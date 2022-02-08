-- luo skeema
CREATE SCHEMA koontinakymat;

-- luo kokoava taso kaavakohteista ja niihin liittyvistä lisätiedoista
-- DROP MATERIALIZED VIEW IF EXISTS koontinakymat.kaavakohteet_mv 
CREATE MATERIALIZED VIEW koontinakymat.kaavakohteet_mv AS (
SELECT 
    ROW_NUMBER() OVER (ORDER BY k.id) AS id, 
    k.id AS id_kaavakohde,
    kla.nimi_fi, 
    kla.nimi_fi AS kaavamaarayslaji,
    s.nimi_fi AS sitovuuslaji,
    ml.nimi_fi AS maanalaisuuden_laji,
    t.nimi AS tietoyksikko_nimi,
    t2.arvo AS tekstiarvo,
    na.arvo AS tietoyksikko_num_arvo,
    na.mittayksikko AS tietoyksikko_num_mittayksikko,
    st_collect(st_curvetoline(geom), geom_polygon) AS geom 
    FROM kaavatiedot.kaavakohde k
        LEFT JOIN kaavatiedot.tietoyksikko t ON k.id = t.id_kaavakohde
        LEFT JOIN kaavatiedot.numeerinen_arvo na ON t.id = na.id_tietoyksikko 
        LEFT JOIN kaavatiedot.kaavamaarays k2 ON k.id = k2.id_kaavakohde 
        LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k2.id_kaavamaarays_laji_ak = kla.jarjestys
        LEFT JOIN koodistot.sitovuuslaji s ON k.id_sitovuuslaji = s.jarjestys
        LEFT JOIN koodistot.maanalaisuuden_laji ml ON k.id_maanalaisuuden_laji = ml.jarjestys
        LEFT JOIN kaavatiedot.tekstiarvo t2 ON t.id = t2.id_tietoyksikko 
    );

-- indeksi
CREATE INDEX koontinakymat_kaavakohteet_mv_geom_idx ON koontinakymat.kaavakohteet_mv USING gist (geom);      

-- hae kaikki kaavamääräykset, niihin liittyvän kaavakohteen geometriat ja ryhmitä ne (group by)
CREATE MATERIALIZED VIEW koontinakymat.kaavamaaraykset_mv AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY kla.id) AS id,
        kla.nimi_fi AS kaavamaarayslaji,
        st_union(st_makevalid(st_curvetoline (geom))) AS geom
        /*,
        st_union(geom_polygon) AS geom_polygon, --hae muutkin geom-sarakkeet tarvittaessa
        st_union(geom_line) AS geom_line,
        st_union(geom_point) AS geom_point
        */
        FROM kaavatiedot.kaavamaarays k 
            LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
            LEFT JOIN kaavatiedot.kaavakohde k2 ON k.id_kaavakohde = k2.id
        GROUP BY kla.nimi_fi, kla.id
        ORDER BY geom);

-- luo indeksi
CREATE INDEX koontinakymat_kaavamaaraykset_mv_geom_idx ON koontinakymat.kaavamaaraykset_mv USING gist (geom);

-- luo kaavakohteet ja kaavamaaraykset -koontinäkymät
CREATE MATERIALIZED VIEW koontinakymat.kaavakohteet_ja_kaavamaaraykset_mv AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY k1.id) AS id,     
        count(DISTINCT kla.nimi_fi) AS eri_kaavamaarayksien_maara,
        array_agg(kla.nimi_fi) AS kaavamaarayslajit,
        st_collect(st_curvetoline(k1.geom), k1.geom_polygon) AS geom
        FROM kaavatiedot.kaavakohde k1
            INNER JOIN kaavatiedot.kaavamaarays k ON k1.id = k.id_kaavakohde
            INNER JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
        WHERE geom IS NOT NULL
        GROUP BY k1.id
)

-- luo indeksi
CREATE INDEX koontinakymat_kaavakohteet_ja_kaavamaaraykset_mv_geom_idx ON koontinakymat.kaavakohteet_ja_kaavamaaraykset_mv USING gist(geom)

