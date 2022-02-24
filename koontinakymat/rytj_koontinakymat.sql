-- luo skeema
CREATE SCHEMA IF NOT EXISTS koontinakymat;

-- luo kokoava taso kaavakohteista ja niihin liittyvistä lisätiedoista
DROP MATERIALIZED VIEW IF EXISTS koontinakymat.kaavakohteet_mv_latest; 
CREATE MATERIALIZED VIEW koontinakymat.kaavakohteet_mv_latest AS ( 
    SELECT DISTINCT ON (k2.id) k2.id,
    ROW_NUMBER() OVER (ORDER BY k.id) AS fid,
    k.id AS id_kaavakohde,
    kav.nimi_fi AS kaavoitusteema,
    kla.nimi_fi AS kaavamaarayslaji,
    t2.arvo AS tekstiarvo,
    na.arvo AS numeerinen_arvo,
    na.mittayksikko AS mittayksikko,
    t.nimi AS tietoyksikko_nimi,
    s.nimi_fi AS sitovuuslaji,
    ml.nimi_fi AS maanalaisuuden_laji,
    st_collect(st_curvetoline(geom), geom_poly) AS geom
    FROM kaavatiedot.kaavakohde k
        LEFT JOIN kaavatiedot.kaavamaarays k2 ON k.id = k2.id_kaavakohde  
        LEFT JOIN kaavatiedot.tietoyksikko t ON k2.id = t.id_kaavamaarays
        LEFT JOIN kaavatiedot.numeerinen_arvo na ON t.id = na.id_tietoyksikko 
        LEFT JOIN kaavatiedot.tekstiarvo t2 ON t.id = t2.id_tietoyksikko       
        LEFT JOIN koodistot.kaavoitusteema_ak kav ON k2.id_kaavoitusteema_ak = kav.jarjestys 
        LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k2.id_kaavamaarays_laji_ak = kla.jarjestys
        LEFT JOIN koodistot.sitovuuslaji s ON k.id_sitovuuslaji = s.jarjestys
        LEFT JOIN koodistot.maanalaisuuden_laji ml ON k.id_maanalaisuuden_laji = ml.jarjestys
        ORDER BY k2.id
        );
    
-- indeksi
CREATE INDEX IF NOT EXISTS koontinakymat_kaavakohteet_mv_geom_idx ON koontinakymat.kaavakohteet_mv_latest USING gist (geom);      

 
-- hae kaikki kaavamääräykset, niihin liittyvän kaavakohteen geometriat ja ryhmitä ne (group by)
DROP MATERIALIZED VIEW IF EXISTS koontinakymat.kaavamaaraykset_mv_latest; 
CREATE MATERIALIZED VIEW koontinakymat.kaavamaaraykset_mv_latest AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY kla.id) AS id,
        kla.nimi_fi AS kaavamaarayslaji,
        st_union(st_makevalid(st_curvetoline (k2.geom))) AS geom
        FROM kaavatiedot.kaavamaarays k 
            LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
            LEFT JOIN 
                (SELECT kav.id,
                st_curvetoline (kav.geom) AS geom
                FROM kaavatiedot.kaavakohde kav) 
                k2 ON k.id_kaavakohde = k2.id
        GROUP BY kla.nimi_fi, kla.id
    );

-- luo indeksi
CREATE INDEX koontinakymat_kaavamaaraykset_mv_geom_idx ON koontinakymat.kaavamaaraykset_mv_latest USING gist (geom);

-- luo kaavakohteet ja kaavamaaraykset -koontinäkymät
DROP MATERIALIZED VIEW IF EXISTS koontinakymat.kaavamaaraykset_listaus_mv_latest; 
CREATE MATERIALIZED VIEW koontinakymat.kaavamaaraykset_listaus_mv_latest AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY k1.id) AS id,     
        count(DISTINCT kla.nimi_fi) AS eri_kaavamaarayksien_maara,
        array_agg(kla.nimi_fi) AS kaavamaarayslajit,
        st_curvetoline(k1.geom) AS geom
        FROM kaavatiedot.kaavakohde k1
            INNER JOIN kaavatiedot.kaavamaarays k ON k1.id = k.id_kaavakohde
            INNER JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
        WHERE geom IS NOT NULL
        GROUP BY k1.id
);

-- luo indeksi
CREATE INDEX IF NOT EXISTS koontinakymat_kaavamaaraykset_listaus_mv_geom_idx ON koontinakymat.kaavamaaraykset_listaus_mv_latest USING gist(geom)



