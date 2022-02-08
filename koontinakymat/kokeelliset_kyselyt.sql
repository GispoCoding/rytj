-- luo kokoava taso kaavakohteista ja niihin liittyvistä lisätiedoista
SELECT 
    ROW_NUMBER() OVER (ORDER BY k.id) AS id, 
    k.id AS id_kaavakohde,
    kla.nimi_fi AS kaavamaarayslaji,
    s.nimi_fi AS sitovuuslaji,
    ml.nimi_fi AS maanalaisuuden_laji,
    t.nimi AS tietoyksikko_nimi,
    t2.arvo AS tekstiarvo,
    na.arvo AS tietoyksikko_num_arvo,
    na.mittayksikko AS tietoyksikko_num_mittayksikko,
    st_curvetoline(geom) AS geom
    FROM kaavatiedot.kaavakohde k
        LEFT JOIN kaavatiedot.tietoyksikko t ON k.id = t.id_kaavakohde
        LEFT JOIN kaavatiedot.numeerinen_arvo na ON t.id = na.id_tietoyksikko 
        LEFT JOIN kaavatiedot.kaavamaarays k2 ON k.id = k2.id_kaavakohde 
        LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k2.id_kaavamaarays_laji_ak = kla.jarjestys
        LEFT JOIN koodistot.sitovuuslaji s ON k.id_sitovuuslaji = s.jarjestys
        LEFT JOIN koodistot.maanalaisuuden_laji ml ON k.id_maanalaisuuden_laji = ml.jarjestys
        LEFT JOIN kaavatiedot.tekstiarvo t2 ON t.id = t2.id_tietoyksikko 


-- laske kaavamaarayksien määrä        
SELECT 
    kla.nimi_fi  AS kaavamaarayslaji,    
    count(*)
    FROM kaavatiedot.kaavamaarays k
        LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
 GROUP BY kaavamaarayslaji
 ORDER BY count desc


-- hae korkeuspisteet lisätietoineen kartalle
SELECT 
    ROW_NUMBER() OVER (ORDER BY k.id) AS id,
    t.nimi AS tietoyksikko_nimi,
    k.geom,
    st_curvetoline(k2.geom) AS geom_kkohde
    FROM kaavatiedot.korkeuspiste k 
        INNER JOIN kaavatiedot.numeerinen_arvo na ON k.id_numeerinen_arvo  = na.id
        INNER JOIN kaavatiedot.tietoyksikko t ON na.id_tietoyksikko = t.id 
        INNER JOIN kaavatiedot.kaavakohde k2 ON t.id_kaavakohde = k2.id;

-- hae kaikki kaavamääräykset, niihin liittyvän kaavakohteen geometriat ja ryhmitä ne (group by)
SELECT 
    ROW_NUMBER() OVER (ORDER BY kla.id) AS id,
    kla.nimi_fi AS kaavamaarayslaji,
    st_union(geom) AS geom
    /*,
    st_union(geom_polygon) AS geom_polygon, --hae muutkin geom-sarakkeet tarvittaessa
    st_union(geom_line) AS geom_line,
    st_union(geom_point) AS geom_point
    */
    FROM kaavatiedot.kaavamaarays k 
        LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
        LEFT JOIN kaavatiedot.kaavakohde k2 ON k.id_kaavakohde = k2.id
    GROUP BY kla.nimi_fi, kla.id
    ORDER BY geom

-- hae kaikki kaavamääräykset ja aggregoi kerrosalan osilta (m2) kaavakohtaisesti
SELECT 
    k3.nimi AS kaava_nimi,
    sum(na.arvo),
    st_union(k2.geom) AS kaava_kohteet_geom
    FROM kaavatiedot.kaavamaarays k 
        LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
        LEFT JOIN kaavatiedot.kaavakohde k2 ON k.id_kaavakohde = k2.id
        LEFT JOIN kaavatiedot.tietoyksikko t ON k.id = t.id_kaavamaarays
        LEFT JOIN kaavatiedot.numeerinen_arvo na ON t.id = na.id_tietoyksikko
        LEFT JOIN kaavatiedot.kaava k3 ON k.id_kaava = k3.id_kaava
    WHERE kla.nimi_fi = 'Sallittu kerrosala' 
    GROUP BY k3.nimi

-- hae kaikki kaavamääräykset ja aggregoi kaavamääräyslajin mukaan numeeriset arvot
SELECT 
    kla.nimi_fi,
    sum(na.arvo),
    st_union(k2.geom) AS kaava_kohteet_geom
    FROM kaavatiedot.kaavamaarays k 
        LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
        LEFT JOIN kaavatiedot.kaavakohde k2 ON k.id_kaavakohde = k2.id
        LEFT JOIN kaavatiedot.tietoyksikko t ON k.id = t.id_kaavamaarays
        LEFT JOIN kaavatiedot.numeerinen_arvo na ON t.id = na.id_tietoyksikko
        LEFT JOIN kaavatiedot.kaava k3 ON k.id_kaava = k3.id_kaava
    GROUP BY kla.nimi_fi 

-- hae tietoyksiköt, niihin liittyvät kaavamääräykset, niihin liittyvät tietoyksiköt sekä numeeriset arvot
SELECT 
    t.id,
    t.nimi,
    kla.nimi_fi AS kaavamaarayslaji,
    t2.arvo,
    na.arvo,
    na.mittayksikko
    FROM kaavatiedot.tietoyksikko t    
        LEFT JOIN kaavatiedot.kaavakohde k2 ON t.id_kaavakohde = k2.id
        LEFT JOIN kaavatiedot.kaavamaarays k ON k2.id = k.id_kaavakohde
        LEFT JOIN koodistot.kaavamaarays_laji_ak kla ON k.id_kaavamaarays_laji_ak = kla.jarjestys
        LEFT JOIN kaavatiedot.tekstiarvo t2 ON t.id = t2.id_tietoyksikko
        LEFT JOIN kaavatiedot.numeerinen_arvo na ON t.id = na.id_tietoyksikko
    ORDER BY t.id

        
-- hae kaavakohteen ja sen eri geometriatyypit yhteen geom-kenttään        
SELECT 
    ROW_NUMBER() OVER (ORDER BY k.id) AS id,
    k.id AS id_kaavakohde,
    st_collect(
        st_collect(st_curvetoline(geom), geom_polygon),
        st_collect(geom_line, geom_point)) AS geom
    FROM kaavatiedot.kaavakohde k 
