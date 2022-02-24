
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2022-02-23 11:36:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS esprytj;
--
-- TOC entry 4415 (class 1262 OID 16394)
-- Name: esprytj; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE esprytj WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE esprytj OWNER TO postgres;

\connect esprytj
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 17420)
-- Name: kaavatiedot; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA kaavatiedot;


ALTER SCHEMA kaavatiedot OWNER TO postgres;

--
-- TOC entry 5 (class 2615 OID 17419)
-- Name: koodistot; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA koodistot;


ALTER SCHEMA koodistot OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 17421)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 279 (class 1259 OID 18947)
-- Name: aikavali; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.aikavali (
    id bigint NOT NULL,
    alku timestamp without time zone,
    loppu timestamp without time zone,
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.aikavali OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 18945)
-- Name: aikavali_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.aikavali ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.aikavali_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 277 (class 1259 OID 18940)
-- Name: ajanhetki; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.ajanhetki (
    id bigint NOT NULL,
    arvo timestamp without time zone,
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.ajanhetki OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 18938)
-- Name: ajanhetki_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.ajanhetki ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.ajanhetki_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 18552)
-- Name: versioitu_objekti_abstrakti; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.versioitu_objekti_abstrakti (
    nimiavaruus character varying,
    viittaustunnus character varying,
    identiteettitunnus character varying,
    tuottajakohtainen_tunnus character varying,
    viimeisin_muutos timestamp without time zone DEFAULT now(),
    tallennusaika timestamp without time zone DEFAULT now()
);


ALTER TABLE kaavatiedot.versioitu_objekti_abstrakti OWNER TO postgres;

--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN versioitu_objekti_abstrakti.nimiavaruus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.nimiavaruus IS 'tunnusten nimiavaruus';


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN versioitu_objekti_abstrakti.viittaustunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.viittaustunnus IS 'johdettu nimiavaruudesta, luokan englanninkielisestä nimestä ja paikallisesta tunnuksesta';


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN versioitu_objekti_abstrakti.identiteettitunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.identiteettitunnus IS 'kohteen versioriippumaton tunnus';


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN versioitu_objekti_abstrakti.tuottajakohtainen_tunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.tuottajakohtainen_tunnus IS 'kohteen tunnus tuottajatietojärjestelmässä';


--
-- TOC entry 243 (class 1259 OID 18617)
-- Name: asiakirja; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.asiakirja (
    id bigint NOT NULL,
    asiakirjan_tunnus character varying,
    nimi character varying,
    lisatietolinkki character varying,
    metatietokuvaus character varying,
    id_asiakirjan_laji integer NOT NULL,
    id_kaavasuositus bigint,
    id_kaavaselostus bigint,
    id_osallistumis_ja_arviointisuunnitelma bigint,
    id_kaavamaarays bigint,
    id_asiakirja bigint,
    id_vuorovaikutustapahtuma bigint,
    id_kasittelytapahtuma bigint,
    id_kaava bigint
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.asiakirja OWNER TO postgres;

--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN asiakirja.asiakirjan_tunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.asiakirja.asiakirjan_tunnus IS 'asiakirjan pysyvä tunnus, esim. diaarinumero tai muu dokumentinhallinnan tunnus';


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN asiakirja.nimi; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.asiakirja.nimi IS 'asiakirjan nimi';


--
-- TOC entry 242 (class 1259 OID 18615)
-- Name: asiakirja_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.asiakirja ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.asiakirja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 269 (class 1259 OID 18806)
-- Name: geometria_arvo; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.geometria_arvo (
    id bigint NOT NULL,
    geom_poly public.geometry(MultiSurfaceZ,3067),
    geom_point public.geometry(MultiPointZ,3067),
    geom_line public.geometry(MultiLineStringZ,3067),
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.geometria_arvo OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 18804)
-- Name: geometria_arvo_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.geometria_arvo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.geometria_arvo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 18592)
-- Name: kaava; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kaava (
    viimeisin_muutos timestamp without time zone DEFAULT now(),
    tallennusaika timestamp without time zone DEFAULT now(),
    id bigint NOT NULL,
    kaavatunnus uuid DEFAULT gen_random_uuid(),
    vireilletulo_aika timestamp without time zone,
    hyvaksymisen_aika timestamp without time zone,
    id_digitaalinen_alkupera integer,
    id_oikeusvaikutteisuuden_laji integer,
    id_kaavalaji integer,
    id_osallistumis_ja_arviointisuunnitelma bigint,
    nimi character varying,
    id_kaavan_elinkaaritila integer,
    kuvaus character varying,
    geom public.geometry(MultiSurfaceZ,3067),
    voimassaolo_alku timestamp without time zone,
    voimassaolo_loppu timestamp without time zone,
    metatietokuvaus character varying,
    id_kaava bigint
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.kaava OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18590)
-- Name: kaava_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.kaava ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.kaava_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 261 (class 1259 OID 18747)
-- Name: kaavakohde; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kaavakohde (
    id bigint NOT NULL,
    liittyvan_lahtotietokohteen_tunnus character varying,
    id_sitovuuslaji integer,
    id_maanalaisuuden_laji integer,
    geom public.geometry(MultiSurfaceZ,3067),
    id_kaava bigint NOT NULL,
    id_kaavakohde bigint,
    geom_line public.geometry(MultiLineString,3067),
    geom_point public.geometry(MultiPoint,3067),
    geom_poly public.geometry(MultiPolygon,3067),
    geom_poly2 public.geometry(MultiPolygon,3067)
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.kaavakohde OWNER TO postgres;

--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE kaavakohde; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.kaavakohde IS 'kaavaan sisältyvä aluerajaus tai kohde, jonka alueella maankäyttöä tai rakentamista halutaan ohjata

Kaavakohteella on maantieteellinen sijainti ja muoto. Velvoittava ohjausvaikutus kuvataan liittyvien kaavamääräysten ja ei-velvoittava liittyvien kaavasuositusten avulla.';


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN kaavakohde.liittyvan_lahtotietokohteen_tunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.kaavakohde.liittyvan_lahtotietokohteen_tunnus IS 'viittaus kaavan lähtötietoaineistoon sisältyvään tietokohteeseen, joka liittyy kaavakohteeseen. Esim. pohjavesialue';


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN kaavakohde.geom; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.kaavakohde.geom IS 'Kaikkien kaavaan liittyvien paikkatietokohteiden yhteinen abstrakti yläluokka. Kohteen geometria voi olla 2-ulotteinen piste, viiva tai alue, tai 3-ulotteinen kappale. Moniosaiset geometriat (multigeometry) ovat sallittuja. Haluttaessa korkeusulottuvuus voidaan ilmaista 2-ulotteisen geometria-attribuutin arvo ja pystysuuntainenRajaus-attribuutin kuvaamien korkeusvälien avulla, myös useampana erillisenä kerroksena. Tällöin kohteen ulottuvuus vastaa 3-ulotteista avaruusgeometriaa, joka muodostuu työntämällä 2-ulotteista pintaa ylös- ja/tai alaspäin annatun korkeusvälin rajoihin saakka. Huomaa, että Korkeusvali-luokan ylä- tai alaraja (korkeuden maksimi- tai minimiarvo) voi myös puuttua, jolloin kohde kattaa alueen ylöspäin tai alaspäin annetusta korkeudesta.';


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN kaavakohde.geom_line; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.kaavakohde.geom_line IS 'Testi 22.12.';


--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN kaavakohde.geom_point; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.kaavakohde.geom_point IS 'testi 22.12';


--
-- TOC entry 260 (class 1259 OID 18745)
-- Name: kaavakohde_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.kaavakohde ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.kaavakohde_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 251 (class 1259 OID 18678)
-- Name: kaavamaarays; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kaavamaarays (
    id bigint NOT NULL,
    id_kaavamaarays_laji_ak integer NOT NULL,
    id_kaavan_elinkaaritila integer,
    id_kaavoitusteema_ak integer,
    voimassaolo_alku timestamp without time zone,
    voimassaolo_loppu timestamp without time zone,
    id_kaavakohde bigint,
    id_kaava bigint
);


ALTER TABLE kaavatiedot.kaavamaarays OWNER TO postgres;

--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE kaavamaarays; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.kaavamaarays IS 'kaavaan sisältyvä velvoittava määräys, jolla ohjataan alueiden suunnittelua ja rakentamista.
Kaavoissa käytettävät kaavamääräysten lajit on yhteisesti sovittu. Määräys voi kohdistua joko yksittäiseen kaavakohteeseen tai koko kaavaan. Kaavamääräykseen voi sisältyä sen lajiin perustuvaa ohjausvaikutusta tarkentavia arvoja ja lisätietoja.';


--
-- TOC entry 250 (class 1259 OID 18676)
-- Name: kaavamaarays_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.kaavamaarays ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.kaavamaarays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 18572)
-- Name: kaavan_kumoamistieto; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kaavan_kumoamistieto (
    id bigint NOT NULL,
    kumottavan_kaavan_tunnus character varying,
    kumoaa_kaavan_kokonaan boolean,
    geom public.geometry(MultiSurfaceZ,3067),
    kumottavan_maarayksen_tunnus character varying,
    kumottavan_suosituksen_tunnus character varying,
    id_kaava bigint
);


ALTER TABLE kaavatiedot.kaavan_kumoamistieto OWNER TO postgres;

--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE kaavan_kumoamistieto; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.kaavan_kumoamistieto IS 'tieto kaavan hyväksymisen johdosta kokonaisuudessaan kumoutuvasta kaavasta tai kaavan kumottavasta osa-alueesta, yksittäisistä kaavakohteista tai kaavamääräyksistä.
kumoamistieto kuvaa miten kaavan voimaantulo vaikuttaa toisten kaavojen ja niiden sisältämien määräysten tai suositusten kumoutumiseen.';


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN kaavan_kumoamistieto.kumottavan_kaavan_tunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.kaavan_kumoamistieto.kumottavan_kaavan_tunnus IS 'URI';


--
-- TOC entry 234 (class 1259 OID 18570)
-- Name: kaavan_kumoamistieto_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.kaavan_kumoamistieto ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.kaavan_kumoamistieto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 18605)
-- Name: kaavan_laatija; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kaavan_laatija (
    id bigint NOT NULL,
    nimi character varying,
    nimike character varying,
    rooli character varying,
    id_kaava bigint
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.kaavan_laatija OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18603)
-- Name: kaavan_laatija_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.kaavan_laatija ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.kaavan_laatija_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 18735)
-- Name: kaavaselostus; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kaavaselostus (
    id bigint NOT NULL,
    id_kaava bigint
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.kaavaselostus OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 18733)
-- Name: kaavaselostus_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.kaavaselostus ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.kaavaselostus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 263 (class 1259 OID 18764)
-- Name: kaavasuositus; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kaavasuositus (
    id bigint NOT NULL,
    id_kaavan_elinkaaritila integer,
    id_kaavoitusteema_ak integer,
    voimassaolo_alku timestamp without time zone,
    voimassaolo_loppu timestamp without time zone,
    id_kaava bigint,
    id_kaavakohde bigint
);


ALTER TABLE kaavatiedot.kaavasuositus OWNER TO postgres;

--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE kaavasuositus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.kaavasuositus IS 'kaavaan sisältyvä ei-velvoittava ohje, joka ilmentää esimerkiksi toteutuksen tapaa ja tavoitetta.
Suositus voi kohdistua joko yksittäiseen kaavakohteeseen tai koko kaavaan. Kaavasuositukseen voi sisältyä sen ohjausvaikutusta tarkentavia arvoja.';


--
-- TOC entry 262 (class 1259 OID 18762)
-- Name: kaavasuositus_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.kaavasuositus ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.kaavasuositus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 288 (class 1259 OID 19057)
-- Name: tapahtuma_abstrakti; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.tapahtuma_abstrakti (
    nimi character varying,
    tapahtuma_aika timestamp without time zone,
    kuvaus character varying,
    sijainti public.geometry(MultiSurfaceZ,3067),
    lisatietolinkki character varying,
    peruttu boolean DEFAULT false
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.tapahtuma_abstrakti OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 19068)
-- Name: kasittelytapahtuma; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kasittelytapahtuma (
    id bigint NOT NULL,
    id_kaavan_kasittelytapahtuman_laji integer,
    id_kaava bigint
)
INHERITS (kaavatiedot.tapahtuma_abstrakti);


ALTER TABLE kaavatiedot.kasittelytapahtuma OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 19066)
-- Name: kasittelytapahtuma_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.kasittelytapahtuma ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.kasittelytapahtuma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 281 (class 1259 OID 18959)
-- Name: koodiarvo; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.koodiarvo (
    id bigint NOT NULL,
    koodistotunnus character varying,
    otsikko character varying,
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.koodiarvo OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 18957)
-- Name: koodiarvo_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.koodiarvo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.koodiarvo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 287 (class 1259 OID 19009)
-- Name: korkeuspiste; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.korkeuspiste (
    id bigint NOT NULL,
    geom public.geometry(PointZ,3067),
    id_numeerinen_arvo bigint
);


ALTER TABLE kaavatiedot.korkeuspiste OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 19007)
-- Name: korkeuspiste_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.korkeuspiste ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.korkeuspiste_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 265 (class 1259 OID 18781)
-- Name: korkeusvali; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.korkeusvali (
    id bigint NOT NULL,
    geom public.geometry(PointZ,3067),
    id_numeerinen_arvovali bigint
);


ALTER TABLE kaavatiedot.korkeusvali OWNER TO postgres;

--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE korkeusvali; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.korkeusvali IS 'Arvo, joka kuvaa kahden pystysuuntaisella koordinaatiston koordinaatin välistä janaa.';


--
-- TOC entry 264 (class 1259 OID 18779)
-- Name: korkeusvali_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.korkeusvali ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.korkeusvali_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 245 (class 1259 OID 18634)
-- Name: lahtotietoaineisto; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.lahtotietoaineisto (
    id bigint NOT NULL,
    aineistotunnus character varying,
    nimi character varying,
    id_lahtoaineiston_laji integer NOT NULL,
    geom public.geometry(MultiSurfaceZ,3067),
    lisatietolinkki character varying,
    metatietokuvaus character varying,
    id_kaava bigint
);


ALTER TABLE kaavatiedot.lahtotietoaineisto OWNER TO postgres;

--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN lahtotietoaineisto.aineistotunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.aineistotunnus IS 'lähtötietoaineiston tunnus';


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN lahtotietoaineisto.lisatietolinkki; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.lisatietolinkki IS 'viittaus ulkoiseen lisätietokuvaukseen asiakirjasta';


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN lahtotietoaineisto.metatietokuvaus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.metatietokuvaus IS 'viittaus ulkoiseen metatietokuvaukseen';


--
-- TOC entry 244 (class 1259 OID 18632)
-- Name: lahtotietoaineisto_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.lahtotietoaineisto ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.lahtotietoaineisto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 253 (class 1259 OID 18700)
-- Name: lisatieto; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.lisatieto (
    id bigint NOT NULL,
    nimi character varying,
    id_kaavamaarays bigint,
    id_lisatiedon_laji_ak integer
);


ALTER TABLE kaavatiedot.lisatieto OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 18698)
-- Name: lisatieto_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.lisatieto ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.lisatieto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 283 (class 1259 OID 18974)
-- Name: numeerinen_arvo; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.numeerinen_arvo (
    id bigint NOT NULL,
    arvo numeric,
    mittayksikko character varying,
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.numeerinen_arvo OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 18972)
-- Name: numeerinen_arvo_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.numeerinen_arvo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.numeerinen_arvo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 285 (class 1259 OID 18984)
-- Name: numeerinen_arvovali; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.numeerinen_arvovali (
    id bigint NOT NULL,
    minimiarvo numeric,
    maksimiarvo numeric,
    mittayksikko character varying,
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.numeerinen_arvovali OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 18982)
-- Name: numeerinen_arvovali_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.numeerinen_arvovali ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.numeerinen_arvovali_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 18659)
-- Name: osallistumis_ja_arviointisuunnitelma; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.osallistumis_ja_arviointisuunnitelma (
    id bigint NOT NULL
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.osallistumis_ja_arviointisuunnitelma OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18657)
-- Name: osallistumis_ja_arviointisuunnitelma_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.osallistumis_ja_arviointisuunnitelma ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.osallistumis_ja_arviointisuunnitelma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 267 (class 1259 OID 18796)
-- Name: tekstiarvo; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.tekstiarvo (
    id bigint NOT NULL,
    arvo text,
    syntaksi character varying,
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.tekstiarvo OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 18794)
-- Name: tekstiarvo_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.tekstiarvo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.tekstiarvo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 275 (class 1259 OID 18893)
-- Name: tietoyksikko; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.tietoyksikko (
    id bigint NOT NULL,
    nimi character varying,
    id_kaavakohde bigint,
    id_lisatieto bigint,
    id_kaavamaarays bigint,
    id_kaavasuositus bigint
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.tietoyksikko OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 18891)
-- Name: tietoyksikko_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.tietoyksikko ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.tietoyksikko_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 271 (class 1259 OID 18816)
-- Name: tunnusarvo; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.tunnusarvo (
    id bigint NOT NULL,
    nimi character varying,
    rekisteri_tunnus character varying,
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.tunnusarvo OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 18814)
-- Name: tunnusarvo_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.tunnusarvo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.tunnusarvo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 292 (class 1259 OID 19086)
-- Name: vuorovaikutustapahtuma; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.vuorovaikutustapahtuma (
    id bigint NOT NULL,
    id_kaavan_vuorovaikutustapahtuman_laji integer,
    id_kaava bigint
)
INHERITS (kaavatiedot.tapahtuma_abstrakti);


ALTER TABLE kaavatiedot.vuorovaikutustapahtuma OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 19084)
-- Name: vuorovaikutustapahtuma_id_seq; Type: SEQUENCE; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE kaavatiedot.vuorovaikutustapahtuma ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME kaavatiedot.vuorovaikutustapahtuma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 208 (class 1259 OID 18436)
-- Name: koodilista_abstrakti; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.koodilista_abstrakti (
    koodiarvo character varying,
    uri character varying,
    jarjestys smallint,
    ylaluokka character varying,
    status character varying,
    nimi_en character varying,
    nimi_fi character varying,
    nimi_sv character varying,
    maaritelma_en character varying,
    maaritelma_fi character varying,
    maaritelma_sv character varying,
    kuvaus_en character varying,
    kuvaus_fi character varying,
    kuvaus_sv character varying,
    nimilyhenne character varying,
    sanasto_uri character varying,
    hierarkiataso character varying,
    tallennusaika timestamp without time zone,
    viimeisin_muutos timestamp without time zone
);


ALTER TABLE koodistot.koodilista_abstrakti OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18582)
-- Name: asiakirjan_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.asiakirjan_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.asiakirjan_laji OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18580)
-- Name: asiakirjan_laji_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.asiakirjan_laji ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.asiakirjan_laji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 18474)
-- Name: digitaalinen_alkupera; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.digitaalinen_alkupera (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.digitaalinen_alkupera OWNER TO postgres;

--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE digitaalinen_alkupera; Type: COMMENT; Schema: koodistot; Owner: postgres
--

COMMENT ON TABLE koodistot.digitaalinen_alkupera IS 'Digitaalisella alkuperällä tarkoitetaan kaava-aineiston digitoinnin tapaa.';


--
-- TOC entry 215 (class 1259 OID 18472)
-- Name: digitaalinen_alkupera_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.digitaalinen_alkupera ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.digitaalinen_alkupera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 18444)
-- Name: kaavalaji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavalaji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavalaji OWNER TO postgres;

--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE kaavalaji; Type: COMMENT; Schema: koodistot; Owner: postgres
--

COMMENT ON TABLE koodistot.kaavalaji IS 'Kaavalajit (maakunta-, yleis- ja asemakaava)';


--
-- TOC entry 209 (class 1259 OID 18442)
-- Name: kaavalaji_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.kaavalaji ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.kaavalaji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 18534)
-- Name: kaavamaarays_laji_ak; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavamaarays_laji_ak (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavamaarays_laji_ak OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18532)
-- Name: kaavamaarays_laji_ak_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.kaavamaarays_laji_ak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.kaavamaarays_laji_ak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 18524)
-- Name: kaavamaarays_laji_yk; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavamaarays_laji_yk (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavamaarays_laji_yk OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18522)
-- Name: kaavamaarays_laji_yk_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.kaavamaarays_laji_yk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.kaavamaarays_laji_yk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 18494)
-- Name: kaavan_elinkaaritila; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavan_elinkaaritila (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavan_elinkaaritila OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18492)
-- Name: kaavan_elinkaaritila_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.kaavan_elinkaaritila ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.kaavan_elinkaaritila_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 257 (class 1259 OID 18720)
-- Name: kaavan_kasittelytapahtuman_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavan_kasittelytapahtuman_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavan_kasittelytapahtuman_laji OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 18718)
-- Name: kaavan_kasittelytapahtuman_laji_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.kaavan_kasittelytapahtuman_laji ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.kaavan_kasittelytapahtuman_laji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 18544)
-- Name: kaavan_vuorovaikutustapahtuman_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavan_vuorovaikutustapahtuman_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavan_vuorovaikutustapahtuman_laji OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18542)
-- Name: kaavan_vuorovaikutustapahtuman_laji_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.kaavan_vuorovaikutustapahtuman_laji ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.kaavan_vuorovaikutustapahtuman_laji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 18514)
-- Name: kaavoitusteema_ak; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavoitusteema_ak (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavoitusteema_ak OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18512)
-- Name: kaavoitusteema_ak_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.kaavoitusteema_ak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.kaavoitusteema_ak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 18504)
-- Name: kaavoitusteema_yk; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavoitusteema_yk (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavoitusteema_yk OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18502)
-- Name: kaavoitusteema_yk_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.kaavoitusteema_yk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.kaavoitusteema_yk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 247 (class 1259 OID 18644)
-- Name: lahtoaineiston_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.lahtoaineiston_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.lahtoaineiston_laji OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18642)
-- Name: lahtoaineiston_laji_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.lahtoaineiston_laji ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.lahtoaineiston_laji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 255 (class 1259 OID 18710)
-- Name: lisatiedon_laji_ak; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.lisatiedon_laji_ak (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.lisatiedon_laji_ak OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 18708)
-- Name: lisatiedon_laji_ak_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.lisatiedon_laji_ak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.lisatiedon_laji_ak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 273 (class 1259 OID 18883)
-- Name: lisatiedon_laji_yk; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.lisatiedon_laji_yk (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.lisatiedon_laji_yk OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 18881)
-- Name: lisatiedon_laji_yk_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.lisatiedon_laji_yk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.lisatiedon_laji_yk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 18464)
-- Name: maanalaisuuden_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.maanalaisuuden_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.maanalaisuuden_laji OWNER TO postgres;

--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE maanalaisuuden_laji; Type: COMMENT; Schema: koodistot; Owner: postgres
--

COMMENT ON TABLE koodistot.maanalaisuuden_laji IS 'Maanalaisuuden lajin avulla ilmaistaan koko Kaavan tai sen sisältämien yksittäisten Kaavamääräyskohteiden sijainti maanpinnan ylä tai alapuolella.';


--
-- TOC entry 213 (class 1259 OID 18462)
-- Name: maanalaisuuden_laji_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.maanalaisuuden_laji ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.maanalaisuuden_laji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 18562)
-- Name: oikeusvaikutteisuuden_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.oikeusvaikutteisuuden_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.oikeusvaikutteisuuden_laji OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18560)
-- Name: oikeusvaikutteisuuden_laji_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.oikeusvaikutteisuuden_laji ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.oikeusvaikutteisuuden_laji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 18454)
-- Name: sitovuuslaji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.sitovuuslaji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.sitovuuslaji OWNER TO postgres;

--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE sitovuuslaji; Type: COMMENT; Schema: koodistot; Owner: postgres
--

COMMENT ON TABLE koodistot.sitovuuslaji IS 'Sijainnin sitovuuden avulla ilmaistaan kaavan sisältämien Kaavamääräyskohteiden sijainnin sitovuus tai ohjeellisuus. Asemakaavassa kaikki kohteet ovat sijainniltaan joko sitovia tai ohjeellisia. Yleiskaavassa sitovuuden lajin ilmaiseminen on vapaaehtoista.';


--
-- TOC entry 211 (class 1259 OID 18452)
-- Name: sitovuuslaji_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.sitovuuslaji ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.sitovuuslaji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 18484)
-- Name: ymparistomuutoksenlaji_yk; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.ymparistomuutoksenlaji_yk (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.ymparistomuutoksenlaji_yk OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18482)
-- Name: ymparistomuutoksenlaji_yk_id_seq; Type: SEQUENCE; Schema: koodistot; Owner: postgres
--

ALTER TABLE koodistot.ymparistomuutoksenlaji_yk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME koodistot.ymparistomuutoksenlaji_yk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 293 (class 1259 OID 19157)
-- Name: qgis_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qgis_projects (
    name text NOT NULL,
    metadata jsonb,
    content bytea
);


ALTER TABLE public.qgis_projects OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 19188)
-- Name: teema_asuminen; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.teema_asuminen AS
 SELECT kaavamaarays.id,
    kaavamaarays.id_kaavamaarays_laji_ak,
    kaavamaarays.id_kaavan_elinkaaritila,
    kaavamaarays.id_kaavoitusteema_ak,
    kaavamaarays.voimassaolo_alku,
    kaavamaarays.voimassaolo_loppu,
    kaavamaarays.id_kaavakohde,
    kaavamaarays.id_kaava
   FROM kaavatiedot.kaavamaarays
  WHERE (kaavamaarays.id_kaavoitusteema_ak = 2);


ALTER TABLE public.teema_asuminen OWNER TO postgres;

--
-- TOC entry 4026 (class 2604 OID 18620)
-- Name: asiakirja viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4027 (class 2604 OID 18621)
-- Name: asiakirja tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4032 (class 2604 OID 18750)
-- Name: kaavakohde viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4033 (class 2604 OID 18751)
-- Name: kaavakohde tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4024 (class 2604 OID 18608)
-- Name: kaavan_laatija viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_laatija ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4025 (class 2604 OID 18609)
-- Name: kaavan_laatija tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_laatija ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4030 (class 2604 OID 18738)
-- Name: kaavaselostus viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4031 (class 2604 OID 18739)
-- Name: kaavaselostus tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4039 (class 2604 OID 19071)
-- Name: kasittelytapahtuma viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4040 (class 2604 OID 19072)
-- Name: kasittelytapahtuma tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4041 (class 2604 OID 19073)
-- Name: kasittelytapahtuma peruttu; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma ALTER COLUMN peruttu SET DEFAULT false;


--
-- TOC entry 4028 (class 2604 OID 18662)
-- Name: osallistumis_ja_arviointisuunnitelma viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.osallistumis_ja_arviointisuunnitelma ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4029 (class 2604 OID 18663)
-- Name: osallistumis_ja_arviointisuunnitelma tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.osallistumis_ja_arviointisuunnitelma ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4036 (class 2604 OID 19060)
-- Name: tapahtuma_abstrakti viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tapahtuma_abstrakti ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4037 (class 2604 OID 19061)
-- Name: tapahtuma_abstrakti tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tapahtuma_abstrakti ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4034 (class 2604 OID 18896)
-- Name: tietoyksikko viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4035 (class 2604 OID 18897)
-- Name: tietoyksikko tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4042 (class 2604 OID 19089)
-- Name: vuorovaikutustapahtuma viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- TOC entry 4043 (class 2604 OID 19090)
-- Name: vuorovaikutustapahtuma tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- TOC entry 4044 (class 2604 OID 19091)
-- Name: vuorovaikutustapahtuma peruttu; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma ALTER COLUMN peruttu SET DEFAULT false;


--
-- TOC entry 4395 (class 0 OID 18947)
-- Dependencies: 279
-- Data for Name: aikavali; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4393 (class 0 OID 18940)
-- Dependencies: 277
-- Data for Name: ajanhetki; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4359 (class 0 OID 18617)
-- Dependencies: 243
-- Data for Name: asiakirja; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4385 (class 0 OID 18806)
-- Dependencies: 269
-- Data for Name: geometria_arvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4355 (class 0 OID 18592)
-- Dependencies: 239
-- Data for Name: kaava; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.kaava (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, kaavatunnus, vireilletulo_aika, hyvaksymisen_aika, id_digitaalinen_alkupera, id_oikeusvaikutteisuuden_laji, id_kaavalaji, id_osallistumis_ja_arviointisuunnitelma, nimi, id_kaavan_elinkaaritila, kuvaus, geom, voimassaolo_alku, voimassaolo_loppu, metatietokuvaus, id_kaava) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, NULL, NULL, 2, 'c1df814d-210d-4bee-a98f-61e3a68fed80', NULL, NULL, 4, 1, 9, NULL, 'Espoon testiasemakaava', 2, 'Testataan kaavatietomallia', '010C0000A0FB0B000001000000010A0000800100000001020000802E0000002A1083345F141741D06463F96974594100000000000000006C70C7FC4D141741223C86576E7459410000000000000000029468132714174171D71FBE6D7459410000000000000000D3964D9BF313174140508FCC7A7459410000000000000000005AC5AB12141741A8C604477B74594100000000000000003C88F6B2E313174102426D31877459410000000000000000C8062617CF121741808805EF82745941000000000000000056AEA1B0BD121741CC2BE3AE827459410000000000000000424F2895AE1217415B1CFAB5827459410000000000000000FF118E78A7121741FB3A8A778274594100000000000000006C73D177A4121741CFD0F7FE8174594100000000000000002185048EB812174181CB56C77C7459410000000000000000BA4A570BCA121741CC6CD056787459410000000000000000398165F7C7121741257DB1BA77745941000000000000000014723D8EC112174100D04F1E777459410000000000000000D440A6AFBC1217415B4AD453767459410000000000000000340F7370BB121741ABC84CF7757459410000000000000000F94ECFB7BA121741DE860B7B7574594100000000000000006B40EA48BB1217413A540ADE747459410000000000000000B33124D1BC121741F76D584A747459410000000000000000937332BBC112174129C854237374594100000000000000006D453D6BE1121741F74E386C6B7459410000000000000000FBCF5EC1E7121741BDA0ABC56A745941000000000000000038081F97EE121741D556244D6A7459410000000000000000816EBA88F6121741716C36E8697459410000000000000000E6B93F5EFE121741304F7CEB67745941000000000000000037376D2709131741747C132F657459410000000000000000275DF5560C1317414FA33460647459410000000000000000B5ACE80C0E131741EF181DF16374594100000000000000005CD797420F131741F49A6FC063745941000000000000000032264D3F11131741A9ABCD96637459410000000000000000541F26DD131317419F035177637459410000000000000000EEB79F1F16131741B6BBCD676374594100000000000000009244495A1913174140B8285F63745941000000000000000071168F9B1C131741B2D6CD64637459410000000000000000BA7F68EB1E131741B2B833726374594100000000000000000B8B1F03211317419D29DC86637459410000000000000000207933CC22131741D804E9A1637459410000000000000000A0D6ED4E25131741FAE59CCA6374594100000000000000000BDA003F2A13174186E53F0164745941000000000000000061E573922E1317418431D71E647459410000000000000000845515D640131741B6F5DB67647459410000000000000000118487BBCB1317413206768B667459410000000000000000F8B260D9E413174125DA7BEE66745941000000000000000052E0118BE013174173A00D066874594100000000000000002A1083345F141741D06463F9697459410000000000000000', NULL, NULL, NULL, NULL);


--
-- TOC entry 4377 (class 0 OID 18747)
-- Dependencies: 261
-- Data for Name: kaavakohde; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.951', NULL, 18, NULL, 1, 2, '010C0000A0FB0B000001000000010A00008001000000010200008008000000DF7983283213174169377B5B6A7459410000000000000000C7E7E13D3C131741B8FAA35A697459410000000000000000910819637E131741F92CAE5F6A7459410000000000000000B955C98BC6131741677BE27B6B7459410000000000000000FD6AEBEDC6131741635B657D6B74594100000000000000008BC2773DC213174114F874936C7459410000000000000000E118C528A5131741F2B8D1206C7459410000000000000000DF7983283213174169377B5B6A7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.535', NULL, 21, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000802B0000003AD872FC001317419DEEDC636A74594100000000000000000BC7040804131741AB18D54F6A745941000000000000000005CAE79805131741912788456A745941000000000000000030FFFC1D0813174154F2F4346A7459410000000000000000031BBDA009131741DA40B92C6A74594100000000000000000270CDE30A131741E3A2D8256A74594100000000000000000986C9A90C1317412A14631F6A745941000000000000F87F6E3C50550F1317412975A9156A7459410000000000000000FD48028012131741753282116A7459410000000000000000DD8E644A14131741FC01290F6A7459410000000000000000EE3B098A15131741A807020E6A7459410000000000000000ABD30F8B1713174167262E0C6A745941000000000000F87FD6CCFA9419131741BBF2460A6A7459410000000000000000CC48C310231317416D72E41F6A7459410000000000000000DF7983283213174169377B5B6A7459410000000000000000C7E7E13D3C131741B8FAA35A697459410000000000000000910819637E131741F92CAE5F6A7459410000000000000000B955C98BC6131741677BE27B6B7459410000000000000000FD6AEBEDC6131741635B657D6B74594100000000000000008ED88C71F813174126A497406C7459410000000000000000754FF84B1E1417418089D1D56C745941000000000000000026EEFF3F35141741387C4D306D745941000000000000000026EEFF3F35141741387C4D306D7459410000000000000000623BDB3A451417413C164C6F6D7459410000000000000000623BDB3A451417413C164C6F6D7459410000000000000000C847953B4A141741A005692A6C74594100000000000000003D25D06B4C1417418A654B9C6B7459410000000000000000FC6E21B550141741BD05EF856A745941000000000000000046AE0C06D213174117088392687459410000000000000000384D5E54D6131741CF8BF07A677459410000000000000000523EF06AB11317413B7118E9667459410000000000000000A32DFA45AB1317414570D1D0667459410000000000000000A32DFA45AB1317414570D1D066745941000000000000000014EC87E82A13174150F9A0D56474594100000000000000001F3A310E261317415A6DB1B6647459410000000000000000514F7F8321131741D301668D647459410000000000000000ECFC6D5E1D1317416293865A64745941000000000000000028BC0CB319131741C866091F647459410000000000000000E8D5E7D410131741AA8EE35E667459410000000000000000449958B50E1317413A1DC5E866745941000000000000000056968F8C0913174151FECD376874594100000000000000002890BB48071317417FC2E2CA6874594100000000000000003AD872FC001317419DEEDC636A7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, '', NULL, '2020-06-08 16:00:00.047', NULL, 1, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000800B00000071FD9B50B9121741B95006D37F7459410000000000000000E54FC557D4121741D947F1E2787459410000000000000000E54FC557D4121741D947F1E2787459410000000000000000792DC9C7F61217415CEB0CC17B74594100000000000000002A5A72C652131741FE4E46B07D745941000000000000000079B2453560131741C7C4A2E27D745941000000000000000083A5EF6FF3131741B57C9600807459410000000000000000BE5DCFF2E71317417AA9EAF2827459410000000000000000656FCEFD3B1317410BF5A5E980745941000000000000000025F0FF1BD6121741451E5A6F7F745941000000000000000071FD9B50B9121741B95006D37F7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.88', NULL, 3, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000800700000030B8EA02481317415028FF0584745941000000000000000055BFC8784C13174181F554E48274594100000000000000004137ABDDF5121741BFC3B890817459410000000000000000D474FB52B612174141C48D978074594100000000000000008C1C5675B0121741002B61F88174594100000000000000001660ED1ABF121741099466E881745941000000000000000030B8EA02481317415028FF05847459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.581', NULL, 17, NULL, 1, 2, '010C0000A0FB0B000001000000010A00008001000000010200008009000000E120FE140F1317412C7E1B306F7459410000000000000000DF38EDE72F13174187735C3D70745941000000000000F87FE229380C72131741206DEB5B727459410000000000000000E118C528A5131741F2B8D1206C7459410000000000000000DF7983283213174169377B5B6A7459410000000000000000CC48C310231317416D72E41F6A7459410000000000000000B8AF66BC191317410D7A3B7C6C745941000000000000000072ECB81318131741FA75F6E76C7459410000000000000000E120FE140F1317412C7E1B306F7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.571', NULL, 8, NULL, 1, 2, '010C0000A0FB0B000001000000010A000080010000000102000080130000003AD872FC001317419DEEDC636A74594100000000000000009059FF4CFE12174119CF947C6A74594100000000000000007F619AB7F4121741C30E77F96A74594100000000000000009DBF24A9F2121741F0AE891E6B7459410000000000000000E8985D04EF1217411364A86E6B7459410000000000000000EC48EF71ED121741A2FD5E996B745941000000000000000095375ED5EA121741410337F36B74594100000000000000005807E1FEC6121741CE7A740A7574594100000000000000003E0761BFC61217411FE9DD3B757459410000000000000000716306B3C6121741F6896E6D757459410000000000000000287B49C0C7121741DA41FB00767459410000000000000000F233CC6EC91217418E41596076745941000000000000000046F53ADECB121741B9DF74BB767459410000000000000000371B77C2CD121741BA631BF1767459410000000000000000E2C23304CF121741AFAEC910777459410000000000000000D2DB9804CF1217412C06B0107774594100000000000000004EC50A1AD4121741F7068FC6757459410000000000000000C39BA7E3F81217417EACA7716C74594100000000000000003AD872FC001317419DEEDC636A7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.026', NULL, 5, NULL, 1, 2, '010C0000A0FB0B000001000000010A00008001000000010200008006000000FCF8BD4D301317416DDD4A758274594100000000000000008834A2EA4B131741F11F17747B74594100000000000000009A3820F7FF1217414C17097C787459410000000000000000B3D21D0CEA12174172332B957874594100000000000000005F8FBD5DC9121741D5AB82DF807459410000000000000000FCF8BD4D301317416DDD4A75827459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:15.664', NULL, 10, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000800500000012500BC7F2121741D333395E76745941000000000000000062209D7F3013174127309C147674594100000000000000008AF5062F1D13174178D2AEEA737459410000000000000000292604D4FB1217416822771274745941000000000000000012500BC7F2121741D333395E767459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:22.121', NULL, 11, NULL, 1, 2, '010C0000A0FB0B000001000000010A00008001000000010200008005000000292604D4FB121741682277127474594100000000000000008AF5062F1D13174178D2AEEA73745941000000000000000077A01736101317411208A676727459410000000000000000DC732AE801131741F388B587727459410000000000000000292604D4FB12174168227712747459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.962', NULL, 19, NULL, 1, 2, '010C0000A0FB0B000001000000010A000080010000000102000080060000008BC2773DC213174114F874936C7459410000000000000000B955C98BC6131741677BE27B6B7459410000000000000000FD6AEBEDC6131741635B657D6B745941000000000000000052C8CEA9DA131741611331CB6B7459410000000000000000F734418DDA131741D05D4BF36C74594100000000000000008BC2773DC213174114F874936C7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.083', NULL, 9, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000800600000082AE7923EE121741FBDB7A8B777459410000000000000000E81A8D3A4A131741A05E86F67874594100000000000000004FDD4CB0331317418CD5197076745941000000000000000062209D7F3013174127309C1476745941000000000000000012500BC7F2121741D333395E76745941000000000000000082AE7923EE121741FBDB7A8B777459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.79', NULL, 15, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000800C0000006AC2CC4C0B141741AF0E7DA7717459410000000000000000877D9CAEF7131741FF3C18BD7174594100000000000000008ED88C71F813174126A497406C7459410000000000000000D0279C71F8131741E60A2A406C745941000000000000000052C8CEA9DA131741611331CB6B7459410000000000000000F734418DDA131741D05D4BF36C7459410000000000000000AADF54CBE3131741CF83BA176D7459410000000000000000430CBCD6E21317417DA7D39174745941000000000000000094D784F9E11317415C20C04C7B745941000000000000000054C28016E5131741CA1006597B74594100000000000000007CED50DCE7131741C006F6A47A74594100000000000000006AC2CC4C0B141741AF0E7DA7717459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.529', NULL, 6, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000800E000000FCF8BD4D301317416DDD4A758274594100000000000000008834A2EA4B131741F11F17747B74594100000000000000009A3820F7FF1217414C17097C787459410000000000000000B3D21D0CEA12174172332B9578745941000000000000000082AE7923EE121741FBDB7A8B777459410000000000000000E81A8D3A4A131741A05E86F6787459410000000000000000D7331F946113174164862C947B7459410000000000000000849F57EF66131741BCA0C92D7C7459410000000000000000C52F92B563131741282144FF7C745941000000000000000079B2453560131741C7C4A2E27D745941000000000000000010DB92F65613174134CE023B80745941000000000000000029C2B549531317417E89AF2981745941000000000000000055BFC8784C13174181F554E4827459410000000000000000FCF8BD4D301317416DDD4A75827459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:28.32', NULL, 4, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000801100000030B8EA02481317415028FF0584745941000000000000000055BFC8784C13174181F554E482745941000000000000000029C2B549531317417E89AF2981745941000000000000000010DB92F65613174134CE023B80745941000000000000000079B2453560131741C7C4A2E27D7459410000000000000000C52F92B563131741282144FF7C7459410000000000000000849F57EF66131741BCA0C92D7C7459410000000000000000C05E0AC36C131741F01661B37A745941000000000000000031D82363781317414CBCC9E07A7459410000000000000000BE89ECF1DD13174123FF786D7C745941000000000000000094D784F9E11317415C20C04C7B7459410000000000000000A2566E62F4131741E46C19917B7459410000000000000000B6963821DE1317417B433841817459410000000000000000B831F563ED1317410BF01C8E817459410000000000000000BE5DCFF2E71317417AA9EAF2827459410000000000000000E2F58DEBDA131741BEAA1E4986745941000000000000000030B8EA02481317415028FF05847459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.275', NULL, 7, NULL, 1, 2, '010C0000A0FB0B000001000000010A000080010000000102000080220000005F8FBD5DC9121741D5AB82DF80745941000000000000000082AE7923EE121741FBDB7A8B77745941000000000000000012500BC7F2121741D333395E767459410000000000000000292604D4FB12174168227712747459410000000000000000DC732AE801131741F388B5877274594100000000000000002C06A34306131741B0F6BD6C717459410000000000000000231E65CB0C131741FDA8A8C46F7459410000000000000000E120FE140F1317412C7E1B306F745941000000000000000072ECB81318131741FA75F6E76C7459410000000000000000B8AF66BC191317410D7A3B7C6C7459410000000000000000CC48C310231317416D72E41F6A7459410000000000000000D6CCFA9419131741BBF2460A6A7459410000000000000000ABD30F8B1713174167262E0C6A745941000000000000F87FEE3B098A15131741A807020E6A7459410000000000000000DD8E644A14131741FC01290F6A7459410000000000000000BA38B50A10131741CFC214136A74594100000000000000006E3C50550F1317412975A9156A74594100000000000000000986C9A90C1317412A14631F6A745941000000000000F87F0270CDE30A131741E3A2D8256A7459410000000000000000031BBDA009131741DA40B92C6A745941000000000000000030FFFC1D0813174154F2F4346A745941000000000000000005CAE79805131741912788456A74594100000000000000000BC7040804131741AB18D54F6A74594100000000000000002A0B73FC00131741E9ECDC636A7459410000000000000000C39BA7E3F81217417EACA7716C74594100000000000000004EC50A1AD4121741F7068FC6757459410000000000000000E2C23304CF121741AFAEC910777459410000000000000000D2DB9804CF1217412C06B010777459410000000000000000CEC3D5BBDA1217410205FB3E777459410000000000000000C5A5AD57D5121741F9E440A1787459410000000000000000E54FC557D4121741D947F1E278745941000000000000000071FD9B50B9121741B95006D37F7459410000000000000000D474FB52B612174141C48D978074594100000000000000005F8FBD5DC9121741D5AB82DF807459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.883', NULL, 2, NULL, 1, 2, '010C0000A0FB0B000001000000010A00008001000000010200008016000000E8D5E7D410131741AA8EE35E6674594100000000000000001670B7DF92131741A483155E687459410000000000000000B9D294B8A2131741F8F99CE0687459410000000000000000A32DFA45AB1317414570D1D0667459410000000000000000A32DFA45AB1317414570D1D0667459410000000000000000523EF06AB11317413B7118E966745941000000000000000091132A98A813174129BE4C01697459410000000000000000F724BC03D21317416EE04CD0697459410000000000000000F724BC03D21317416EE04CD06974594100000000000000003D25D06B4C1417418A654B9C6B7459410000000000000000C847953B4A141741A005692A6C74594100000000000000006D5C7D55CD1317412AFDAC666A7459410000000000000000896059A7A4131741EB339D9A697459410000000000000000896059A7A4131741EB339D9A697459410000000000000000910819637E131741F92CAE5F6A74594100000000000000002890BB48071317417FC2E2CA68745941000000000000000056968F8C0913174151FECD37687459410000000000000000CAE9E16B77131741AA6D33B7697459410000000000000000CAE9E16B77131741AA6D33B769745941000000000000000045D1E80C941317417576272D697459410000000000000000449958B50E1317413A1DC5E8667459410000000000000000E8D5E7D410131741AA8EE35E667459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.04', NULL, 37, NULL, 1, 2, '010C0000A0FB0B000001000000010A00008001000000010200008005000000CC48C310231317416D72E41F6A7459410000000000000000B8AF66BC191317410D7A3B7C6C7459410000000000000000C7EE54972713174105DBDFAF6C7459410000000000000000DF7983283213174169377B5B6A7459410000000000000000CC48C310231317416D72E41F6A7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.708', '2021-12-22 15:07:12.708078', 23, NULL, 1, 2, NULL, 2, NULL, NULL, NULL, '0106000020FB0B000001000000010300000001000000090000008C1C5675B0121741002B61F8817459410B2935A5B71217412FF989F08174594159BB7D6ABD1217412ACBDC0582745941E2F58DEBDA131741BEAA1E498674594110485923EC131741A404478D81745941D43C4A41FF131741E86C47F77C745941C05E0AC36C131741F01661B37A7459419039A3ABD61217413E3DFD49787459418C1C5675B0121741002B61F881745941', NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.207', NULL, 14, NULL, 1, 2, '010C0000A0FB0B000001000000010A000080010000000102000080050000008824D60574131741B62DE1DB78745941000000000000000008391510E21317412D5AB08D7A7459410000000000000000430CBCD6E21317417DA7D391747459410000000000000000A57C011B851317419239B3867474594100000000000000008824D60574131741B62DE1DB787459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.924', NULL, 20, NULL, 1, 2, '010C0000A0FB0B000001000000010A000080010000000102000080050000006AC2CC4C0B141741AF0E7DA7717459410000000000000000877D9CAEF7131741FF3C18BD7174594100000000000000008ED88C71F813174126A497406C7459410000000000000000754FF84B1E1417418089D1D56C74594100000000000000006AC2CC4C0B141741AF0E7DA7717459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.429', NULL, 13, NULL, 1, 2, '010C0000A0FB0B000001000000010A00008001000000010200008009000000C05E0AC36C131741F01661B37A74594100000000000000002806E2CD701317412346DDAC79745941000000000000000056F45A3E711317413B3155907974594100000000000000008824D60574131741B62DE1DB78745941000000000000000008391510E21317412D5AB08D7A745941000000000000000094D784F9E11317415C20C04C7B7459410000000000000000BE89ECF1DD13174123FF786D7C745941000000000000000031D82363781317414CBCC9E07A7459410000000000000000C05E0AC36C131741F01661B37A7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.917', '2022-01-04 11:09:17.916685', 27, NULL, 1, 2, NULL, 2, NULL, NULL, NULL, '0106000020FB0B0000010000000103000000010000000B00000072ECB81318131741FA75F6E76C745941C39BA7E3F81217417EACA7716C7459412A0B73FC00131741E9ECDC636A74594105CAE79805131741912788456A745941EFD509D3091317415921BA296A7459416E3C50550F1317412975A9156A745941DD8E644A14131741FC01290F6A745941D6CCFA9419131741BBF2460A6A7459412476BD0A231317416D72E41F6A745941B8AF66BC191317410D7A3B7C6C74594172ECB81318131741FA75F6E76C745941', NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:19.353', '2022-01-04 09:41:19.352718', 25, NULL, 1, 2, NULL, 2, NULL, NULL, NULL, NULL, '0106000020FB0B0000010000000103000000010000000A000000754FF84B1E1417418089D1D56C745941FD6AEBEDC6131741635B657D6B7459418BC2773DC213174114F874936C7459412476BD0A231317416D72E41F6A7459415F8FBD5DC9121741D5AB82DF8074594155BFC8784C13174181F554E48274594156F45A3E711317413B3155907974594154C28016E5131741CA1006597B745941B7E016A1F61317414982DEE576745941754FF84B1E1417418089D1D56C745941');
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.945', NULL, 45, NULL, 1, 2, '010C0000A0FB0B000001000000010A00008001000000010200008006000000A2566E62F4131741E46C19917B7459410000000000000000FF0D8DED031417412C1A77C47B745941000000000000000083A5EF6FF3131741B57C9600807459410000000000000000B831F563ED1317410BF01C8E817459410000000000000000B6963821DE1317417B433841817459410000000000000000A2566E62F4131741E46C19917B7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:02.662', NULL, 12, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000800D000000DC732AE801131741F388B5877274594100000000000000002C06A34306131741B0F6BD6C717459410000000000000000231E65CB0C131741FDA8A8C46F74594100000000000000006DAD0A8C331317411BE1231E74745941000000000000F87FF3A897F962131741729EE47079745941000000000000000056F45A3E711317413B3155907974594100000000000000002806E2CD701317412346DDAC797459410000000000000000C05E0AC36C131741F01661B37A7459410000000000000000849F57EF66131741BCA0C92D7C7459410000000000000000D7331F946113174164862C947B74594100000000000000004FDD4CB0331317418CD5197076745941000000000000000077A01736101317411208A676727459410000000000000000DC732AE801131741F388B587727459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.215', NULL, 16, NULL, 1, 2, '010C0000A0FB0B000001000000010A0000800100000001020000800F000000E118C528A5131741F2B8D1206C7459410000000000000000E229380C72131741206DEB5B727459410000000000000000DF38EDE72F13174187735C3D70745941000000000000F87FE120FE140F1317412C7E1B306F7459410000000000000000231E65CB0C131741FDA8A8C46F74594100000000000000006DAD0A8C331317411BE1231E74745941000000000000F87FF3A897F962131741729EE47079745941000000000000000056F45A3E711317413B3155907974594100000000000000008824D60574131741B62DE1DB787459410000000000000000A57C011B851317419239B386747459410000000000000000430CBCD6E21317417DA7D391747459410000000000000000AADF54CBE3131741CF83BA176D7459410000000000000000F734418DDA131741D05D4BF36C74594100000000000000008BC2773DC213174114F874936C7459410000000000000000E118C528A5131741F2B8D1206C7459410000000000000000', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly, geom_poly2) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2020-06-08 16:00:00.704', '2022-01-11 17:17:27.703867', 34, NULL, 1, 2, NULL, 2, NULL, NULL, NULL, '0106000020FB0B00000100000001030000000100000005000000E2F58DEBDA131741BEAA1E4986745941FF0D8DED031417412C1A77C47B745941A2566E62F4131741E46C19917B74594138D2372BCB1317414AF4060B86745941E2F58DEBDA131741BEAA1E4986745941', NULL);


--
-- TOC entry 4367 (class 0 OID 18678)
-- Dependencies: 251
-- Data for Name: kaavamaarays; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (209, 272, 6, 6, '2020-06-08 16:00:00.75', NULL, 1, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (78, 204, 6, 11, '2020-06-08 16:00:00.372', NULL, 2, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (260, 196, 6, 1, '2020-06-08 16:00:00.777', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (259, 196, 6, 1, '2020-06-08 16:00:00.349', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (257, 196, 6, 1, '2020-06-08 16:00:00.609', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (258, 196, 6, 1, '2020-06-08 16:00:00.753', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (27, 80, 6, 6, '2020-08-06 16:00:00.494', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (23, 215, 6, 11, '2020-06-08 16:00:00.395', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (14, 273, 6, 11, '2020-06-08 16:00:00.76', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (20, 215, 6, 11, '2020-06-08 16:00:00.412', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (21, 215, 6, 11, '2020-06-08 16:00:00.091', NULL, 3, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (39, 221, 6, 11, '2020-06-08 16:00:00.35', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (22, 215, 6, 11, '2020-06-08 16:00:00.101', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (19, 221, 6, 11, '2020-06-08 16:00:00.379', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (130, 3, 6, 2, '2020-06-08 16:00:00.771', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (131, 3, 6, 2, '2020-06-08 16:00:00.722', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (43, 221, 6, 11, '2020-06-08 16:00:00.629', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (132, 3, 6, 2, '2020-06-08 16:00:00.135', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (133, 3, 6, 2, '2020-06-08 16:00:00.409', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (40, 221, 6, 11, '2020-06-08 16:00:00.898', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (134, 3, 6, 2, '2020-06-08 16:00:00.67', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (135, 3, 6, 2, '2020-06-08 16:00:00.494', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (136, 3, 6, 2, '2020-06-08 16:00:00.797', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (44, 221, 6, 11, '2020-06-08 16:00:00.184', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (45, 187, 6, 11, '2020-06-08 16:00:00.355', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (137, 3, 6, 2, '2020-06-08 16:00:00.021', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (138, 3, 6, 2, '2020-06-08 16:00:00.301', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (139, 3, 6, 2, '2020-06-08 16:00:00.492', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (16, 272, 6, 6, '2020-06-08 16:00:00.67', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (13, 272, 6, 6, '2020-06-08 16:00:00.93', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (29, 158, 6, 8, '2020-08-06 16:00:00.032', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (15, 272, 6, 6, '2020-06-08 16:00:00.65', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (50, 187, 6, 1, '2020-06-08 16:00:00.957', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (140, 3, 6, 2, '2020-06-08 16:00:00.665', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (54, 196, 6, 1, '2020-06-08 16:00:00.29', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (142, 3, 6, 2, '2020-06-08 16:00:00.899', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (30, 215, 6, 11, '2020-06-08 16:00:00.164', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (143, 17, 6, 3, '2020-06-08 16:00:00.128', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (75, 80, 6, 6, '2020-06-07 16:00:00.057', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (76, 215, 6, 11, '2020-06-08 16:00:00.112', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (77, 213, 6, 11, '2020-06-08 16:00:00.481', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (79, 221, 6, 11, '2020-06-08 16:00:00.232', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (80, 158, 6, 11, '2020-06-08 16:00:00.472', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (85, 159, 6, 11, '2020-06-08 16:00:00.808', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (86, 157, 6, 11, '2020-06-08 16:00:00.382', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (87, 144, 6, 11, '2020-06-08 16:00:00.682', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (88, 213, 6, 11, '2020-06-08 16:00:00.471', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (41, 221, 6, 11, '2020-06-08 16:00:00.154', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (28, 221, 6, 11, '2020-06-08 16:00:00.602', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (31, 215, 6, 11, '2020-06-08 16:00:00.922', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (42, 221, 6, 11, '2020-06-08 16:00:00.646', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (32, 215, 6, 11, '2020-06-08 16:00:00.562', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (37, 215, 6, 11, '2020-06-08 16:00:00.741', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (74, 142, 6, 11, '2020-06-08 16:00:00.096', NULL, 18, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (103, 272, 6, 6, '2020-06-08 16:00:00.267', NULL, 3, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (89, 159, 6, 11, '2020-06-08 16:00:00.192', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (47, 187, 6, 1, '2020-06-08 16:00:00.932', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (107, 227, 6, 5, '2020-06-08 16:00:00.892', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (108, 142, 6, 5, '2020-06-08 16:00:00.352', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (81, 221, 6, 11, '2020-06-08 16:00:00.455', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (90, 157, 6, 11, '2020-06-08 16:00:00.952', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (91, 144, 6, 11, '2020-06-08 16:00:00.953', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (92, 213, 6, 11, '2020-06-08 16:00:00.041', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (12, 272, 6, 6, '2020-06-08 16:00:00.762', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (106, 136, 6, 6, '2020-06-08 16:00:00.241', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (48, 187, 6, 1, '2020-06-08 16:00:00.683', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (49, 187, 6, 1, '2020-06-08 16:00:00.802', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (97, 80, 6, 6, '2020-06-08 16:00:00.123', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (100, 221, 6, 11, '2020-06-08 16:00:00.571', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (98, 158, 6, 11, '2020-06-08 16:00:00.603', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (102, 157, 6, 11, '2020-06-08 16:00:00.024', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (99, 159, 6, 11, '2020-06-08 16:00:00.147', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (101, 213, 6, 11, '2020-06-08 16:00:00.292', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (125, 188, 6, 1, '2020-06-08 16:00:00.764', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (109, 80, 6, 6, '2020-06-08 16:00:00.515', NULL, 8, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (104, 272, 6, 6, '2020-06-08 16:00:00.397', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (144, 17, 6, 3, '2020-06-08 16:00:00.091', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (145, 17, 6, 3, '2020-06-08 16:00:00.471', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (146, 17, 6, 3, '2020-06-08 16:00:00.799', '2020-06-08 16:00:00.821', 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (35, 215, 6, 11, '2020-06-08 16:00:00.853', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (36, 215, 6, 11, '2020-06-08 16:00:00.443', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (147, 17, 6, 3, '2020-06-08 16:00:00.437', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (148, 17, 6, 3, '2020-06-08 16:00:00.485', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (149, 17, 6, 3, '2020-06-08 16:00:00.782', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (33, 215, 6, 11, '2020-06-08 16:00:00.835', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (34, 215, 6, 11, '2020-06-08 16:00:00.165', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (150, 17, 6, 3, '2020-06-08 16:00:00.59', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (38, 221, 6, 11, '2020-06-08 16:00:00.739', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (46, 187, 6, 11, '2020-06-08 16:00:00.149', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (51, 187, 6, 11, '2020-06-08 16:00:00.43', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (52, 188, 6, 11, '2020-06-08 16:00:00.645', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (56, 184, 6, 1, '2020-06-08 16:00:00.399', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (55, 154, 6, 11, '2020-06-08 16:00:00.494', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (57, 43, 6, 11, '2020-06-08 16:00:00.861', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (58, 188, 6, 11, '2020-06-08 16:00:00.109', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (60, 137, 6, 11, '2020-06-08 16:00:00.654', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (59, 138, 6, 11, '2020-06-08 16:00:00.985', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (61, 227, 6, 11, '2020-06-08 16:00:00.226', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (62, 216, 6, 11, '2020-06-08 16:00:00.074', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (66, 216, 6, 11, '2020-06-08 16:00:00.162', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (63, 216, 6, 11, '2020-06-08 16:00:00.218', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (65, 134, 6, 11, '2020-06-08 16:00:00.447', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (64, 134, 6, 11, '2020-06-08 16:00:00.603', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (67, 134, 6, 11, '2020-06-08 16:00:00.46', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (68, 204, 6, 11, '2020-06-08 16:00:00.476', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (69, 134, 6, 11, '2020-06-08 16:00:00.76', NULL, 13, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (71, 213, 6, 11, '2020-06-08 16:00:00.133', NULL, 13, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (70, 263, 6, 11, '2020-06-08 16:00:00.945', NULL, 13, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (82, 221, 6, 11, '2020-06-08 16:00:00.211', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (83, 80, 6, 6, '2020-06-08 16:00:00.883', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (84, 158, 6, 11, '2020-06-08 16:00:00.255', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (93, 159, 6, 11, '2020-06-08 16:00:00.667', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (94, 157, 6, 11, '2020-06-08 16:00:00.8', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (95, 144, 6, 11, '2020-06-08 16:00:00.628', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (96, 213, 6, 11, '2020-06-08 16:00:00.73', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (110, 213, 6, 11, '2020-06-08 16:00:00.485', NULL, 8, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (111, 213, 6, 11, '2020-06-08 16:00:00.675', NULL, 8, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (112, 81, 6, 6, '2020-06-08 16:00:00.406', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (119, 81, 6, 6, '2020-06-08 16:00:00.646', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (120, 221, 6, 11, '2020-06-08 16:00:00.959', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (113, 221, 6, 11, '2020-06-08 16:00:00.287', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (114, 161, 6, 11, '2020-06-08 16:00:00.41', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (121, 161, 6, 11, '2020-06-08 16:00:00.573', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (122, 163, 6, 11, '2020-06-08 16:00:00.457', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (115, 163, 6, 11, '2020-06-08 16:00:00.553', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (116, 167, 6, 11, '2020-06-08 16:00:00.772', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (123, 167, 6, 11, '2020-06-08 16:00:00.893', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (124, 213, 6, 11, '2020-06-08 16:00:00.864', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (117, 213, 6, 11, '2020-06-08 16:00:00.08', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (118, 204, 6, 11, '2020-06-08 16:00:00.124', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (151, 17, 6, 3, '2020-06-08 16:00:00.787', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (152, 17, 6, 3, '2020-06-08 16:00:00.151', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (153, 17, 6, 3, '2020-06-08 16:00:00.449', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (154, 17, 6, 3, '2020-06-08 16:00:00.745', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (155, 17, 6, 3, '2020-06-08 16:00:00.189', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (157, 18, 6, 3, '2020-06-08 16:00:00.826', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (158, 18, 6, 3, '2020-06-08 16:00:00.946', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (159, 18, 6, 3, '2020-06-08 16:00:00.85', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (160, 18, 6, 3, '2020-06-08 16:00:00.924', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (161, 18, 6, 3, '2020-06-08 16:00:00.076', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (162, 18, 6, 3, '2020-06-08 16:00:00.254', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (163, 18, 6, 3, '2020-06-08 16:00:00.387', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (164, 18, 6, 3, '2020-06-08 16:00:00.748', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (165, 18, 6, 3, '2020-06-08 16:00:00.879', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (166, 18, 6, 3, '2020-06-08 16:00:00.291', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (167, 18, 6, 3, '2020-06-08 16:00:00.576', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (168, 18, 6, 3, '2020-06-08 16:00:00.943', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (169, 18, 6, 3, '2020-06-08 16:00:00.191', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (171, 23, 6, 3, '2020-06-08 16:00:00.036', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (172, 23, 6, 3, '2020-06-08 16:00:00.327', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (173, 23, 6, 3, '2020-06-08 16:00:00.327', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (174, 23, 6, 3, '2020-06-08 16:00:00.42', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (175, 23, 6, 3, '2020-06-08 16:00:00.768', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (176, 23, 6, 3, '2020-06-08 16:00:00.144', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (177, 23, 6, 3, '2020-06-08 16:00:00.295', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (178, 23, 6, 3, '2020-06-08 16:00:00.525', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (179, 23, 6, 3, '2020-06-08 16:00:00.33', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (180, 23, 6, 3, '2020-06-08 16:00:00.49', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (181, 23, 6, 3, '2020-06-08 16:00:00.616', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (182, 23, 6, 3, '2020-06-08 16:00:00.917', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (184, 23, 6, 3, '2020-06-08 16:00:00.776', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (185, 34, 6, 3, '2020-06-08 16:00:00.723', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (186, 34, 6, 3, '2020-06-08 16:00:00.43', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (187, 34, 6, 3, '2020-06-08 16:00:00.159', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (188, 34, 6, 3, '2020-06-08 16:00:00.151', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (189, 34, 6, 3, '2020-06-08 16:00:00.779', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (190, 34, 6, 3, '2020-06-08 16:00:00.498', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (191, 34, 6, 3, '2020-06-08 16:00:00.186', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (192, 34, 6, 3, '2020-06-08 16:00:00.395', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (193, 34, 6, 3, '2020-06-08 16:00:00.683', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (194, 34, 6, 3, '2020-06-08 16:00:00.381', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (195, 34, 6, 3, '2020-06-08 16:00:00.338', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (196, 34, 6, 3, '2020-06-08 16:00:00.209', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (198, 34, 6, 3, '2020-06-08 16:00:00.98', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (199, 196, 6, 1, '2020-06-08 16:00:00.433', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (201, 196, 6, 1, '2020-06-08 16:00:00.597', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (202, 196, 6, 1, '2020-06-08 16:00:00.568', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (203, 196, 6, 1, '2020-06-08 16:00:00.594', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (204, 196, 6, 1, '2020-06-08 16:00:00.799', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (205, 196, 6, 1, '2020-06-08 16:00:00.92', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (208, 196, 6, 1, '2020-06-08 16:00:00.988', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (212, 196, 6, 1, '2020-06-08 16:00:00.255', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (213, 184, 6, 1, '2020-06-08 16:00:00.526', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (214, 184, 6, 1, '2020-06-08 16:00:00.065', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (215, 184, 6, 1, '2020-06-08 16:00:00.165', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (216, 184, 6, 1, '2020-06-08 16:00:00.205', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (217, 184, 6, 1, '2020-06-08 16:00:00.184', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (218, 184, 6, 1, '2020-06-08 16:00:00.256', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (219, 184, 6, 1, '2020-06-08 16:00:00.7', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (220, 184, 6, 1, '2020-06-08 16:00:00.686', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (221, 184, 6, 1, '2020-06-08 16:00:00.387', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (222, 184, 6, 1, '2020-06-08 16:00:00.402', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (223, 184, 6, 1, '2020-06-08 16:00:00.563', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (225, 184, 6, 1, '2020-06-08 16:00:00.643', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (226, 276, 6, 2, '2020-06-08 16:00:00.88', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (227, 276, 6, 2, '2020-06-08 16:00:00.526', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (228, 276, 6, 2, '2020-06-08 16:00:00.14', NULL, 9, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (229, 276, 6, 2, '2020-06-08 16:00:00.863', NULL, 10, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (230, 276, 6, 2, '2020-06-08 16:00:00.542', NULL, 11, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (231, 276, 6, 2, '2020-06-08 16:00:00.152', NULL, 12, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (232, 276, 6, 2, '2020-06-08 16:00:00.535', NULL, 14, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (233, 276, 6, 2, '2020-06-08 16:00:00.16', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (234, 276, 6, 2, '2020-06-08 16:00:00.312', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (235, 276, 6, 2, '2020-06-08 16:00:00.867', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (236, 276, 6, 2, '2020-06-08 16:00:00.474', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (237, 276, 6, 2, '2020-06-08 16:00:00.13', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (239, 276, 6, 2, '2020-06-08 16:00:00.786', NULL, 37, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (240, 213, 6, 11, '2020-06-08 16:00:00.796', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (241, 213, 6, 11, '2020-06-08 16:00:00.591', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (242, 213, 6, 11, '2020-06-08 16:00:00.673', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (243, 213, 6, 11, '2020-06-08 16:00:00.721', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (244, 213, 6, 11, '2020-06-08 16:00:00.825', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (245, 197, 6, 11, '2020-06-08 16:00:00.315', NULL, 20, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (246, 197, 6, 11, '2020-06-08 16:00:00.437', NULL, 15, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (247, 197, 6, 11, '2020-06-08 16:00:00.559', NULL, 19, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (248, 197, 6, 11, '2020-06-08 16:00:00.65', NULL, 16, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (249, 197, 6, 11, '2020-06-08 16:00:00.65', NULL, 17, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (126, 184, 6, 1, '2020-06-08 16:00:00.73', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (127, 80, 6, 6, '2020-06-08 16:00:00.197', NULL, 3, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (128, 80, 6, 6, '2020-06-08 16:00:00.859', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (129, 80, 6, 6, '2020-06-08 16:00:00.614', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (250, 213, 6, 6, '2020-06-08 16:00:00.001', NULL, 3, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (251, 213, 6, 6, '2020-06-08 16:00:00.152', NULL, 4, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (252, 213, 6, 6, '2020-06-08 16:00:00.288', NULL, 5, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (253, 213, 6, 6, '2020-06-08 16:00:00.426', NULL, 6, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (254, 213, 6, 6, '2020-06-08 16:00:00.596', NULL, 45, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (255, 213, 6, 6, '2020-06-08 16:00:00.701', NULL, 7, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (265, 221, 6, 6, '2020-06-08 16:00:00.187', NULL, 21, 2);
INSERT INTO kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) OVERRIDING SYSTEM VALUE VALUES (256, 204, 6, 6, '2020-06-08 16:00:00.849', NULL, 1, 2);


--
-- TOC entry 4351 (class 0 OID 18572)
-- Dependencies: 235
-- Data for Name: kaavan_kumoamistieto; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4357 (class 0 OID 18605)
-- Dependencies: 241
-- Data for Name: kaavan_laatija; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.kaavan_laatija (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, nimike, rooli, id_kaava) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2021-12-22 09:25:17.616715', '2021-12-22 09:25:17.616715', 1, 'John Doe', 'Urban Planner', 'GIS analysis', NULL);
INSERT INTO kaavatiedot.kaavan_laatija (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, nimike, rooli, id_kaava) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2021-12-22 09:25:17.616715', '2021-12-22 09:25:17.616715', 2, 'Jane Doe', 'Architect', 'Head of planning', NULL);


--
-- TOC entry 4375 (class 0 OID 18735)
-- Dependencies: 259
-- Data for Name: kaavaselostus; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4379 (class 0 OID 18764)
-- Dependencies: 263
-- Data for Name: kaavasuositus; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4406 (class 0 OID 19068)
-- Dependencies: 290
-- Data for Name: kasittelytapahtuma; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4397 (class 0 OID 18959)
-- Dependencies: 281
-- Data for Name: koodiarvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4403 (class 0 OID 19009)
-- Dependencies: 287
-- Data for Name: korkeuspiste; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.korkeuspiste (id, geom, id_numeerinen_arvo) OVERRIDING SYSTEM VALUE VALUES (1, NULL, NULL);
INSERT INTO kaavatiedot.korkeuspiste (id, geom, id_numeerinen_arvo) OVERRIDING SYSTEM VALUE VALUES (2, NULL, NULL);
INSERT INTO kaavatiedot.korkeuspiste (id, geom, id_numeerinen_arvo) OVERRIDING SYSTEM VALUE VALUES (3, NULL, NULL);
INSERT INTO kaavatiedot.korkeuspiste (id, geom, id_numeerinen_arvo) OVERRIDING SYSTEM VALUE VALUES (4, NULL, NULL);
INSERT INTO kaavatiedot.korkeuspiste (id, geom, id_numeerinen_arvo) OVERRIDING SYSTEM VALUE VALUES (5, NULL, NULL);


--
-- TOC entry 4381 (class 0 OID 18781)
-- Dependencies: 265
-- Data for Name: korkeusvali; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.korkeusvali (id, geom, id_numeerinen_arvovali) OVERRIDING SYSTEM VALUE VALUES (1, NULL, NULL);


--
-- TOC entry 4361 (class 0 OID 18634)
-- Dependencies: 245
-- Data for Name: lahtotietoaineisto; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4369 (class 0 OID 18700)
-- Dependencies: 253
-- Data for Name: lisatieto; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4399 (class 0 OID 18974)
-- Dependencies: 283
-- Data for Name: numeerinen_arvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (3, 8, 'm', 14);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (4, 12.5, 'm', 12);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (5, 10.5, 'm', 13);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (6, 10, 'm', 23);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (7, 13, 'm', 17);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (8, 13, 'm', 18);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (9, 13, 'm', 19);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (10, 13, 'm', 20);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (11, 13, 'm', 21);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (12, 8, 'm', 22);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (13, 2, NULL, 31);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (14, 2, NULL, 32);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (15, 2, NULL, 26);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (17, 2, NULL, 28);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (18, 9, NULL, 29);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (19, 5, NULL, 24);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (20, 5, NULL, 25);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (21, 12, NULL, 30);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (22, 3270, 'k-m2', 33);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (16, 1, NULL, 27);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (2, 13, 'm', 16);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (23, 2, NULL, 34);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (24, 34, 'm', 36);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (25, 38, 'm', 37);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (26, 48, 'm', 38);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (29, 3, NULL, 50);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (30, 8, 'm', 60);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (31, 3, 'm', 61);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (32, 10.5, 'm', 62);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (33, 12.5, 'm', 63);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (35, 4840, NULL, 93);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (36, 5580, NULL, 94);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (37, 5580, NULL, 94);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (38, 5580, NULL, 94);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (39, 4.5, 'm', 104);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (45, 3.6, 'm', 52);
INSERT INTO kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (46, 9, 'm', 92);


--
-- TOC entry 4401 (class 0 OID 18984)
-- Dependencies: 285
-- Data for Name: numeerinen_arvovali; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.numeerinen_arvovali (id, minimiarvo, maksimiarvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (2, 11, 12.5, 'm', 77);
INSERT INTO kaavatiedot.numeerinen_arvovali (id, minimiarvo, maksimiarvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (3, 8, 12.5, 'M', 78);
INSERT INTO kaavatiedot.numeerinen_arvovali (id, minimiarvo, maksimiarvo, mittayksikko, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (1, 12.5, 8, 'm', 55);


--
-- TOC entry 4365 (class 0 OID 18659)
-- Dependencies: 249
-- Data for Name: osallistumis_ja_arviointisuunnitelma; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4404 (class 0 OID 19057)
-- Dependencies: 288
-- Data for Name: tapahtuma_abstrakti; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4383 (class 0 OID 18796)
-- Dependencies: 267
-- Data for Name: tekstiarvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (2, 'Itätuulenkuja', NULL, 14);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (14, 'Maanalaisista tiloista maanpintaan johtava ilmanvaihdon kanavatorni', NULL, 43);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (3, 'Sammonsilta', NULL, 12);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (5, 'Merituulentori', NULL, 2);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (6, 'Neljäntuulentie', NULL, 13);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (7, 'Alueelle ei saa sijoittaa asuntokohtaisia pihoja', NULL, 35);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (8, '12-kerroksisessa rakennuksessa sen saa ylittää noin 2,5 metrillä esim. katoksella, lipalla tai arkkitehtuuriin sopeutetulla teknisellä tilalla, joka on enintään 1/5 tyypillisen asuinkerroksen alasta.', NULL, 41);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (9, '12-kerroksisessa rakennuksessa sen saa ylittää noin 2,5 metrillä esim. katoksella, lipalla tai arkkitehtuuriin sopeutetulla teknisellä tilalla, joka on enintään 1/5 tyypillisen asuinkerroksen alasta.', NULL, 39);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (10, '12-kerroksisessa rakennuksessa sen saa ylittää noin 2,5 metrillä esim. katoksella, lipalla tai arkkitehtuuriin sopeutetulla teknisellä tilalla, joka on enintään 1/5 tyypillisen asuinkerroksen alasta.', NULL, 40);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (11, '2', NULL, 42);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (12, 'Sen ulkokuori tulee visuaalisesti sovittaa viereisen asuinrakennuksen julkisivuun. Asuinrakennuksen parveke tai muu kevyt rakenne voi sijoittua kanavatornin ylle. ', NULL, 45);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (13, 'Korttelialueella kanavatornin ulokkeen alle saa sijoittaa huolto-/käytävätilaa kahteen kerrokseen. Ulkopuolisten pääsy sinne on estettävä.', NULL, 44);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (19, 'Kevyen liikenteen kulkuyhteydet eri tasojen välillä tulee toteuttaa siten, että kokonaisuus on toimiva, esteetön ja kaupunkikuvallisesti laadukas. ', NULL, 56);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (20, 'Kevyen liikenteen kulkuyhteydet eri tasojen välillä tulee toteuttaa siten, että kokonaisuus on toimiva, esteetön ja kaupunkikuvallisesti laadukas. ', NULL, 56);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (21, 'Kevyen liikenteen kulkuyhteydet eri tasojen välillä tulee toteuttaa siten, että kokonaisuus on toimiva, esteetön ja kaupunkikuvallisesti laadukas. ', NULL, 56);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (22, 'Kevyen liikenteen kulkuyhteydet eri tasojen välillä tulee toteuttaa siten, että kokonaisuus on toimiva, esteetön ja kaupunkikuvallisesti laadukas. ', NULL, 56);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (23, 'Merituulenkuja', NULL, 65);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (1, 'Lounaistuulenkuja', NULL, 11);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (27, 'Alue on toteutettava yhtenäisenä kokonaisuutena ympäristön kevyen liikenteen alueiden ja istutusten kanssa.', NULL, 70);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (43, 'Maisemoitava', NULL, 73);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (50, 'Merituulentie', NULL, 110);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (44, 'Betonikannella ja/tai rakennuksella katettava katu kaupungin tarpeisiin. Katua kattavan betonikannen päälle, kadulle ja kadun alle rakentamisesta on sovittava kaupungin ja kiinteistön välisin sopimuksin. Katualueella tulee voida tehdä kaivuja tukematta rakenteita.', NULL, 98);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (45, 'Betonikannella ja/tai rakennuksella katettava katu kaupungin tarpeisiin. Katua kattavan betonikannen päälle, kadulle ja kadun alle rakentamisesta on sovittava kaupungin ja kiinteistön välisin sopimuksin. Katualueella tulee voida tehdä kaivuja tukematta rakenteita.', NULL, 98);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (46, 'Betonikannella ja/tai rakennuksella katettava katu kaupungin tarpeisiin. Katua kattavan betonikannen päälle, kadulle ja kadun alle rakentamisesta on sovittava kaupungin ja kiinteistön välisin sopimuksin. Katualueella tulee voida tehdä kaivuja tukematta rakenteita.', NULL, 98);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (47, 'Betonikannella ja/tai rakennuksella katettava katu kaupungin tarpeisiin. Katua kattavan betonikannen päälle, kadulle ja kadun alle rakentamisesta on sovittava kaupungin ja kiinteistön välisin sopimuksin. Katualueella tulee voida tehdä kaivuja tukematta rakenteita.', NULL, 98);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (17, 'Alueen osa, joka tulee maisemoida istutuksin ja terassoinnein. Alue on rakennettava korkeatasoisia materiaaleja käyttäen ja sille on istutettava puita, pensaita ja/tai perennoja.', NULL, 70);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (25, 'Pensaat ja perennat', NULL, 68);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (29, 'Alueen osa, joka tulee maisemoida istutuksin ja terassoinnein. Alue on rakennettava korkeatasoisia materiaaleja käyttäen ja sille on istutettava puita, pensaita ja/tai perennoja.', NULL, 71);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (30, 'Alueen osa, joka tulee maisemoida istutuksin ja terassoinnein. Alue on rakennettava korkeatasoisia materiaaleja käyttäen ja sille on istutettava puita, pensaita ja/tai perennoja.', NULL, 72);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (31, 'Alue on rakennettava korkeatasoisia julkisivu- ja viherrakennusmateriaaleja käyttäen, esim. köynnösistutuksin ja terassoinnein.', NULL, 74);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (32, 'Alue on itsenäisesti tuettava niin, että katualueella voidaan tehdä kaivuja tukematta rakenteita.', NULL, 75);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (33, 'Esteetön', NULL, 76);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (34, 'Sammonsillan alueen osa tulee toteuttaa yhtenäisenä kokonaisuutena viereisen Sammonsillan katualueen kanssa', NULL, 79);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (48, 'Betonikannella ja/tai rakennuksella katettava katu kaupungin tarpeisiin. Katua kattavan betonikannen päälle, kadulle ja kadun alle rakentamisesta on sovittava kaupungin ja kiinteistön välisin sopimuksin. Katualueella tulee voida tehdä kaivuja tukematta rakenteita.', NULL, 98);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (18, 'Katettava betonilla', NULL, 51);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (38, 'Sisäpuolelle saa sijoittaa kadun päälle tulevien kansien ja rakennusten kantavia rakenteita. Rakennettaessa rajaan kiinni on rakennettava siten, että edellä mainitut rakenteet voidaan kiinnittää siihen.', NULL, 90);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (39, 'Sisäpuolelle saa sijoittaa kadun päälle tulevien kansien ja rakennusten kantavia rakenteita. Rakennettaessa rajaan kiinni on rakennettava siten, että edellä mainitut rakenteet voidaan kiinnittää siihen.', NULL, 86);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (40, 'Sisäpuolelle saa sijoittaa kadun päälle tulevien kansien ja rakennusten kantavia rakenteita. Rakennettaessa rajaan kiinni on rakennettava siten, että edellä mainitut rakenteet voidaan kiinnittää siihen.', NULL, 87);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (41, 'Sisäpuolelle saa sijoittaa kadun päälle tulevien kansien ja rakennusten kantavia rakenteita. Rakennettaessa rajaan kiinni on rakennettava siten, että edellä mainitut rakenteet voidaan kiinnittää siihen.', NULL, 88);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (42, 'Sisäpuolelle saa sijoittaa kadun päälle tulevien kansien ja rakennusten kantavia rakenteita. Rakennettaessa rajaan kiinni on rakennettava siten, että edellä mainitut rakenteet voidaan kiinnittää siihen.', NULL, 89);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (49, 'Betonikannella ja/tai rakennuksella katettava katu kaupungin tarpeisiin. Katua kattavan betonikannen päälle, kadulle ja kadun alle rakentamisesta on sovittava kaupungin ja kiinteistön välisin sopimuksin. Katualueella tulee voida tehdä kaivuja tukematta rakenteita.', NULL, 98);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (51, '12005', NULL, 124);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (52, '12005', NULL, 125);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (53, '12005', NULL, 127);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (54, '12005', NULL, 126);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (55, '12005', NULL, 128);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (56, '12005', NULL, 129);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (57, '12005', NULL, 130);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (58, '12005', NULL, 131);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (59, '12005', NULL, 124);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (60, '12005', NULL, 134);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (61, '12005', NULL, 133);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (62, '12005', NULL, 124);
INSERT INTO kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) OVERRIDING SYSTEM VALUE VALUES (63, '12005', NULL, 124);


--
-- TOC entry 4391 (class 0 OID 18893)
-- Dependencies: 275
-- Data for Name: tietoyksikko; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-12 16:41:37.75202', '2022-01-12 16:41:37.75202', 14, 'Itätuulenkuja', 21, NULL, 16, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:57:17.384413', '2022-01-18 15:57:17.384413', 78, 'Varattu jalankululle, 8-12.5', 15, NULL, 121, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 29, 'Maanpäällinen kerrosluku IX', 14, NULL, 50, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 26, 'Maanpäällinen kerrosluku II', 9, NULL, 47, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 28, 'Maanpäällinen kerrosluku II', 11, NULL, 49, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:26:46.598815', '2022-01-14 16:26:46.598815', 17, 'Maanpinnan korkeusasema 13.0', 5, NULL, 35, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:26:46.598815', '2022-01-14 16:26:46.598815', 18, 'Maanpinnan korkeusasema 13.0', 6, NULL, 36, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-12 16:41:37.75202', '2022-01-12 16:41:37.75202', 12, 'Sammonsilta', 15, NULL, 13, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 08:44:36.212914', '2022-01-17 08:44:36.212914', 33, 'Sallittu kerrosala 3270', 14, NULL, 56, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 31, 'Maanalainen kerrosluku II', 14, NULL, 52, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 08:56:33.382058', '2022-01-17 08:56:33.382058', 34, 'Maanalainen kerrosluku II', 16, NULL, 58, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 30, 'Maanpäällinen kerrosluku XII', 17, NULL, 51, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 32, 'Maanalainen kerrosluku II', 17, NULL, 125, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 24, 'Maanpäällinen kerrosluku V', 5, NULL, 45, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 25, 'Maanpäällinen kerrosluku V', 6, NULL, 46, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:21:13.059594', '2022-01-18 15:21:13.059594', 63, 'Likimääräinen kansitaso 12.5', 3, NULL, 21, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:55:22.90437', '2022-01-17 16:55:22.90437', 43, 'Maanalaisista tiloista...', 13, NULL, 69, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 12:22:15.715603', '2022-01-18 12:22:15.715603', 53, 'Muu korkeusasemaan liittyvä määräys, kansitaso +8,0 - +12,5', 21, NULL, 79, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 15:37:08.95241', '2022-01-14 15:37:08.95241', 16, 'Korkeus 13.0', 16, NULL, 30, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:21:13.059594', '2022-01-18 15:21:13.059594', 60, 'Likimääräinen kansitaso 8.0', 21, NULL, 23, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-12 16:22:55.864352', '2022-01-12 16:22:55.864352', 11, 'Lounaistuulenkuja', 12, NULL, 12, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-10 16:34:26.705881', '2022-01-10 16:34:26.705881', 2, 'Merituulentori', 4, NULL, 14, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:55:22.90437', '2022-01-17 16:55:22.90437', 44, 'Korttelialueella kanavatornin ulokkeen alle...', 13, NULL, 70, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-12 16:41:37.75202', '2022-01-12 16:41:37.75202', 13, 'Neljäntuulensilta', 7, NULL, 15, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:53:22.656862', '2022-01-18 15:53:22.656862', 77, 'Varattu jalankululle, 11-12.5', 12, NULL, 114, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:26:46.598815', '2022-01-14 16:26:46.598815', 20, 'Maanpinnan korkeusasema 13.0', 10, NULL, 31, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:26:46.598815', '2022-01-14 16:26:46.598815', 21, 'Maanpinnan korkeusasema 13.0', 11, NULL, 32, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 12:22:15.715603', '2022-01-18 12:22:15.715603', 55, 'Muu korkeusasemaan liittyvä määräys, kansitaso +8,0 - +12,5', 7, NULL, 82, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 13:53:10.535005', '2022-01-18 13:53:10.535005', 57, 'Muu rakentamistapaan liittyvä määräys, kevyt liikenne', 21, NULL, 88, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:21:13.059594', '2022-01-18 15:21:13.059594', 62, 'Likimääräinen taso 10.5', 7, NULL, 22, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:11:29.888035', '2022-01-18 15:11:29.888035', 59, 'Muu rakentamistapaan liittyvä määräys, kevyt liikenne', 4, NULL, 101, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:25:43.869588', '2022-01-17 16:25:43.869588', 39, 'Muu korkeusasemaan liittyvä määräys', 5, NULL, 38, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:25:43.869588', '2022-01-17 16:25:43.869588', 40, 'Muu korkeusasemaan liittyvä määräys', 14, NULL, 43, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:55:22.90437', '2022-01-17 16:55:22.90437', 45, 'Sen ulkokuori...', 13, NULL, 71, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:21:13.059594', '2022-01-18 15:21:13.059594', 61, 'Katutaso 3.0', 21, NULL, 265, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:14:34.847924', '2022-01-17 16:14:34.847924', 35, 'Alueelle ei saa sijoittaa...', 16, NULL, 137, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:26:46.598815', '2022-01-14 16:26:46.598815', 23, 'Maanpinnan korkeusasema 10.0', 17, NULL, 34, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 12:05:27.646926', '2022-01-18 12:05:27.646926', 50, 'Maanpinnan korkeusasema 3', 21, NULL, 76, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:25:43.869588', '2022-01-17 16:25:43.869588', 41, 'Muu korkeusasemaan liittyvä määräys', 17, NULL, 44, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:34:44.379533', '2022-01-18 15:34:44.379533', 68, 'Pensaat ja perennat', 20, NULL, 106, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:26:46.598815', '2022-01-14 16:26:46.598815', 19, 'Maanpinnan korkeusasema 13.0', 9, NULL, 37, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:52:18.892924', '2022-01-18 15:52:18.892924', 76, 'Esteetön', 12, NULL, 118, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:34:35.008556', '2022-01-14 16:34:35.008556', 27, 'Maanpäällinen kerrosluku I', 10, NULL, 48, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:25:48.01171', '2022-01-18 15:25:48.01171', 65, 'Merituulenkuja', 3, NULL, 103, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-14 16:26:46.598815', '2022-01-14 16:26:46.598815', 22, 'Maanpinnan korkeusasema 8.0', 14, NULL, 33, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:34:31.85097', '2022-01-17 16:34:31.85097', 42, '2 metriä', 37, NULL, 68, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:34:44.379533', '2022-01-18 15:34:44.379533', 70, 'Alue toteutettava...', 20, NULL, 107, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:40:31.274957', '2022-01-18 15:40:31.274957', 72, 'Alueen osa, joka...', 19, NULL, 108, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:40:31.274957', '2022-01-18 15:40:31.274957', 71, 'Alueen osa, joka...', 18, NULL, 74, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:44:05.662894', '2022-01-18 15:44:05.662894', 73, 'Maisemoitava', 8, NULL, 109, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:44:05.662894', '2022-01-18 15:44:05.662894', 74, 'Alue on rakennettava...', 8, NULL, 110, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:44:05.662894', '2022-01-18 15:44:05.662894', 75, 'Alue on itsenäisesti...', 8, NULL, 111, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 15:59:28.300299', '2022-01-18 15:59:28.300299', 79, 'Sammonsillan alueen osa...', 15, NULL, 240, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 12:05:27.646926', '2022-01-18 12:05:27.646926', 51, 'Katettava betonilla', 21, NULL, 77, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 13:53:10.535005', '2022-01-18 13:53:10.535005', 56, 'Kevyen liikenteen kulkuyhteydet...', 7, NULL, 96, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:20:40.05739', '2022-01-17 16:20:40.05739', 37, 'Korkeuspiste 38.0', 14, NULL, 66, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:20:40.05739', '2022-01-17 16:20:40.05739', 36, 'Korkeuspiste 34.0', 5, NULL, 62, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-17 16:20:40.05739', '2022-01-17 16:20:40.05739', 38, 'Korkeuspiste 48.0', 17, NULL, 63, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 12:05:27.646926', '2022-01-18 12:05:27.646926', 52, 'Kulkuaukko 3,6', 2, NULL, 78, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 13:53:10.535005', '2022-01-18 13:53:10.535005', 58, 'Muu rakentamistapaan liittyvä määräys, kevyt liikenne', 34, NULL, 92, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-16 10:48:22.886889', '2022-02-16 10:48:22.886889', 86, 'Muu rakentamistapaan liittyvä määräys', 15, NULL, 240, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-16 10:48:22.886889', '2022-02-16 10:48:22.886889', 87, 'Muu rakentamistapaan liittyvä määräys', 16, NULL, 241, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-16 10:48:22.886889', '2022-02-16 10:48:22.886889', 88, 'Muu rakentamistapaan liittyvä määräys', 17, NULL, 242, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-16 10:48:22.886889', '2022-02-16 10:48:22.886889', 90, 'Muu rakentamistapaan liittyvä määräys', 20, NULL, 244, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-16 13:29:15.134039', '2022-02-16 13:29:15.134039', 91, 'Sammonsilta', 45, NULL, 104, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-16 14:16:53.89897', '2022-02-16 14:16:53.89897', 92, 'Maanpinnan korkeusasema +9.0', 16, NULL, 30, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-21 16:45:17.70432', '2022-02-21 16:45:17.70432', 93, 'Kerrosala 4840', 5, NULL, 126, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-21 17:24:23.317455', '2022-02-21 17:24:23.317455', 94, 'Rakennusala 5580', 37, NULL, 225, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-21 17:24:23.317455', '2022-02-21 17:24:23.317455', 95, 'Rakennusala 5580', 16, NULL, 220, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-21 17:24:23.317455', '2022-02-21 17:24:23.317455', 96, 'Rakennusala 5580', 17, NULL, 221, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-16 10:48:22.886889', '2022-02-16 10:48:22.886889', 89, 'Muu rakentamistapaan liittyvä määräys', 19, NULL, 243, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-22 16:51:18.080265', '2022-02-22 16:51:18.080265', 98, 'Betonikannella ja/tai...', 3, NULL, 250, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-22 16:51:18.080265', '2022-02-22 16:51:18.080265', 99, 'Betonikannella ja/tai...', 4, NULL, 251, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-22 16:51:18.080265', '2022-02-22 16:51:18.080265', 100, 'Betonikannella ja/tai...', 5, NULL, 252, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-22 16:51:18.080265', '2022-02-22 16:51:18.080265', 101, 'Betonikannella ja/tai...', 6, NULL, 253, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-22 16:51:18.080265', '2022-02-22 16:51:18.080265', 102, 'Betonikannella ja/tai...', 7, NULL, 255, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-22 16:51:18.080265', '2022-02-22 16:51:18.080265', 103, 'Betonikannella ja/tai...', 45, NULL, 254, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-01-18 12:22:15.715603', '2022-01-18 12:22:15.715603', 54, 'Muu korkeusasemaan liittyvä määräys, kansitaso +8,0 - +12,5', 34, NULL, 81, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-22 16:57:27.317424', '2022-02-22 16:57:27.317424', 104, 'Kulkuaukko 4,5', 1, NULL, 256, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 10:18:55.527809', '2022-02-23 10:18:55.527809', 110, 'Merituulentie', 1, NULL, 209, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 111, 'Rakennusluokitus2018', 5, NULL, 199, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 112, 'Rakennusluokitus2018', 6, NULL, 259, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 113, 'Rakennusluokitus2018', 9, NULL, 201, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 114, 'Rakennusluokitus2018', 10, NULL, 202, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 115, 'Rakennusluokitus2018', 11, NULL, 203, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 116, 'Rakennusluokitus2018', 12, NULL, 204, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 117, 'Rakennusluokitus2018', 14, NULL, 205, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 118, 'Rakennusluokitus2018', 15, NULL, 260, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 119, 'Rakennusluokitus2018', 16, NULL, 54, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 120, 'Rakennusluokitus2018', 17, NULL, 208, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 121, 'Rakennusluokitus2018', 19, NULL, 257, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 122, 'Rakennusluokitus2018', 20, NULL, 258, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 123, 'Rakennusluokitus2018', 37, NULL, 212, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 124, 'Korttelin numero', 5, NULL, 226, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 125, 'Korttelin numero', 6, NULL, 227, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 126, 'Korttelin numero', 9, NULL, 228, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 127, 'Korttelin numero', 10, NULL, 229, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 128, 'Korttelin numero', 11, NULL, 230, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 129, 'Korttelin numero', 12, NULL, 231, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 130, 'Korttelin numero', 14, NULL, 232, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 131, 'Korttelin numero', 15, NULL, 233, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 132, 'Korttelin numero', 16, NULL, 234, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 133, 'Korttelin numero', 17, NULL, 235, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 134, 'Korttelin numero', 19, NULL, 236, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 135, 'Korttelin numero', 20, NULL, 237, NULL);
INSERT INTO kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) OVERRIDING SYSTEM VALUE VALUES (NULL, NULL, NULL, NULL, '2022-02-23 11:17:31.997373', '2022-02-23 11:17:31.997373', 136, 'Korttelin numero', 37, NULL, 239, NULL);


--
-- TOC entry 4387 (class 0 OID 18816)
-- Dependencies: 271
-- Data for Name: tunnusarvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4347 (class 0 OID 18552)
-- Dependencies: 231
-- Data for Name: versioitu_objekti_abstrakti; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4408 (class 0 OID 19086)
-- Dependencies: 292
-- Data for Name: vuorovaikutustapahtuma; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--



--
-- TOC entry 4353 (class 0 OID 18582)
-- Dependencies: 237
-- Data for Name: asiakirjan_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/01', 1, NULL, 'DRAFT', NULL, 'Hakemus', NULL, NULL, NULL, NULL, NULL, 'Kaava-asiaan liittyvä hakemus, esimerkiksi kaavoitusaloite tai -hakemus.', NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 1);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/02', 2, NULL, 'DRAFT', NULL, 'Havainnekuva', NULL, NULL, 'Kaavaa havainnollistava visualisointi', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 2);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/03', 3, NULL, 'DRAFT', NULL, 'Kaavakartta', NULL, NULL, NULL, NULL, NULL, 'Juridisen kaavakartan sähköinen versio. Esimerkiksi vanhan, digitoidun kaavakartan skannattu versio.', NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 3);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/04', 4, NULL, 'DRAFT', NULL, 'Kaavaselostus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 4);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/05', 5, NULL, 'DRAFT', NULL, 'Karttaliite', NULL, NULL, NULL, NULL, NULL, 'Kaavaan liitetty karttaa esittävä dokumentti.', NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 5);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/06', 6, NULL, 'DRAFT', NULL, 'Kirje', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 6);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/07', 7, NULL, 'DRAFT', NULL, 'Kuulutus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 7);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/08', 8, NULL, 'DRAFT', NULL, 'Lausunto', NULL, NULL, 'asiakirja tai asiakirjojen muodostama kokonaisuus, jolla lausuntopyynnön saanut toimija esittää näkemyksensä tarkastelun kohteesta asiankäsittelyn aikana', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 8);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/09', 9, NULL, 'DRAFT', 'opinion', 'Mielipide', 'åsikt', NULL, 'osallisen tai yhteisön jäsenen esittämä kannanotto viranomaisen valmisteluaineistoon', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 9);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/10', 10, NULL, 'DRAFT', NULL, 'Muistio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 10);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/11', 11, NULL, 'DRAFT', 'objection', 'Muistutus', 'anmärkning', NULL, 'asianosaisen esittämä kannanotto kaavaehdotukseen', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 11);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('12', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/12', 12, NULL, 'DRAFT', NULL, 'Osallistumis- ja arviointisuunnitelma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 12);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('13', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/13', 13, NULL, 'DRAFT', NULL, 'Päätös', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 13);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('14', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/14', 14, NULL, 'DRAFT', NULL, 'Pöytäkirja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 14);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('15', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/15', 15, NULL, 'DRAFT', NULL, 'Raportti', NULL, NULL, 'Raportti voi olla esimerkiksi yhteenveto vuorovaikutustapahtumasta tai -tapahtumien kokonaisuudesta.', NULL, NULL, 'asiakirja, joka sisältää yhteenvedon kaavan valmisteluun liittyvästä asiasta', NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 15);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('16', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/16', 16, NULL, 'DRAFT', NULL, 'Selvitys', NULL, NULL, 'Kaavan laadinnassa hyödynnetyt selvitykset. Selvityksiä voivat olla esimerkiksi luonto-, maisema-, kulttuuriperintö-, liikenne- tai palveluverkkoselvitykset.', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 16);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('17', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/17', 17, NULL, 'DRAFT', NULL, 'Sopimus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 17);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('18', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/18', 18, NULL, 'DRAFT', NULL, 'Suunnitelma', NULL, NULL, 'Kaavatyöhön liittyvä erillinen suunnitelma, esimerkiksi katujen tai yleisten alueiden suunnitelma', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 18);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('19', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/19', 19, NULL, 'DRAFT', NULL, 'Suunnitteluohje', NULL, NULL, 'Suunnitteluohje voi olla esimerkiksi rakentamistapaohje tai lähiympäristön suunnitteluohje.', NULL, NULL, 'Kaavan suunnitteluratkaisuja täydentävä ohjeistus jatkosuunnittelua varten.', NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 19);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/20', 20, NULL, 'DRAFT', NULL, 'Valitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 20);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('21', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/21', 21, NULL, 'DRAFT', NULL, 'Vastine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 21);
INSERT INTO koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('22', 'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/22', 22, NULL, 'DRAFT', NULL, 'Muu asiakirja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:32:11', '2021-01-13 19:32:11', 22);


--
-- TOC entry 4332 (class 0 OID 18474)
-- Dependencies: 216
-- Data for Name: digitaalinen_alkupera; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.digitaalinen_alkupera (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/01', 1, NULL, 'DRAFT', NULL, 'Tietomallin mukaan laadittu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kaavan kansallisen tietomallin mukaisesti tuotettu aineisto.', NULL, '1', '2020-12-11 06:20:58', '2020-12-11 06:22:41', 1);
INSERT INTO koodistot.digitaalinen_alkupera (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/02', 2, NULL, 'DRAFT', NULL, 'Kokonaan digitoitu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kaava on jälkikäteen digitoitu tietomallin mukaiseksi. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.', NULL, '1', '2020-12-11 06:20:58', '2020-12-11 06:27:41', 2);
INSERT INTO koodistot.digitaalinen_alkupera (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/03', 3, NULL, 'DRAFT', NULL, 'Osittain digitoitu', NULL, NULL, NULL, NULL, NULL, 'Osa kaavasta (esim. kaavan rajauksen lisäksi aluevaraukset) on jälkikäteen digitoitu tietomallin mukaiseksi. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.', NULL, NULL, NULL, '1', '2020-12-11 06:20:58', '2020-12-11 06:29:44', 3);
INSERT INTO koodistot.digitaalinen_alkupera (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/04', 4, NULL, 'DRAFT', NULL, 'Kaavan rajaus digitoitu', NULL, NULL, 'Digitoitu kaavan rajaus, johon on liitetty muut tiedot linkitettyinä dokumentteina. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 06:20:58', '2020-12-11 06:32:27', 4);


--
-- TOC entry 4326 (class 0 OID 18444)
-- Dependencies: 210
-- Data for Name: kaavalaji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/1', 1, NULL, 'DRAFT', 'Regional land use plan', 'Maakuntakaava', 'Landskapsplan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 1);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/11', 2, '1.0', 'DRAFT', 'Regional land use plan', 'Kokonaismaakuntakaava', 'Helhetslandskapsplan', NULL, NULL, NULL, NULL, 'Koko maakunnan aluetta tai sen osa-aluetta koskeva kaava.', 'Plan som berör hela landskapet eller dess delområde.', NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 2);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('12', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/12', 3, '1.0', 'DRAFT', 'Phased regional land use plan', 'Vaihemaakuntakaava', 'Etapplandskapsplan', NULL, NULL, NULL, NULL, 'Koko maakuntaa tai sen osa-aluetta koskeva rajattuja teemoja käsittelevä maakuntakaava.', 'Landskapsplan som berör hela landskapet eller dess delområde och behandlar begränsade teman.', NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 3);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/2', 4, NULL, 'DRAFT', 'Local master plan', 'Yleiskaava', 'Generalplan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 4);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('21', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/21', 5, '2.0', 'DRAFT', 'Local master plan', 'Yleiskaava', 'Generalplan', NULL, 'yleiskaavan määritelmä', NULL, NULL, 'Koko kunnan aluetta koskeva yleiskaava.', NULL, NULL, 'http://uri.suomi.fi/terminology/rak/concept-37', '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 5);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('22', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/22', 6, '2.0', 'DRAFT', 'Phased  local master plan', 'Vaiheyleiskaava', 'Etappgeneralplan', NULL, NULL, NULL, NULL, 'Koko kuntaa tai kunnan osa-aluetta koskeva rajattuja teemoja käsittelevä yleiskaava.', NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 6);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('23', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/23', 7, '2.0', 'DRAFT', 'Partial local master plan', 'Osayleiskaava', 'Delgeneralplan', NULL, NULL, NULL, NULL, 'Kunnan osa-aluetta koskeva yleiskaava.', NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 7);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('24', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/24', 8, '2.0', 'DRAFT', 'Joint municipal master plan / Joint master plan', 'Kuntien yhteinen yleiskaava', 'Gemensam generalplan', NULL, NULL, NULL, NULL, 'Kahden tai useamman kunnan aluetta tai osa-aluetta koskeva yleiskaava (MRL 46 §) tai vaiheyleiskaava.', NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 8);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/3', 9, NULL, 'DRAFT', 'Local detailed plan', 'Asemakaava', 'Detaljplan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 9);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('31', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/31', 10, '3.0', 'DRAFT', 'Local detailed plan', 'Asemakaava', 'Detaljplan', NULL, NULL, NULL, NULL, 'MRL 50 § mukaan laadittu yksityiskohtainen asemakaava tai asemakaavan muutos.', NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 10);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('32', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/32', 11, '3.0', 'DRAFT', 'Phased local detailed plan', 'Vaiheasemakaava', 'Etappdetaljplan', NULL, NULL, NULL, NULL, 'MRL 50 § mukaan laadittu rajattuja teemoja käsittelevä asemakaava tai asemakaavan muutos,', NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 11);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('33', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/33', 12, '3.0', 'DRAFT', 'Detailed shore plan', 'Ranta-asemakaava', 'Stranddetaljplan', NULL, NULL, NULL, NULL, 'Asemakaava, joka laaditaan pääasiassa loma-asutuksen järjestämiseksi', NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 12);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('25', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/25', 13, '2.0', 'DRAFT', NULL, 'Oikeusvaikutukseton yleiskaava', 'Generalplan utan rättsverkningar', NULL, NULL, NULL, NULL, 'Koko kuntaa tai kunnan osa-aluetta koskeva yleiskaava, jolla ei ole maankäyttö- ja rakennuslaissa tarkoitettuja oikeusvaikutuksia (MRL 45§).', NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 13);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('34', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/34', 14, '3.0', 'DRAFT', NULL, 'Vaiheranta-asemakaava', 'Etappsranddetaljplan', NULL, NULL, NULL, NULL, 'Rajattuja teemoja käsittelevä asemakaava, joka laaditaan pääasiassa loma-asutuksen järjestämiseksi.', NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 14);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('35', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/35', 15, '3.0', 'DRAFT', NULL, 'Maanalaisten tilojen asemakaava', 'Underjordisk detaljplan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 15);
INSERT INTO koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('26', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/26', 17, '2.0', 'DRAFT', NULL, 'Maanalainen yleiskaava', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-11 11:24:39', '2020-12-11 11:24:39', 16);


--
-- TOC entry 4344 (class 0 OID 18534)
-- Dependencies: 228
-- Data for Name: kaavamaarays_laji_ak; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/01', 1, NULL, 'DRAFT', NULL, 'Alueen käyttötarkoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 1);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0101', 2, '1.0', 'DRAFT', NULL, 'Asuminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 2);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010101', 3, '101.0', 'DRAFT', NULL, 'Asuinkerrostaloalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 3);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010102', 4, '101.0', 'DRAFT', NULL, 'Asuinpientaloalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 4);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010103', 5, '101.0', 'DRAFT', NULL, 'Rivitalojen ja muiden kytkettyjen asuinrakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 5);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010104', 6, '101.0', 'DRAFT', NULL, 'Erillispientaloalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 6);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10105', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010105', 7, '101.0', 'DRAFT', NULL, 'Asumista palveleva yhteiskäyttöinen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 7);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10106', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010106', 8, '101.0', 'DRAFT', NULL, 'Maatilan talouskeskuksen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 8);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10107', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010107', 9, '101.0', 'DRAFT', NULL, 'Kyläalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 9);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10108', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010108', 10, '101.0', 'DRAFT', NULL, 'Erityisryhmien palveluasuminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 10);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10109', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010109', 11, '101.0', 'DRAFT', NULL, 'Muu asuminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 11);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0102', 12, '1.0', 'DRAFT', NULL, 'Keskustatoiminnot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 12);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010201', 13, '102.0', 'DRAFT', NULL, 'Keskustatoimintojen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 13);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010202', 14, '102.0', 'DRAFT', NULL, 'Keskustatoimintojen alakeskus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 14);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010203', 15, '102.0', 'DRAFT', NULL, 'Muut keskustatoiminnot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 15);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0103', 16, '1.0', 'DRAFT', NULL, 'Liike- ja toimistorakentaminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 16);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10301', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010301', 17, '103.0', 'DRAFT', NULL, 'Liikerakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 17);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10302', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010302', 18, '103.0', 'DRAFT', NULL, 'Toimistorakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 18);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10303', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010303', 19, '103.0', 'DRAFT', NULL, 'Toimitilarakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 19);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10304', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010304', 20, '103.0', 'DRAFT', NULL, 'Kaupallisten palveluiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 20);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10305', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010305', 21, '103.0', 'DRAFT', NULL, 'Muu liike- ja toimistorakentaminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 21);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0104', 22, '1.0', 'DRAFT', NULL, 'Palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 22);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10401', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010401', 23, '104.0', 'DRAFT', NULL, 'Palvelurakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 23);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10402', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010402', 24, '104.0', 'DRAFT', NULL, 'Lähipalveluiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 24);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10403', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010403', 25, '104.0', 'DRAFT', NULL, 'Huvi- ja viihdepalveluiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 25);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10404', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010404', 26, '104.0', 'DRAFT', NULL, 'Muut palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 26);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('105', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0105', 27, '1.0', 'DRAFT', NULL, 'Julkiset palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:48', '2020-12-17 09:11:48', 27);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10501', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010501', 28, '105.0', 'DRAFT', NULL, 'Julkiset palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 28);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10502', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010502', 29, '105.0', 'DRAFT', NULL, 'Yleisten rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 29);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10503', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010503', 30, '105.0', 'DRAFT', NULL, 'Julkisten lähipalveluiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 30);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10504', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010504', 31, '105.0', 'DRAFT', NULL, 'Hallinto- ja virastorakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 31);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10505', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010505', 32, '105.0', 'DRAFT', NULL, 'Opetustoimintaa palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 32);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10506', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010506', 33, '105.0', 'DRAFT', NULL, 'Sosiaalitointa ja terveydenhuoltoa palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 33);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10507', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010507', 34, '105.0', 'DRAFT', NULL, 'Kulttuuritoimintaa palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 34);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10508', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010508', 35, '105.0', 'DRAFT', NULL, 'Museorakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 35);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10509', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010509', 36, '105.0', 'DRAFT', NULL, 'Kirkkojen ja muiden seurakunnallisten rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 36);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10510', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010510', 37, '105.0', 'DRAFT', NULL, 'Urheilutoimintaa palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 37);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10511', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010511', 38, '105.0', 'DRAFT', NULL, 'Julkisten palveluiden ja hallinnon alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 38);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10512', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010512', 39, '105.0', 'DRAFT', NULL, 'Muut julkiset palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 39);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('106', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0106', 40, '1.0', 'DRAFT', NULL, 'Työ ja tuotanto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 40);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10601', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010601', 41, '106.0', 'DRAFT', NULL, 'Työpaikka-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 41);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10602', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010602', 42, '106.0', 'DRAFT', NULL, 'Teollisuusalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 42);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10603', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010603', 43, '106.0', 'DRAFT', NULL, 'Varastorakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 43);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10604', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010604', 44, '106.0', 'DRAFT', NULL, 'Alue, jolle saa sijoittaa merkittävän, vaarallisia kemikaaleja valmistavan tai varastoivan laitoksen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 44);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10605', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010605', 45, '106.0', 'DRAFT', NULL, 'Ympäristövaikutuksiltaan merkittävien teollisuustoimintojen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 45);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10606', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010606', 46, '106.0', 'DRAFT', NULL, 'Kiertotalous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 46);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10607', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010607', 47, '106.0', 'DRAFT', NULL, 'Ympäristöhäiriötä aiheuttava tuotantotoiminta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 47);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10608', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010608', 48, '106.0', 'DRAFT', NULL, 'Muu työpaikka- tai tuontantoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 48);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('107', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0107', 49, '1.0', 'DRAFT', NULL, 'Virkistys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 49);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10701', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010701', 50, '107.0', 'DRAFT', NULL, 'Virkistysalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 50);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10702', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010702', 51, '107.0', 'DRAFT', NULL, 'Puisto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 51);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10703', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010703', 52, '107.0', 'DRAFT', NULL, 'Lähivirkistysalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 52);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10704', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010704', 53, '107.0', 'DRAFT', NULL, 'Leikkipuisto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 53);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10705', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010705', 54, '107.0', 'DRAFT', NULL, 'Urheilupalvelujen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 54);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10706', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010706', 55, '107.0', 'DRAFT', NULL, 'Retkeily- ja ulkoilualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 55);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10707', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010707', 56, '107.0', 'DRAFT', NULL, 'Uimaranta-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 56);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10708', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010708', 57, '107.0', 'DRAFT', NULL, 'Lähimetsä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 57);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10709', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010709', 58, '107.0', 'DRAFT', NULL, 'Muu virkistysalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 58);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('108', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0108', 59, '1.0', 'DRAFT', NULL, 'Loma-asuminen ja matkailu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 59);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10801', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010801', 60, '108.0', 'DRAFT', NULL, 'Loma-asuntojen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 60);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10802', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010802', 61, '108.0', 'DRAFT', NULL, 'Matkailua palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 61);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10803', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010803', 62, '108.0', 'DRAFT', NULL, 'Leirintäalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 62);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10804', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010804', 63, '108.0', 'DRAFT', NULL, 'Asuntovaunualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 63);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10805', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010805', 64, '108.0', 'DRAFT', NULL, 'Siirtolapuutarha-/palstaviljelyalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 64);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10806', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010806', 65, '108.0', 'DRAFT', NULL, 'Muu loma-asumisen tai matkailun alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 65);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('109', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0109', 66, '1.0', 'DRAFT', NULL, 'Liikenne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 66);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10901', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010901', 67, '109.0', 'DRAFT', NULL, 'Liikennealue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 67);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10902', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010902', 68, '109.0', 'DRAFT', NULL, 'Yleisen tien alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 68);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10903', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010903', 69, '109.0', 'DRAFT', NULL, 'Rautatieliikenteen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 69);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10904', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010904', 70, '109.0', 'DRAFT', NULL, 'Lentoliikenteen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 70);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10905', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010905', 71, '109.0', 'DRAFT', NULL, 'Satama-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 71);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10906', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010906', 72, '109.0', 'DRAFT', NULL, 'Kanava-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 72);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10907', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010907', 73, '109.0', 'DRAFT', NULL, 'Venesatama/venevalkama', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 73);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10908', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010908', 74, '109.0', 'DRAFT', NULL, 'Yleinen pysäköintialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 74);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10909', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010909', 75, '109.0', 'DRAFT', NULL, 'Huoltoasema-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 75);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10910', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010910', 76, '109.0', 'DRAFT', NULL, 'Henkilöliikenteen terminaalialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 76);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10911', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010911', 77, '109.0', 'DRAFT', NULL, 'Tavaraliikenteen terminaalialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 77);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10912', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010912', 78, '109.0', 'DRAFT', NULL, 'Yleisten pysäköintilaitosten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 78);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10913', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010913', 79, '109.0', 'DRAFT', NULL, 'Autopaikkojen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 79);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10914', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010914', 80, '109.0', 'DRAFT', NULL, 'Katualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 80);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10915', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010915', 81, '109.0', 'DRAFT', NULL, 'Muu liikennealue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 81);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('110', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0110', 82, '1.0', 'DRAFT', NULL, 'Erityisalueet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 82);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11001', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011001', 83, '110.0', 'DRAFT', NULL, 'Erityisalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 83);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11002', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011002', 84, '110.0', 'DRAFT', NULL, 'Yhdyskuntateknisen huollon alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 84);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11003', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011003', 85, '110.0', 'DRAFT', NULL, 'Energiahuollon alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 85);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11004', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011004', 86, '110.0', 'DRAFT', NULL, 'Jätteenkäsittelyalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 86);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11005', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011005', 87, '110.0', 'DRAFT', NULL, 'Maa-ainesten ottoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 87);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11006', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011006', 88, '110.0', 'DRAFT', NULL, 'Kaivosalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 88);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11007', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011007', 89, '110.0', 'DRAFT', NULL, 'Mastoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 89);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11008', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011008', 90, '110.0', 'DRAFT', NULL, 'Ampumarata-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 90);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11009', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011009', 91, '110.0', 'DRAFT', NULL, 'Puolustusvoimien alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 91);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11010', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011010', 92, '110.0', 'DRAFT', NULL, 'Hautausmaa-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 92);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11011', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011011', 93, '110.0', 'DRAFT', NULL, 'Suojaviheralue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 93);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11012', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011012', 94, '110.0', 'DRAFT', NULL, 'Tuulivoimaloiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 94);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11013', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011013', 95, '110.0', 'DRAFT', NULL, 'Moottorirata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 95);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11014', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011014', 96, '110.0', 'DRAFT', NULL, 'Maa-ainesten vastaanotto- tai läjitysalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 96);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11015', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011015', 97, '110.0', 'DRAFT', NULL, 'Vankila-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 97);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11016', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011016', 98, '110.0', 'DRAFT', NULL, 'Muu erityisalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 98);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('111', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0111', 99, '1.0', 'DRAFT', NULL, 'Suojelu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 99);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011101', 100, '111.0', 'DRAFT', NULL, 'Suojelualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 100);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011102', 101, '111.0', 'DRAFT', NULL, 'Luonnonsuojelualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 101);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011103', 102, '111.0', 'DRAFT', NULL, 'Muinaismuistoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 102);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011104', 103, '111.0', 'DRAFT', NULL, 'Rakennuslainsäädännön nojalla suojeltava alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 103);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11105', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011105', 104, '111.0', 'DRAFT', NULL, 'Rakennussuojelulakien nojalla suojeltu alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 104);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11106', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011106', 105, '111.0', 'DRAFT', NULL, 'Muu suojelualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 105);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('112', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0112', 106, '1.0', 'DRAFT', NULL, 'Maa- ja metsätalous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 106);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011201', 107, '112.0', 'DRAFT', NULL, 'Maa- ja metsätalousalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 107);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011202', 108, '112.0', 'DRAFT', NULL, 'Maatalousalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 108);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011203', 109, '112.0', 'DRAFT', NULL, 'Kotieläintalouden suuryksikön alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 109);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11204', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011204', 110, '112.0', 'DRAFT', NULL, 'Puutarha- ja kasvihuonealue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 110);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11205', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011205', 111, '112.0', 'DRAFT', NULL, 'Maisemallisesti arvokas peltoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 111);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11206', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011206', 112, '112.0', 'DRAFT', NULL, 'Poronhoitovaltainen maa- ja metsätalousalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 112);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11207', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011207', 113, '112.0', 'DRAFT', NULL, 'Muu maa- ja metsätalousalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 113);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('113', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0113', 114, '1.0', 'DRAFT', NULL, 'Vesialueet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 114);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11301', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011301', 115, '113.0', 'DRAFT', NULL, 'Vesialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 115);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11302', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011302', 116, '113.0', 'DRAFT', NULL, 'Muu vesialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 116);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/02', 117, NULL, 'DRAFT', NULL, 'Alueen osan käyttötarkoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 117);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0201', 118, '2.0', 'DRAFT', NULL, 'Yhdyskuntatekninen käyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 118);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020101', 119, '201.0', 'DRAFT', NULL, 'Johto, putki tai linja', NULL, NULL, NULL, NULL, NULL, 'Maan alaista tai maan päällistä johtoa, putkea tai linjaa varten varattu alue.', NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 119);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020102', 120, '201.0', 'DRAFT', NULL, 'Sähkölinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 120);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020103', 121, '201.0', 'DRAFT', NULL, 'Kaasulinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 121);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020104', 122, '201.0', 'DRAFT', NULL, 'Vesi- tai jätevesitunneli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 122);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20105', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020105', 123, '201.0', 'DRAFT', NULL, 'Vesijohto tai siirtoviemäri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 123);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20106', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020106', 124, '201.0', 'DRAFT', NULL, 'Kaukolämpölinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 124);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20107', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020107', 125, '201.0', 'DRAFT', NULL, 'Kaukokylmälinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 125);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20108', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020108', 126, '201.0', 'DRAFT', NULL, 'Tulvapenger', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 126);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20109', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020109', 127, '201.0', 'DRAFT', NULL, 'Tulvareitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 127);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20110', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020110', 128, '201.0', 'DRAFT', NULL, 'Pumppaamo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 128);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20111', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020111', 129, '201.0', 'DRAFT', NULL, 'Muuntamo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 129);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20112', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020112', 130, '201.0', 'DRAFT', NULL, 'Suojavyöhyke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 130);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20113', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020113', 131, '201.0', 'DRAFT', NULL, 'Hulevesijärjestelmä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 131);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20114', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020114', 132, '201.0', 'DRAFT', NULL, 'Hulevesien viivytysallas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 132);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20115', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020115', 133, '201.0', 'DRAFT', NULL, 'Avo-oja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 133);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20116', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020116', 134, '201.0', 'DRAFT', NULL, 'Muu yhdyskuntatekniseen huoltoon liittyvä käyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 134);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0202', 135, '2.0', 'DRAFT', NULL, 'Ulkoalueiden käyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 135);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020201', 136, '202.0', 'DRAFT', NULL, 'Istutettava alueen osa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 136);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020202', 137, '202.0', 'DRAFT', NULL, 'Leikkialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 137);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020203', 138, '202.0', 'DRAFT', NULL, 'Oleskelualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 138);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20204', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020204', 139, '202.0', 'DRAFT', NULL, 'Puurivi', NULL, NULL, NULL, NULL, NULL, 'Säilytettävä/istutettava puurivi', NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 139);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20205', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020205', 140, '202.0', 'DRAFT', NULL, 'Muuri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 140);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20206', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020206', 141, '202.0', 'DRAFT', NULL, 'Pengerrys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 141);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20207', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020207', 142, '202.0', 'DRAFT', NULL, 'Muu tontinkäyttöön liittyvä käyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 142);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0203', 143, '2.0', 'DRAFT', NULL, 'Liikennekäyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 143);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20301', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020301', 144, '203.0', 'DRAFT', NULL, 'Ajoluiska', NULL, NULL, NULL, NULL, NULL, 'Maanalaisiin tiloihin johtava ajoluiska', NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 144);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20302', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020302', 145, '203.0', 'DRAFT', NULL, 'Ajoyhteys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:49', '2020-12-17 09:11:49', 145);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20303', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020303', 146, '203.0', 'DRAFT', NULL, 'Alikulku', NULL, NULL, NULL, NULL, NULL, 'Kadun tai liikennealueen alittava kevyen liikenteen yhteys', NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 146);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20304', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020304', 147, '203.0', 'DRAFT', NULL, 'Auton säilytyspaikka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 147);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20305', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020305', 148, '203.0', 'DRAFT', NULL, 'Eritasoristeys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 148);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20306', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020306', 149, '203.0', 'DRAFT', NULL, 'Hidaskatu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 149);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20307', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020307', 150, '203.0', 'DRAFT', NULL, 'Katuaukio/Tori', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 150);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20308', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020308', 151, '203.0', 'DRAFT', NULL, 'Liikennetunneli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 151);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20309', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020309', 152, '203.0', 'DRAFT', NULL, 'Pelastustie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 152);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20310', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020310', 153, '203.0', 'DRAFT', NULL, 'Pihakatu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 153);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20311', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020311', 154, '203.0', 'DRAFT', NULL, 'Pysäköintialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 154);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20312', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020312', 155, '203.0', 'DRAFT', NULL, 'Tontille ajo sallittu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 155);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20313', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020313', 156, '203.0', 'DRAFT', NULL, 'Ulkoilureitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 156);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20314', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020314', 157, '203.0', 'DRAFT', NULL, 'Varattu alueen sisäiselle huoltoajolle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 157);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20315', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020315', 158, '203.0', 'DRAFT', NULL, 'Varattu alueen sisäiselle jalankululle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 158);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20316', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020316', 159, '203.0', 'DRAFT', NULL, 'Varattu alueen sisäiselle polkupyöräilylle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 159);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20317', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020317', 160, '203.0', 'DRAFT', NULL, 'Varattu huoltoajolle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 160);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20318', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020318', 161, '203.0', 'DRAFT', NULL, 'Varattu jalankululle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 161);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20319', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020319', 162, '203.0', 'DRAFT', NULL, 'Varattu joukkoliikenteelle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 162);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20320', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020320', 163, '203.0', 'DRAFT', NULL, 'Varattu polkypyöräilylle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 163);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20321', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020321', 164, '203.0', 'DRAFT', NULL, 'Yleisen tien näkemäalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 164);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20322', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020322', 165, '203.0', 'DRAFT', NULL, 'Yleisen tien suoja-alue', NULL, NULL, NULL, NULL, NULL, 'Yleisen tien suoja-alueeksi varattu alueen osa', NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 165);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20323', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020323', 166, '203.0', 'DRAFT', NULL, 'Ylikulku', NULL, NULL, NULL, NULL, NULL, 'Kadun tai liikennealueen ylittävä kevyen liikenteen yhteys', NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 166);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20324', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020324', 167, '203.0', 'DRAFT', NULL, 'Muu liikennejärjestelmään liittyvä käyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 167);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('204', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0204', 168, '2.0', 'DRAFT', NULL, 'Virkistyskäyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 168);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20401', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020401', 169, '204.0', 'DRAFT', NULL, 'Asuntovaunualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 169);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20402', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020402', 170, '204.0', 'DRAFT', NULL, 'Frisbeegolf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 170);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20403', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020403', 171, '204.0', 'DRAFT', NULL, 'Golf-väylä', NULL, NULL, NULL, NULL, NULL, 'Golf-väylä suoja-alueineen', NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 171);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20404', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020404', 172, '204.0', 'DRAFT', NULL, 'Kenttä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 172);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20405', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020405', 173, '204.0', 'DRAFT', NULL, 'Koirapuisto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 173);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20406', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020406', 174, '204.0', 'DRAFT', NULL, 'Mäenlaskupaikka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 174);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20407', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020407', 175, '204.0', 'DRAFT', NULL, 'Ratsastuskenttä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 175);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20408', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020408', 176, '204.0', 'DRAFT', NULL, 'Telttailu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 176);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20409', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020409', 177, '204.0', 'DRAFT', NULL, 'Muu virkistyskäyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 177);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('205', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0205', 178, '2.0', 'DRAFT', NULL, 'Maatalouskäyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 178);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20501', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020501', 179, '205.0', 'DRAFT', NULL, 'Laidun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 179);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20502', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020502', 180, '205.0', 'DRAFT', NULL, 'Muu maatalouskäyttö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 180);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('206', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0206', 181, '2.0', 'DRAFT', NULL, 'Rakennusalan käyttötarkoitus', NULL, NULL, NULL, NULL, NULL, 'Rakennuksen käyttötarkoitusta tarkentava kaavamääräys. Käyttötarkoitus ilmaistaan Rakennusluokitus 2018 -koodiston avulla tai tekstiarvona.', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 181);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('207', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0207', 182, '2.0', 'DRAFT', NULL, 'Muu alueen osan käyttötarkoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 182);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/03', 183, NULL, 'DRAFT', NULL, 'Rakentamisen määrä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 183);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('301', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0301', 184, '3.0', 'DRAFT', NULL, 'Sallittu kerrosala', NULL, NULL, NULL, NULL, NULL, 'Sallittu kerrosala kerrosneliömetreinä (m2)', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 184);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('302', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0302', 185, '3.0', 'DRAFT', NULL, 'Sallittu rakennustilavuus', NULL, NULL, NULL, NULL, NULL, 'Rakennuksen sallittu tilavuus kuutiometreinä (m3)', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 185);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('303', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0303', 186, '3.0', 'DRAFT', NULL, 'Tehokkuusluku', NULL, NULL, NULL, NULL, NULL, 'sallitun kerrosalan suhde tontin/rakennuspaikan pinta-alaan', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 186);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('304', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0304', 187, '3.0', 'DRAFT', NULL, 'Maanpäällinen kerrosluku', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 187);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('305', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0305', 188, '3.0', 'DRAFT', NULL, 'Maanalainen kerrosluku', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 188);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('306', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0306', 189, '3.0', 'DRAFT', NULL, 'Kellarin sallittu kerrosalaosuus', NULL, NULL, NULL, NULL, NULL, 'ilmaisee kuinka suuren osan rakennuksen suurimman kerroksen alasta saa kellarikerroksessa käyttää kerrosalaan luettavaksi tilaksi.', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 189);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('307', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0307', 190, '3.0', 'DRAFT', NULL, 'Ullakon sallittu kerrosalaosuus', NULL, NULL, NULL, NULL, NULL, 'ilmaiseen kuinka suuren osan rakennuksen suurimman kerroksen alasta ullakon tasolla saa käyttää kerrosalaan laskettavaksi tilaksi.', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 190);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('308', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0308', 191, '3.0', 'DRAFT', NULL, 'Rakennuspaikkojen määrä', NULL, NULL, NULL, NULL, NULL, 'Ranta-asemakaavassa osoitettavien rakennuspaikkojen määrä', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 191);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('309', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0309', 192, '3.0', 'DRAFT', NULL, 'Lisärakennusoikeus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 192);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/04', 193, NULL, 'DRAFT', NULL, 'Rakennusten sijoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 193);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('401', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0401', 194, '4.0', 'DRAFT', NULL, 'Rakentamisen suhde alueen pinta-alaan', NULL, NULL, NULL, NULL, NULL, 'Luku osoittaa, kuinka suuren osan alueesta tai rakennusalasta saa käyttää rakentamiseen.', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 194);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('402', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0402', 195, '4.0', 'DRAFT', NULL, 'Etäisyys naapuritontin rajasta', NULL, NULL, NULL, NULL, NULL, 'Rakennusten etäisyyden naapuritontin rajasta on oltava vähintään kaavamääräykseen liitetyn numeerisen arvon mukainen.', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 195);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('403', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0403', 196, '4.0', 'DRAFT', NULL, 'Rakennusala', NULL, NULL, NULL, NULL, NULL, 'asemakaavassa rakentamiselle osoitettu, rajoiltaan määrätty korttelin tai tontin osa', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 196);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('404', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0404', 197, '4.0', 'DRAFT', NULL, 'Rakennettava kiinni rajaan', NULL, NULL, NULL, NULL, NULL, 'Rakennusalan sivu, johon rakennus on rakennettava kiinni', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 197);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('405', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0405', 198, '4.0', 'DRAFT', NULL, 'Rakennuspaikka', NULL, NULL, NULL, NULL, NULL, 'Ranta-asemakaavan mukainen rakennuspaikka', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 198);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('406', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0406', 199, '4.0', 'DRAFT', NULL, 'Muu rakennusten sijoitukseen liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 199);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/05', 200, NULL, 'DRAFT', NULL, 'Rakentamistapa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 200);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('501', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0501', 201, '5.0', 'DRAFT', NULL, 'Kattokaltevuus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 201);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('502', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0502', 202, '5.0', 'DRAFT', NULL, 'Uloke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 202);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('503', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0503', 203, '5.0', 'DRAFT', NULL, 'Rakennuksen harjansuunta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 203);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('504', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0504', 204, '5.0', 'DRAFT', NULL, 'Kulkuaukko', NULL, NULL, NULL, NULL, NULL, 'Rakennukseen jätettävä kulkuaukko', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 204);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('505', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0505', 205, '5.0', 'DRAFT', NULL, 'Valokatteinen tila', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 205);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('506', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0506', 206, '5.0', 'DRAFT', NULL, 'Suora uloskäynti porrashuoneista', NULL, NULL, NULL, NULL, NULL, 'Rakennuksen sivu, jolla tulee olla suora uloskäynti porrashuoneista', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 206);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('507', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0507', 207, '5.0', 'DRAFT', NULL, 'Ei saa rakentaa ikkunoita', NULL, NULL, NULL, NULL, NULL, 'Rakennusalan sivu, jonka puoleiseen rakennuksen seinään ei saa sijoittaa ikkunoita', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 207);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('508', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0508', 208, '5.0', 'DRAFT', NULL, 'Ääneneristävyys', NULL, NULL, NULL, NULL, NULL, 'Rakennusalan sivu, jonka puoleisten rakennusten ulkoseinien sekä ikkunoiden ja muiden rakenteiden ääneneristävyyden liikennemelua vastaan on oltava vähintää xx dBA', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 208);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('509', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0509', 209, '5.0', 'DRAFT', NULL, 'Parvekkeet sijoitettava rungon sisään', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 209);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('510', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0510', 210, '5.0', 'DRAFT', NULL, 'Hissi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 210);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('511', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0511', 211, '5.0', 'DRAFT', NULL, 'Viherkatto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 211);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('512', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0512', 212, '5.0', 'DRAFT', NULL, 'Kelluvat asuinrakennukset', NULL, NULL, NULL, NULL, NULL, 'Rakennukset saa toteuttaa kelluvina', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 212);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('513', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0513', 213, '5.0', 'DRAFT', NULL, 'Muu rakentamistapaan liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 213);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/06', 214, NULL, 'DRAFT', NULL, 'Korkeusasema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 214);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('601', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0601', 215, '6.0', 'DRAFT', NULL, 'Maanpinnan korkeusasema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 215);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('602', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0602', 216, '6.0', 'DRAFT', NULL, 'Rakennuksen vesikaton ylimmän kohdan korkeusasema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 216);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('603', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0603', 217, '6.0', 'DRAFT', NULL, 'Rakennuksen julkisivupinnan ja vesikaton leikkauskohdan korkeusasema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 217);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('604', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0604', 218, '6.0', 'DRAFT', NULL, 'Rakennuksen julkisivun enimmäiskorkeus metreinä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 218);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('605', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0605', 219, '6.0', 'DRAFT', NULL, 'Rakennuksen, rakenteiden ja laitteiden ylin korkeusasema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 219);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('606', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0606', 220, '6.0', 'DRAFT', NULL, 'Maanalaisen kohteen korkeusasema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 220);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('607', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0607', 221, '6.0', 'DRAFT', NULL, 'Muu korkeusasemaan liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 221);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/07', 222, NULL, 'DRAFT', NULL, 'Ulkoalueet', NULL, NULL, NULL, NULL, NULL, 'Rakennusten ulkopuoleisten alueiden toteuttaminen', NULL, NULL, NULL, '1', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 222);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('701', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0701', 223, '7.0', 'DRAFT', NULL, 'Vihertehokkuus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 223);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('702', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0702', 224, '7.0', 'DRAFT', NULL, 'Puusto tai kasvillisuus säilytettävä tai korvattava', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 224);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('703', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0703', 225, '7.0', 'DRAFT', NULL, 'Olemassa oleva puusto säilytettävä', NULL, NULL, NULL, NULL, NULL, 'Olemassa oleva puusto tulee mahdollisuuksien mukaan säilyttää.', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 225);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('704', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0704', 226, '7.0', 'DRAFT', NULL, 'Maisema säilytettävä avoimena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 226);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('705', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0705', 227, '7.0', 'DRAFT', NULL, 'Muu ulkoalueiden toteuttamiseen liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 227);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/08', 228, NULL, 'DRAFT', NULL, 'Liikenne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 228);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('801', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0801', 229, '8.0', 'DRAFT', NULL, 'Ajoneuvoliittymä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 229);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('802', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0802', 230, '8.0', 'DRAFT', NULL, 'Ajoneuvoliittymän kielto', NULL, NULL, NULL, NULL, NULL, 'Katualueen rajan osa, jonka kohdalta ei saa järjestää ajoneuvoliittymää', NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 230);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('803', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0803', 231, '8.0', 'DRAFT', NULL, 'Autopaikkojen määrä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 231);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('804', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0804', 232, '8.0', 'DRAFT', NULL, 'Polkupyöräpysäköinnin määrä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 232);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('805', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0805', 233, '8.0', 'DRAFT', NULL, 'Muu liikenteeseen liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 233);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/09', 234, NULL, 'DRAFT', NULL, 'Ympäristöarvojen vaaliminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 234);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('901', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0901', 235, '9.0', 'DRAFT', NULL, 'Kulttuurihistoriallisesti arvokas alue tai kohde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 235);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090101', 236, '901.0', 'DRAFT', NULL, 'Suojeltava alue tai alueen osa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 236);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090102', 237, '901.0', 'DRAFT', NULL, 'Suojeltava rakennus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 237);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090103', 238, '901.0', 'DRAFT', NULL, 'Suojeltava rakennelma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 238);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090104', 239, '901.0', 'DRAFT', NULL, 'Kiinteä suojeltava kohde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 239);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90105', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090105', 240, '901.0', 'DRAFT', NULL, 'Kiinteä muinaisjäännös', NULL, NULL, NULL, NULL, NULL, 'Alue tai alueen osa, jolla sijaitsee muinaismuistolailla rauhoitettu kiinteä muinaisjäännös', NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 240);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('902', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0902', 241, '9.0', 'DRAFT', NULL, 'Luontoarvoiltaan arvokas alue tai kohde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 17:42:13', 241);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090201', 242, '902.0', 'DRAFT', NULL, 'Suojeltu puu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 242);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090202', 243, '902.0', 'DRAFT', NULL, 'Säilytettävä puu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 243);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090203', 244, '902.0', 'DRAFT', NULL, 'Suojeltava vesistö tai vesialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 244);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90204', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090204', 245, '902.0', 'DRAFT', NULL, 'Luonnon monimuotoisuuden kannalta tärkeä alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 245);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('90205', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090205', 246, '902.0', 'DRAFT', NULL, 'Ekologinen yhteys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 246);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('903', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0903', 247, '9.0', 'DRAFT', NULL, 'Alue, jolla ympäristö säilytetään', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 247);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('904', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0904', 248, '9.0', 'DRAFT', NULL, 'Alue, jolla on erityistä ulkoilun ohjaamistarvetta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:50', '2020-12-17 09:11:50', 248);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/10', 249, NULL, 'DRAFT', NULL, 'Tonttijako', NULL, NULL, NULL, NULL, NULL, 'maa-alueen jakautuminen asemakaavassa osoitetuiksi yksiköiksi, joista on muodostettu tai joista on tarkoitus muodostaa tontteja soveltuvalla kiinteistönmuodostustoimituksella', NULL, NULL, NULL, '1', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 249);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1001', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1001', 250, '10.0', 'DRAFT', NULL, 'Sitova tonttijako laadittava', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 250);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1002', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1002', 251, '10.0', 'DRAFT', NULL, 'Esitontti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 251);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/11', 252, NULL, 'DRAFT', NULL, 'Yleismääräykset', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 252);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1101', 253, '11.0', 'DRAFT', NULL, 'Yleismääräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 253);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1102', 254, '11.0', 'DRAFT', NULL, 'Ajanmukaisuuden arvioinnin aikaraja', NULL, NULL, NULL, NULL, NULL, 'Asemakaavan ajanmukaisuuden arviointi on tehtävä kaavamääräyksen numeerisen arvon osoittaman vuoden kuluttua kaavan voimaantulosta.', NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 254);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1103', 255, '11.0', 'DRAFT', NULL, 'Aluetta koskee sitovat rakentamistapaohjeet', NULL, NULL, NULL, NULL, NULL, 'Aluetta koskee sitovat rakennustapaohjeet', NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 255);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1104', 256, '11.0', 'DRAFT', NULL, 'Aluetta koskee rakentamistapaohjeet', NULL, NULL, NULL, NULL, NULL, 'Alueelle on laadittu rakentamistapaohjeet', NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 256);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('12', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/12', 257, NULL, 'DRAFT', NULL, 'Yhdyskuntatekninen huolto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 257);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1201', 258, '12.0', 'DRAFT', NULL, 'Alin painovoimainen viemäröintitaso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 258);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1202', 259, '12.0', 'DRAFT', NULL, 'Aurinkokennojen alin sijoittumistaso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 259);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1203', 260, '12.0', 'DRAFT', NULL, 'Vaatimus hulevesisuunnitelman laatimisesta', NULL, NULL, NULL, NULL, NULL, 'Alueelle tulee laatia hulevesisuunnitelma.', NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 260);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1204', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1204', 261, '12.0', 'DRAFT', NULL, 'Liitettävä kaukolämpöverkkoon', NULL, NULL, NULL, NULL, NULL, 'Alue on liitettävä kaukolämpöverkkoon.', NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 261);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1205', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1205', 262, '12.0', 'DRAFT', NULL, 'Hulevesien imeyttämisen periaate tai vaatimus', NULL, NULL, NULL, NULL, NULL, 'Hulevesien imeyttämisvaatimus', NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 262);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1206', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1206', 263, '12.0', 'DRAFT', NULL, 'Muu yhdyskuntatekniseen huoltoon liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 263);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('13', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/13', 264, NULL, 'DRAFT', NULL, 'Ympäristön ja terveyden suojelu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 264);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1301', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1301', 265, '13.0', 'DRAFT', NULL, 'Pilaantunut maa-alue', NULL, NULL, NULL, NULL, NULL, 'Alue, jolla on maaperän haitta-aineita', NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 265);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1302', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1302', 266, '13.0', 'DRAFT', NULL, 'Meluaita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 266);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1303', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1303', 267, '13.0', 'DRAFT', NULL, 'Meluvalli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 267);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1304', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1304', 268, '13.0', 'DRAFT', NULL, 'Melualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 268);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1305', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1305', 269, '13.0', 'DRAFT', NULL, 'Radonhaitta huomioitava', NULL, NULL, NULL, NULL, NULL, 'Rakentamisessa on huomioitava mahdollinen radonhaitta.', NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 269);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1306', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1306', 270, '13.0', 'DRAFT', NULL, 'Muu ympäristönsuojeluun liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 270);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('14', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/14', 271, NULL, 'DRAFT', NULL, 'Nimistö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 271);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1401', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1401', 272, '14.0', 'DRAFT', NULL, 'Kadun tai tien nimi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 272);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1402', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1402', 273, '14.0', 'DRAFT', NULL, 'Torin tai katuaukion nimi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 273);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1403', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1403', 274, '14.0', 'DRAFT', NULL, 'Puiston tai muun yleisen alueen nimi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 274);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1404', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1404', 275, '14.0', 'DRAFT', NULL, 'Kaupungin- tai kunnanosan nimi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 275);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1405', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1405', 276, '14.0', 'DRAFT', NULL, 'Korttelinumero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 276);
INSERT INTO koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1406', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1406', 277, '14.0', 'DRAFT', NULL, 'Muu nimistö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:11:51', '2020-12-17 09:11:51', 277);


--
-- TOC entry 4342 (class 0 OID 18524)
-- Dependencies: 226
-- Data for Name: kaavamaarays_laji_yk; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/01', 1, NULL, 'DRAFT', NULL, 'Alueen käyttötarkoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 1);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0101', 2, '1.0', 'DRAFT', NULL, 'Asuminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 2);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010101', 3, '101.0', 'DRAFT', NULL, 'Asuinkerrostaloalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 3);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010102', 4, '101.0', 'DRAFT', NULL, 'Asuinpientaloalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 4);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010103', 5, '101.0', 'DRAFT', NULL, 'Rivitalojen ja muiden kytkettyjen asuinrakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 5);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010104', 6, '101.0', 'DRAFT', NULL, 'Erillispientaloalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 6);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10105', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010105', 7, '101.0', 'DRAFT', NULL, 'Asumista palveleva yhteiskäyttöinen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 7);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10106', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010106', 8, '101.0', 'DRAFT', NULL, 'Maatilan talouskeskuksen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 8);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10107', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010107', 9, '101.0', 'DRAFT', NULL, 'Kyläalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 9);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10108', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010108', 10, '101.0', 'DRAFT', NULL, 'Erityisryhmien palveluasuminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 10);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10109', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010109', 11, '101.0', 'DRAFT', NULL, 'Muu asuminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 11);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0102', 12, '1.0', 'DRAFT', NULL, 'Keskustatoiminnot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 12);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010201', 13, '102.0', 'DRAFT', NULL, 'Keskustatoimintojen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 13);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010202', 14, '102.0', 'DRAFT', NULL, 'Keskustatoimintojen alakeskus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 14);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010203', 15, '102.0', 'DRAFT', NULL, 'Muut keskustatoiminnot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 15);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0103', 16, '1.0', 'DRAFT', NULL, 'Elinkeinot, työ ja tuotanto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 16);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10301', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010301', 17, '103.0', 'DRAFT', NULL, 'Liikerakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 17);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10302', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010302', 18, '103.0', 'DRAFT', NULL, 'Toimistorakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 18);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10303', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010303', 19, '103.0', 'DRAFT', NULL, 'Toimitilarakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 19);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10304', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010304', 20, '103.0', 'DRAFT', NULL, 'Kaupallisten palveluiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 20);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10305', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010305', 21, '103.0', 'DRAFT', NULL, 'Vähittäiskaupan suuryksikkö', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 21);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10306', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010306', 22, '103.0', 'DRAFT', NULL, 'Vähittäiskaupan myymäläkeskittymä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 22);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10307', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010307', 23, '103.0', 'DRAFT', NULL, 'Työpaikka-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 23);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10308', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010308', 24, '103.0', 'DRAFT', NULL, 'Teollisuusalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 24);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10309', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010309', 25, '103.0', 'DRAFT', NULL, 'Varastorakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 25);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10310', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010310', 26, '103.0', 'DRAFT', NULL, 'Alue, jolle saa sijoittaa merkittävän, vaarallisia kemikaaleja valmistavan tai varastoivan laitoksen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 26);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10311', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010311', 27, '103.0', 'DRAFT', NULL, 'Ympäristövaikutuksiltaan merkittävien teollisuustoimintojen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 27);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10312', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010312', 28, '103.0', 'DRAFT', NULL, 'Kiertotalous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 28);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10313', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010313', 29, '103.0', 'DRAFT', NULL, 'Ympäristöhäiriötä aiheuttava tuotantotoiminta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 29);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10314', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010314', 30, '103.0', 'DRAFT', NULL, 'Muu elinkeinotoiminta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 30);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0104', 31, '1.0', 'DRAFT', NULL, 'Palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 31);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10401', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010401', 32, '104.0', 'DRAFT', NULL, 'Palvelurakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 32);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10402', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010402', 33, '104.0', 'DRAFT', NULL, 'Lähipalveluiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 33);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10403', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010403', 34, '104.0', 'DRAFT', NULL, 'Huvi- ja viihdepalveluiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 34);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10404', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010404', 35, '104.0', 'DRAFT', NULL, 'Julkiset palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 35);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10405', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010405', 36, '104.0', 'DRAFT', NULL, 'Yleisten rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 36);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10406', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010406', 37, '104.0', 'DRAFT', NULL, 'Julkisten lähipalveluiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 37);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10407', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010407', 38, '104.0', 'DRAFT', NULL, 'Hallinto- ja virastorakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 38);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10408', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010408', 39, '104.0', 'DRAFT', NULL, 'Opetustoimintaa palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 39);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10409', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010409', 40, '104.0', 'DRAFT', NULL, 'Sosiaalitointa ja terveydenhuoltoa palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 40);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10410', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010410', 41, '104.0', 'DRAFT', NULL, 'Kulttuuritoimintaa palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 41);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10411', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010411', 42, '104.0', 'DRAFT', NULL, 'Museorakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 42);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10412', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010412', 43, '104.0', 'DRAFT', NULL, 'Kirkkojen ja muiden seurakunnallisten rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 43);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10413', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010413', 44, '104.0', 'DRAFT', NULL, 'Urheilutoimintaa palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 44);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10414', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010414', 45, '104.0', 'DRAFT', NULL, 'Julkisten palveluiden ja hallinnon alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 45);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10415', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010415', 46, '104.0', 'DRAFT', NULL, 'Muut palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 46);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('105', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0105', 47, '1.0', 'DRAFT', NULL, 'Virkistys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 47);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10501', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010501', 48, '105.0', 'DRAFT', NULL, 'Virkistysalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 48);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10502', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010502', 49, '105.0', 'DRAFT', NULL, 'Puisto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 49);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10503', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010503', 50, '105.0', 'DRAFT', NULL, 'Lähivirkistysalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 50);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10504', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010504', 51, '105.0', 'DRAFT', NULL, 'Leikkipuisto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 51);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10505', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010505', 52, '105.0', 'DRAFT', NULL, 'Urheilupalvelujen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 52);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10506', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010506', 53, '105.0', 'DRAFT', NULL, 'Retkeily- ja ulkoilualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 53);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10507', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010507', 54, '105.0', 'DRAFT', NULL, 'Uimaranta-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 54);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10508', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010508', 55, '105.0', 'DRAFT', NULL, 'Lähimetsä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 55);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10509', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010509', 56, '105.0', 'DRAFT', NULL, 'Muu virkistysalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 56);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('106', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0106', 57, '1.0', 'DRAFT', NULL, 'Loma-asuminen ja matkailu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 57);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10601', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010601', 58, '106.0', 'DRAFT', NULL, 'Loma-asuntojen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 58);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10602', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010602', 59, '106.0', 'DRAFT', NULL, 'Matkailua palvelevien rakennusten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 59);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10603', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010603', 60, '106.0', 'DRAFT', NULL, 'Leirintäalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 60);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10604', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010604', 61, '106.0', 'DRAFT', NULL, 'Asuntovaunualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 61);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10605', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010605', 62, '106.0', 'DRAFT', NULL, 'Siirtolapuutarha-/palstaviljelyalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 62);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10606', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010606', 63, '106.0', 'DRAFT', NULL, 'Muu loma-asumisen tai matkailun alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 63);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('107', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0107', 64, '1.0', 'DRAFT', NULL, 'Liikenne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 64);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10701', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010701', 65, '107.0', 'DRAFT', NULL, 'Liikennealue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 65);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10702', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010702', 66, '107.0', 'DRAFT', NULL, 'Yleisen tien alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 66);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10703', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010703', 67, '107.0', 'DRAFT', NULL, 'Rautatieliikenteen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 67);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10704', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010704', 68, '107.0', 'DRAFT', NULL, 'Lentoliikenteen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 68);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10705', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010705', 69, '107.0', 'DRAFT', NULL, 'Satama-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 69);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10706', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010706', 70, '107.0', 'DRAFT', NULL, 'Kanava-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 70);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10707', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010707', 71, '107.0', 'DRAFT', NULL, 'Venesatama/venevalkama', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 71);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10708', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010708', 72, '107.0', 'DRAFT', NULL, 'Yleinen pysäköintialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 72);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10709', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010709', 73, '107.0', 'DRAFT', NULL, 'Huoltoasema-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 73);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10710', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010710', 74, '107.0', 'DRAFT', NULL, 'Henkilöliikenteen terminaalialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 74);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10711', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010711', 75, '107.0', 'DRAFT', NULL, 'Tavaraliikenteen terminaalialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 75);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10712', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010712', 76, '107.0', 'DRAFT', NULL, 'Yleisten pysäköintilaitosten alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 76);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10713', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010713', 77, '107.0', 'DRAFT', NULL, 'Autopaikkojen alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 77);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10714', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010714', 78, '107.0', 'DRAFT', NULL, 'Katualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 78);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10715', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010715', 79, '107.0', 'DRAFT', NULL, 'Muu liikennealue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 79);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('108', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0108', 80, '1.0', 'DRAFT', NULL, 'Erityisalueet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 80);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10801', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010801', 81, '108.0', 'DRAFT', NULL, 'Erityisalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 81);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10802', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010802', 82, '108.0', 'DRAFT', NULL, 'Yhdyskuntateknisen huollon alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 82);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10803', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010803', 83, '108.0', 'DRAFT', NULL, 'Energiahuollon alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 83);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10804', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010804', 84, '108.0', 'DRAFT', NULL, 'Jätteenkäsittelyalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 84);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10805', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010805', 85, '108.0', 'DRAFT', NULL, 'Maa-ainesten ottoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 85);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10806', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010806', 86, '108.0', 'DRAFT', NULL, 'Kaivosalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 86);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10807', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010807', 87, '108.0', 'DRAFT', NULL, 'Mastoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 87);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10808', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010808', 88, '108.0', 'DRAFT', NULL, 'Ampumarata-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 88);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10809', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010809', 89, '108.0', 'DRAFT', NULL, 'Puolustusvoimien alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 89);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10810', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010810', 90, '108.0', 'DRAFT', NULL, 'Hautausmaa-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 90);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10811', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010811', 91, '108.0', 'DRAFT', NULL, 'Suojaviheralue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 91);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10812', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010812', 92, '108.0', 'DRAFT', NULL, 'Tuulivoimaloiden alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 92);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10813', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010813', 93, '108.0', 'DRAFT', NULL, 'Moottorirata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 93);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10814', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010814', 94, '108.0', 'DRAFT', NULL, 'Maa-ainesten vastaanotto- tai läjitysalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 94);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10815', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010815', 95, '108.0', 'DRAFT', NULL, 'Vankila-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:10', '2020-12-17 09:18:10', 95);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10816', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010816', 96, '108.0', 'DRAFT', NULL, 'Muu erityisalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 96);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('109', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0109', 97, '1.0', 'DRAFT', NULL, 'Suojelu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 97);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10901', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010901', 98, '109.0', 'DRAFT', NULL, 'Suojelualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 98);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10902', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010902', 99, '109.0', 'DRAFT', NULL, 'Luonnonsuojelualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 99);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10903', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010903', 100, '109.0', 'DRAFT', NULL, 'Muinaismuistoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 100);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10904', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010904', 101, '109.0', 'DRAFT', NULL, 'Rakennuslainsäädännön nojalla suojeltava alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 101);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10905', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010905', 102, '109.0', 'DRAFT', NULL, 'Rakennussuojelulakien nojalla suojeltu alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 102);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10906', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010906', 103, '109.0', 'DRAFT', NULL, 'Muu suojelualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 103);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('110', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0110', 104, '1.0', 'DRAFT', NULL, 'Maa- ja metsätalous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 104);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11001', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011001', 105, '110.0', 'DRAFT', NULL, 'Maa- ja metsätalousalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 105);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11002', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011002', 106, '110.0', 'DRAFT', NULL, 'Maatalousalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 106);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11003', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011003', 107, '110.0', 'DRAFT', NULL, 'Kotieläintalouden suuryksikön alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 107);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11004', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011004', 108, '110.0', 'DRAFT', NULL, 'Puutarha- ja kasvihuonealue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 108);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11005', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011005', 109, '110.0', 'DRAFT', NULL, 'Maisemallisesti arvokas peltoalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 109);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11006', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011006', 110, '110.0', 'DRAFT', NULL, 'Poronhoitovaltainen maa- ja metsätalousalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 110);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11007', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011007', 111, '110.0', 'DRAFT', NULL, 'Muu maa- ja metsätalousalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 111);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('111', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0111', 112, '1.0', 'DRAFT', NULL, 'Vesialueet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 112);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011101', 113, '111.0', 'DRAFT', NULL, 'Vesialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 113);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011102', 114, '111.0', 'DRAFT', NULL, 'Muu vesialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 114);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/02', 115, NULL, 'DRAFT', NULL, 'Rakentaminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 115);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0201', 116, '2.0', 'DRAFT', NULL, 'Rakennusala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 116);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0202', 117, '2.0', 'DRAFT', NULL, 'Rakennuspaikka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 117);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0203', 118, '2.0', 'DRAFT', NULL, 'Asunnon rakennuspaikka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 118);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('204', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0204', 119, '2.0', 'DRAFT', NULL, 'Loma-asunnon rakennuspaikka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 119);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('205', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0205', 120, '2.0', 'DRAFT', NULL, 'Saunan rakennuspaikka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 120);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('206', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0206', 121, '2.0', 'DRAFT', NULL, 'Maatalouden talouskeskuksen rakennuspaikka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 121);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('207', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0207', 122, '2.0', 'DRAFT', NULL, 'Sallittu kokonaiskerrosala', NULL, NULL, 'kokonaiskerrosalan suhde korttelin pinta-alaan', NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 122);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('208', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0208', 123, '2.0', 'DRAFT', NULL, 'Aluetehokkuus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 123);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('209', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0209', 124, '2.0', 'DRAFT', NULL, 'Korttelitehokkuus', NULL, NULL, 'kokonaiskerrosalan suhde tontin/rakennuspaikan pinta-alaan', NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 124);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('210', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0210', 125, '2.0', 'DRAFT', NULL, 'Tonttitehokkuus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 125);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('211', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0211', 126, '2.0', 'DRAFT', NULL, 'Sallittujen rakennuspaikkojen lukumäärä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 126);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('212', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0212', 127, '2.0', 'DRAFT', NULL, 'Rakennuspaikan vähimmäiskoko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 127);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('213', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0213', 128, '2.0', 'DRAFT', NULL, 'Sallittu tuulivoimaloiden määrä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 128);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('214', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0214', 129, '2.0', 'DRAFT', NULL, 'Vähittäiskaupan suuryksikön sallittu kerrosala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 129);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('215', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0215', 130, '2.0', 'DRAFT', NULL, 'Vähittäiskaupan myymäläkeskittymän sallittu kerrosala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 130);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/03', 131, NULL, 'DRAFT', NULL, 'Liikenne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 131);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('301', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0301', 132, '3.0', 'DRAFT', NULL, 'Alueverkon pyöräilyreitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 132);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('302', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0302', 133, '3.0', 'DRAFT', NULL, 'Eritasoliittymä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 133);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('303', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0303', 134, '3.0', 'DRAFT', NULL, 'Eritasoristeys ilman liittymää', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 134);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('304', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0304', 135, '3.0', 'DRAFT', NULL, 'Joukkoliikenteen runkoyhteys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 135);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('305', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0305', 136, '3.0', 'DRAFT', NULL, 'Kaksiajoratainen päätie/-katu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 136);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('306', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0306', 137, '3.0', 'DRAFT', NULL, 'Kevyen liikenteen reitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 137);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('307', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0307', 138, '3.0', 'DRAFT', NULL, 'Laivaväylä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 138);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('308', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0308', 139, '3.0', 'DRAFT', NULL, 'Liikennetunneli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 139);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('309', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0309', 140, '3.0', 'DRAFT', NULL, 'Liittymä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 140);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('310', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0310', 141, '3.0', 'DRAFT', NULL, 'Linja-autoasema/julkisen liikenteen vaihtopaikka/matkakeskus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 141);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('311', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0311', 142, '3.0', 'DRAFT', NULL, 'Metroasema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 142);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('312', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0312', 143, '3.0', 'DRAFT', NULL, 'Metrolinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 143);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('313', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0313', 144, '3.0', 'DRAFT', NULL, 'Moottori- tai moottoriliikennetie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 144);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('314', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0314', 145, '3.0', 'DRAFT', NULL, 'Moottorikelkkailureitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 145);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('315', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0315', 146, '3.0', 'DRAFT', NULL, 'Pysäkki/seisake', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 146);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('316', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0316', 147, '3.0', 'DRAFT', NULL, 'Pyöräilyn pää-/runkoreitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 147);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('317', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0317', 148, '3.0', 'DRAFT', NULL, 'Päärata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 148);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('318', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0318', 149, '3.0', 'DRAFT', NULL, 'Raitiotie/Pikaraitiotie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 149);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('319', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0319', 150, '3.0', 'DRAFT', NULL, 'Ratsastusreitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 150);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('320', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0320', 151, '3.0', 'DRAFT', NULL, 'Rautatieasema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 151);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('321', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0321', 152, '3.0', 'DRAFT', NULL, 'Seututie/pääkatu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 152);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('322', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0322', 153, '3.0', 'DRAFT', NULL, 'Seutuverkon pyöräilyreitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 153);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('323', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0323', 154, '3.0', 'DRAFT', NULL, 'Suuntaisliittymä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 154);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('324', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0324', 155, '3.0', 'DRAFT', NULL, 'Ulkoilu- tai virkistysreitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 155);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('325', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0325', 156, '3.0', 'DRAFT', NULL, 'Valtatie/kantatie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 156);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('326', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0326', 157, '3.0', 'DRAFT', NULL, 'Varattu joukkoliikenteelle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 157);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('327', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0327', 158, '3.0', 'DRAFT', NULL, 'Varikko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 158);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('328', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0328', 159, '3.0', 'DRAFT', NULL, 'Venesatama/venevalkama', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 159);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('329', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0329', 160, '3.0', 'DRAFT', NULL, 'Veneväylä', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 160);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('330', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0330', 161, '3.0', 'DRAFT', NULL, 'Yhdysrata/sivurata/kaupunkirata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 161);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('331', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0331', 162, '3.0', 'DRAFT', NULL, 'Yhdystie/kokoojakatu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 162);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('334', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0334', 163, '3.0', 'DRAFT', NULL, 'Liityntäpysäköinti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 163);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('335', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0335', 164, '3.0', 'DRAFT', NULL, 'Muu liikenteeseen liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 164);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/04', 165, NULL, 'DRAFT', NULL, 'Kehittämisperiaatteet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 165);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('401', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0401', 166, '4.0', 'DRAFT', NULL, 'Yhdyskuntarakenteen laajenemissuunta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 166);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('402', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0402', 167, '4.0', 'DRAFT', NULL, 'Yhdyskuntarakenteen mahdollinen laajenemisalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 167);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('403', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0403', 168, '4.0', 'DRAFT', NULL, 'Alueen eheyttämis- tai tiivistämistarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 168);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('404', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0404', 169, '4.0', 'DRAFT', NULL, 'Ohjeellinen tai vaihtoehtoinen tielinjaus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 169);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('405', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0405', 170, '4.0', 'DRAFT', NULL, 'Tieliikenteen yhteystarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 170);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('406', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0406', 171, '4.0', 'DRAFT', NULL, 'Joukkoliikenteen kehittämiskäytävä tai yhteystarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 171);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('407', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0407', 172, '4.0', 'DRAFT', NULL, 'Kevyen liikenteen yhteystarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 172);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('408', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0408', 173, '4.0', 'DRAFT', NULL, 'Johdon, putken tai linjan yhteystarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 173);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('409', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0409', 174, '4.0', 'DRAFT', NULL, 'Viheryhteystarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 174);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('410', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0410', 175, '4.0', 'DRAFT', NULL, 'Virkistyksen yhteystarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 175);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('411', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0411', 176, '4.0', 'DRAFT', NULL, 'Julkisen virkistyksen kehittämistarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 176);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('412', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0412', 177, '4.0', 'DRAFT', NULL, 'Kävely-ympäristön kehittämistarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 177);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('413', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0413', 178, '4.0', 'DRAFT', NULL, 'Kaupunkikuvallinen kehittämistarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 178);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('414', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0414', 179, '4.0', 'DRAFT', NULL, 'Meluntorjuntatarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 179);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('415', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0415', 180, '4.0', 'DRAFT', NULL, 'Ympäristö- tai maisemavaurion korjaustarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 180);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('416', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0416', 181, '4.0', 'DRAFT', NULL, 'Terveyshaitan poistamistarve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 181);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('418', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0418', 182, '4.0', 'DRAFT', NULL, 'Uusi tai olennaisesti muuttuva alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 182);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('419', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0419', 183, '4.0', 'DRAFT', NULL, 'Pienin toimenpitein kehitettävä alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 183);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('421', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0421', 184, '4.0', 'DRAFT', NULL, 'Muu kehittämisperiaate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 184);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/05', 185, NULL, 'DRAFT', NULL, 'Rajoitukset', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 185);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('501', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0501', 186, '5.0', 'DRAFT', NULL, 'Rakentamisrajoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 186);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('502', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0502', 187, '5.0', 'DRAFT', NULL, 'Määräaikainen rakentamisrajoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 187);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('503', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0503', 188, '5.0', 'DRAFT', NULL, 'Toimenpiderajoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 188);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('504', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0504', 189, '5.0', 'DRAFT', NULL, 'Rakennuksen purkamisrajoitus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 189);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/06', 190, NULL, 'DRAFT', NULL, 'Alueen osan erityisominaisuudet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 190);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('601', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0601', 191, '6.0', 'DRAFT', NULL, 'Erityisharkinta-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 191);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('602', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0602', 192, '6.0', 'DRAFT', NULL, 'Kehittämisalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 192);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('603', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0603', 193, '6.0', 'DRAFT', NULL, 'Vaara-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 193);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('604', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0604', 194, '6.0', 'DRAFT', NULL, 'Suojavyöhyke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 194);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('605', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0605', 195, '6.0', 'DRAFT', NULL, 'Suunnittelutarvealue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 195);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('606', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0606', 196, '6.0', 'DRAFT', NULL, 'Reservialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 196);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('607', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0607', 197, '6.0', 'DRAFT', NULL, 'Muu alueen osan erityisominaisuus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 197);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/07', 198, NULL, 'DRAFT', NULL, 'Ympäristöarvojen vaaliminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 198);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('701', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0701', 199, '7.0', 'DRAFT', NULL, 'Kulttuurihistoriallisesti arvokas alue tai kohde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 199);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70101', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070101', 200, '701.0', 'DRAFT', NULL, 'Suojeltava alue tai alueen osa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 200);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70102', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070102', 201, '701.0', 'DRAFT', NULL, 'Suojeltava rakennus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 201);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70103', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070103', 202, '701.0', 'DRAFT', NULL, 'Suojeltava rakennelma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 202);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70104', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070104', 203, '701.0', 'DRAFT', NULL, 'Kiinteä suojeltava kohde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 203);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70105', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070105', 204, '701.0', 'DRAFT', NULL, 'Kiinteä muinaisjäännös', NULL, NULL, 'Alue tai alueen osa, jolla sijaitsee muinaismuistolailla rauhoitettu kiinteä muinaisjäännös', NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 204);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('702', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0702', 205, '7.0', 'DRAFT', NULL, 'Luontoarvoiltaan arvokas alue tai kohde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:11', '2020-12-17 17:43:33', 205);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70201', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070201', 206, '702.0', 'DRAFT', NULL, 'Suojeltu puu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 206);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70202', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070202', 207, '702.0', 'DRAFT', NULL, 'Säilytettävä puu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 207);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70203', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070203', 208, '702.0', 'DRAFT', NULL, 'Suojeltava vesistö tai vesialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:11', '2020-12-17 09:18:11', 208);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70204', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070204', 209, '702.0', 'DRAFT', NULL, 'Luonnon monimuotoisuuden kannalta tärkeä alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 209);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('70205', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070205', 210, '702.0', 'DRAFT', NULL, 'Ekologinen yhteys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 210);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('703', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0703', 211, '7.0', 'DRAFT', NULL, 'Alue, jolla ympäristö säilytetään', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 211);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('704', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0704', 212, '7.0', 'DRAFT', NULL, 'Alue, jolla on erityistä ulkoilun ohjaamistarvetta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 212);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/08', 213, NULL, 'DRAFT', NULL, 'Yleismääräykset', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 213);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('801', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0801', 214, '8.0', 'DRAFT', NULL, 'Yleismääräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 214);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('802', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0802', 215, '8.0', 'DRAFT', NULL, 'Yleiskaavan käyttö rakennusluvan myöntämisen perusteena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 215);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/09', 216, NULL, 'DRAFT', NULL, 'Yhdyskuntatekninen huolto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 216);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('901', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0901', 217, '9.0', 'DRAFT', NULL, 'Johto, putki tai linja', NULL, NULL, 'Yhdyskuntatekniikkaa palveleva johto, putki tai linja, joka voi sijaita maan päällä tai alla. Tällaisia ovat esimerkiksi sähkölinjat, vesijohdot, maakaasun runkoputket ja jätevesiviemärit.', NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 217);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('902', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0902', 218, '9.0', 'DRAFT', NULL, 'Sähkölinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 218);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('903', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0903', 219, '9.0', 'DRAFT', NULL, 'Kaasulinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 219);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('904', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0904', 220, '9.0', 'DRAFT', NULL, 'Vesi- tai jätevesitunneli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 220);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('905', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0905', 221, '9.0', 'DRAFT', NULL, 'Vesijohto tai siirtoviemäri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 221);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('906', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0906', 222, '9.0', 'DRAFT', NULL, 'Kaukolämpölinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 222);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('907', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0907', 223, '9.0', 'DRAFT', NULL, 'Kaukokylmälinja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 223);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('908', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0908', 224, '9.0', 'DRAFT', NULL, 'Hulevesien hallinta-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 224);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('909', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0909', 225, '9.0', 'DRAFT', NULL, 'Hulevesien hallinnan kannalta merkittävä alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 225);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('910', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0910', 226, '9.0', 'DRAFT', NULL, 'Hulevesien purkuoja/-reitti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 226);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('911', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0911', 227, '9.0', 'DRAFT', NULL, 'Hulevesien viivytysalue', NULL, NULL, 'Hulevesien käsittelytapaa ohjaava määräys', NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 227);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('912', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0912', 228, '9.0', 'DRAFT', NULL, 'Hulevesien käsittelytapa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 228);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('913', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0913', 229, '9.0', 'DRAFT', NULL, 'Pohjavedenottamo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 229);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('914', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0914', 230, '9.0', 'DRAFT', NULL, 'Pohjavedenottamon lähisuoja-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 230);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('915', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0915', 231, '9.0', 'DRAFT', NULL, 'Muu yhdyskuntatekniseen huoltoon liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 231);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/10', 232, NULL, 'DRAFT', NULL, 'Ympäristön ja terveyden suojelu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 232);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1001', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1001', 233, '10.0', 'DRAFT', NULL, 'Pilaantunut maa-alue', NULL, NULL, NULL, NULL, NULL, 'Alue, jolla on maaperän haitta-aineita', NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 233);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1002', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1002', 234, '10.0', 'DRAFT', NULL, 'Tulvavaara-alue', NULL, NULL, 'Alue, joka on tulvavaarassa', NULL, NULL, 'Tulvavaara voi liittyä meritulvaan tai hulevesien aiheuttamaan tulvimiseen', NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 234);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1003', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1003', 235, '10.0', 'DRAFT', NULL, 'Meritulvavaara-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 235);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1004', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1004', 236, '10.0', 'DRAFT', NULL, 'Hulevesitulvavaara-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 236);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1005', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1005', 237, '10.0', 'DRAFT', NULL, 'Valuma-alue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 237);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1006', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1006', 238, '4.0', 'DRAFT', NULL, 'Virkistyskohde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 238);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1007', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1007', 239, '10.0', 'DRAFT', NULL, 'Melualue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 239);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1008', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1008', 240, '10.0', 'DRAFT', NULL, 'Pohjavesialue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 240);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1009', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1009', 241, '10.0', 'DRAFT', NULL, 'Pohjaveden muodostumisalue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 241);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1010', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1010', 242, '10.0', 'DRAFT', NULL, 'Arvokas harjualue tai muu geologinen muodostuma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 242);
INSERT INTO koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1011', 'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1011', 243, '10.0', 'DRAFT', NULL, 'Muu ympäristönsuojeluun liittyvä määräys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 09:18:12', '2020-12-17 09:18:12', 243);


--
-- TOC entry 4336 (class 0 OID 18494)
-- Dependencies: 220
-- Data for Name: kaavan_elinkaaritila; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/01', 1, NULL, 'DRAFT', NULL, 'Kaavoitusaloite', NULL, NULL, 'Kuntaan saapunut kaavoitusaloite', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 1);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/02', 2, NULL, 'DRAFT', NULL, 'Vireilletullut', NULL, NULL, 'viranomainen on ottanut kaava-asian käsiteltäväksi', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/jhs/J336', '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 2);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/03', 3, NULL, 'DRAFT', 'material used in preparation', 'Valmistelu', 'beredningsmaterial', NULL, NULL, NULL, NULL, 'kaavaprosessin vaihe, jossa laaditaan kaavan valmisteluaineisto. Valmisteluaineisto koostuu kaavaehdotuksen tai muun päätösehdotuksen laatimista varten laadituista ja kerätyistä aineistoista', NULL, NULL, 'http://uri.suomi.fi/terminology/mrl/concept-203', '1', '2020-12-11 11:13:51', '2021-01-13 19:35:58', 3);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/04', 4, NULL, 'DRAFT', 'plan proposal', 'Kaavaehdotus', 'planförslag', NULL, 'julkisesti nähtäville asetettava ehdotus kaavaksi', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/mrl/concept-147', '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 4);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/05', 5, NULL, 'DRAFT', NULL, 'Tarkistettu kaavaehdotus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 5);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/06', 6, NULL, 'DRAFT', NULL, 'Hyväksytty kaava', NULL, NULL, 'Toimivaltainen viranomainen on hyväksynyt kaavaehdotuksen', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 6);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/07', 7, NULL, 'DRAFT', NULL, 'Oikaisukehotuksen alainen', NULL, NULL, 'Kaavasta on jätetty oikaisukehotus', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 7);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/08', 8, NULL, 'DRAFT', NULL, 'Valituksen alainen', NULL, NULL, 'Kaavasta on tehty valitus', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/luvat/c87', '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 8);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/09', 9, NULL, 'DRAFT', NULL, 'Osittain voimassa', NULL, NULL, 'Kaava on kuulutettu osittain voimaan.', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 9);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/10', 10, NULL, 'DRAFT', NULL, 'Voimassa', NULL, NULL, 'Kaava on saanut lainvoiman', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 10);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/11', 11, NULL, 'DRAFT', NULL, 'Kumottu', NULL, NULL, 'Kaava on kumottu', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 11);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('12', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/12', 12, NULL, 'DRAFT', NULL, 'Kumoutunut', NULL, NULL, 'Kaava on kumoutunut kaavamuutoksen myötä', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 12);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('13', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/13', 13, NULL, 'DRAFT', NULL, 'Rauennut', NULL, NULL, 'Kaava on rauennut kaavoitusprosessin keskeyttämisen myötä', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 13);
INSERT INTO koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('14', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/14', 14, NULL, 'DRAFT', NULL, 'Hylätty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 11:13:51', '2020-12-11 11:13:51', 14);


--
-- TOC entry 4373 (class 0 OID 18720)
-- Dependencies: 257
-- Data for Name: kaavan_kasittelytapahtuman_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/01', 1, NULL, 'DRAFT', NULL, 'Kaavan ajanmukaisuuden arviointi', NULL, NULL, NULL, NULL, NULL, 'Kaavan ajanmukaisuus arvioidaan', NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 1);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/02', 2, NULL, 'DRAFT', NULL, 'Kaavoitusaloitteen hyväksyminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 2);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/03', 3, NULL, 'DRAFT', NULL, 'Kaavoituksen käynnistäminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 3);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/04', 4, NULL, 'DRAFT', NULL, 'Kaavan vireilletulo', NULL, NULL, NULL, NULL, NULL, 'Kaava-asia kuulutetaan vireille', NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 4);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/05', 5, NULL, 'DRAFT', NULL, 'Kaavan valmisteluaineiston nähtäville asettaminen', NULL, NULL, NULL, NULL, NULL, 'Kaavan valmisteluaineisto asetetaan nähtäville', NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 5);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/06', 6, NULL, 'DRAFT', NULL, 'Kaavaehdotuksen nähtäville asettaminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 6);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/07', 7, NULL, 'DRAFT', NULL, 'Tarkistetun kaavaehdotuksen nähtäville asettaminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2021-01-13 19:44:13', 7);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/08', 8, NULL, 'DRAFT', NULL, 'Kaavaprosessin keskeyttäminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 8);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/09', 9, NULL, 'DRAFT', NULL, 'Kaavan hyväksyminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 9);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/10', 10, NULL, 'DRAFT', NULL, 'Kaavan hyväksyminen oikaisukehotuksen johdosta', NULL, NULL, NULL, NULL, NULL, 'Kaavasta annettu oikaisukehotus käsitellään', NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 10);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/11', 11, NULL, 'DRAFT', NULL, 'Kaavan kumoaminen', NULL, NULL, NULL, NULL, NULL, 'Kaavoitusprosessin myötä muutettava tai kumottava kaava kumoutuu', NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 11);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('12', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/12', 12, NULL, 'DRAFT', NULL, 'Valituksen vastineiden hyväksyminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 12);
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('13', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/13', 13, NULL, 'DRAFT', NULL, 'Kaavan voimaantulo', NULL, NULL, NULL, NULL, NULL, 'Kaava saa lainvoiman voimaantulokuulutuksella', NULL, NULL, NULL, '1', '2020-12-11 18:29:53', '2020-12-11 18:29:53', 13);


--
-- TOC entry 4346 (class 0 OID 18544)
-- Dependencies: 230
-- Data for Name: kaavan_vuorovaikutustapahtuman_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/01', 1, NULL, 'DRAFT', NULL, 'Nähtävilläolo', NULL, NULL, NULL, NULL, NULL, 'kaavan virallinen nähtävilläoloon valmistelu- ja ehdotusvaiheissa', NULL, NULL, NULL, '1', '2020-12-11 18:48:01', '2020-12-11 18:48:01', 1);
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/02', 2, NULL, 'DRAFT', NULL, 'Vuorovaikutustilaisuus', NULL, NULL, 'Kaavaan liittyvä tilaisuus tai tapahtuma, jossa toimijoiden on mahdollisuus tuoda esiin suunnitteluun liittyviä näkemyksiään', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:48:01', '2020-12-11 18:48:01', 2);
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/03', 3, NULL, 'DRAFT', NULL, 'Tiedonkeruu', NULL, NULL, 'Kaavaan liittyvä kartoitus, jossa kerätään esimerkiksi kyselyn tai muun soveltuvan menetelmän avulla toimijoiden näkökulmia suunnitteluun', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:48:01', '2020-12-11 18:48:01', 3);
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/04', 4, NULL, 'DRAFT', NULL, 'Neuvottelu', NULL, NULL, 'Kokous tai muu neuvottelutilaisuus, jossa keskustellaan kaavaan liittyvistä kysymyksistä', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:48:01', '2020-12-11 18:48:01', 4);
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/05', 5, NULL, 'DRAFT', NULL, 'Sähköinen osallistuminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 18:48:01', '2020-12-11 18:48:01', 5);
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/06', 6, NULL, 'DRAFT', NULL, 'Muutoksenhaku', NULL, NULL, 'toimenpide, jolla tuomioistuimelta tai muulta muutoksenhakuviranomaiselta pyritään saamaan muutos hallintoviranomaisen tai tuomioistuimen ratkaisuun', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/jhs/J180', '1', '2020-12-11 18:48:01', '2021-01-13 19:52:12', 6);
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/07', 7, NULL, 'DRAFT', NULL, 'Muu vuorovaikutustapahtuma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-01-13 19:52:41', '2021-01-13 19:52:41', 7);


--
-- TOC entry 4340 (class 0 OID 18514)
-- Dependencies: 224
-- Data for Name: kaavoitusteema_ak; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/01', 1, NULL, 'DRAFT', 'permitted building volume', 'Rakennusoikeus', 'byggrätt', NULL, 'Oikeus rakentaa määritellylle alueelle', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/mrl/concept-162', '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 1);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/02', 2, NULL, 'DRAFT', NULL, 'Asuminen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 2);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/03', 3, NULL, 'DRAFT', NULL, 'Palvelut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 3);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/04', 4, NULL, 'DRAFT', NULL, 'Elinkeinot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 4);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/05', 5, NULL, 'DRAFT', NULL, 'Viheralueet ja virkistys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 5);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/06', 6, NULL, 'DRAFT', NULL, 'Kadut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 6);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/07', 7, NULL, 'DRAFT', NULL, 'Kunnallistekniikka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 7);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/08', 8, NULL, 'DRAFT', NULL, 'Liikenneverkko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 8);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/09', 9, NULL, 'DRAFT', NULL, 'Kulttuuriympäristöt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 9);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/10', 10, NULL, 'DRAFT', NULL, 'Suojelu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 10);
INSERT INTO koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/11', 11, NULL, 'DRAFT', NULL, 'Muu kaavoitusteema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 19:21:16', '2020-12-11 19:21:16', 11);


--
-- TOC entry 4338 (class 0 OID 18504)
-- Dependencies: 222
-- Data for Name: kaavoitusteema_yk; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.kaavoitusteema_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_YK/code/01', 1, NULL, 'DRAFT', 'community structure', 'Yhdyskuntarakenne', 'samhällsstruktur', NULL, 'kaupunkiseudun, kunnan tai kunnan osan keskeisten toimintojen sijoittuminen ja keskinäiset suhteet', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/mrl/concept-176', '1', '2020-12-11 19:11:55', '2020-12-11 19:11:55', 1);


--
-- TOC entry 4324 (class 0 OID 18436)
-- Dependencies: 208
-- Data for Name: koodilista_abstrakti; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--



--
-- TOC entry 4363 (class 0 OID 18644)
-- Dependencies: 247
-- Data for Name: lahtoaineiston_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/01', 1, NULL, 'DRAFT', NULL, 'Aluerajat', NULL, NULL, NULL, NULL, NULL, 'Hallinnolliset rajat - kunnat, maakunnat, AVI, valtio, Hallinnolliset rajat (kuntapohjaiset tilastointialueet) - kunnat, seutukunnat, maakunnat, vaalipiirit, suuralueet, AVI, ELY, Aluevesien rajat, Rajavyöhyke, kuvaukseen paliskunnat, saamelaisten kotiseutualue, koltta-alue', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 17:43:09', 1);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/02', 2, NULL, 'DRAFT', NULL, 'Energia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 2);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/03', 3, NULL, 'DRAFT', NULL, 'Ihmisten elinolot ja elinympäristö', NULL, NULL, NULL, NULL, NULL, 'Työpaikat, alueen sosiaalista luonnetta ja ympäristöterveyttä kartoittavat selvitykset, kokemustieto', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 3);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/04', 4, NULL, 'DRAFT', NULL, 'Ilma ja ilmasto', NULL, NULL, NULL, NULL, NULL, 'Tuulisuutta ja pienilmastoa koskevat selvitykset, ilmastonmuutoksen resilienssi jne.', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 4);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/05', 5, NULL, 'DRAFT', NULL, 'Kaupunkikuva ja maisema', NULL, NULL, NULL, NULL, NULL, 'esim. kaupunkikuvallinen tai maisemarakenneselvitys', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 5);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/06', 6, NULL, 'DRAFT', NULL, 'Kulttuuriympäristö', NULL, NULL, NULL, NULL, NULL, 'Kulttuurimaisemaa, muinaismuistoja ja rakennettua kulttuuriympäristöä koskevat selvitykset, kuten Valtakunnallisesti merkittävät arkeologiset kohteet (VARK), kiinteät muinaisjäännökset ja niiden suoja-alueet, arkeologiset kohteet sekä muu kulttuuriympäristö Metsähallituksen hallinoimilla alueilla, valtakunnallisesti merkittävät rakennetut kulttuuriympäristöt, maailmanperintökohteet, museotiet ja -sillat, rakennussuojelu, erityislaeilla suojellut rakennukset, valtakunnallisesti arvokkaat maisema-alueet, kansalliset kaupunkipuistot, historiallisen ajan kylätontit, perinnemaisemat ja -biotoopit', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 6);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/07', 7, NULL, 'DRAFT', NULL, 'Liikenne', NULL, NULL, NULL, NULL, NULL, 'Liikennejärjestelmän ja katuverkon toimivuusselvitykset, eri kulkumuotoja ja näiden jakaumaa koskevat selvitykset', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 7);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/08', 8, NULL, 'DRAFT', NULL, 'Luonto ja luonnonvarat', NULL, NULL, NULL, NULL, NULL, 'Kasvi- ja eläinlajit, luonnon monimuotoisuus ja luonnonvarat. Luontoselvitykset: kasvillisuus, eläimistö, Natura 2000 -tarkastelut jne. Luonnontilaisten alueiden verkosto, koko, määrä, laatu ja yhtenäisyys, perinnebiotoopit. Luonnonvarat: käytön määrä ja kestävyys: kierrätys- ja uudelleen- käyttömahdollisuudet, jne', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 8);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/09', 9, NULL, 'DRAFT', NULL, 'Palveluverkko', NULL, NULL, NULL, NULL, NULL, 'Julkiset palvelut (etenkin kasvatus/sivistys, sote, kulttuuri- ja vapaa-aika), Kaupalliset palvelut (etenkin vähittäiskauppa)', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 17:44:45', 9);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/10', 10, NULL, 'DRAFT', NULL, 'Maa- ja kallioperä, maanpeite', NULL, NULL, NULL, NULL, NULL, 'Maaperä- ja rakennettavuusselvitykset, maankamaran mekaaninen muuttaminen', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 10);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/11', 11, NULL, 'DRAFT', NULL, 'Pohjakartta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 11);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('12', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/12', 12, NULL, 'DRAFT', 'building', 'Rakennukset ja rakenteet', 'byggnad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/rakymp/c6', '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 12);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('13', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/13', 13, NULL, 'DRAFT', NULL, 'Suunnitelmat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 13);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1301', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/1301', 14, '13', 'DRAFT', 'area use plan', 'Alueidenkäytön suunnitelmat', 'områdesanvändningsplan', NULL, 'kunnan tai maakunnan liiton tekemä suunnitelma alueiden käytöstä', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/mrl/concept-204', '2', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 14);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1302', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/1302', 15, '13', 'DRAFT', NULL, 'Muut suunnitelmat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 15);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('14', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/14', 16, NULL, 'DRAFT', NULL, 'Työpaikat ja elinkeinoelämä', NULL, NULL, NULL, NULL, NULL, 'Elinkeinot ja elinkeinorakenne', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 17:45:40', 16);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('15', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/15', 17, NULL, 'DRAFT', NULL, 'Vesi- ja jätehuolto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 17);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('16', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/16', 18, NULL, 'DRAFT', NULL, 'Vesien hoito ja suojelu', NULL, NULL, NULL, NULL, NULL, 'Hulevesi- ja tulvaselvitykset', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 18);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('17', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/17', 19, NULL, 'DRAFT', NULL, 'Viestintäverkko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 19);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('18', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/18', 20, NULL, 'DRAFT', NULL, 'Virkistys ja viherrakenne', NULL, NULL, NULL, NULL, NULL, 'Virkistyspalveluihin ja viherrakenteeseen liittyvät selvitykset', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 17:47:24', 20);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('19', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/19', 21, NULL, 'DRAFT', NULL, 'Väestö', NULL, NULL, NULL, NULL, NULL, 'Väestörekisteri ja väestötilastot', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 21);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('20', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/20', 22, NULL, 'DRAFT', 'community structure', 'Yhdyskuntarakenne', 'samhällsstruktur', NULL, NULL, NULL, NULL, 'Rakennukset ja rakennelmat (MML, kunnat) Kiinteistötiedot (KTJ), Yhdyskuntarakenteen seurantajärjestelmä YKR, Taajama-alueet, Keskusta-alueet ja kaupan alueet', NULL, NULL, 'http://uri.suomi.fi/terminology/mrl/concept-176', '1', '2020-12-11 15:39:18', '2020-12-11 17:44:27', 22);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('21', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/21', 23, NULL, 'DRAFT', NULL, 'Yhdyskuntatalous', NULL, NULL, NULL, NULL, NULL, 'Yhdyskuntatalous, esimerkiksi rakennusten ja infrastruktuurin rakentamisesta, käytöstä ja kunnossapidosta, maan hankinnasta ja myynnistä sekä palvelujen toteuttamisesta ja ylläpidosta aiheutuvat kustannukset ja tulot', NULL, NULL, NULL, '1', '2020-12-11 15:39:18', '2020-12-11 15:39:18', 23);
INSERT INTO koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('22', 'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/22', 24, NULL, 'DRAFT', NULL, 'Muu lähtötietoaineisto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 17:48:08', '2020-12-11 17:48:08', 24);


--
-- TOC entry 4371 (class 0 OID 18710)
-- Dependencies: 255
-- Data for Name: lisatiedon_laji_ak; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/01', 1, NULL, 'DRAFT', NULL, 'Käyttötarkoituksen osuus kerrosalasta', NULL, NULL, NULL, NULL, NULL, 'Kuvaa yhden käyttötarkoituksen osuuden yhden tai usemman rakennuksen sallitusta kerrosalasta', NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 1);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/02', 2, NULL, 'DRAFT', NULL, 'Käyttötarkoituskohdistus', NULL, NULL, 'kohdistaa liittyvän kaavamääryksen koskemaan ainoastaan lisätiedon arvona annettuja käyttötarkoituksia', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 2);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/03', 3, NULL, 'DRAFT', NULL, 'Kohteen geometrian osa', NULL, NULL, 'liitetty arvo ilmaisee sen osan liittyvän kohteen geometriasta, jota kaavamääräys koskee.', NULL, NULL, 'Esim. se osa korttelin tai tontin rajaviivaa, johon rakennukset on rakennettava kiinni, tai osa yhtenä paikkatietokohteena määritellyn liikenneväylän viivaa.', NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 3);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/04', 4, NULL, 'DRAFT', NULL, 'Poisluettava käyttötarkoitus', NULL, NULL, NULL, NULL, NULL, 'Annetut käyttötarkoitukset suljetaan pois kaavamääräyksen kuvaamista sallituista käyttötarkoituksista. Käytetään, mikäli on luontevampaa sulkea tiettyjä yksityiskohtaisia käyttötarkoituksia pois sallittujen joukosta kuin kuvata kaikki sallitut käyttötarkoitukset.', NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 4);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/05', 5, NULL, 'DRAFT', NULL, 'Kulttuurihistoriallinen merkittävyys', 'kulturhistorisk betydelse', NULL, 'kohteesta muodostettu käsitys, joka perustuu kohteen kulttuurihistoriallisten arvojen ja kulttuuristen merkitysten analysointiin sekä sen suhteuttamiseen muihin vastaaviin kohteisiin', NULL, NULL, 'Kulttuurihistoriallinen merkittävyys voi olla kansainvälinen, valtakunnallinen, maakunnallinen, paikallinen tai vähäinen.', NULL, NULL, 'http://uri.suomi.fi/terminology/rakkultymp/c15', '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 5);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/06', 6, NULL, 'DRAFT', NULL, 'Kulttuurihistoriallinen arvotyyppi', NULL, NULL, 'Kohteelle määritetyt kulttuurihistorialliset ominaisuudet', NULL, NULL, 'Kulttuurihistoriallisia ominaisuuksia ovat esimerkiksi rakennustaiteellinen, rakennustekninen, arkkitehtoninen ja maisemallinen.', NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 6);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/07', 7, NULL, 'DRAFT', NULL, 'Kulttuurihistoriallinen tyyppi', NULL, NULL, 'Kuvaa kohteen kulttuurihistoriallista käyttötarkoitusta', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 7);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/08', 8, NULL, 'DRAFT', NULL, 'Kulttuurihistoriallisen merkittävyyden kriteerit', NULL, NULL, 'Kuvaa kulttuurihistoriallisen merkittävyyden kriteerejä, joita kohde edustaa.', NULL, NULL, 'Merkittävyys voi liittyä edustavuuteen, alkuperäisyyteen, harvinaisuuteen, tyypillisyyteen tai historialliseen merkittävyyteen.', NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 8);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/09', 9, NULL, 'DRAFT', NULL, 'Ympäristöarvon peruste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-11 15:10:24', 9);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/10', 10, NULL, 'DRAFT', NULL, 'Ympäristö- tai luontoarvon merkittävyys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:10:24', '2020-12-17 09:20:33', 10);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/11', 11, NULL, 'DRAFT', NULL, 'Muu lisätiedon laji', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:20:54', '2020-12-17 09:20:54', 11);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('12', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/12', 12, NULL, 'DRAFT', NULL, 'Lukumäärä per kerrosneliömetri', NULL, NULL, NULL, NULL, NULL, 'Kuvaa suureen arvon kutakin rakennuksen kerrosneliömetriä kohden.', NULL, NULL, NULL, '1', '2020-12-29 11:12:46', '2020-12-29 11:12:46', 12);
INSERT INTO koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('13', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/13', 13, NULL, 'DRAFT', NULL, 'Lukumäärä per asunto', NULL, NULL, NULL, NULL, NULL, 'Kuvaa suureen arvon kutakin rakennuksen asuntoa kohden.', NULL, NULL, NULL, '1', '2020-12-29 11:13:29', '2020-12-29 11:13:29', 13);


--
-- TOC entry 4389 (class 0 OID 18883)
-- Dependencies: 273
-- Data for Name: lisatiedon_laji_yk; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/01', 1, NULL, 'DRAFT', NULL, 'Käyttötarkoituksen osuus kerrosalasta', NULL, NULL, NULL, NULL, NULL, 'Kuvaa yhden käyttötarkoituksen osuuden yhden tai usemman rakennuksen sallitusta kerrosalasta', NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-11 15:13:35', 1);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/02', 2, NULL, 'DRAFT', NULL, 'Käyttötarkoituskohdistus', NULL, NULL, 'kohdistaa liittyvän kaavamääryksen koskemaan ainoastaan lisätiedon arvona annettuja käyttötarkoituksia', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-11 15:13:35', 2);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('3', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/03', 3, NULL, 'DRAFT', NULL, 'Kohteen geometrian osa', NULL, NULL, 'liitetty arvo ilmaisee sen osan liittyvän kohteen geometriasta, jota kaavamääräys koskee.', NULL, NULL, 'Esim. se osa korttelin tai tontin rajaviivaa, johon rakennukset on rakennettava kiinni, tai osa yhtenä paikkatietokohteena määritellyn liikenneväylän viivaa.', NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-11 15:13:35', 3);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('4', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/04', 4, NULL, 'DRAFT', NULL, 'Poisluettava käyttötarkoitus', NULL, NULL, NULL, NULL, NULL, 'Annetut käyttötarkoitukset suljetaan pois kaavamääräyksen kuvaamista sallituista käyttötarkoituksista. Käytetään, mikäli on luontevampaa sulkea tiettyjä yksityiskohtaisia käyttötarkoituksia pois sallittujen joukosta kuin kuvata kaikki sallitut käyttötarkoitukset.', NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-11 15:13:35', 4);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('5', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/05', 5, NULL, 'DRAFT', NULL, 'Kulttuurihistoriallinen merkittävyys', 'kulturhistorisk betydelse', NULL, 'kohteesta muodostettu käsitys, joka perustuu kohteen kulttuurihistoriallisten arvojen ja kulttuuristen merkitysten analysointiin sekä sen suhteuttamiseen muihin vastaaviin kohteisiin', NULL, NULL, 'Kulttuurihistoriallinen merkittävyys voi olla kansainvälinen, valtakunnallinen, maakunnallinen, paikallinen tai vähäinen.', NULL, NULL, 'http://uri.suomi.fi/terminology/rakkultymp/c15', '1', '2020-12-11 15:13:35', '2020-12-11 15:13:35', 5);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('6', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/06', 6, NULL, 'DRAFT', NULL, 'Kulttuurihistoriallinen arvotyyppi', NULL, NULL, 'Kohteelle määritetyt kulttuurihistorialliset ominaisuudet', NULL, NULL, 'Kulttuurihistoriallisia ominaisuuksia ovat esimerkiksi rakennustaiteellinen, rakennustekninen, arkkitehtoninen ja maisemallinen.', NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-11 15:13:35', 6);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('7', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/07', 7, NULL, 'DRAFT', NULL, 'Kulttuurihistoriallinen tyyppi', NULL, NULL, 'Kuvaa kohteen kulttuurihistoriallista käyttötarkoitusta', NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-11 15:13:35', 7);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('8', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/08', 8, NULL, 'DRAFT', NULL, 'Kulttuurihistoriallisen merkittävyyden kriteerit', NULL, NULL, 'Kuvaa kulttuurihistoriallisen merkittävyyden kriteerejä, joita kohde edustaa.', NULL, NULL, 'Merkittävyys voi liittyä edustavuuteen, alkuperäisyyteen, harvinaisuuteen, tyypillisyyteen tai historialliseen merkittävyyteen.', NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-11 15:13:35', 8);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('9', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/09', 9, NULL, 'DRAFT', NULL, 'Ympäristö- tai luontoarvon peruste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-17 09:19:10', 9);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('10', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/10', 10, NULL, 'DRAFT', NULL, 'Ympäristö- tai luontoarvon merkittävyys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-11 15:13:35', '2020-12-17 09:19:37', 10);
INSERT INTO koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('11', 'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/11', 11, NULL, 'DRAFT', NULL, 'Muu lisätiedon laji', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2020-12-17 09:19:58', '2020-12-17 09:19:58', 11);


--
-- TOC entry 4330 (class 0 OID 18464)
-- Dependencies: 214
-- Data for Name: maanalaisuuden_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.maanalaisuuden_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_MaanalaisuudenLaji/code/01', 1, NULL, 'DRAFT', NULL, 'Maanalainen', NULL, NULL, NULL, NULL, NULL, 'koskee pääosin maanpinnan alapuolista maankäyttöä ja rakentamista', NULL, NULL, NULL, '1', '2020-12-18 11:06:21', '2020-12-18 11:06:21', 1);
INSERT INTO koodistot.maanalaisuuden_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_MaanalaisuudenLaji/code/02', 2, NULL, 'DRAFT', NULL, 'Maanpäällinen', NULL, NULL, NULL, NULL, NULL, 'koskee pääosin maanpinnan yläpuolista maankäyttöä ja rakentamista', NULL, NULL, NULL, '1', '2020-12-18 11:07:10', '2020-12-18 11:07:10', 2);


--
-- TOC entry 4349 (class 0 OID 18562)
-- Dependencies: 233
-- Data for Name: oikeusvaikutteisuuden_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.oikeusvaikutteisuuden_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_OikeusvaikutteisuudenLaji/code/01', 1, NULL, 'DRAFT', 'legal consequence', 'Oikeusvaikutteinen', 'rättsverkan', NULL, 'päätetyllä maankäyttöasialla vaikutus, joka luo, muuttaa tai kumoaa oikeuden tai velvollisuuden', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/mrl/concept-157', '1', '2020-12-11 06:44:19', '2020-12-11 06:44:19', 1);
INSERT INTO koodistot.oikeusvaikutteisuuden_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_OikeusvaikutteisuudenLaji/code/02', 2, NULL, 'DRAFT', 'legal consequence', 'Oikeusvaikutukseton', 'rättsverkan', NULL, 'päätetyllä maankäyttöasialla ei ole vaikutusta, joka luo, muuttaa tai kumoaa oikeuden tai velvollisuuden', NULL, NULL, NULL, NULL, NULL, 'http://uri.suomi.fi/terminology/mrl/concept-157', '1', '2020-12-11 06:44:19', '2020-12-11 06:44:19', 2);


--
-- TOC entry 4328 (class 0 OID 18454)
-- Dependencies: 212
-- Data for Name: sitovuuslaji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.sitovuuslaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_Sitovuuslaji/code/01', 1, NULL, 'DRAFT', NULL, 'Sitova', NULL, NULL, NULL, NULL, NULL, 'Kaavamääräyskohteen sijainti on oikeudellisesti sitova.', NULL, NULL, NULL, '1', '2020-12-11 05:59:48', '2020-12-11 05:59:48', 1);
INSERT INTO koodistot.sitovuuslaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_Sitovuuslaji/code/02', 2, NULL, 'DRAFT', NULL, 'Ohjeellinen', NULL, NULL, NULL, NULL, NULL, 'Kaavamääräyskohteen sijainti ei ole oikeudellisesti sitova.', NULL, NULL, NULL, '1', '2020-12-11 06:00:47', '2020-12-11 06:00:47', 2);


--
-- TOC entry 4334 (class 0 OID 18484)
-- Dependencies: 218
-- Data for Name: ymparistomuutoksenlaji_yk; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

INSERT INTO koodistot.ymparistomuutoksenlaji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('1', 'http://uri.suomi.fi/codelist/rytj/RY_ymparistomuutoksenLaji_YK/code/01', 1, NULL, 'DRAFT', NULL, 'Olemassa oleva', NULL, NULL, NULL, NULL, NULL, 'Kaavakohde kuvaa kaavan laatimisen hetkellä olemassa olevaa kohdetta. Tällaisia voivat esimerkiksi olla olemassa olevat (jo rakennetut) rakennuspaikat, väylät tai muut kohteet.', NULL, NULL, NULL, '1', '2020-12-17 06:16:18', '2020-12-17 06:16:18', 1);
INSERT INTO koodistot.ymparistomuutoksenlaji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) OVERRIDING SYSTEM VALUE VALUES ('2', 'http://uri.suomi.fi/codelist/rytj/RY_ymparistomuutoksenLaji_YK/code/02', 2, NULL, 'DRAFT', NULL, 'Uusi', NULL, NULL, NULL, NULL, NULL, 'Kaavakohde on uusi eli sitä ei vielä ole   toteutettu. Koodiarvolla voidaan ilmaista esimerkiksi uusi rakennuspaikka, uusi väylä tai muu kaavakohde.', NULL, NULL, NULL, '1', '2020-12-17 06:17:41', '2020-12-17 06:17:41', 2);


--
-- TOC entry 4409 (class 0 OID 19157)
-- Dependencies: 293
-- Data for Name: qgis_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.qgis_projects (name, metadata, content) VALUES ('asemakaava_vanha', '{"last_modified_time": "2022-01-07 14:43:08.74316", "last_modified_user": "postgres"}', '\x504b030414000200080064852754153314c9377b010012de11002a0000007b62323336616238352d303063382d343161362d396232382d6266623666333137623161327d2e716773ecfddd76db4892308a5eb79f02c3595f97eb2b4ac42f01564bda9f2ccb2e4fcb964a92abbbc7ab165612484ab04080058092e95973739ea56ef6ddb99aab73b56bedf73a919900895f127fa424176aa62d02c888cc8c8c8c888ccc8c38f8b7d7e727d7ffba38e57ebbb17ceee2e3abb37727dc77b74130fb7130987a86b16fb8d301f9b86f06e677dc7757ffbaba3e7dffddd18b030a718f3ddf729dc39eb42f8afbc2de2b0bfdbfff1ff7c1c2ffefff0ff5381fdde38f3ef6decc6dfbb0f71ff35bb7c7cd3cf7333602074df1616f5524fa4c9e5fa3005f5be4bbc88be21e2fecf1eab530fc51967ee4b5ded10b8e3bb875a7f80205b7dc0cfe013c03fa36b0021b1f1d0cd85ff206cd0337f090e32323807672e4cf3d20e643087c8fec3954f71a4fd0dc0e7e8127ec674a05dedc0f326fc39e9c783e7984173e34c642b68727fe227c076f1fee82a38bcbf3ff38b9bcfad43bbdbebcd246dc80bb7e2f296fde7d7879dafff07dafffeaf8eaf4ede9f9db58995efff4c3d5e9fb5767a7f066eeb9338c1cee1a7b1ef6030f6ae12ef1047bd8313077b5f0033ce5841160c68e8fa7631bf7faef01f8f47223f01b0f4682c2f67ead0a33e26bc0083560c41a30520d18b906ccb0068c5a1546e479be068c521d462034383d3b7b777175feeef5a7dedbcb2bc21d7caf3f94544d90d4be38d2f64545154551e085fed9e987b7d73f7dfcf0eefa536f8a030f384ff8f5d725f31e9f9c7cbc3c3ef9d7277e9fbcbeb87c07ed01ac1ec6ce8365dcf6fa7cfff8c3dbb35386c1c437f0055eeef3822a2b92381215322e9204c0a439a717576f7b7d595434787172fee197d3cbab77e71f3ef5c20945f8fefaa77328794da63d914f987b8f3d0305aed78ba1802ea9a441c797c70041087406b337989b9873279c8382b907f4713debc672ca37325681a6f142aa02d7b929ac41546b552126abb832908db909882ad7e35090edc7fe0838b67f75721cd53477ac6041c62c895749e27d836ca023467e603937bdbec293fff2c73e89679887c771bde096222a8503c609c6faead309f202ec5bc8e98bbff68ffff90e64e5cb53909ea459fdf3cbd7500180163064589e485b5a7d082016027cbc3a7e7bfae9eae4fc824860183907630f1acdf973ef1e2ffa5ce0cedc1b0fcd6e2d839ba2d90cbeedc3dc39be3c3d868e5a8e8d1c93dbe35cc7bf753dcc91277732a10fa4dcab57e7fffca468fb9adc1746fbbcd65761b0477d49d85746096697f82150e060401449a45488ee918f7e207f0ee7c194fbe1abebe04349e17ec0b63df30f61d66a3cf743e03edcf89a7cc8f763ffc7fd40c6dc3f0428c7d54dd0560703862fc2ee8352378f045ee20f06ecf7ea0b3c9006910fb1f7a0676fe19134f847f6397c131530b16f78d68c28e1a35c257830881789f71353d58d0ccf7516d323e82d6b6ef2750400ddb766be6b99d107da249517460783ccb708e806470339b1d1cdd18430e9c120f596e9f84146c92f5b131a0207365a606f0ff808efdd78ee7c16421a6043b8d31911c25e60e19581704ebb3c882ac82f97c1ca310bea5f77be15047ffc6ef938e002e4bb01f7129b56e05a0e3493bb2753c6f9bec7e12f3360406c1ef6841e67dc62e38efcfe39f8f1c713f6d05bb6a7a8a1e9a6163736d95cfa336cee1d42f7e8cebd35f13e9077aacf5c7b71e33a22b50bef2d137b7fc78bc3deccf50310807eaadd36bec18ea9fb33db0af431be45f796eb11838cf3ddb967007e734cebf9ce5918df71b780e5d0764124925fdc0ca6fda1224b22e7fbf6d435f1a169f9086c25ee0eeafcce02f396f0f421e15f2e58ccf0e17b3009ad0bd64446b40bcf9a226f018dfce8580648cec3ef84ef80ee80e5f0afbfcddde06fb487400ad30dd88bfdd87bda73f6ccbd4c10e0fb8251e1a04131aae909207d628a93b1a8493a4875accb089bba36e187ba32194a0a9215411d6b4bb2012989c50dfc6bdceabef515c8b527f4f7845e6c808bc73e3bfa6bc77f9066809a9cf167678c345f7c748c129ca1ab63b0cdc6a2a9f33cfc234b3c02b2c8b2ae9a132c63192cead1e4d931c613e685abb9074617fecfed3043792618096023aa20102443d07479a8c93a9285b1ae1a13431b4b4379026ba9e731ee36d01d3004ee1319f68623bbec0e7b5c27ee97457598c1020f325e1f83d5aecb8238d6b591c9eb435131b1a08aea64387c26c3e9cca7d47ec68e8ebc7bf71ed9d6b731b0391ddb3cc43940ba2c4e54d15060c60a435997b129e86355367461ac0e11160d519184e739d8dfe440571e64dd947965680cc13c938760adf10a0cb029c9fa102b63d3100d7e84d03319e000dff9b0bef866c676d59fcdc3ba2aab8f784dd2344d01813c127499685a4d194bba81872379648c7965fc5ce43355380b584ddedd7d2b631aeb5189518d95d60d718c15531deb862081de8571d447b2a6e98236111451516553109e93f93c45c8430bffdb18d7788f368f6bbcb40ef35136784dd4791546539ef02390c060239baa200a0a12e5d1131bd7c4fbb837a9c86826bfaf091153633dc553d75b541e6906f67f9145080ebcc5e105f12bfd154d677f333cff90b9fb3445a56f2616b6cd43da02cbfc916c3038372f459eeff3dfa7bf93c6ae2f419656ab12c902516bd695893a5ff4dd44c459463ab92ca1a48a300f6616c11cd8eabfc6933196f8f1686f8491b127831ad81b992ade530c100e9282246c18ffbdd6c85f8e942e09a682b4b1a91bbc62c0625d35744d1b217d3499a8ca708cf1d030ca73650bfebb426e2ce9bbb1c1e679c28bf53368de151dd52df96e48ff2b39f40800745fd2f891c0eba288c1984048d2b5892a10fb1fe191ac682ae29f151bcc88b078d20e3c68dfd6dc7780bba2531720f421d2b4a18678504ee6589715c18445a088c1ac3486634513c78a3179264cd0b9eb360cfb703cd64059c084e70db046b0a4c0d25f012b5334b4b108a6a73216db1c6b4680de7b34ebe5d829e1f8f9b7eec31b4cb68df1893b27f39741d1a94c4ecb60326c09a3e63cb967d72623fd5978a81afbe8bcac2882aa88fa489041542013e99a2c69fa7024c93c180de6642cfdc939a75bf2b0258fa84a3c3fe2555d34884211c0bed04424eb18890813b7a24924f5535728fedcf5ad60fe2d0d67d4a592e31915d7c7635552cd09af1b136da8cb4363a46b43acc23f3c06eb40e2c5c9e8190c28b681d6dfd680865d2a3ba061711d8d0d34312455e7456c823017c7fa4811057d3c9a48d2485578517bda76bfeb23dbb6a02f53cbd73f23e2ecb6e8f9137f3e771c2bc0f6147d1be35ca6a79b87bf0c167dc2f302923545c702a6bb41237d3c11255d019b636c60052ba2f9e4b8227e32e9ccf2fff89dd1f0518f1fc5db74bd72f2fef13f555ad5a2abaf781e21eb0eed7e5f744e4edf7f1755f25df5b9c3979b3b51ef36cf8fa8a42ec9aa294dc682ce235e23c79b60ae28f244573424a8b2c8f35ab51dd10da398378e1b46b2d01dbf46fdb9de1d9efb3310004f74894cfd22cdd735b17e965fdec480f4311acabc3414750189b0ca5164431f693c06c3471d4e44519b1823f45c87ff099d7fd8e6e8af267cf9c1a7537f32992893213fd2151593932f5881650b984723341969f278c28f86cf6fea777bacb13d568d3726b2a64aba209a4897651566b704f37c8c440d4968c48fcce737bbd167e4dce2e0ee1b39dbb4ec4e09a51d15d535a48d054d41baa96aaa2ef32a4c5d8c79dd542692622864af6bf40cc5b66b7e43e75d96dd29b1588d8aea4345355473a2e9237134261b543cac5d354d5725551dab02ccd8b1f9ec06b63baa9677540d0b06367983789a0de26442481fabb00e85f116b1214d26923079ee43dd1d41cd1c414560534b1aaf82261e89ba3c9260d82549d6b13a918c316f68729593084fc5eaeace2ad2b38a58540c49c6ba3822dbcbca58d5918826fa70280b3c3f164d69f8fca47730779cb9ff0d8dedb23f25c67659561f9b261e0d27863e54e9d1f1f144d73445d04763d918a9221ef226ff44c7b6e884db86fd0347bf9b4f5d34b5fca7744764ebfbc4a96e57db364e01eb489a98bc002b30c5108992d78620f7c78a3e1c618c8489ca0f15f9b95c1642b7814b7b8540a34107ff0c1c91ed74697ec882eaa2c80b4381d7745e221bc5d210648842f7a2a421a80758958f95e774e6d9d16d0454fb8cbea12dc6659f4aee312ecbebda5894244190745304a34e164157201e635d1919aa3046aaa929fc33195de45be8cef2be95815d76a7848f252aaa83dce60d118c3943225789ccc9040c7505e9c4bd224c7872910c77f73c9fcd3d4f49e227a26ca8baaaa8303b152cea48191bf06b889491604e2465fc4c86934504b382b9ee8e3fe3bb001695633ff010fc7a02031cb430c26b7ab879ccd700eb82cac3c88f64ddc4435597850918f03c2fea0258f18a6468631919cfee764a7cfbfdefc4950855240e04f08f198f64295189a6fcfcdcdc411139f3f509eb5205adc2008021319a883caf0f4d09d8d034241d1982aa0b02ac2425019ba6f05c748b69dd58014236f372d97773c088be8541ceedd8e6a1ce05d3f921af2a231039aaa92a30e0f250d726602a4ea4912a8db591c24ff8e764f97f2b3379d99992d63e9bbd481d8f54eac225a684ca83a12f0e118cada01aa0441489e79fe1d5d55034dd7d33e39aea57c553dd2194ae22c59cf0a2a2f36020e8f2481ec3d4350d1d1bb2441cf9922c8e9eed682fbed1d15ed41aedc59dce837da82141d385a12492ebcb1866b92ceb82a419c391a90e2763e179b96830a822f8e9598165a36f66b453fd2aedac4940c182de1c8f30127465648ed80199315226ba80f93116e491a488eaf31aed3b448215627b11a019ba0de6d36fc8ecded0c5d23c508440372445c66312e34bc658972545d5c7430de9d2782c9afc648c269af1bcd8e17eeec2b023eb6e1e00ea6f9625d675b3345bac43a2ab58d4301af1ba2893eb806369a26be248d287b2a68c8c91668ae673620de21ef1038ca7e81b32f8129d2a37ec09101d861823831c95140df8070b237d349411b906264e781e8b8a293ccf415e7c8b83bca83ec860e199086363888660d80ba62e2b9aa28f26e64447783831549ed7c4f17389df48a944ae39a1e7eb01ce1fe89c8e953c4699822257fc0ca4199aae280abde4a5e8c82011a78cd17038d14c3c1ca2e7b4031f6d267f3b3a3ca75b253676b240b05a13052c80d006453d01f30d8381cf9bbc2e98bc381425451963ed79edd89951d7be0d259ded55e91dbc180c0caaa19a0aaf805d3e04356d1209ae604597f9f158d626a2a118d2331de7c53739ce8b1ae30c9a7a8279494430ba63240abaac89a2ae2145d09168088a2861c5e49f4be8c729420eb211b97e6ce26f4774e7746bf348e700e91a89c6264f141d6bfc885c431d910b2daa2ec8a2c0f31312a3f9b938625c8bddb023ebc8007f6b235edcbb1297f20b61c116974720b8c12c933598ea43014cb89122eaaa34192b7828f163f1b94c75df0adcfbf9dcff56463cde9fcd631c2fad0bb0a0e62748d645b28a96e5b10186b9caeba68926fc10143746cfe5f4eb623a431e21ce743e0fdc3b1f3bdf90be2eecdce6f12e04d5357522898281743c56619d2d68aaaec9135ee7d5b12188bca909183deba33697989efcdc79ec8daaedbc46c49d7987bc20404fe654d0f90c3b57e46d40229e25e7d0c3b4faf4c98995eb7a53c402e9d273e15f165f596c59cf3e24d937fd1f0783c0b2f13e34d9f16953a668b6ef7a3783ffa5befafabfd4d7e4ef97f0ef02feeecf9c1b8ae2eb147d391446e16fcb39e4d74d914457f5a1a2c1da0596a6b220916061303746bc2aea24978c6ac8a3a1244bcf3a3e728591e5bfa991e515d06da68274553149e46b89d7c79389aac30a461c8e2471343484a7114e8815df733d18170e3b443fd0d15822b4023c3daa7981e16040a113a8aa869d5883a37cdc925c24752fe914222b1f67b41045a9589379d0d525cb866e94c96db4b9216526421e968af1ba37f4a57a1ab70a084b65ff2a87af6c48e232d84a07b98e238bc40793072cdf629ec83ff01d968273cfc7014952eaaf64070836909c34352a15de24fd257deb637bb21701d24f2c6229e83810af2b009ffc7a8d818f604d682cde13239796766dec21872802410418fa1e7e00d548de599aa032813fec93e59816e89d39b299e45bb639659884afe35230d913d65c21d5dc54b358b64f52aa59e8f1c12e5a573504d02e1a55f7b2dce01186b34214f19d35af5cb8e21db25785f0623b1ec35221c177dca65239051f87d72b24bb7cc40696ccd3ba1b51562debc8cea856eb6efa3267f25a857a30c8d806f4b5876de22171a20549f49c13ac4d5f85e6f4f0047b6005009a335255e5709511026c86f035a2a29175a37313dc1ef68e7ddf352cdaee1ac13375cbd413d5576e0b6058adcc68de9c4b3c89f5f10d4da5d3835271ca2ddf262a5c8d67341465466615712d67682a0625dbf6d8546acef31c9cd86db2ec51d6dc31aa78a9393346ed1c9c5d376ccb169221c9d6a3af5ad094e23924ab4ef7fcb3a2dba47d0ba7534bd33fbf2e7dd592a6635040beaae3a0c7e2146c81f2551194a26f1954640c723a5916b6d1d0ac485a7d56b0033abb19934a3769b73332e90e5768526ba3149e2c2839566cadb8dd11aa923ea7d571611597afbeb92221d993aa503eba6cb68301a8969ba6fd7188eaafdc98564625ca4c54657056c942b63f3a151393b43f3ccb06546f4e2b03b4cc4d536984a2fc3cbb18a16ab980b630425103aa37a79d118ad241951ca1521957b63b702d267d69753c4bb5abb5c6371dfd52a9864a32457e308c30ed609603aa980e99d16f127863cd7057b227f4fc46d46f5ad3c1cc8fce52c95afcfb5646ab252bb1dae83c7d0b912e20eeb647f10af14bdaa5faaa63a59bd00af52baf8ed22102b63818f5a211b43b2eb9ddadd3b056462b1dada2aced517cb07c3bc3d7f8247b6b83b8a6250d1bd9d88e28be07d1a649b9a501de89295971a8ffb466644c6f8769cf0b86bb4ad2efad9a24e51bf23cec12d69f9d8c40150c5b1886744fcb42371f1046d892a39277896edbc353ffe25ebbe394d78eba6d6b3a7279173b4b0e61e2aad4b6c7aec6bdac76072dd180caad693a4c894b7925c7e7efcb4eeedd5bd6fd2653a3d681cf5d68a11c05b3530512a3233b15589a8e154e5a3e1e2175e17148c90ebe594215725638ccf78804151f95a0626582963c7cf8881495766c2ec6d4d95e9885f95b99edf26392329af3cf7ab6c72cecf6945125e3b990b0e2f39ef539946d433b35a32db59d9eafd5944753f131689ab1a076b310af2c9a6b9337faf088c44dda543b25701561dd98c48fcac1493b6bf7442e2bb89b53597a3c2ac756ac3ba4700511de9cbaf2a3badcf6526e9b1dd9b9dbf6c16d74af3da2c36cc300ecc4d0780af46f68d36d6f0476b93e791203213ef181d8c97ae6498c84f4c4bcf8bb91465bf3ea173bec1fc3135f44e3dda8dcc721724321df2a997728d61f89d8e29323f64e44f723515bda39b5f33d28d13591224a47f75678652c1bbc26eabcaa918046a0d2c6a626eba62a888282447924083bf6a2d0a63d0b2fcace89dca6276523991fc7bf9aeb49791c42b7e54dd94c69f1497853764ce5163d2a9b292c3dde5e4159b296bbcfb8d5fd818ab7199fd7e9be5d8c439b27fc6a0dc63339e3979b8e7467a3542f0fea56c66b1d0d2ab5afcdcbc5cbc42c8d6f97ec6234b773d7a4d6687e13574eb2c9e37635947552d66d631cb3bdafdeb236463099cab0bae5910a8b563874b5c2a76dd712a9d3a4e76191e834b4fe67b46634c2123a28684912044937458930dbc4d0118f31080e4315c648353585dffa385469cc331981649c86a271a818c962abc350358cc573b1ccd31e95656886c241a916bc62c73e15dabaa7edba121f97d06df9543652fa31bd57319fcacee9dca25765338d9fc669c147e0e5f6bcdd9b89fc88aeabdd50b62d1d593190d0f3f25eed92c9dbf15fd51b8fe7e4c0ca5deeef66a0b6e3f4a83764dfb2d76327a3b90dbf47ada17cd68e8f44806b9a0d1079f7f94e8fe8a33e54540388a3e960df8f89a1c4c30a4bd37420993a5685113f1a9b5b0fec5dad39cf33b0b7339f62ecb1585da4a7f15c1af9435435d7467694d2756201bef10651f6243ecc10815452b14c482c62439a4c246183c156b55164acd2ada8d3aaa62396aab3e6a0d1c400b11c3b6bc6ad7c0a9e8dc34651212027d9e900661e893a680ba2502459c7ea4432c66018c8865166e84ab72b67e4286cddc6b53c8294fc15bd8e511aa2bc61ab9ba4686b167dcd063d79b39ef62bea5278dc37dbd7ed0e515e1be489286001f43946a309a0c2c0c3bcc9eb82c98b4351529431d6b635608534a9d1c6a68399536fbd3d6dcb47c5b32dfaa84b123f116543d55585040b54b0a823656cc0af215246823981d5cdd6e360576bcef38c831df6d18c78098cd9ed0e514e85a00a5453e1155d1a0f0193a929301540f9c8fc782c6b13d1006bbce5812aee76d586359e58996a6bd9f5694b2667e8ea997d5bb6f16b5a7dcf3dbf529ed9b279c82a987cbb1db62ae6de731fba00dff941e1127af5551fc1b2df9064ac8b23e20c57c6aa0ec27ea20f87b2c0839e37a5e1f6d7d015dbf33cc727b3fd914092374ad569bcabcd8f55d39efa51ffc721724bdbd2e5c8fc348efa3f22a15bd8962e49e9473feaff18546e6753ba24851f2f34c5ae69db789fae8ed67bbee7cc77363aadadcceb8fcf334c52156d58ed6c98da4b84547f9c9e5b2ea4950b6217c354d50bd3f610adeaafec7a69c35912d45cb9cd1d67ee17aedc965ff531ccf7d17062e843754882e58f27baa629823e1acbc608acf9216ff2db5fb9556bcf7358b9ad9e58ae7062644e5d6f766b1997d1070a783045330339300da371bcc5efd1ec84beea71c871dc8015ffc5f2adb14d93a38735d234e847531c60cf3f18b027f6057f09b0132cbbf8656a394792aaf10abf0f46d65018c9a321392a3c9279ed60403f476517e4613854455553f77959164682a4f2aaa0c1ff09d2c160112ffc658abe10c482ac41594595478a301445b09705714810c3e715627820884782b2cf8bda4801305919a92a98841a411c153e18c4db7fe0851438e281aad16ff6c9c4b0e477187d3c7f59953f8357c886b1f317cbb7f0fee12e38bab83cff8f93cbab4fbdd3ebcb2b6dc40db8ebf792f2e6dd8797a7fd0fdff7faaf8eaf4edf9e9ebf8d95e9f54f3f5c9dbe7f75760a6fe69e3bc3c8e1aeb1e741ed1ed4c35d469cc35d2d60513ee5841160c68e8fa73062bdfe7b003ebddc08fcc6030ea0b0bd5fabc28cf81a30420d18b1068c540346ae0133ac01a3568511799eaf01a3548711080d4ecfcede5d5c9dbf7bfda9f7f6f28a7007dfeb0fc99c93d4be38d2f64545154551e085fed9e987b7d73f7dfcf0eefa530fa482079c27fcfaeb92798f4f4e3e5e1e9ffceb13bf4f5e5f5cbe83f600560f63e7c1326e7b7dbe7ffce1edd929c360e21bf8022ff779419515491c890a1917490260d29cd38babb7bdbe2c2a1abc3839fff0cbe9e5d5bbf30f9f7ae184227c7ffdd33994bcf690e3df8394c2dc7bec192870bd5e0c057449250d3abe3c060842a03398bfc1dcc49c3b01b118cc3da08feb59379653be91b10a348d175215b8ce4d610da25aab0a3159c595816ccc4d9001bde55090edc7fe0838b67f75721cd54424f8828c5912af92c4fb06d940478c88e4bbe9f5159efc973ff6493cc33c3c8eeb05b71451291c304e30d6579f4e901760df424e5ffcb57ffccf77202b5f9e82f424cdea9f5fbe860a00b48021c3f244dad2ea4300b110e0e3d5f1dbd34f5727e7174402c3c839d4257fc3f973ef1e2ffa5ce0cedc1b0f11f5ca81429dc1b77d983bc797a7c7d051cbb19163727b1c68895bd7c31c79722713fa40cabd7a75fecf4f8ab6afc97d61b4cf6b7d15067bd497847d65946076891f02050e064491acd4cacc733fcb473f903f87f360cafdf0d575f0a1a4703f60db9ef987306f359efb21701f6e7c4d3ee4fbb1ffe37ea07afb10a01c573741631d0c18be157e506d967924f0122840f63bfe0d1e49b3c8a7c417348781358f48c37f6405c237ab22a03e0dcf9a51859aab0e0f06f122c91e6383bc4486e73a8be911f49b353cf97a0502a4b066be6b99d127da30951746a0eed3df566037381ad8898d6e8e2684690f06a9b791de1fe4287eda858c9100d6b363620f7825b06c4c2d8bc48bc88c9a8178f601f0c47502304aae0c90dbcc6e1b2c0d3766e0b1aebf774d6c87969d8d6f0027379f9928c0af3df4005c79ee99d47ef6e638b2e258b11bcf9dcf4213f05f605906c11fbf5b3e0eb800f96ec0bdc4a615d00c5388bb2773cff9bec7415b9c101767dc62e30e8379fa73f0e38f27ec6165e3b23a6c62bc675c56fb092f2818eab7eec31b4c84153e71e74e70d8e393559989aeec091b2aa72636348076308e0778d1244f744c63c593ed25b01cfd958ac254c7796bf9ef9c735044f7167ea0fdba5f19d583588307cb16af782bd6a6ea746d4ed68f8ef108842db9fd504c57be75ba3e27528e60a505a69aa44b86a0913bcbb28e6461acabc6c4d0c6d2509e803dbd03eac50eba3ce9e9bdf2b18c49144d98d3fa188c245d16c4b1ae8d60ed3f1415130bb03a9d0c87bb98cfb9c7179e340df30e2cc822c9d7ad00f709d4ad620afa58950db2f132245e5f51918447a0e6f3a2a46ecabc323486a0546492129d57808aa624eb43ac8c4d4334f81142bba062fc5cc6932660fc4806af499aa629308147822e1321a829634937f070248f8c31af8c77329f933eeba74dbdb85bd310c75831d5b16e0812c843a0973e92354d17b489a0888a2a9b82b033fb661908e6e9db8ad522d6b54abfe855ac5c9e6a26bfaf11f113b64ece8ac45ca397978dd425c1549036367583570c3008554327e1b0f5d164a22ac331c6437228af14213364cc23e266139b1c2d78c2b46b7012629754a487ba9e1119ab1c42db0d1df388273c39e2953b31b2758a3d756295bcbfb4753a6d4dd5b64bae6ae75db64eb5d59deda74db68ae74fb64fb76544ac274eb76a81b9b64937d747b66d4163a696af7f4664a5685147ad3f9f3b8e15607b8a9e3039cb345f9ff0bc806458bc610153f70118cf1351d21564e0b18115ac8866fb548ebbc4cf2cff8fdfe9e5a1a0badf3b8ee87ab5a8fae37f2aa0ca1d7b64dda16d79846a2c85d68d73d4545d9255539a8c059d47bc461ce530e68a3cd1150d09aa2cf2b04e2fbf10ca5d0a152c26f3a54e2208c093a7628d98043ba6e43361c7ea41027645c76d3b885a26648d9378bba224fa8c9c5b1cdc3d0bf118b555d79036163405e9a6aaa9baccab0a49eec5eba63291144321ce8fd12e67f53288cd3398d3d562eaec8a863bd874689992f5ee2f3f123d9f89c6a97fc178679a67abdb3a6deb9daab77f7746c5d8d1f7a74fc5aa27f1b740c59c6d8a620741269efcd3df01aa17da7efb3b6979317f9ef6e18cbae18776b42be9ace2ea3f07aeac16e27ffb3444be85ee2cefc9936fd94e1da6316f88a0780c899cc730271350df60b9132b5d98f0e4c80bdec94c7e76a7abcadda5db3ee5c89d008b84fad4ddf1677c17804936f6030fc1af274ecb352dd70595078a8e64ddc44358420a13d0e23c2fea02a8724532b4b18c8c9d9d35883b3fff4e566820b7973e54d6e3ca87879753300c8ff64c044614776a8cd144e4797d684a303ca621e9c810545d10c0cc92046c9ac24ec48669dd580142365b93d877f319f69ebaf0cd6db3ce0f79551901afaba6aa0045e5a1ae4d40a34da4912a8db591c24ff89d9901cf802397edd41152c72395ae408920567950fee210012105d50051a1483cbfeb635dcbe86ccfe87857b53c7e8f41cfc5f3a3e7e24ee741936948d074612889e4d81c064e95655d9034633832d5e1642cecd0c04fc6757f16667e9d20fd3ba3e71d22378db0bd08d00c5677f3e9f3d0e81b5a0feb0145c66372ff428685942c29aa3e1e6a4897c663d1e4276334d18c1d52f97eee7aee3db2eee624a6fd73a4f4ba1ee82a16358c46bc2ecae4a4d4589ae89a3892f4a1acc11a76a499a2b9336a27d3063c7ddad6c9fbb0734a2e9e1925416f990863638886601008262c6b493cdb8939d1111e4e0c95e735b1f429c76694242b2e72be063d9b956d5e93c9792a036986a62b8a424f0029b0662217118cd17038d160a13b443b739aa682733f03af69ad50eb3b735cc523323f0b0f56f590dabba7e5e2b9d112a4e604f39288808263240abaac89a2ae21458025a92128a2841593dfc9252d588538b03e266710a15bcf6196e7b458d7c8bd1879a2e858e347e4a4dd889c2451754116059e9f900bae3bb1f55d8b1db522d65b809f11518b1b0e6a5d1ec1dc0605246bc0a9430194d5481175559a8c153c94f8b1b8134e8505887b3f9ffbcf809af1a6ea02989afc04c9ba48ec4b591e1ba0ec555e374d34e187204531dac926e8623a83a53168c6e97c1eb8773e769e87f02c6cb7aea9134914c07cc763152c4f4153754d9ef03aaf8e0d41e44d4dc0e8519cff24ee1c098252e600f5a010cb35220bc03be405016ab88b700ec057818771f01ecd9ef87827daaa0f150d4c0eb0da644122b75c60a047bc2aea2452866ac8a3a1244b8f7299b43c49c3316b7aed204453fdde4192a0bc02c2c75490ae2a26b99d2bf1fa78325175b045c4e1481247434368ed8241f4220abff80ba07bed1a77ab808ccb37d2ebe89de5ecad6231ee319a2398fa9778e261fff6da9ad2701d5cb098910db265511a41929438773eb8813559bcc7be8f6ea04c8f63cdb8b091816f5d1b46e0dd34fc92823975c8d55b935610ab34f63aecaa651e1daf2246eaea509a0c31d8c6e210166cb2229b60cf99435d198e8763ac0a8a4c424a4521a10e4c44820dcd3d031f1d0c620feceb1d5e3cb89e7906526f49eb7b64cf4961f6372477a6e0012517e1d078eb601896af5f4471ae4a8570cc8fbf551437ab2868165f14316b43a0acf231b12a06c4da761cac78f02b36b2ef7180c8382f012d98c5c070164c14c217cb87e83b283df22e5e2af36a29f0917333077e3e22031dfe8cbe915902efe99fe53b2bb0e94bfa377acb5c100619f4e5cf650d96134e5a269b30f6a118fd13bdc38ee19a20e00871a39fd137c38b335601c3e5b35c31d3ad61bb42c65bc77ae598af3afb5565c08a2c58c084e4758cec619cda5804dd3cbe3cb0023cf5077159723e4386152c8e84508844cfac080845c72491d808a9570f2f4216b69ce0743201ba2c03b9e508f7785037fa229a3ba01e98f49fa22f34c42395cab7c8a70faf908f4d1aa9d7b2a1416f802469a9bd54157eb0b0f1090af08deb59d83fec1ddbf655f25da44f3ce407d8db912ee1a69613f64cc03ff05a2f355cb131a69183f7449e975485d7f6255954b591284b237ea84a43494dc6168ea20b6701405189bc3824410a1749001a42787d05ab18c35194e1f5f863318907a940c9344063412f058d2fe88ea6ecf38a004b2a551d69fc70c84b4a4147047544a27eaefe031dace5f7a10869bcf539cd25264075db6a650424cd0098ab872c80a4a6a87f45d3d9df26ae374501fd4959f3cbe22b7d987bf6e16d10ccfc1f07031241719fd8873e6d04cc987dd7bb19fc2ff5d5d7ffa5be267fbf847f17f0777fe6dc50145fa16f87c228fc6d39877cd60ac9b743f22d915c5b24618d240895b1479216c94615b10c2cfd8fb7579c267303eec2c773d3dd5b85bc4dc49666c5e2b1a5ffe17ab6c9bdc520ac02cb88c59296736249af29fc92c6dbb582ef632187d7157fab4a7ce9b29a2a952e2b084a79c4c25095cb17568762e9c2a2208dbe4f86528e889f09a42c2943a9742065719f6f3190b2240e5381942fdcd9dc461e070a658e98bfd675b26c1585595e573c37f0b2c08bf2530abcccb7117739151ff92984460e1bc3bdfc67b510c9510bb897ffaa172bf91f781cc543a6418fefe39cb18a90cc66cf18070fc0c11cd13cc3ffe7ff7b4521c2870fcb30c954db0dfb441df6d94ff8950c920cba221324391526790adcc8fd800ec3f9c7fd305efdb451a007fe210fbf5c47e7c98f2feccf82fdb93b14e26193917903e6b47ff87f9cb96d733f40b5a0128bc3292f2d74d2ce42233dfa986fa72f75e24683bd48195431e409b12a1bf3617865b2c0df85551f5fbb172d2f930bcc84f2e588cde0e7ad39abad3ad7af3ba39527b52a70905c802e97a0b90d4bac4ae3ebd26469cbe7c673cb0eb8f182439ce14ea734a83b1176641ec232820b6e51005f9cc0b3c6f3800523274b9000fec791967168ecce03ce7391e9f739a8c5b2e1af81267ffcdff0973c3ea005ac1e981ba5cf10cc8d5b6eea7a181e6112b8f7b040096e31f74066f67e76ed1cad9e93de4f78133a12afe800f63866ee91650431f07a9185f7f0f09063e0c192c6fa4ad71c6cd5f28f7ffce3c7b3771ffe4e5614537c4ddff5b818dfc363c2119a6a52de8a9eb09775731bf84764a945884afb4fe936f1dc29971c0ff22df9e68d3b774ca6195f9e9cecbdfad7ded5f1f7fbdcfff37f736b3b47312d47cdf57c206ad89038490d62a8519ee05e93269d0007c02071cb3763d2ea33568e7b79fe7a7cf63de93783cb623af130b4f51e2f111d07ac0564a17a750bb3e0d8b6ee70ac2b79d8d67841d27e9075666e67e876866e67e876866e67e8ae35749f92a9bbc9d85d6fee9634789b9abc758dde06666f65c3b7d0f44db9b473bca42b954a3cab5f2317eb17b2dfaab1df0bf89de7f0036b092c27876420f10f7b628f230e39ca7d3f1229da234e68c0c3d0a02f216ef405f0e5a24b585b29c7e1a070570806e11e4c6defe861ca788c3d459f1df775d2c8672f88cf8d1bc3d4fae0d2d09e731f5f79c607fa2d91d9e06090c4405ceccc09bf475de47b53e48011ef71c6dc2356ff2148cc099adb417ca33905135db10b0bc6ea2a40beaa3cecfd47cf8eef2d0133c4c7f85db8f2204e73b20b91785e15bbc453f73e2ab37a5815b8c2c8336ee94be0d8d8d3aac88567dda3807e8f7eaeb6bae3cd3a004b60e612358363cefc090e8c5bb2ffc17823fc913824f1059b97b052c249960d40bc83c1c8fe26969a8e490d49337986218d05d64c617b563b6e7372626646929f79819530eacfa95408170ee4f042a2caf02b1bd470d5b718b0c549b4daf8196c7ca2c438ea023eecfd42fe2439fe3c217a60de16b4e76066cdf01ee1823de020cbc1e65ed346937f8b5a9a8adc91805bd5bbae14c15b84dd706d9b89d0f5c428d3674a98e49e77421644cb7f349dd944152f19313c27f2d575a7d83c9f0797cb32206d6e5d129f07781ffbc1070c8b2a58ff7a548e91d31e51412aff1882774e09f84467b30d3d607b6a2ced133940e392be9fb8b6ebad56b03e54606322c40cf28194200768e86623156ac89edda257f09d1d9e19d35f42920f584574a942dd16c622399220ffdf4357a969980e1c634d4952cf0fae83c9ba6e6a05e9055928c4ff71ebdaf892569416ecabf91c1c1b204291b1383a05330da60e36e9fc5ebd4f8218f3e9dca6cbcf937970e63e00f9c04615c9bcc97c5803f991f83d0072a4a520d9877433cdd7f8fe0dcd9a772492e6c59e13da389f6ca0c612e31afb32a6eb7507fb3e5dc743312efa4165e30d9a4e111dd555c9740a9edb39301eb1e5e9e4b31ce0cf80f20c2dc9512eb1bee27387edf02e8b26be5e9219212acaeacd2b3a534159af5e5d2df3e50ae40af00db99649366597a23c2a4857630c7890c3de749eb0edeaf46c4a145f4ea8ab8078cc56cf6f2c9b7255ba4442702c9fd6eebd0fa2cdf36e2fbddb4b7f8e7be9650e7e767be9dd5e7ae762ec5c8c9d8bb17331767be9dd5e7ab797deeda5777be9dd5e7ab797de19ba9da1db19ba9da1dbeda5777be9dd5e7ab797deeda5777be9dd5e7ab797deeda5777be9dd5efaa3eca57b1899e78ebd686363fd1e13c6aab7b14e52bac37204daf1c15d3eb4b1dfce3ddc8d99b7ec83fb36c21bdfe0ad9418b5686fd71c53ddf19db330bee36e5d9804b60bad20bf3850dbc1a1022626b1dabcc3ef66f01216a9fe779cefdbd48630616d051de0eef0e2f03bcbfc8ec5e00103658abcc5dff1e2a3635121f91dff1d17201af086c6e50df3e1eeaff2d06e7b9337aaa8e9fe6e174ee311370b9ec6cec09a6d805c173b512f8937647144f80f963c3136a4ef5def0639d657148e71e23131c824fb3a2bb3fc19ff7eef5a341612fb9b480287be10677afca809618129b26c32eef46fc26e716997e99ff86237dda9544c9b42bf7dbb5ee862b7cb3a3708bfc607c2af738094f07b54f36fd4f06d3c0797c6d29fc1e7fb2e229745d661c1a71638e9d5634449ec596e6a18d62d578b96aca1ed92c1965db6d6f29570118b43978f22f599e33c6106c867d77262de06aaa85ee319b1611d03cc95414281e77fc15f6650052137883ddb8c7d79547f0a9a7f01f30d8c82335268f0f87e16613b7e16ca786f08e50993d3a7d3e588d07dcf7029b02c13bd005309c600660d189b6489b7b4f06190978591112e9d969f92d8a9ffe5757cb5f12db87acc39b249e444983798fc5df57969c113ab2f9dbb345143da1f72727e7c767a7572fa92fbeb6f7337f81bc908c57ef5b9effe6a077ffbf0f1ecece83beefba43cead0e6788db22386a7636c9ad8fc8765dee0c0076b61ee2c5d7416f919b6805fe7cfba471e9de21fe0c95f411333de2c03477d7feb002bf802a3951d03f0972bbd0b0f1b961fcd368f081dfc7a0e0b640326e907987c7e6af681d144fc1e649d94b096e8cae98488ed9b70fec6c46baaf65468dab083a158de8b56b32486ea191a63fb8c964a7adb41d763e285c2e6592c465cf8c94671af22c9bbb8b8f3adbb3b575faed7b84887c12aefb017a9b61e0b93face4c8169bc31913555d20591e40821c9834692c89368ed1a92d0881f9988ae99699b804569a30e7b9596b861e51f32ad5e610e7b5bab75444db1033140ea52abe6caab64215a25b349185b2ab317fbec4fbcf1ec0d513591a3e8d8f75dc30a43b8d22c825588a85ba69e204e654a018674da69d05e9778121b8550a141c9f8a02fdf262a4d4ed88839e346583e27b37a13332aa104e1e3722b81f8d162e58893c9277e17271565199b56c0645a38e7aec1243c859769ddc3d0652cd0b54a2f4f94bdf3dfc394b648d6c2488e8d5dd75eca4fe6511f6c42f3d1c73f0553bb0a8a3c211f2efc523d03d3604996a48500242e2039d134b589fe1a442b71f36d8be8c8b6dd079d6caee7128cc6e2de4872e2ca734ce4e93377369f354004d283f847f5f5fb5c0bf86feffdfb3dd3e47efae9c7e9f447dfdf8c9a8ec8f6105bbe9b42fef88c67bbb359c7791de7ed9ef3d26aad2e0f5e861af032d27bdb62c663c28cc7a619c6e1f79b28208a8bac269a208146472b7f23b46fea23a389035e2dd8f98006782ec37da866381226cceba5a559343522fb935a8877c8095068866243dc13b43d6124ee8982023fc57d3cdf3330d9e0b4f7847d031637f300efa329faea3ae8c1276f1ec764ad4a9577661135aa1bf355ebfeb0e6dc4691ad5a0af1c56a1555847fb9b62a81db4e4c8b34a64758086c6cf31549f40192bac9f42138c8d17a82e7d53c080a0443bed26b59e8878fb9cb8e03a03df2135e30fa26ec0671df2d97459663e22fe97307b9a599291d961736970f2da01040dc0c90515c21a8147700a7ba76103a23fc442a0afa2ade4b349bd98b73e7e3cc5cba34e3fecc413134eb757df8900af51164a8521615d9204ad286686cb26b6839097aadde124cfa6a85cf2738c571036230c6be9363968ef5db1c27dfc56a490c5eb9aa18c1b395f13995f1a9caf8aa9585a3b3a3da3243d9b85e2a3ed2431a6b4acc835dd8d4944020bb8a298e2c2ccfc6aa0a4448f02a2019aaa581e344c8e9f09aad2a145e6fc2c80852340ae7ce31fd40cd93de0972ee91bf14f3ffc587ffede5fc13fdf7df09d95550ddaa1dd4c4611a816385981aa0e789c01cf3dcd96bf701d48e0f965498928a674f890d9a045dedf9d449ee76b37731af14d362943cab545580f8c1320907ee092937780201e382462842b6688423c32735b185f9a9d810ad00850240c27d090ac7c639369cf1c969d27314607390514d78c4dd07f66e905edba55e5396cf4773e007ae87cd15d3c7376d01842c57b9c0b5b187c866acd03b62f606799f2968395630c87d6b902d07768a8a5f21487dc90324b9c76628b83d4a422d5f17557674f06f9f4e5e1f5f1f7ffa776eef7fef716cbffb476e1e4cf634f2e645afd77bf1f3db7757f41aa9cf19c8e16ed13de61077b1086e61164fe60e9bcef452ac458ad83636b9875becd0fbab943696ff82dcc7c4e6fe8b171f7d0c1fa0e40ad4e5906982880279c3d9ee8d6590570be82fab16804e9d20bc0f4b18935cc8a2b8230c16abab1736ea1df46ff9b1f7828ef6fe8b6307aaa06729012d59d3fa3fd2fed14ba7bfdd58fefec5e2e760ffe7d04cf4398bec8806dccfecf9c50b905fdc94b95474d29d97a685a0b97db677d1e7266cb1fdfd8f2ffe42367db8c3e8cd7eb407f4f2fb177fa127565d1bbe32f0fd09d86427b7966dbe0c6bea73bdf78b33cbc1d43bfdfd8b5f7f3dcab2432c0115a21ffcf98cb227e19dccbb3807b81eb4d79d0747642ad15f0cfbf27d46849ed2af6f62dc9cf335e3215e9ab5abddac8c915b8c236dead642526cfe16a08b099a6ca729f552670eb28ef1a850ba99e95d8b72e552ed2f0314522eb7281be9781f0e6c428473e7da9dadedd6aa58da4a4b77ac6cc954d7ca81859d2b284c8e05a67b73e0e1b98fcf901ffc123f749adbc964d14d1dad525a4f6f6a96050d3bbc06806ca3e5f5303c69446f82d04971b1dc1a5fc13e84bbfcb1e34fa9731a47ab93068c4aa9f30507d9a31df1734bd7d6ec889e31223fba43e4ad1e22ff8c9c5b1cdc59ba86b4b1a0294837554dd5655e5548d26f5e379589a4188aa9206dd4ec14797de762fad478d4e8ed1f1b8f6aeace8d77e7c6bb73e3ddb9f1eedc78776ebc3b37de9d1befce8d77e7c6e99169efdeddc649ec0e6d69b4dd71f43fef71f4e5427047e7d12bad96bb03e90507d22b51b13b91de9d48dfc589745036bb3d173ce8ce9976e74cbb73a6dd39d36fee9ce923e8f7eea0e9f60f9a520d59fea069d1c6b9f8a8e7466927ba639fa58f7d527a7507316b1ec4a4d4eb4e557e4ba72ae990762722bb1391dd89c8ee44e44e4f4426edaf560f338adb39cc485bbcfbc38cb54e28d2b63ed609c506870e69bb9fc2a1c35d9e21249deece103e953384be85ee2cef332cf37981374419eb8634c4ba6c4e26fa5882e53f59ea0b137ea28a067e2a6708a3466fff0c6154537786b03b43d89d21ecce10766708bb3384dd19c2ee0ce1733a43786fc15402e3d7d1a773301bfdee4ce1f6ce143a30065b384ed7a1edd07ec368bb63a07fa663a0cb45b5a3dfc1ef20c0f6224033741bcca768f36950ea0bc80375741b7db6744352643c36b13e9231d6654951f5f15043ba341e8b263f19a38966e41e10ade40a491c10ddd0a49c33a3ed74e2118e91ba60970247278fee6ce84d9973a54be29333255944faaa8a368e84e6f0ddda83a16b99f87eee02cb22eb6e1ec064afccc8f9e0211fa858d4301af1ba28cbbc2e8fa589ae8923491fca9a3232469a299a5b62e675cd2a66e8163af3c4987a5d8f2a33763e327d55551bcc5dc08f75195c5fb95b37b27455b66b957163edccb06755b44fe780feb2e59598ad4c2f0943e68c7259d8c67cba1aaffab297ca953a0c1a818e319a883caf0f4d4985be1a928e0c41d5054115b12480cd296c8d4d0b6569bd463e15b9996afd76d936cd011528d62a0b8763599191e99cafc2be0c809715455015511f09448f2213e99a2c69fa7024c94023c59c8ca56d1805456abf64835a6450e26a3f94f8a1ca562af45acbd5dc9b2003ff6753814bdfb39fdc4bb24efabe65e665342b4fb9760c5e327e75d8738a10c95c5b994b23385195787ec4abba6898635d16041e8c3e24eb188908230c6f4dbc0d660deb2fe2d96acd7b3ae640bcf15b11ad09ea5426556bbc1a0d5f1d96f5b10d8331afceb32bc0b1812606a80e5ec4264c4b71ac8f1451d0c7a389248d548517357e1b4c1b35a0886b2b36f089b16dd4faedf1ed923ed5a9d51ae72ec7b016ebcec9b67c1dd68d00c7635552cd09af1b136da8cb4363a46b43acc23f3c1e2b86c48b93d15658376c4021eb566be05363ddb0f55b64dd883ed5a9d51eeb46635891755d1fd936ac04e653cbd7c95ad2bbb75ccb092c7f3e771c2bc0f6b492995b0adf84e705246b8a8e052ceb323647fa78224aba0246e0d8c00a5644b365462fd3ae1cfe6fb13b4f675a94e9d456664b296ab646f236e65629b6d97a6002b2170743e9cd898cee2214ec3442c1bd6505019a030b384e47fe47c8df450efe041807f06f37048f3104016882007d4677ee6d80a0738ede0dc46389a2d469b02ea162975071d7d280dc8924d39fe435eb38b0e3c04730093acdb3eb305dabcdb24ef73fca0890256047f45da7adb67c442fe2929b4e771dfd774d7f725784d2ff6e7e8f3aa1f318c9b333475ebe89b886e5ccb62eace19f24ac6185c350edc535ac7554accdd0866b4e403dc1e8868f76d0ec4f17e330ab0452bbc49d0ae854c09f24b26dde0982f654408dd3156d2a80c28303df82f86fe3644627fa53e7a23ad1df89fe3f97e84f9e7b6c5bf4573a13dabee8cf39eef8ed88fe66e7493bd15feeec53a7113a8df067d10815ce4db6a728da3b81daa6fea87a2ef25b502bbb3fbdda29a1e48da24ed974cae64fb5fc48de166c79f551e91e65eb8b8f9c5b82dfccdaa3d11dcc4ee8c7ef1b7512bf93f87f12899f0e17b385ade672f7e6b6b2c9fccd6e2fd708bfd389f8c2c86b5ddad44ee0ff39ce17950f52d7b2dddf46a8bfd697031ba2163e13e5513a5060a7017203c876d2bf93fe7f2ae9bf21ee6eeb92bf59d4e22d48fdc2c0cbcf48e26f8c79dc49fb308a5d5d015f499e0f9e50aeef44e48ef249bfd34127aaa4ffcec64bc866002f822ebeea1fe2904ab53d754b3d84954bd49fbc5c1c022a65babd2c3d2c91533d7b9d3104563703b39b7861796d73f9cc25b21074b4193473ff29e203be541ef8ccdd9d08bc5c1af9d4a9ef0858ac00bc3c3718014ba580cb9d3c8970cae51bb4dc488c60956a845c010e4b01167939222c6ac9a6672de5088356bef32ba05122d36c52924559c9731295e70a35349bd98b73e7e3cc5ce6248a27241a14a3490bb9fa98f2845e7d6cc542b0515fd3899ceab72f29249b90ad09748e10ad8f8c09d5faf019215b1f5546e8362170560637c29612c92de05a4ae846b8ca09ece6cd5dcaef76c6a4219e22e9deb09f5961df9c70e571906c96490540ac6d92e214c6d34f26390ddf124cfa2a50209f6ffd3a6e40e2b1240bce1debb7394ebe8b559736964bd499d62a3baa364f05eda8ea627db53b92a794dbae7a9ed4843b1beabcaa849caa84545552d5aa7274ec8e3ac914f28e2acb68ef1dd59b51f53be3a0ac5d508ea3d2550b35aa4e1911bbeb73cae2d85dc5e5cc931d136269cb3c02d3edb2d2222b6997e4ce9a543b1eec162aa47eccb41d166b432c276e611b8b3c93248179ca902c044c1b585560f3aca42af0c5a64ec51ea4ec954a6d481a1dd5ba5fad7c8efaaf02ce747815888c22ae029cd1a6d54893558915e1537aad16f4523955842ea761ea3469a926ea52b3326491c0aedcfaacd4ad43802c545c12e648bd83d5c296a28aa5994741e059e3798049e6dda4a00c57bdc7f403dde4ed9d20075862b973f65f7cf8df5ece3fd17fff9d70ad1654b76a07dd2866fb531c2bc436a5ae82854d36b53d77f6da7d707a9cef7a01dd9f6749e7dd5496f90441edf934deb5e5bbbc68f26c7f8dd2a9c7dd5a2608685ac38365127db427a4922b2730a55541236479baa111c26265d1b4d329edd1ac954975d290840d11e4289c46f898066ad8a7ac62688a30a529da41b7541d4dd195d325ad347aa95c5a1ba2daa818582828578042c936642c97463dca98324de953a4539b8f6256c956c2497469425fc4b4564c39c5d71ba645c608d93ed1518964f1ee037b37489f0349bda60a3c1fcd811fb81e36572a3c0645ce6c9060d41c8c32f6901310f638626739c8fb4c410b66cb20f7ade1825141cf931df12b04a92f798013cbc63314dc1e25a196af8b2a3b3af8b74f27af8faf8f3ffd3bb7f7bff76095675acecd8fdc3c98ec69e4cd8b5eaff7e2e7b7efae3802e6730672b85b748f39c45d2c825bb0492673871927c12d0a388b1401d561720fb798bcc31410debf7067d8c1e6fe8b171f7d0c1fa0e40ad4e5906982a505d61367bb3796415e2da0bfac5a003a7502ec517c84cb3877c27047182c56572f6cd43be8dff263ef051dedfd17c70e5481a6339b348a9c73f47fa4fd9b78ee94fbedc6f2f72f163f07fb3f8747707cce9a920377dccfecf9c50bb0c6b8290b98ae93eebc342d04cdedb3944e7d6ec20e607effe38bbf903c9fdc61f4669f3ce2c05bbcfcfec55f80cb02cfb5e12b03df9f588e79726bd9e6cbb0a63ed77bbf3803e3808687fdfec5afbf1e65d96195b007eaa0649acf287b12dec9bc8b7380eb417bdd797044a612fdc5b02fdf670cc253faf54d8c9b73be66e2422f4fa370feadfb7086c6d8ce9c162ac6b1ee384c2d846b8e00d5c257742ca816b2f50763eaa22c3c2cd30c61ce019aba08ab1eaa69d4f09c83368d072b7ef8a62eb2cd0772ea777bdd219dd2582f0bf2a5efe45e1a17252fdb79c5ce34ea3849224832f75152a5e846749481af42494b84e405c9cc41ad9ba8e94cae5f830d4430456f752675b3c74c5d4f4f9c492dbc0c903c6c3ba6076cfda2f3c1c7b6fd2a2c31c89e3b4dd719b7c60ad821c73acb6a0ada2162b395cfe21041a4b9329d6fa35cb9f85cad0a1189e29270492953056825532b412d457b69a8ac3c28095a4e5297445624f1ca81675d3265e0328bb13240993557192066fe942db9f47a950148191da5400a3d4e65a0b3565349a8840f2e1786c99db86838a012f6dcb97667e5a5c50a26bd15969617654bc625467598486694864c4a8d6a602bb951116e29392ac065654769e072d2a334ba22f951164156829483ccc89072601929520e8cc991f2659792a41c484a9694042a9426e5e0b3f2a4345c42a214401d0cb222e4c0c3731f9f213fa09708cb4b9624dc26e952a5745cc2d4838ba44c25e8a4a4a90eba9236356063f9dc2bc166a54e250465736c574059247daa20c94aa0f2d01929541e342389ca83326954adfc522295074b49a50a808592a93c8eac74aa049b90506b2049faed3c917440d2b1bfc613683d4b027ee1b933ecc180c51cce0fcc3b196b057bf3288bf3d43e00dd322eb758a5abe6bdc841b9579ccd32f7a669129733dd833575046d390099bee09abd70793078485cb58c9e57ce5268d9bd851f567bda4727e7c767a75727a72f39361dfadc777fb583bf910bf347df71df1f0cb22011b2299a5d5bb3a38341f8e305ab139ea8f7387c8e1eb929fa7245527d5237c22df2e9c32b90c0e62fc09f63cbb68205b9aa1aba19d8dd76fa8080712ff104eabf25c94cd9d63cd9ce384101be713d6026ea0bb84abe8ba8778f0de2932099e7098a73e7831b5893c57be80ebaa137b86c7c831df3c24606be756d137befa6e197c8cd4daecf2e1f32a84e1d62f39be9c6c65f4f2d27ecbd807fe0b51ef77037bea6cdfbe0be8df02e496b994775f2e81c0c2c3331f3c21d96e8d2beb330c2dbfab60b8d21bf5ab981df5b5ebeefed67f21d1d0c622d891a07b81f5ccf3c03a018ffd2f9010c759f1021839cc20794a748afd28422f652f469b9d9e5c5858b3f0385816c18437f913cbff1701740ede4dff8db99e77e968fc84c207fe35f002f109c3f18b01fc94fd197d407e08f5b787530087fc4bf9113389ec56e88930b22aba7747b30dd084286e73a8b69d8b6e4bb84070eec8599ef5ae60a20f32a5e1e18fdc643b35bcb98c0843ca2f2ea60907a1b133bb914a5548959ac8c03de83ba26fc1003b7c2c81a203208032f1f562566c8236fe3e532af56a56de4dccc61fe1e1156087faebe129970443912070703fa14fb68053681637f63dee33139076510ee58fe8c5508464b72331663ff88ec5925f66db1c3762309f5a39fb1f3445e92170bb9b4884fd771ea5a5e5dc3adebf9b52cc7d6e1d9ea5c5b996f0b3997ead684c8c05f0260b484b593cfcea4a3343e06170d3139351645c4a07da69f97e59972fa0cf67bcc20a212ec359e81520234095b89d953795f8a8fe3810adea328f7a8d6dc9b2207e684c719738f4ca2c35e78282f7ebc2d051365d80e0bc62851807cb5e53aff02aa1d34070d1f126b5448b98f9e1d6b2a19a138e1a3a83bd4a7261c0c12cfab6297780acb97b0ccea6155e00a23cfb88d4ac49e564540c1dd83ed40a641f47315a122deac8300936d7464c318af143c2c9bbce00d3b53193e258e0e7266148e232a13bd007d0a630006021822608205ef8912a637071df34de1bd66c3984fe7f6f292a163266b9b585fb0f93aac81592021da84b10f852e4146e2a4e8218d87d9c6fe2614896352e96526a379a4b180000d49b43ad002cb08773a5b5aff31046bc343a532bccf914dacd1ac55bab4f688955060a6e76f2211b3579f5869e33a1da825fd06444441970e223b9101f84bbbf1c2c386e547e3e11136c5afe7339bc494c21fc88198d4f890635af7f884985f7ed87ad6f84c27d777317912298e35ae80c88b441496d82c4f756925a9a8e51c561b4a87bdc8e05e6e2a9ed152c905a3978c2b14970185e16052eb536a7522efde7d5e016f52bd987bd6b36eff67e47dc620fbfd67dd8b850d53c5bdbb43cfba1720b19be48f7b0a5da0e2183bcfbf0f13ebf9f7c1bf7fd67d201b03612e9867ce51b19e3c73be8af5e4997317db7078ee9c15f6e2997355d88b67ce5144e6da8b5bec406b9fb519821c046b23fdb99bb6b716f690776751fff5b3ee496a0ff219f724eb0a79c69d21a72cfe6cb15a63abf6f2915aa924291f9e35b6262d1f9535b6042c1f86355a71950fbeba5ce0940fbbba5c4f948fbdba34dfcb475c4d59cbe543afa68cd30a815793b66085b0ab31dbab42b4d598ad5321cc6accb6a8105f35a1cb2bc4504de8ce0af15353baaa4200d5fc6b3f6582a6165e402a172fb5b548a93191523f861f25787df098c8a98f242682ea23894452b330a1746e354431b11aa320b3ae4190d1a4486b0551b34ea5445e7d443109d81849b32ec5e463b3c15e8acb06bc1f979ef5d1a484e9130822dc6664e32a0189db8c531a13d33b8a0b46d9604775c514c08e6a8c698b1dd518a9961d46c7a4126e97f54dacddd647e4e6ae027126d5e1ee6bdd216d538a7647b5c6b4f26e6bdc216563fa7e87f364691cec4ad4c52d891dd599323bbee9f0ce8f16cdba95b8d22d47098d59465562f751deac0210b351aa80c50c8d2a6091b550359826159f958126560d2022c42a05df4c6ad09aa0559b9ad2655540630aa90658d586c65443d5a158caf74a1c1617d255005392764781699b45c4cd0b6bdbc5e86c14a33326771b8588a3fcd708434c3237c21313d58df044b2bb715c4a2a7a9a6399586d602182a959c4c2a4fc6f0b57e3dea53444235c3195d1069ec67d8b2995c61cb0d432cd26475ced34c294d2434f26c46dcbd1771b44ccad18b0b40bb4b9eb409bdb8ae578831d204a80cdb5111da3803b839c883b83827819833ab7d3076b2e51871aaabb2cfd5897a54deb06d800d9344802b2efe6308a48e787bcaa8c86aaae9aaaa2cba63cd4b58920e91369a44a636da4f013fe495c99ce6dfed62f4ee7d6da5d9feeae4f6feffaf4eb88e57c2020e242a6fbe377dbfee3779818de9d6b11358d60d54922ecec91a8276492381c6556d7721c121819cd10daefae627757b1bbabd8dd55ecee2a76db57b107dd1de7ee8e7377c7b9bbe3dcdd71eeee3877779cbb3bcedd1de7ee8e7377c7b9bbe3dcdd71eeee3877779cbb3bcedd1de7ee8e7377c7b9bbe3dcdd71eeee3877779cbb3bcedd1de7ee8e7377c7b9bbe3dcdd71eeee3877779cbb3bcedd1de7ee8e7377c7b9bbe3dcdd71eeee3877779cbb3bcedd1de7ee8e7377c7b9bbe3dcdd71eeee3877779cbb3bcedd1de7ee8eb3c7d14ef8f17bbf9b2f3a175d4af617d3b16bbb378bcbe8ca457881784f88dd1e7e0f169f7535f726c8c0ff0940d67466133ccbcbd642fc12f3856b2f6e5ca7ce05e608f3b14d6e5707b753fa3679c33a71c53b0278eda107cbb9f9892dc68582ebdcc9c2d7ae4d8b46afcfc84565fa26768f3a325853b7c54bdd0c2fbcf11d33c1c9a5bc9804f902551f49aac68bcabe20a83c3f1a892341d6648d970e06f4ebaaf0823c0e87aaa86ac2beac0db5212f49b2a64ac268240f0f068b64f12f4039825b90947d8d17444d1085a1c82bfc48552972f81c470e8f04f94894f75555144792321c29222f088aa610e4abe230ff121d3978b8f13539bf73800d2a9778d2564953794196e4829ef1fb822a0d154991545e54a16bb29cdf298a13b029d2501647402f51160b3a4470ca23e80e745d1678895787e9bee4349edc95a7376b755e56144155441d6ae175199948d76449d3872349e627aa624ec6d296eec6939bad874038954d88c4a42c73719eb41fc49749afced3a71ef7924cdbefb77d639e56d6f486fcc5e5f97f9c5c5e7dea9d5e5f5e69236ec05dbf979437ef3ebc3ced7ff8bed77f757c75faf6f4fc6dac4caf7ffae1eaf4fdabb353783327f21b39dc35f6402a80da4736b7947adcd5c20ff094134680193b3e9e02cd7afdf7007c7ab911f88d079da2b0bd5fabc28cf81a30420d18b1068c540346ae0133ac01a35685118918af0ea3548711080d4ecfcede5d5c9dbf7bfda9f7f6f28a7007dfeb0fa9fc55fbe248db17151043a2c00bfdb3d30f6faf7ffaf8e1ddf5a71e51a2c079c2afbf2e99f7f8e4e4e3e5f1c9bf3e81f082d71797efa03d80d5c3d879b08cdb5e9fef1f7f787b76ca3098f806bec0cb7d1e649d22810457c8b848120093e69c5e5cbdedf56551d1e0c5c9f9875f4e2fafde9d7ff8d40b2714e1fbeb9fcea1e435589efe3df67cccbdc79e8188028ea1802ea9a441c797c700410874063338989b98732760de077372c518b4e18de5946f64ac020d5445aa02d7b929ac41546b552126aba0aa9f03b10abde55090edc7fe0838b67f75721cd53407cb7641c62c895749e27d43eef273182c4d72ffb6af50bb227fec93788679781c5018b71451291c304e30d6579f4e901760df424e5ffcb57ffccf77202b5f9e82f424cdea9f5fbe860a00b48021c3f244dad2ea4300b110e0e3d5f1dbd34f5727e7174402c3c8391893dbc79c3ff7eef1a20fab9b5914d9000cbbd90cbeedc3dc39be3c3d868e5a8e8d1c93dbe36069740b4b258e3cb993097d20e55ebd3affe72745dbd7e4be30dae7b5be0a833dea4bc2be324a303b519bbffe5a1464e507f2e7701e4cb91fbeba0e3e9414ee076cdb33ff1066aec6733f042e350a0ef97eecffb81fc8b8fb8700e5b8ba095aab38580bb1340ae3b590c615876c211df89115d910bb2557315609e80214a81cd385360fccb85117dca5667097dc802c86eb048937f08e9a4e0783b80545dfbbde0d72acaf280c6192784c0cb8eb5b6199e5cff8f77bd732a86d47ffc6bf4cc03e86b579dc9e26bc3045964d16f8f46ffc8be7d22ed33f09f74baa538f1377a6b3243b4bb2b3243b4bb2b3243b4bb22d4b7217b6e4266b72bd3d59d2a26c6453d6b42a1bd895db0f9996675a100ff1d728e4e697e807730d9bd614d43ed9cd21370b394079d85b529cbaaf4300f4e56bf463913aab168bd095262f70bd6b66ae7216c6bb2a8a79c5fa9bc5968d7b95e3deed62c775b1e3bad8715562c77984633de0927b919bb830733cd092d12925ba0767e37b6cfb616f085d5d728c69bc8836f09861e8af76e7d8ae1810e5c6c6571445bc6f0c696a5d44df85bcccaf76dd6d1b086acf6e11ddfca2cdd3bd5bd6380344af1eb83a930074133aa52c808989c222fba47a5e70bcbc2074efd1ac972eb12a131ec9807f7b2582d6e543af5ab2b92ca9a3a826838c0cd55b593c0783f33c0d3828451226e580bec88751bf227b90f8cc22c74f96d30a066346bfc238d8ae71c7a65a73ca22dbba717413f9b73aa8336043a7a8f7fc66e2196846255f110acf9d3b66093434602269531122e56fe2dff8fdd4bf5510eb20ab756266e9741615d5237df931669855aa80202f42fbfefd6654f121d189758a83062393836d4b24c8aba9312d3cf4a0835900e6823e8b4e14d4a605b5305a605312f45b0799400e2214d04ee9b3ff1715a524beb50df35ddb2adb307aeaa9904afb5a15348d07b031ff6e95655be25202a0830605ce6fd0530098ea24aa3d0215af83a9d026ae2d11305b4f535a263152ebab353a506c3ba104aba9312d1e30bad39372d501c1e339d8f31b5065ee83f8a20a4b5fa76b85cd9898906887a2f986145b4eceb87b6a00dde5da2d83421026d009d8d242292e9c6f5b50e0955d520c9eea5f122e4da36234c0182950ca46830d64c9b31a2ab5b584a1b0b1d18526c0c6d6e7e8f932a3bad2e86bfa1ad7c50428a6be8ba198c65d16df5409d1abcbc24c036fa4565acd6e22529d51ad399055c62eaefd3695cdeab84abdd9a8d63676ac4061556b37d34a0d5a9eab882ab63da66236b67ead1e29861628745a5b54ea77ae82c86228e93f28b7ce6dea43a8e64568cb8fb0460196f4250c6207c5974e6eeaed491ca948fb840e3c3740a9188007bef595b99912b94296eeabf2e9100a462ab5cc9b239b1c8bcf1e8f5f9a399984069b521a9c9c1f9f9d5e9d9cbee4fefadbdc0dfe468ee0b35f7deebbbfdac1df3e7c3c3b3bfa8efb3e3d141dda6da1cd63f02423e0e9189b2636ff115ea93040d32f4d688bfcccb7729358ee91479de31fe0c95f4103687a119d0f47ef80ac034c77644daa0f40e798c49b4d7ceaab87f8ed97b9875fc54b65de25b644ce67881cea262efcc47354e88afa82c31b088bd716baf1d0f4329cba9cc99ed98d8e9f487628f2d8e39657a0a24c1c7117ef41882542ca51c9b0dc81591cf68e3d8c7adc18197737d4383b668e646a7185b7b004855cb2f81a5d2d49eb0a3fe7ea0a738c93fe39376c838068c231f2fec1502aab4b1aafb1e3c26f72a280f9ca4399764e0d1968894a6ec860ebe636089bc2d05224b12a0a5a476fdbd03b1c53ec04ef7170eb028dfef91345c8fa155e92794f36301c7cb5a6a7b7eec3f1178bdd5089eeb124da1fe6ed332d8f298b7047918ec1b967410bc21d8d8fb31e078370426cd9c3debf479754a206ac9a44ae5d4de753f292227319d330ef3276427af2bdc46ece6a38a30a26f43f0a121be1e42131d7095697a4b8d816f161ef0a393e77853d6bd21ff5f784bed25792946117b9535374c99ad135f77038c80f23d9f3142010f92aa5ffb25b20d134b7a9dbbdee0e4867c3b462c3b4b823528fce0d7745aaee8bf8bfcd91874b612ab335520d516b9eb0563743dade0ed9e586c876b644dade14a9bc2d3226bbd2653035df1869716ba4cee68838ac86a985d16c81a5b7ccc5ad316edd7d9276774a76b757b28ddd92b6f74b76b963b29d3d93eded9ad4dc372985abcd9d9362b3abd6ee49dc0bceec93f51b28c92d948d1b26ad6d99d4d834a9b76dd2fec64993ad937a9b273128a6ce376c9fd4dd40a9bc8592d84401fdbb6917a5c63e4ae99d9456f6522aeea654db4fa9b3a3d2f69e4afd5d957afb2aedefac34d95b69babb9281dfb8bfd2c60e4b15ff44d99573731f45552f457b7e8ab52ab3b4af22bbe392b7e742434ce5f8a20e0629bfeaca9dbcd689bb2c16bea787caaf7040ee01f9dc2cf252524709918d4bbf65983b4ad07a9c3b061e37c2f83984ef99af95b8266d16fe66e65924fa0e73c27e7d1725628a5f9ecd25cc26dea9cf336579a5398f647983de5a48fbf6077903b0dd24df83b5f9b84b6db6fd7ce3bf0d9bf216cd28da5ec9d142b6ed3e6013c0fc57f3c964b58c33dd39b9e05a680117a209e33e4578c6ae6b2fb1d03b3ca531d14128c74a79c39b25e62e739bc77763b18de2ce1eebc60a1022f3d8d1917d370726447a18b827ba49f377128135ba6043dce380f39d5904cc0f7955190d555d355545974d79a86b1341d227d24895c6da48e127b1db0624993cc117c60e2a15fb286cc287e21ec46e339821fa268d2502fb8a5e46023ccd022c6d8ca1c4363a69605850da017bdc677f72fbc03e91ed8d286ef8b1efbb864587b9c7596615d2ea96a9e753aa3efd00676a13876cb45ce2496c90deac420cc73863f936bff6e49e69c4d9c5cccec8f0f772cc5d851d5b63e670e26598b70aba1699b55934b090935721c112bc4cdfb39f6184b016599895ae04d39845d9d8d561491b7db6cacadc150042ea78a4f2aa3e9254a4cb2a6fe8481c229889826a4886a6483cdf366b928a8bd8b342a39e8a3c5db6bb75199a1ad7d2b4698d11e948d5614647c724600a8de76cd9a8125fa661c792391e6124e8cac81ce9b2ac1afa1829135dc0fc180bf2485244b56d164db5a1885beb35f549316eaa0bdbe1e15c76a843bcd6383b3dc01599dcb5eef0dcbf47d6dd3c08b0e5cfe72698145544f01a0c2a924713d118020d3441978702d2d10828ad4a93b18287123f262ec8d618beb825396cdfb8d94f85f98b3bd2fa145843b386e46c633aac19feaa93c287a52e507a3eb57cfd3334d7bbb75ccb09084ec70903fb979d1e65704d785e40b2a6e858c0b22e63101be38928e90a989663032b5811cd36274a8936e54d99f6baf20893a7c0f02ed3a9f62752194ab646ee5626571996593bcdc89b7c3fcc417116fbe8632c6704d0d99b935c28461c20f4b67e701d9cec2b8948cf0e3887aea36bfc2538859769df5b321341fdabfeef7cba3064271ccb3adab2683efaf8a7606a574151141c21db3316bd9f9125195803685d40fb7bcb0a0234071620492d3af2ef98fc2c46668089e3bb1b8247198200b440803ea33bf73640d4f5d60dc46389a25470a29a03f01a0598e4aad8d600d01d139de4b6cc255ee0cd7199702fe46e0af2f4993b9bcf1a2002d389e433d149b2175478ee6b01ffedbd7fbf679adc4f3ffd389dfee89788e74347677b882ddf4d217f02d22099dfa9e3c08e03776e12749a67c72467abc84eeb3f8ed6f7b005323798dbaede09dd4ee83e0a17de2eeed19dbf985a3ed97aefb8b0e3c2c751fd056740ea32e365e8ad5bc6c3df16571e13ae3c36cd37ecdebddf80a5282a12fca0899a833647217e8dd09f5b1f19cd83fd6a41431a34c17319263e6c8623e16d7dbdf4b8174d91c80f4f6d9c3be4042874c76343dc13b43d6124ee8982023fc57d3cdf3380681eb2f7847dc39dcee601de4753f4d575d0834fde3ceae9afaac4795778a9adc139b9aa8df8b0e674eec6035fa56ab858ed551555b4dcc12a81db4ecc9734a6c73f65b7b10b57b7eec31b90ec4da619c1713ec30ec1f36a1e040502245fa26d5d49acdb12ef3445a729fe149a62e30989f6d445d353256dea8c72e7219ebbe2d8ee99944e85c4ce4f7e1b1aa3e4a0742ae3cfac32d247a1dbd310150f87b7a910724f423f77f9dfe4687927ddcb9debea960a9ddcffe6e47ef3f3a02d2e1b5a3b59dbea02a2e299cf67bf94d8f9a9dc660aa89c407bc2fa871ce7edb6d11f694997b919d6adee3a2dff275adde5df176c79a157eb5e65eb6bbe357704bf89e55fabb732ffec8bc2bbf93dea4eb7edfe749b0bb2ccf7914b0eb7d977f3ee585177ace85199d07667b38e0b3b2edc3d179244ed818503b753458fba42ac4df84a041fb4d489f0313faa1cb22de4271266d137cbac2461b293c4fd622b8ac238d80496be1a1b420a9b21f36e7586d0e266e8e20b89210ea954db5377e94258b944fdc92b5021a052a6dbcbd2c3cda513972e4230b54ccf32f70542606d3370ce31ef107854a67b45a77323cee04b2159777a2bc2548ac9e29bf811a058ae09a5f687229c25f88df9fc2200b97ceb33feaa0847097e8b1449045282e9b2f67804ac56030eeda808ba04ef65f45f043b2a4fad95188947c21ca4e4e0411847332e18c357b92211cd66f6e2dcf93833c1bc6329ac96c90393713fd368d222b23ea63c91591f5bb1086dd4d794486dd0bea4886d42b626d00911dc843219915c1f598e886e429e2291dd08e73a09de08714ca0376b6029f95ebf0a26ee9b773523fd1bf07228551bb0714637b4832b5415f59165344773c297c77130486b1362f8fb81077235a161566f09267d155589cf37c41d37200bfd64c1b963fd36c7c977b1ead2767b893ad32a6a47d5e6e9b31d555dacfc7647f294a6dc55cf936a7567439d579590539590aa4aaa5a554261ef6c3433da7d4735e798023b1bd222bb61770d586764ecae15318b64875d2f65be946b4f7ace8955dbc36c9d1d533c6318eda8fec8c2d8956cc9985c8f5071689feda8e68c31b763ce6aa142eacc4d5b80b1369c2e0dc962fbb0c83d4b925da74cd842c0b469570536cf3eab025f6c6455ec41ca52aad486a4b953adfbd5ca270c8f6a3dcc580f55c0734c806add2cd2e315b1ac53c61551c5346ad54694528b559032dd56a703190555899b42d157899132aaa22e7428efab806784761d9265a1e2823447681eac56e414d52a73d5010a02cf1acf038c8c202567c3e5fa31fd408fd6f54e90738ffce5f6e37ff1e17f7b39ff44fffd77c2c15c50ddaa1df4781edbe3e35821b6b17745325692fc9aeeecb5fbe0f438dff5027a2a92654b83a7d3b8df2141507b3e759289d1d8bbbcb8c16c8f92d2a9c7dd5a26cc4f5a03cded77d8db1352f9ab1298d29aa411b23cd5d20861b1ae69dae994f269d6caa4366a48c2860812faaa2195320aac11be1c8dd69054452aae29da753aaf29ee98126cdccc525ab1950693de831ef8dc1ebe94126d849529f366d326546fcd664c4653b7862e54dd8df06574794d6c0c2c54882b40a1220f54ac9f980c09b51853ce311d1c5f9599166922b269f2e8449a44f781bd1ba48f0ca55e533b251fcd811fb81e3657964a0c8a1cef21a7d0b8c0b54122b174aa47ecd80f799f2968c1741de4be35484e4f7a59e1885f21487dc9039c58369ea1e0f62809b57c5d54d9d1c1bf7d3a797d7c7dfce9dfb9bdffbd076b61d3726e7ee4e6c1644f236f5ef47abd173fbf7d77c511309f3390c3dda27bcc21ee6211dc82e935993bcc060b6e51c059a408e811937bb8c5e41da680f0fe853bc30e36f75fbcf8e863f8002557a02e874c130c4a301239dbbdb10cf26a01fd65d502d0a913608fe2238cc5b913863bc260b1ba7a61a3de41ff961f7b2fe868efbf3876a00a349dd9a451e40ca6ff23eddfc473a7dc6f3796bf7fb1f839d8ff393cade573d694dce6e07e66cf2f5e80d1c94dd949499d74e7a56921686e9fe527e9731376bbe7fb1f5ffc85a4c1e30ea337fb5162d097dfbff80b7059e0b9367c65e0fb13cb314f6e2ddb7c19d6d4e77aef1767a0e8e809c0ef5ffcfaeb51961d561928a00e4aa6f98cb227e19dccbb3807b81eb4d79d0747642ad15f0cfbf27dc6ee3da55fdfc4b839fbf504ba45ec362f9cfad7f47e2a877c3c455406f80188811bcf9dcf5eb9f46c1a770f76d9d8b2ad6091b08e73df87f95f43970d110e27ee3ccc5dbccca04aa75e5c186d68e3d5e28fff09fef89d637a8a038b02ac63daee784b851db43487da85a14c56a7a092f806e511e61f4bab8d2e7d30aa7ebb32879d6aa32a71f6aa05dc4b5329c4ba27acc31a53632986acc2b5177ffc6eddfff1fbe2cec74f8c4fd71d3cab4decb507d2ea632d3e3b5a1b67d199d2da08d79de46cd0f3e2b3a55be7dd33cbffe3f7272a62cb1d596d2234369eacad8d7ccdb9cbad8fe9dfe3cae4698de99a13ea4d2447fe89f946ea337b74bfbe18da7cb4be214f942a53866ba67ffcfec7ef1ee832ffb14dc3cb9c04ba53301ad0c2d74555e2f911afeaa2618e755910785d1391ac6324228c30bc3571dd5cd55c946b6e97753ad3a8bb24cd23c9af482994199204f5c85accc057e18a822c062ec8d5334af6a8136cfd720d6b7d82387aabb3d5457ae6b2b77ae2a2ce9a2b4cc99b47637af3d82fba56766cdbafc212994b3a79f5ae9d0197d9ac9b6d4d007feefa209b9e24fb476dd3c7635552cd09af1b136da8cb4363a46b43acc23f3c1e2b86c48b93515bfcbf9b4ad74d80d59074ecbf45f63f8f79b4f7b8cf88cb77693feeb4785327e2dcea4651a19a6d4f7e60dbf59faafc08dba6a3b1812686a4eabc884d9896e2581f29a2a08f4713491aa90a2f6a7c6bf2632795ae951fcb21e9e4c7b6d5a7c3ddcda72e82e948173f4f7116387aa2893a9226262fa892ae1822d16ba0dc46d258011ec3180913951f2a725b9361a775af9b13cb7182d548372f1acc8b4c8937e92d26c2c6e5f33f451069fd94ced557ae5c9183a32474ccc75d0522e3e1ad06bc74e196045be7262a8ba2941d510e59d6c551062eb101500a20f42b95299b71469501627b08654b2edd256500527ed95220853e9432d059e77249a88463a91c4cc6995b0a2ce3a8af0a157ae273c1982c8c0ba203aa0cce9d6b77565e36ad60d227c1d3d2a96cc922f9541a3e26a1aac164645455f0a5942a0db84e4e9547524a529545979555e52013d2aa2448287aca95ce48ac72604c66952fbb945ae5405272ab2450a1e42a079f955da5e112d2ab2c54467e9504cc48b0ea70a10c2b003c186485d68107530a9f213fa0c14ecbcbb224dc267956a574914cab842326d7aac365645b1d144bf95609789d8cab86a8949cab82322bebca4327e45d05b050789587c8c8bdf2a04cf6552bbf947fe5c15232b00260a11c2c8f232b0b2bc126e46115c88c4cac009c918bf56043d9b806f860902f0c0f4c14a0d778023437a9fff4c2734124019bc54e4d3eb02376ab17b0fabfb7f0c3ca217374727e7c767a7572fa9263bcd6e7befbab1dfc8d44be3efa8efbfe60900589904dd1ecda9a1d1d0cc21f2f587be1899ed40b9fa347a600fca50748e871b7c8bf2211165f211f9bbf2cdd45248c5ce89898409db7e7ce0737b0268bf7503fbaa1b18c40ec8f817e378b651c628a889d0c7ab81b5f33470409be7735f726c8c0ff0940d67466133ce84b581a0a4767060f7b17aebdb821617653d5c67d5608f8f3927d8ebf8e301fdb372e88e7db297dcb9c1bf7d820ee136ebaac3506f0da430f9673f313bb1729242a20c131f30a5fbbcca313bd3e73012d7d33b59ca863d1d51bd21b16ee9ba122076e4f5080493bb14f5d2d57c977a0a9f10d76cc0b1ba876ebda26f6de4d19d96397890210bc31fefe02551f49aac68bdabe20c88a369478419387b23852858301fdbc2abd208fc3a12aaa9abc2f6bf248d6345190868a2649a2763058248b7f01d211e48224ee0bea50d3144911245ed1445521b8e16b1c373c12dc2351d81764511e0dd5a1a88e54511aca32c1bd2a0e2ba844470e1e6e7c4dceef9c28ef6b3cb45114461acf4bb23c92c4828ef1d04a6908cd85ce8cc491ac0a057da2382549d0c411f44885b27c5187084ea8525386ca4855144d25b527fb92d3f803cb3c6211d7dd5b13ebc3f158934d89d745ded074194b8a8e0445d305d1d0c6a22148ca18b05a6642c68407a2a300eecec20823b7db84efc8af32d1d87dcf320f257ea8b2599198999b43b5f762b9587afbbd55977adc4b3281414cc59a1ab51e2a7f703df30c0c8e183da98f1184d67d429a0e720a1f50b945ba1d2322b157a3b7cb73eb5efc28bc3f8396221ba488bf48de387bb80b8e2e2ecfffe3e4f2ea53eff4faf24a1b7103eefabda4bc79f7e1e569ffc3f7bdfeabe3abd3b7a7e76f63657afdd30f57a7ef5f9d9dc29b3911f3c8e1aeb1074222f0a0266e2904b9ab851fe029073c3ae2b0e3e32950afd77f0fc0a7971b81df78e4d03781edfd5a1566c4d780116ac0883560a41a30720d98610d18b52a8c48a47a7518a53a8c4068707a76f6eee2eafcddeb4fbdb79757843bf85e7f48a5b1da1747dabea8a8a2280abcd03f3bfdf0f6faa78f1fde5d7f2226af079c27fcfaeb92798f4f4e3e5e1e9ffceb13c832787d71f90eda03583d8c9d07cbb8edf5f9fef187b767a70c83896fe00bbcdce741f429120874858c8b24013069cee9c5d5db5e5f16150d5e9c9c7ff8e5f4f2eaddf9874fbd704211bebffee91c4a5e7bc8f1efb1e763ee3df60c44f4710c057449250d3abe3c060842a03344d61326bd01e190bb05401f508e379653be91b10a34d01ca90a5ce7a6b00651ad558598ac825a021c0858e82d87826c3ff647c0b1fdab93e3a8a639acc01664cc92789524de3724e03087c11e255b367d859a19f9639fc433ccc3e380eab8a5884ae1807182b1befa7482bc00fb1672fae2affde37fbe0359f9f214a4276956fffcf2355400a0050c199627d296561f028885001faf8edf9e7eba3a39bf20121846cec1986c5871fedcbbc78b3e17b833f7c643b35bcb003b6f36836ffb30778e2f4f8fa1a3966323c7e4f638d7f16f5d0f73e4c99d4ce80329f7ead5f93f3f29dabe26f785d13eaff55518ec515f12f6955182d98902fdf55750f5774142b1cc3cf7b37cf403f973380fa6dc0f5f5d071f4a0af703b6ed997f083357e3b91f0297da08877c3ff67fdc0f64dcfd4380725cdd04ad456c7e822f5e03a838b00b045ee20f06ec77f22bbc208d231f53dfc0a2bd8557a4033fb222e19b7821729bddb358c4ea5cc54842c7ad8aa4fb8ee915246478aeb3981e0105581792af1301a96ddb9af9ae65461f69f3545e18814d98fe1607046b231ce809ac528e68f4ed8341ea6d6ca731d718a0248c39bb98ddf21e0788583131702b4c1e048b2962972d1f562566c8236fe3e532af56a5810f6fe660cb1f112b26fcb9fa4a2cb3236a47e1e060409f621fadc02670ec6fecfcc098041d30026622814ef1c9d9733b58dcfff13b474c2c0f7d86f539187216470da83ef7d975ee10fd06a44630619073f7c7ef8b20f8e37f008614f4d01db49eeea8235825daf38060766f3f43e35efc3db4c50206ee3a1403f1af9017c407016df84ce22058e4c0d374ee06ee3ef70bb661e11d04004b1145fe2c681af1cad00a6ce24c58c06ad7617795568734c1a826b8b0b5771fc3932e1f9d6923a5d1fd1c5ab70fdc1e112811de2148bc8177d4a03c18c4ed4afadef56e90637d655bd80783c463621a90aa5999e5cff87768b441cd5efa37fe65028b8883c124bee82033648a2c9b5c88a37fe35f3c973202fd93b84b9aead401715726ef8362ec93aa70e2ea28d81cf44224a92cfa19a39597b4a10badebcebeeeecebcebeeeecebcebeeeeceb96edeb5d58d89b6cecf55676493bbb91a55dd3d66e606d57b6b70b2d6e6aa024bc74692fefcab4206ef4afd45b0e3fbe443f98ffdcb4a6a0f649680a7ab90d501ef69614a73efe10007df91afd58a4368388318d49cc0364a7c90b5cef9a99a39360047b015847ec6ffa2b764c6a39a5077a90c506d67ba6e28c0f7c50b41e21a34f933c72919946b604a2b48e940be8e76579b6f3f1d9b5e2813ca8f7f4359e4183014d62b78aed68e57d290e5e06d2608fa2dca35b1b7b53e4c0a2c6e38cb947564187bd3084593c18580a26cad015168cedbc15205f456e987fb16c0b790b9a0333d6a890721f3d3bd654c2aa710e8c32c3d2135cc2c120f1bc2a7689a7ee7d5466f5b02a70859167dc4625624fab22179e054b1c1aef24fab9ca89146fd69233618c63db5b84f1deb00874e153f2a8b71925808aca442f3e82e03becc1f4e9c162696a05efc9e6000d10ef986f0a736118c67c3ab797b1e41d3359dbc4fa82cdd7610d6c968568133bae50e81216b9c9c54ee15cca9b472461541a4b760ec1021e38d6032eb917d9316b0fb46414948e6e54da18968d7ed81b42579744ad1b2fa25d4e6618faab2d4cb67568849b725fb17945f1006d82c08b9dcd463730f76ea0d8cbefeadf6b649b4315f78900fabb3ef71df2a03ed20c7860097223ac5153c831111dddb18fdf2782f22df71c93a18dd8eb4548bb90460e0df34793ed4567de97e7c5d3b191d208842204299109e822946afaba6e84747d4d62e39a921f85b55fd7838e86f5fa20edb40fc97447ad7542aede098daf5795d2bcaa761a32acde1041aa495fb585ba5a6a8a56a3294a4d128faad7250ea57a750995e4de126b429c1e306429171a7d179a3dfc2a681cc9948aecd92d5a5d18d2bd5ba6c70cb0d2f5c0d599b198132082d83b646d43ce23e9b3e559a4e639349d35b9cb37a7ce5cb56473595247514d0651e22cd059e95c9ba548c20c62a02ff2c140b822677af01b3a143876526a46bfc238d8ae71c7acb2e6941d532b44a7b10175b07575b24cd5a915524406e9cb8fb1856d89fcb9ae4dce3ee523d3a4be004b7251d2faa2a26c46465712c4102f42382666d6663cc435800b53e596ea1743b125a285c809e22294efdf9740330fc86e88be760c24a5cffebfd4084428d78e82efda96591e1765bfc2c1d81787155135a65b9dcee58b00b6669e71f7191ee0eed64fbf4121a2d4a42188d8001783b069414aae665071e9a879e12c1954e952feb4284601c31103a303b7a6be38ab52b004831703b2318b436ca40161bb380063d2cd1dc9326299661535a7a44e2d27fb9bead56a9ab52dddba666a95d4af83d861e4a58f905a40c54691d019459d51f438469120f17d5184fff16267157556516715953224d2b3a6338b3ab3a8338b5a378b3a675167173d925d244a6a5fe095be30543bbba8b38b3abba89425919e359d5dd4d9459d5dd4b65d2476665167163d92bb489560d10bff933baba8b38a3aaba89cb72839693aa3a8338a3aa3a86da348ea8ca2ce287a1ca36834a4e25d913a9ba8b3893a9ba89419919c339d49d499449d49d4b6492477265167123dd2f699a0f4059eef8b42b77dd619459d515472fb2c356b3ab3a8338b3ab3a86db348e9cca2ce2c7a244f1139323aea0b6277d8bab38a3aaba8a4ab2839693aa3a8338a3aa3a86da368d819459d51f448be2291ef0b8ad0973aa3a8338a3aa3a8a4ab2839693aa3a8338a3aa3a86da348ed8ca2ce287aacfb67625f55fbc3ee4c516713753651d9db67f139d399449d49d499446d9b445a67127526d1e3dd3da38157c8ff3aa3a8338a3aa3a8e4e5b3f8ace9cca2ce2ceacca2b6cda25167167566d1e3984543a5af097d511c764651671475465129332239673a93a833893a93a8a94914bd49a403a199ddf636594f5d9cc7ce7a7a2ca79220f70545e90b82d0d94f9dfdd4d94fe59c4aa959d359509d05d559502d5850f9f6d281e7063401673c019b6f7d65293c07f15cbacbd4a0b10cb8636c93ecd6acdb3ed5eef1bc98c0f424f7b7cf01321b78e73abf1ccdd6fa250893d84e5c272004bcc30041ad829987ef2dfcf0eaeec6334fc85c38ecc114e9c7fed7a350ff0089733543064de84b2c3f407a4e9e83053533a6733bb008fffe84ad9bdb20b4039de0efd873284cf87c05fd67f95e2f409e04ece51b34b56cc0f3fe8abbbac5b6cdbdb66f3831ac38c4a78495868d54f83efbff650bdf05c8b60cda38f27806f4c15ebcc9e4ed474269d24c669aa29945a0beae92c4d27e791658aae1bb5b925a15201135716df7e1a760cad28d5a7e3ce32ca980e4aafd4059964cceb98fafe6639f24b10f5832687e45039867840c572c9b6b5a1c12be37afc8901df62ef1cddc46a085c1a473cc656e5c1bdfc0239b0d87bd63b4424d43b0a7187942281ccf961ce78df17c32014392fdf90f1896b06641d47ae1dbcd4d66e55e7be881368f3d2e398a8c53f43f258ef4234d7a4e65207bf9c125362ce517f622ce65eccdab042156b84891dc0e4e917fc7917f121c0bcf0c8a670fa7b164c6d1c7f57d26a5d8bc0b1fd2c423efa2b4bc34fdb34f123346c8577d4fb77a8c0c9890eedc3139ff16cdf025322deb9f2c57307d768315cbd237afa845f00fa23b12d38b7e2495c5a03373308d218d361c46e8523ffa1f1d465a24d6e7a11c8125468855facb5b18584c734393e773aab7e37d227dcc366bc951f46949ed188ef563b4ecf1bfd270ff4ad5fdaf2c7d93d56d668815b2928d4a56101b8212f071668e752b4b4232a10a647b368d7c7c853f45de1d4cad30ab34d344ec5dfde57e35e3a4ac79d2dc40a96aa2b467a4149b29a50d952277c0fb70b02a3a04ead31d3937c50b20be1c25412b6f5825fe36471e2e896c7dbc1b922791ef0f0b8fa66411aeec011d39063ce93336d50a3c15e5b0d6f74f54e37dc3f20cbb24e96af93ab6eeef68d1e7b125bf47dbbe8fbafe8f1ab8b6394a0d1d2d39ce16d2447d8a835bd72cc2655a5014d601253182462e9415e5516c918a147d1bc4bb276ac46826c48ad556dc1d42bd144c2f0cd6960cc53af54a2d55c07a9094005fe3d04a3ac268c92249be1eb694432c0111ca5c024245f3fad29b5c682db9d12abbd21ab9d3eab9d472f868834f6d2371d609bb72342ae1a54bc02d251075d6c545d606d66600442255ee669e102ad5bb9578293381f265483e64058bbfbcedd986d55fddee6fd3f2df20442b58ff595765d119b8ec3a8f6ce0265779cdb674bb35de0ed778b5b67ceb537d2b5bbf55d76d292fc6ce9758ddd2a8c0504c7908db5b1d39ee632f8dd611f1a258f3b5b1455cdad86eba559cb440d2fb4025adebea16f2b3b07933deef8a662f70f0f66dded0ed5bc750ddb8a5dcd9714fcd8e3b18ac368a525ffc5b64ba0f1cfb53729f6459f2aded8e911d6d2c90d7d15603bf3f1c25ff1b26415f5b7e1007a42f8fc9ea9fe45f57a2f76123047e59736ccb688932bef7038f74f336f64c365ae660e908fb4af2d531b15bcf1db2a5bc2c1c6e80b0fe46bb57cb16b24d132213e278f2dfaea5637a27cfec8e34863360cd310b3fbe4d3e481eb7589d5ec81e6a8055c91405abb307c7b675e3d0a452331b19f8b5e5b156b2b50d65068f9c26c87c38820fa0b53c3f17e6c143b3935be491bd4b1b4fb2e07fb583bf913ae7be4f1b40f7f949d33ecca763bae90b6fd03c70ff0198ceb073136eb19ad8b0a6c8f669939169e6553ef7f17bf4e50c7ac700dfb8de718829e3983ba0dd9ec29a8c9ba22f2773ef1e9ba4e174fe9d93131f7b2230feccb51737ae7311157e63a31b9f7a1c98365c6e4a9a3099d74b8d6585b4fc6f7364b2f944d358d021a1ae8125462adcd8d3056bc55bec4e71e02dc808cc30a202043946fc60003d0b534686dd84b8de62077b2870973581525cd533b182774e58fb52486440c9601bd031cfb5cc778e6f857bd9d1991e261a28615fe31b0fc394e21651dfa19c0bdce4cd9d786f5867b203f3ce21b6564e13e20712bec470cf3c1caa920bd7b7486bce3d2a19af2ffbd767fd5797fd5767fdcbfe59fffa0a7e5e5da6491b22b15c8fca7425fd7d3d910953c40627d551863bc559428c70a12ee057d4fdc7ad1bbe7197b238446e526dc2c759e9c4b666b3e8480f397e838198abf31042a645eb7bb3427c813d8331f27e6ae172c00e6891d3582668a433c28e3e3b4362396f8070730f2f4f92b820ca9061873bfbe1a92798c117d6176c47c77378aaf7488be04b028ce94ef2e517cbb7c620d682c5f2e0d07bcb89a191c2834ed6d40a62af89cc70e808982914ac428b09a8afefa04f5fc249091d82ee5f202f88e63d20581cdba1089a11f607fde7445da7c75dbe80748b5e88b4475127de2083ce2081d0175a172b4820b177838940f3332bb175ea72b3b26ca22acb2bca36d4649e925ca3220fc2337e458701eb9087f96c2fd66dfb809ec0ba3bd12d07190639e7c67869134996e7d422bcb48ae2a57712da342f56c4ff13584699fe8384b97661ea91d9b8a4c0d825bed9b09209980c78131d438760051748129e0a85e3324c021f75d7a1ce60a253362286999f7436a75112732aee9ffeeb6f73377ac37e3340f69be00bdf327f357b10c2772bcf357bc187ef533eec04d0116941d1928d7c8bcf3506022c1a838d7798bd263fb36d0f7b1e7e60dd670fecdf4101b65573d697235555a975c5be71bc11dfd2dfebc812f74e3304cc457db61aa2c84f9d1ca4d90a221a9fd0779d785993f6882c0b7413f9b7fa0c9153c14e159af0eb496ca0195d9d5441c976ba37e09dfb813b258dae8259f99b58166dca5d56a596a41155ba425259956adebf5f8f3a3ea23ab31d5b1cd81cec3b22595ecdadd30ed40c287662d8e9e17ab045da2d1dbf557052bff17abc2b676b15c4437a40849d112981bffa74269ed31288a92bb61295f7a5b2685b6790d6e7d34ea7d096660d01d327960d33b345ca00d85437c3e5aa0ec6f33671ef6800b2f5b63d16c91ae08f176c8d6e14fba3508ed5dc3aed1e30bad3937ac601c1ea39d8f35ba4e2dc07714d0d00bdaa25b30173de7e663b2312b776c3bdb1a4657ab7c1ac1c6441e306df123e6939e6402d8db91548ca28cc01caeb580e7c2ee972d0459c948762c59583cdd42a34d6aaf6a1ac5d56a633eb2dad32bd2a32a3726063f6cd123e6528e540658d972570da1aca63bc956992045b5fe9d2f04802c50c9832d4cdb54e4a10b509773464883a3c90310a4ac014a8fcaabd2da7ddcb747c9dbeaedc9f98326ed6a362bd5bbd4f694d5aa6579bd564092cb94ab02a5d8af5dda0f356d5f35685272de8cff074c526dfe5d472d82e6ce4ba34ddf9981ce72aeb555d2288ef4ad53df15780fa63c5d37e794706df78ee94397febf6348da7fd0ea76b68abdf74abaa79b7299a6df69a5650add3f9fb4ee1ee5222a445185d6215a4220a48b17cc3445ade86d5faada8d476c71cd92400c5200c44b10aa9b0dcfb380309be76b32bddeff411cadc5e27374ba6636c9ad8fc8765dee0c01f18ee7cb5e3b166fb2a75a70a7916f16e931010fe0a1a40332dca85fb85d4b10e30dd1118ba824138586ec21df10783d543f479c276ad5fc54b65debd881f3a0f8f801d09e109b5e8392a7465918dfd1314e01bd75bbcb6d08d87a697616413ce64cf6c53fc271850973cf638d0aa9e359e07f88c86b3485e253808b14448d906f66b3c23581d6371d83bf630ea71ab4370c7ecc2023ddef5c0221908e4a497f515171d7b23af5f213fbb59ce2287ac0e6e8c51141c41a11bff57ac318e0bbfd98191d82987e8b486a8c2cbdb28248ab2444b91c4aa283a9d4077e6a3d314efe9bda1c3de3f598c15d62f46527a4c866cacade9e9adfb70fcc50a0f2ea02fd9f60bf8075e23bbffe129a4f02c001d83444c948fb31e0783101ea9fb779e67071aa206ac9a04a8ade97cba3a1c110b59000856c12670eca8cb6a38a30a26f43f0a121be1c484222721561bc79c897dc3b366acb957c8f1b92bec5993fea8bf27f4151237264e1916bd22354597acc9e2bad0c35f6438e8c1a064cf538040e4abbcd39a893b37d13427446b72d3a60bf4d442a0a7fc9b356774682adfaca943e7ac2fa9e2dd854c0885da1114529896ee9e225ccadfc46a885abcef5258459d1b2f29c324eb1a6a34249bdd56ed11a2c8add59022595f57238a34b990953d52d23466430ec6da5775b2a86a45aa2cc6d4c268b6c0d25be6e2d61837e6a06bd4df8c8fac5d6c5b2364be6faf194d737c6b2d5223cfefb72d7aacfc820d29b2ce59d88836290762235c2d876c2ebed49c8aff91b56f066b8092a1400aefa32dcb131b84165e592beb8ae75c212c364fd6210a2f11a60d8fc1467ae45917155b5cc2a028d1f44253a1441f72ec81755025ef85160719597fd532e722e3fa8b96d988bdebaf59a64957e27a65fa2667ad81ae3db6d58633ae253797ceeac28abddaa8fe4a74b040b1556d3dd35e8dda9fabb02af720a68a4af461adbed90c9fd62a15fb5ff642791707a4f53820b9778473b39d0df27c510783945f75e54e5eebc45d160bdfd380b6575118ead84d4081b902d3f70b052d7ecd898fddeea2aec930e8efea5e5ae29252acf905776436f04e7d9e29cb2bcd7924cb1b07831cdffe206f00965fa36b840c95bfbc5678e161c35ac6aaf6f0d4bdc7afe733db3260b83fb826bb8e15ab1a410beff1c92d36eee297720f0cf2e6c47526d6cddc43a5777a7ebef1a33b986fc97d5a40d22b395a34ee363601cc7f45a33d97dd9d2b44739abc1db3f97a4d21263a08e558296f78b3c45c0d736a2457fb3174af2422019ea0b91decdd6372e78ecd25ba3318eda8c48872e061201e065563b268d4f160f5d846b11ede21748f74faef9d7b4bee720123de83a9e7fd1d2fc8ad1f3fb8f1c866151545efcc08829715455015511f0932afcbc844ba264b9a3e1c49323f511573329608f7b17600ad684342685a933e1c8f35d994785de40d4d97b1a4e84850345d100d6d2c1a82a48cc5b0de0fabb6ae90869dabd622227aaf681c7f20e998d2e03b67617cc7dd424f0f6d17d41bf9c5cd5c2f38546449e47cdf9e92700520c5082f71774097ef2cf33bcef72cf350e2872a1ba1f7e476fad5dc9b8034fc4f8e8ef705687de42d80921f1d8b6e887c277cc705044d78b481361d26bde986a755f663efc3a3102f097f7c4fb62fbcf04af9b1efbb864587b1c7596665aaea96a9c706be14e90026b51343764b2ef124361e6fd8060ab1ca6323bf7ccb6a4b6e7446ecb8814359df2ab3691546db02af864dcd67d82a889f13d7d27e6d9f75d31c5116ba1d2666235b9193a70839c846963f9f9bd8d16df4d9aac4d279f09aa68d903c5174acf12398ba78a46b18abba208b02cf4f4453e0d5b6793ba71d394c5ebfb52d727b5986765d62a4a6d839a707ec43db0c9d47aabae46b83c5f306b822affb56e0decfe77e65264f000aa286f90992757128235d96c7868ec62aaf9b269af043d9d43092dbe6ee780372d8ba46fb9e0a3fc79bbe1d464e10a732a5da60ddc4e8d5b634f66640bddaf606517a2c48ae3e449a36d41018551373accb8a60ea6355c4baa618c3b1a28963c5986ccff4d85fb564bd1552b9c55b3648682482ed5823ac9ba56d924273e3512d8938a7328fbc2534e4568a4557c7022f8c4553e779f8479678a48fb12cebaa39c13296472371b4037e0dcf1c94e0d82aadde3acfd2c66c8d6b29f636f856179f16e78a6d70aea84f4c71321635491f8d46981847a6ae816ad195c9505210083275aced8875c5f2bc5bb6dddf02f38aad70aff434b8f7deb2ea38ce621c40f715c758025b5e009613b100a38f24187d55d085b10ae6bdac682ae2b7cdb5ec68ea468eadd0de2d732b39b0c93cb05b6258d2d5569855de19b39237f94e5f566baeef39fa18ed9658530b6af3c07e26679f6300e1d6ce07d749251dc5a615b0db14a19ffa1a7f094ee165dad1cfd0358f8cface7f1f8501ad12342b8de6a38f4982cf4a71b70a229e667b76305891253e6694d605b40779120468ee0773c7e9c8bf73f283e076022bc06497ad1b82471982000470803e13611720e89ca37703f158a2688a2ddf72f4e97c1eb8f507e0350af035e0dad600d0ed59dd99dbf9c40bbc7909f293032d8e89485aa3d97cd60051184d556721a18bb68a17f0dfdefbf77ba6c9fdf4d38fd3e98f7e8950947474b687d8f2dd14f227200d60703199fec8ba431d07761cf8082641a779764c729b18c18b7b44f69c6e0317166c814bcc01dc19038f370b927b2a75e97f19ae572fa355eab606e29888e463d30c03b6fb4d4683e2faf0f1ecac81508636bfa38b8b09398167ad2ed3d569104d00f06a4123083468d32546264989d0a429974977c3eba5cba730476fe808621e0de40428f4076143dc13b43d6124ee8982023fc57d3cdfa3690390bd27ec1bee74360ff03e9aa2afae831e7cf2e631764babd2e45de1cdb1eabbc855ebfeb0e6e46bd1266929c4172b376771acf0d0f95902b79d9813694c8fb207bdb1d557b7eec31bb0569a4c1f82e37c861d82e7d53c08aac985adcbfcdc333e9de8ef44ff9f41f4171ffc6a4f03d43e1ed7a622d870d0eb9bd0076d1faeebb4437490fbdbd007e5c4e6eed441395c9d36a8a20d767c55a33d2d51e16a4b9b7a217351e39bd00475aebc74d23e7104a113f99dc8ef447ed13da796e57e85e35dad0bffcc89a36f4703d4be39f6a7d705b1d38235f54025b13fd8622fc24b11cfbf1be159f96fa423e2f3ea49f8987faf1fd916f213f1b2e99b655cd830dc6ce2d0a515c5c1186c024b9f170c2185cd907947dd4268713374f129ad108754aaeda9034621ac5ca2fee4b990105029d3ed65e9e1e6d26576a2436c6a99ba539ba821a8560a34d7171f621895c210fa6b221ee1cb0385667f045982bd624a2282124b4285423902934a838542300294ab018a2bc8181f1d0c5213f8200cc1119fd1e1abdcb98c66337b71ee7c9c9928608170f032e87d3264481a4d7a6ed7c79437d7eb632b9efb8dfa9a92050dda97940d4dc8d604ba8cec68d2b6942c69842a57b634c218ca9ae63842d1531f514c123544120aa6c6584239d50e1eb13ca283415a7611fbc8873536f42b2ecf566f09267d750186cfb7571c3720871f9305e78ef5db1c27dfc5aa4b9b3725ea4c0bc41d559b273d775475b1a8dd1dc9537279573d4f0af19d0d755e55424e5542aa2aa96a5565d4c3ce7a9dd225bbab3757f1ecaefa504b951bf2748542dd0a4395b6a36ec6f4df2e6b0c95e56eab0c35eb23542ab6502b7540a4d571ac21b16c59850d2d722990143929a3a21030ad67abc0e629cb2af0c51aaf620f526aab521b92baa75af7ab952fa305aad59f12e5158173e571451ca150ad03154ac62aa031f156192c945135e04241531752cc82c6277fce443f5899f414df2a46eb2a75153282946c08edfd63fa81ee8af54e90738ffce50ec27ff1e17f7b39ff44fffd77c21f5250ddaa1d74f38cf9523956883950af58e62dd37367afdd07209fef7a01ddcf647181e1e934b67061bb6a5142e35e82c6f67cea240302b3777957d899679852adc7dd5a263036ad2f4c19b727a4e2b62630a56561236479c2b111c26269d9b4d329f1d9ac954979da90840d119491b80d5b9812c14db1e5cae4a6484321dd0a9a506a37c21513e3cdf18472bd0d4489c4572da0126be36260a1d05d010a0580449f24a4644c72c70474dccc342d821bd9348746225ab4fbc0de0dd29b77a9d75489e5a339f003d7c3e64a8dc5a0c81e1bb9f7c905ae8d3d14a63e647b6fe47da6a0e558c120f7ad41429bd3432824c969c1973cc08965e3190a6e8f9250cbd745951d1dfcdba793d7c7d7c79ffe9ddbfbdf7b60dc9b9673f323370f267b1a79f3a2d7ebbdf8f9edbb2b92ec71ea730672b85b748f39c45d2c825bd0cb93b9c31474708b02ce224540609adcc32d26ef300584f72fdc1976b0b9ffe2c5471fc30728b9027539649a60728005c1d9ee8d6590570be82fab16804e9d007b141f614bce9d30dc11068bd5d50b1bf50efab7fcd87b41477bffc5b1035520922e11d0929351fe8fb47f13cf9d72bfdd58fefec5e2e760ffe770cbd4e7ac2939a5c3fdcc9e5fbc008b849bb2bbc93ae9ce4bd342d0dc3e8b4cd4e7c2b4b4dffff8e22f64da7087d19bfd283efacbef5ffc05b82cf05c1bbe32f0fd89e59827b7966dbe0c6bea73bdf70b122188def6fcfec5afbf1e65d92191209792693ea3ec1925c84dbc8b7380eb417b4916653295e82f867df93e63149dd2af6f62dc9cfd7a02dd226adc0b05c7353d74c445421674941f80d026e95267af5cba43ccdd2f13d9c66da7fcf7a7b1bcab4c3a9c90d4c764c77715493e9d76745323af167ffc4ff0c7efdc0c7b6026d116c79b28b4d444614d1373e89c7b527db5f399c435a884ac600fb709caf57bbb6b30c7847a6a74aa0ce1c51fbf5bf77ffcbeb8a339029fd2d815edf3d726f69a43075b27f319333dfff81da6349dcd4f74a26476fb2b51fbb23070ff6ecee771514cb4c7a8db9946dd7f97cc219da0204bfb7c152a16a2132e48cc8f30550b83676a8c24d72698a2b73a5332d9bcd0ecbd6e9448d49277de704ccf1816262e3cb6ed5761899cc3867975a78f5615304979e6ac741467eb53f9ef2b950c640eab7f4a7339ff3c5913b1997fceac81d65b73feac36d612e7d21af246a93265b867fac7ef7ffcee81d6f5b761d109152cba3c890d16898716be2eaa12cf8f7855170d12085c10785d1391ac6324228c30bc5d17fbb2aeccde71ed8f23b5abcaec9624f666795d425ab7360bfcb90bf6f4fc49ce81a86dfa78ac4aaa39e17563a20d7579688c746d8855f887c763c5907871326a7f12ecbafa6e163cc62cb826860cacbcacbbbb3ffee789cd8260d53657d77863226baa048c6392b829aaa18f2491d7c748d4908446fc085eb739091ea3f66e0eb43f073225dea45dba8473d784df8b8aa48fdce48723a8523a5ce99604c9f5d294844d3a8dca01650de4327065164a65f0245610650052be9a522085e67a19e8ac2fa724546229930bc3a6469c2f0fa8283877aeddd91a565d154a9f27ca67d66ae543762d0d94cbb0a5a1932c5b162ccbb4e520cbb06d394c09c62d079262dd924085cc5b0e3ecbbea5e1120c5c0045f246a739f6c0c3731f9f213fa0f7c7d73072b2603966ae0eb34c8d5901b020ef60050ce9dc6ee541b3cc5d1eba0c8397c79660f2f2602946af0058c8ece5716419be126c82e9d740921c18795c4e73d3bf66f9d6a9cfe862996c7b05fbc0f62d572fc0c4bbb7f0c3cad03eb24c92a73bfd362a3f45b36b6b767430087fbc604d82a7581af783e8914d5e3f6ebcdf22ff8ac4827e857c6cfeb2b4f4c91dd8d0c09c409db7e7ce07e0a1c9e23dd48f6ee8a5369612debd592cefe35344f46400f77037be6606653c06020059d3994df0a02f6169281cedb51ef62e6269b8e2d5c65b8c60302fd9e7f8eb08f3b17d4372bcdf4ee95b66a446f9aba7cb5a6300af3df40016ec4fd131eb7805248c775ee16b9759e6d1eb33925d86be995a4ed4b1e83c1be90d0b7fc15091830a2728c0a49d24313a98cc57c977206569826d9ae5fed6b54decbd9b32b2c74ee805201f62fcfb05aa3e92548d17b57d4190156d28f182260f6571a40a0703fa79557a411e8743555435795fd6e491ac69a2200d154d9244ed60b04816ff02a423c80549dc17d4a1a629922248bca289aa4270c3d7386e7824b847a2b02fc8a23c1aaa43511da9a2349465827b551c4c9f44470e1e6e7c4dceef9c28ef6b3cb45114461acf4bb20c6bb2828ef1d04a6908cd85ce8cc491ac0a057da2382549d0c411f44885b27c5187084ea8525386ca485514581e8ae9bee434fec0328f626bc3913092818e922e1902ac0d879aac235918ebaa3181c521d0673202ac96991023e1419247cdc2dc8b0526e9ed27724db3482407835853a3d643e50fae679e597e7c34e95a1184d67d42600e720a1f50b945ba1d2322b135a2b7cbf33e8984f3fe0c5a8a6c9022fe227970f3e12e38bab83cff8f93cbab4fbdd3ebcb2b6dc40db8ebf792f2e6dd8797a7fd0fdff7faaf8eaf4edf9e9ebf8d95e9f54f3f5c9dbe7f75760a6fe644922387bbc61e0809586c229b5b0a41ee6ae10778ca018f8e38ecf8780ad4ebf5df03f0e9e546e0371e392c43607bbf568519f13560841a30620d18a9068c5c0366580346ad0a2312a95e1d46a90e23101a9c9e9dbdbbb83a7ff7fa53efede515e10ebed71f5269acf6c591b62f2aaa288a022ff4cf4e3fbcbdfee9e38777d79f7a44a702e709bffeba64dee393938f97c727fffa04b20c5e5f5cbe83f600560fccc207cbb8edf5f9fef187b767a70c83896fe00bbcdce741f429120874858c8b24013069cee9c5d5db5e5f16150d5e9c9c7ff8e5f4f2eaddf9874fbd704211bebffee91c4a5e7bc8f1efb1e763ee3df60c44f4710c057449250d3abe3c060842a03344cc5e939e1c73c8992ca00f28c71bcb29dfc858051a688e5405ae73535883a8d6aa424c56412d010e042cf4964341b61ffb23e0d8fed5c97154d3dc01a94bc62c895749e27d4302f170184c4ee27aeb2bd4ccc81ffb249e611e1e0754c72d45540a078c138cf5d5a713e405d8b790d3177fed1ffff31dc8ca97a7203d49b3fae797afa102002d60c8b03c91b6b4fa10402c04f87875fcf6f4d3d5c9f90591c030720ec634199f3ff7eef1a2cf05eeccbdf1d0ecd632c0ce9bcde0db3ecc9de3cbd363e8a8e5d8c831b93dce75fc5bd7c31c79722713fa40cabd7a75fecf4f8ab6afc97d61b4cf6b7d15067bd497847d65946076a2407ffd1554fd5d90502c33cffd2c1ffd40fe1cce8329f7c357d7c18792c2fd806d7be61fc2ccd578ee87c0a536c221df8ffd1ff7031977ff10a01c5737416b119b9fe08bd7002a0eec028197f88301fb9dfc0a2f48e3c8c7d437b0686fe115e9c08fac48f8265e885c11f12c16c9295731920bddab22e9be637a7413199eeb2ca6474001d685e4eb44341ddbb666be6b99d147da3c9517466013a6bfc501c1da08077a02ab94231a95ea60907a1bf318e71a039484314705b35bdee300112b26066e85a1f4603145ecb2e5c3aac40c79e46dbc5ce6d5aa34f0e1cd1c6cf92362c5843f575f89657644ed281c1c0ce853eca315d8048efd8dedf98cc94d1e23602612e814dff2fff8dda687bf38626279b0949efb60c8591c35a0fadc67d7b943f41b901a71c4cb71f7c7ef8b20f8e37f008614f4d01db41e4dc11843b04ab4e701c1ecde7e86c6bd881d4821e0ae4331102703794116ecd086cfe47291c57d06f4b09c77f7b95fb07def9285f53da288e6fe3db2eee60134ed6e0eb625a920f45b5880e12e796e018c6a820b5b7bf7313ce9f2d13626298deee7d0ba7de0f68840b161b09cbbe401738cfd23720e3771161d94313d614d8ef3463f633783bca471596876768667677876866767787686676778b66c78eec2f4dc647cae373f4b1aa08d4cd09a46680333b4b2215a688ad28b6c09f715f32026b618f2edd38328ff3b175927c4451c85bba59da79f97e59927fcb36bc52fc4516fda6b3cc38e493281c73728d82646de97e21be23009f628ca3deaeade9b22078c5c8f33e61eb18a0f7bae8dc919bc58875320e12e4c582e468702d4abfb4ff32f966d216f412303c79a14d2eda367c71a4ac6274ef6286a36dd88170e0689e755b14b3c75efa332ab8755812b8c3ce3362a117b5a15b9f02c3078e9adc1e8e72abc67bc590760d2cd5c22bb717cb323001918e66b0f9f9267b6cc28966954267af11166fb616f0a4a004ce7a915bc27ae621ac4cb89d2c2e744c7338cf9746e2fe37d3966b2b689f5059bafc31a6891698836b1bf06852e61c983933633693c98d7ec6f6281e898d4ec3693a150d358603d149228b69c037ef5804bee457678ca03d510ddfba7db56368645841ff686d0d5258101c68b68cf8b5943fe6a438b6d2401516e6c7c4551c4fbc690a61603f45dc8cafcea222e49db8aecd92d5a9dedd2bd5bd63803e48d1eb83a13003967f0091313294d7615f5d97247b1790c7b674d70eecd01a4572dd95c96d4515493414686dd012d1d66ba1449988c03fa221f46fd8a6cdbe137742896d30a066346bfc238d8ae71c7a65a73ca8e296be9f4dab40e024c270a57a7ac554406e9cb8f31155d2299af6b93edcd7c64a224f60541ea0bb2d01715653336aa1d88782dc238269367331e62e5e0c2c4bda53ac6506c896a217282b808e5fbf725d0cc03e2f1d0d70e82a4f4d9ff971a8108e5da51f05dbb4c7cf80817e5bfc2c1d81787155135a65b9dcee5cb006607cdb8fb0c0f7077ebe7dfa010517ad6104c6c848b61d8bc20255753a8b874d4be709a0caaf4297f5e14a380f18881d1915b535f9c57295882c38b01d9a0c52136d280f05d1c8071e9e68e6439b14cb38a9a5352ab9693fe4d356b35ddda96765d33b74a6ad841ecc4d172bd436da084333e6d291d786e8052f1f10f7ceb2b33be126ba0a551b70a2332f703779ad7a4f523954a613f4736395f953d67b53ce64ece24a46db1440d695ab33052b1737379c91cb3244fbf81956141170fc06a714c62be9345c4ea211e6462eee157f15299778915e0f90c91331f64cd92787eb15aeed2635aac85fef2d8d685870dcb8f2c7f8f2c88f0ebf9cc26d987f007120725b512205165eef1093971e287e463d4cb50793d8d930168e258e33e7af222912c21c653a92eade8418f5f85d58661cdf6a25364cbcb1967b454f234a0974c4e135f6d16666d5877d8f219e7d8481fa27cc65dc93b8bfb8cbb537cbcf679b35bca6df19c47287972fa594f9d67ddfc32e7e89ff5e8a4ee273cefbeb49941fe8974a959dae3a7d48966d93c9f4cd6b02e175d978baecb45d7e5a2eb72d175b9e8ba5c745d2eba2e175d978baecb45d7e5a2eb72d175b9e8ba5c745d2eba2e175d978baecb45d7e5a2eb72d175b9e8ba5c745d2eba1ab9e8baec735df6b92efb5c977daecb3ed7659f7b9ad9e7b695e0ec063b4094009b6bd39c45d1720739e1720705d147076d07664c28dee71fa39164af8bced76e88d27846455717a2715388c664e4bfa5d4d7c758d2f891c0eba288055d4648d2b5892ae8c2584578242b9a8af81dc6005c8d7cf32880b4833b0c05b8bfacb40b0ad8c566e962b374b159bad82c5d6c962e28601714b00b0ab8eba080df40544092e93bf106de518bf26010372ce97bd7bb418ef5959d793d18241e13f38054cdca2c7fc6bf43a30d6a01d3bff12f13f48544248c87222753648a2c9bacbee9dff817cfa59c40ff247c23a94e75c10f3b03bb33b03b03bb33b03b03bb0b7ed8053f7c8ac10ff34c0be2b9fdcac2cb59ce97e80773d99ad614d43ed96aa119bd01e5616f4971ea560e01d097afd18f45eae4532cda5e9abcc0f5ae99b94c5518bbae287e1deb6f165b36865d4e669cad44818cd5479e3903f90632b1f91adb383c524dded3601624b52835a7755e56144155447d24c8bc2e436b744d96347d3892647ea22ae6642cf5b8f9ccc75e70ee903c9c4b4c74cbe5434eb64db21580bc1b1c244a449bb7533c75bdc509326ed96e84b90083dc324872cfd449b29cce75112e9f7584cbec118dcd112fe971b4f2312fbb18972dc6b80caf9c74312e1f3fc625dbaadd7a8c4b645b378e6e22ff5607550d6ce814461a2c11cd12cdd6c706fc6d8e3c5c020f8d9c451a558449f99b5805cdb6a277ae2a681a53313e02fa86f89bb5b06d8904793535a685871e743002c0f2499f6daa418bb682a26e0e152a28625f1095bea049e5a285b6162ab4ad38a12d06096dccc3cf21822c01d027960ddcdfa0a70030d54de29907adae8375d026ae2d11305b4f535a26315283ab353a506c3ba104aba9312d1e30bad393b2d501e1e339d8f31b5065ee8308a34a4b5fa75d4b606a3328f6c6d8c02c746e8ea9b226742c333568f0dfc82a292e4dcc095a746578548aea5b6c696c0c889bb621061ba8906728546a6b09db6063a30bb5fec6d6e7a8f6b6c232a7d52f81ab18fdb85ae8e32a718fcb073d7ea2b1a559157185b7a96c56ad55eacd464db6b163053aaa5abb99226ad0f25cdd53b1ed31adb2b1f56b55c726e8b482a8d4ef9281dabb98dd7fea98dd783ac6a689cd7f8407f50d77beba06436fc4e45b21492cf7c8a3be4fe26df657d0009a5e2fe5c3d19b05eb009f723cef2beae80b8fb42f5e5be8c643d3cb70c438933db31b023f8108211b3bd31eb7bc581345bf8efbef0e422c11528e32c4d2bdbe38ec1d7b18f5b83132ee6e3c1832f3987909a9a60deff6080a39b5ff35baaa9016117ece5508e6f524fd736e98b79708c031f2fec1502aab53ffafb1e3c26fb215ce1ca1212b9f53fd052d51c98d0b6cdddc066153185a8a24564541ebe8ed0d7a29608a9de03d0e6e5da0d13f7fa20859bfc24b17ef8937dac1576b7a7aeb3e1c7fb1d89587e86244a2fd02fe81d7c8e697c76444b81546c7e0dcb3c8592df6fae3acc7c1209c101be6b0f7efd1ad87a801ab2691cb3cd3f994bca4c85cc634cc75889d909e7c2fe1ac5f0d6754c184fe474162239c3cdde43ac1eaea0d17dbdb84965c7157b7d8b6b9d7f60d27f6d57dadbf27f495be92a40fbb559b9aa84b068dae1f8783427e18c9fea70081d45729e197f572b7e3e4ee14582b0aac45a7773d3a37747cb7e7fa6ecdf9bd03f777ab0ef0b65de0bb74826fc70ddeb623bc3d57787567f8a6bc592dfac2dbf386b7ea0f6fc123be659f786b5ef1b6fce2ed7ac677e71bdf8677bc6dfff82e3de4dbf1916fcf4bdea69f7c9b9ef262b3ab96b7bcaabfbca2c7bc359f790daf793dbf79fb9ef326bef37adef3aafef375f903d7b9cf2b3bd0abbad06b38d14bbbd15b71a45774a55773a6d771a7b7ed50afef52afe7546fdfaddec4b1ded4b55eddb9de867bbd8a7fa2eccab9b98fa2aa97a23d3fc55a9559da579175b7e739dc69f8a21c5fd4c120e55d5d3995d7ba7297c5c2f7f4e4f01589cbe6dcf8dc2cf255d273f344362ebd9761f21141eb71ee1878dc088f6913be671e57e2a0b4595495996791a02ecc15fbf55d94c7237e253697309b78a73ecf94e595e63c9297c733c7c33fc81b80eda6d71c3c9d4c98f1ed236ca318c9ffbe0ce7b2776f59f7283af31fdd5bf83b89de185d6720dedc1a7711a2d6902ca304feb0573b344fd8027643216c6aaab3d5da46c4c715bdd901246e3fbecfd5dc9bc08cfecfcdd17d588eda58881ff6623ff69efd64c17ebe272ef828baefb1efbb864587b5c7596682bed1350e7d45157897da0e20cefa4b3c89913276943f367c6f52e15613bb6d116715335bac213196eb98ed9b6336f694e0385d6c87e758c4ab8a8c970c6db947425bd660c39c0099baa66923244f141d033bc1c0e391ae61acea822c0a3c3f114d8157b7c794b9213b332c5abfdd2d326c599e745d62e2a43832a707614eeff28c994785d53b524268cca179e3519155e3315d6bf068025c1035cc4f90ac8b4319e9b23c3674345679dd34d1841fcaa68691bc3de64c46a7cd70658d963e15768c37bd321f26fabd7a6843292728be96efc89b7c1371b7b9d2aff197805c51fd8672a63fa52eb5983bfd2975abf51cea4f8c0ddbc9a5fea446ac959cea4f6b6a7d13ddd8628ef5a7355aede45aa737c3bfc184eb4fa65fc4defc5638ae59faf8cbd0645b86c8aad4ab0a17c88f6ddb7d3836cd37ec44f372df7decbaf6d2fd1a78f312d7be29aa0f1fcfce7271d038359b91409ba3d818466845d76e10cdf3f26a41cf8a3769d36518a2bc190e3bd19ddcb3ee798057b7ee0309b6d2a47282e37c861d82e7d53c082a51b5283442bb33258c65fe0dccfd7872906fa73be1e9c56fac43e237d123e66afdd656e4ac57dfe0ba9c75ec1b5d9db3ce7dd36bf42563b6b3527f8d024c72a93ca1d16b65bdfef4fac5b6bcbe3d46f4b065937876b6ab7f632376bb00cbd05f4c2d1f44c837d637b07c4debc60a10a211da7564dfcd67d843cf7f19bfec9f6bdde128aa7c80bf2d5fc5b293f4c737d627d707156081d105334fff8c74e4dd5b64454386d071c06ab1a7e81b339dbf29d39231a5a36392700021cf0a2cfb9b112c2439c5b7a5c15d6b8a7c1fb944818316f886945cbc6bb63b9b7d4b7d23917fd996c9b7c6908dddd78fdaa5f031f714c301185bc84fc43ea16f963106c2d00509678a159da91e6c024b7b2b42486133649e3b208416374317afb7431c52a9b6a716b421ac5ca2fee48a310454ca747b597ab8b97499fdca109b5aa6eed4b66008aa9502cddd800b318c3663605b5d117ff0a5aa0ce764042494070abdeb11a458ae7d91173b02934a8385dee20850ae0628ae204bb0508ef733821e96852e9ab76a59046ba6afa09545b271160ba30a1dca9fcc225fba35b9735a14cac227bc2d11b458be0319af4684432a8b23c77b10e190cb0f6cd12a3d42a55440b56e411ce11b56c0175b7b46e06a95e6945ae64598b52a73710536aada9fccb225d261a5593732c822c0d23c9bb5c42314621d14a1c51be128cdb819cb32c22057a5e50a548927bb48594107e1fda2b85914beca3588d06c662fce9d8f337399b5219eb261508c262d68eb63ca93b8f5b1158bde467d4dc9e006ed4b0ae326646b025dc6006bd2b69441d60855ae81561f2333d81ab5289c91cd7184e65cb3ce44d65d632ca1b1d70e1eb109a21c53b029b2f60456b1a1d814e73684579119d9b8ad6d09b21c23b3796f3336675394392668730e2ab2485bc0bcce406d017dcc5e6da3b1a5ccd736c4497b9dcf18b78d674068223666fe8ce9db26c6d0126e8a326318b7352ce531916490496399783549426be03c3f99d23a7c4b30e9ab2b627cbe97d17103676edbc98273c7fa6d8e93ef62d5a59d9225ea4c2bb41d559ba7f7765475b17adc1dc9535a74573d4f2adb9d0d755e55424e5542aa2aa96a5565d6233beb756af1b2bb7a73573a3baa9e2d8b76d7d7505a97e3af748542dd0ac305d70e691aadce765b65b8947b844ac59dd59ab348dc69cd8fa4808b979f3b6dc0a32be3a285ed6ea9f0288a3967c9bc63a267d6d73bad3f6731bee3c957b472df7533d62df377dd96984f60e76428e54028d7aab42d2bd6d74b8f340619d7c46ec552b8a2dfad44ca383d1eadfad043b2d3fa33ee9447e1bb16aaa567c5d23e98584b5619e58b3d3445a7bf487e9c942ba910306ddb5581cd33cdaac0175b56157b90328c2ab52169d754eb7eb5f26596fed5ea4faddf2b02e72ec2abe0602be98ab58613a80e54b8a6addac468615a032e5c5dd68514ab81e6acf3aa833799d0c52baeea58da99dc456b9f1aeda93fd173562175fa90594a544792b31ea833be45467d2d5ceb2cf35a0863e675bd0695b291eb4dcc265dca58ab357830b47a6ab05fc66e6c862334feaa23c95870f5099a858d5b553916d4c16a838c225cc5bc5ea50244469032bac2ddb363fa818664ec9d20e71ef9cb3024ffc587ffede5fc13fdf7df89e36c05d5adda41c33ab2fb041c2bc42e115cb14c86a6e7ce5ebb0fa09c7cd70b68dc1816671d9e4ee3db8009b2daf3a9930ca9cedee5854864f722289d7adcad65c2aca63584a937f7845460f304a6b4166a842c4f21354258ac9b9a763aa5a69ab532a9b11a92b0218232c66bc316a6acd9a6d872cddb464899bddbb45da1e86a054d681137ee556422b781289135b0055462435c3956750bf85a1570c576770b68b724ec8a2cf3365adca2e0cbb1dd5be976c6986f016b8e75df0a5b1599fbed205f67ffb753436c41d052934bad105a923aad5221b3866863728486781bf322b3ca681969b8ec68016b661dd2e228d546c6c0c235c10a50280024cb9d84491f5b58c4d60f71f7b26911dcc8a629f3128976dc07f66e90be689d7a4dd758f9680efcc0f5b0b95a65c5a0c835e889eb4db9c0b541fa8499ced9f568f23e53d0828938c87d6b904c4634aefe11bf4290fa920738b16c3c43c1ed51126af9baa8b2a3837ffb74f2faf8faf8d3bf737bff7b8f83779673f323370f267b1a79f3a2d7ebbdf8f9edbb2b92db7dea730672b85b748f39c45d2c825b58364ee60e5b3f06b728e02c5204f487c93ddc62f20e534078ffc29d61079bfb2f5e7cf4317c80922b509743a6094b6258e072b67b6319e4d502facbaa05a05327c01ec547f89273270c7784c16275f5c246bd83fe2d3ff65ed0d1de7f71ec401588644707b42442aaff23eddfc473a7dc6f3796bf7fb1f839d8ff39bcd5ee73d6946430e07e66cf2f5ec082999b2e74d2269d74e7a56921686e9f655be8731316b9f5fb1f5ffc85187adc61f4663f4a2df5f2fb177f012e0b3cd786af0c7c7f6239e6c9ad659b2fc39afa5ceffd826470a717f7bf7ff1ebaf47597658250a803a2899e633ca9e847732efe21ce07ad05e771e1c91a9447f31eccbf79935fb29fdfa26c6cd395f8b52122cefecaf726565eee117a32abcc75f0bdbdabbfdb53096b8ef5fb7df453100eab5b3202e404d32c66205d4c250297e40cd3616c514a88b6e7d9c815a58d3b107ea362d138fa011a24c8c82da7dcbc62d68822a13cba031b2447c835ad88a631eec094d3016c8bd6648d788bf6688374ac1c6c4c817860d5b9d2b139be1cc8bb5d0b4f345f1179ae12d8ec9d094c936c469688cbe44ec86c67564e339346f7695180fcd6a4bc47d68871645b1201a4e976458858633a52866447b689371249ae12d8a2dd1ce789540175b55672d7cba54206bedb51942a242e9661685e1af503ed4f65521c47220c4842d572e226795d2a105551224d7b02c099bb471cb01658d803270855a6305cc6f002e560d95706406a42c4c9a4865e132b2af128a75eaaa1aa2520aa40aca759cb0093a61e954000b855d79888c9c2c0fcaf460b5f24b3bbe3c58ca90ac0058683797c791358e2bc1265619552033566905e08ca2ae071b6ae332c0651c0e65a4600187140314f2c61a90125c510cbd8e1fd642157042c260481b050736b12ace9d6b77b6d64e58155b3748714ba11244682b548711cb02117ba16cc94841552b1fda0ca58172ad86d2d049bba12c58565f94832cb41daa80175b0f15b1541a9e3c0ba20e64c686a888649d15511555293ba21ad2669c91b0252a0186264115988c3d51059859145521961aa30a604a7354022dd42055b064354945e88446a9069bb12e2a8167ec8bbad0a185510ebc8c8d510e530d9ea9c52d4df9a42e8794e48d8341d6bc38f0400ce233e407349be45aab2359b4ace551192ab43eeac189550059caf9f2a52355571d26b4462a01e65a24953024ad922aa059fd531ebad03aa98aa2d842a981a9f2d0e5592a75a133d64a0d44eb2c963ae84a592dd51137e79c84f55219383442aac265ac98aa08982553076aa999aa02a7745465f0426d551553566fd5c090d060d5e133164e6514192ba70986d0d2298fa28cb5531e5b4dbeaacd516df052132eaac03f07837c93e7c044017a8d27d07a93ee035d782e681b1888d8f1c40776966df562e6e17b0b3facee521d25687f30c8168840a768766dcd8e0e06e18f17ac75f0440fc085cfd12333eafc5387f88b4c7a00ec16f95706b2f12be463f317a0dcd8b2ad6041b2d9d0ef1e9e409db7e7ce0760a7c9e23dd48f6e684875d0cb63e0d29bc5320d3b45c476b71eeec6d72ccdfadc0eac0b66c5f9d674661324e84b58144a46e7f00e7b1791ad97a831de5804437ac93ec75f47788fed1b1794e3ed94be65075cefb111b85e8f9b2eeb8c01bcf6d083e5dcfc1405408b5740d229e515be766d76d62d7c7de6025afa666a3951b7a28b78a4372c3d3a43458eb09ea0009376629f6685bf4abe03c31bdf60c7bcb091816f5ddbc4debb29a3f872d02df3686510ea2b3b591f224d1b6a88d7e58939d6654530f5b12a625d538ce158d1c4b1624c0e06969960d7f010ab39a6b3e03b67617cc7ddba7e7068939e915f1c397379a8c892c8f9be3d754d7c685a3ea13fbda2f89d657ec7f99e651e4afc5065745f0d3b67dc62e3eec203b1e62dfe8e171f1dcb00063bfc4ef88e0bdd994c595bd87483de7e2f6eebbe5c75eefb8341acb55107a0fe07d733cfc00889cd6a7a571226c57d626e0e720a1fd079417a1e23e9feaa56b2dc890a2c4f1e7bf1c3ccfe0c9a8e6ce05a7f91bceff870171c5d5c9effc7c9e5d5a7dee9f5e59536e206dcf57b4979f3eec3cbd3fe87ef7bfd57c757a76f4fcfdfc6caf4faa71fae4edfbf3a3b853773223f90c35d630f9832f0a0266e39dfb8ab851fe029278c0033767c3c0572f6faef01f8f47223f01b8f1cdb25b0bd5fabc28cf81a30420d18b1068c540346ae0133ac01a35685118914a90ea3548711080d4ecfcede5d5c9dbf7bfda9f7f6f28a7007dfeb0f25551324b52f8eb47d515145511478a17f76fae1edf54f1f3fbcbbfed423121c384ff8f5d725f31e9f9c7cbc3c3ef9d7277e9fbcbeb87c07ed01ac1e18230f9671dbebf3fde30f6fcf4e190613dfc01778b9cf0baaac48e24854c8b848120093e69c5e5cbdedf56551d1e0c5c9f9875f4e2fafde9d7ff8d40b2714e1fbeb9fcea1e4b5871cff1e7b3ee6de63cf4044fec750409754d2a0e3cb638020043a4364a161d233ec0e391d0ef401617c6339e51b19ab40d378215581ebdc14d620aab5aa10935550cdc34d10d1761c0ab2fdd81f01c7f6af4e8ea39ae6b0405b90314be2559278df201be888c1d001ddd7eb2b54ade58f7d12cf300f8f038ae496222a8503c609c6faead309f202ec5bc8e98bbff68ffff90e64e5cb53909ea459fdf3cbd7500180163064589e485b5a7d082016027cbc3a7e7bfae9eae4fc824860183907630f1acdf973ef1e2ffa5ce0cedc1b0fcd6e2d03ec8ad90cbeedc3dc39be3c3d868e5a8e8d1c93dbe35cc7bf753dcc91277732a10fa4dcab57e7fffca468fb9adc1746fbbcd65761b0477d49d85746096627eaf4d75f0f064491c415cbcc733fcb473f903f87f360cafdf0d575f0a1a4703f60db9ef9873073359efb21701f6e7c4d3ee4fbb1ffe37e20e3ee1f0294e3ea26682d625e127cf11a40c5819520f0127f3060bf935fe105691cf998fa0616d42dbc221df8911509dfc40b91580a9e45f31a1ee52a4612477c5524dd774c2f9120c3739dc5f40828c0ba907c9d48c168dbd6cc772d33fa489ba7f2c2e86090f916070443201ce80918c44713c2c40783d4dbd81da95c63809230e62b6526cc7b1c2062d0c4c099e3039624de11b1d2960fab1233e491b7f1729957abd2c0873773b01d8f881513fe5c7d2576da1135a9309839f429f6d10a6c02c7fec6ceba8d49c80b2360d612e814dff2fff8dd8645e71fbf73c4daf2600137f7c1b2b3386a4bf5b9cfae7387e8372035e28847f2ee8fdf1741f0c7ff000c29e8a13b683d9a825d86604162cf0382d9bdfd0c8d7bf1e2efa15d163078d7a128c8da96bc20eb4468c4671286c3e23e037e5845bafbdc2fd886a534ace7ee11c51479bda06dc43b436b0897cb1660a0dd99fef1fb1fbf7bd036b0aa1c820b5b7bf7313ce9f2fedcf541acd3d2e87e0eaddb07768f28141b07cbb94bde75c3d83f22578212d7e2401bd3cb5ee46651f4331651c34b5a97857667677976966767797696676779769667cb96e72e6ccf4dd6e77afbb3a405dac806ad698536b0432b5ba285b628bd539ff05fe12f60be0409cf76be814a3a7d0f76a6c745d609f149ce5c3f00b9c146927e5e9667aed7cfae15bf9b4fdd69aff10c3b60b11a09bf38f39de77d298ea50693608fa2dca3bed5bd2972c0caf53863ee11b3f8b0e792fd1c3f1e9a2c05123affc372313a14a05e5dc59e7fb16c0b798b335228d6a4906e1f3d3bd650323e71b2bf0b0d767a72533818249e57c52ef1d4bd8fcaac1e5605ae30f28cdba844ec6955e4c2b3c0e0a5010ca29fab64f0f1661d8049377389ecc671ef7a0032f00d0b8a173e25a2be716698467e59267af11166fb616f6a9163a0d6d40ade13cf314d1ee5986f0ad3801ac67c3ab79779a61c3359dbc4fa82cdd7610db4c834449bd8d6814297b0e6c1499b99341ecc6bf637b142744c6a769bf18992c5020ba29044b1f51cf0ab075c722f92d00806ac80c0340e23e4d12d121bc322c20f7b43e8ea92107ae345b4bfc2ac217fb579c2762e80283736bea228e27d6348538b01fa2e64e5e5dec7147977d80392dab35b44b728680375ef9635cf0089a307aece44000d92919291c0c6444e93ed2c7db6dcca4a968272e733163482edf8a0592f5d625526dc5a847fa356fe7c15101db78c70980c579207bd6ac9e6b2a48ea29a0c32362c204506cfc1e03c4ff00f4a91844939a02ff261dcafc84e117e1f0ec6726ac170cce8771809db35eed8746b4e5b44d8a6a8cbfc668a1988c4255f14e3f07f9b23b0583623726db2f3968f449484be20487d55ec8b8ab21919983016981a01b275e418f0948c2397462f6cc64815d3ba7e8ec9bcdd8c671d2f1b9667d82548458c345cd819309dcaa2d0416be9c4cad2a93c29c2287df931669795464e1017a17cffbe049a79401c36fa5ace90943efbff527c11a15ccfb1ae6d99e571d100480d665002cfb646245147d381a14d23e7976e5db3088f694151d06c25b0595f0bfb299603df12d528eaa6c4ba2722dfa82f88f2550b33b067dc3d550877911c1f14960ac53029ba12d9c5c553029782d169580c22d0524592b7188e094e02bb92b1c5a54319498a53515a5c920c3129164acbe28229b658c1a4d9aa180530420c8cb2cc9afae2228b822504dd9a31a482290eb1895a7ca2349354d508b14e386da64756ec14c32c2506814c8898356cca0a130952a95b794263636f56e260d324c89ff359a892167339bbaea9d55ccd6e6ecb725e23e04a5acf83d8d9b5a53783ae70127b6de975d081e706745518df6a21434cb921e1e1582ed956f10ae77ee04ef39a1452251e94b0a0ec0118f68e4956b964adbd7a8887859b7bf855bc54e65dc251723e43e4b01459da279e5facbc42f4f01c6ba2bf3c4c77e161c3f2a305b247fc06f8f57c66030b07f803895c985a30933890f7f8841cd5f2c33167434e0e4b255833c9b8ebd8f06010c71adfca222f4e68bcc8701d1f236eaa4b2b7ad0637161b5619cfcbde874df3298c6192d953cabb95c629bd45393e0186ca318cbff7d79046c6f06fdc6d181ffc8b5f57712903ff278f5588cc177cb5c01bcac2882aa88fa4890795d4626d23559d2f4e14892f989aa9893b1b45af013da12f8c35efdb37c61133eacce0fc71c0a661c7dc9c691f97945bd7f40e3f60f045ecdbd0932f07f6e3e13f8d7dfe66ef0b7d8c140f6623ff69efd644704bf278ea92815d6b1efbb8645c7b5c7596682c0d1650a7d4515f22ee9f960a7822ff12446cc37ab444cb1117c93ca3594e0fe88b98af92dd69418d775fcf6cdf39bfc38fc96bc0db647eefdd4e0be9c3b65baa66923244f141d6bfc08861b8f740d6355176451e0f989680abcba455e2cb8e696e2ccfa0d6f914fcbb2a2eb02689062c49c1eb00f15f8318f0aab7750a2316fe68d46454e8ddf3aacc1a2097041d4303f41b22e0e65a4cbf2d8d0d158e575d344137e289b1a46f21679337d8132c594359afa54b831def4ca6c98e8f7eaa11d6d9ca0f95ad6236ff2cd43566fc24c2d7351ca8803906b34606a7f701d9cec1309dac2224b87166d7aeb25194ebd682d120b939e2acde2c2b02a927b5ad0ee9217a09e7157f2ee903ee3ee145f8d7bdeec96dafb7dce2394bcf5f8aca7ceb36e7e993bb0cf7a745211199e775f720df767dc2516e4e4798f49b8b0ff063a11de227de6fca4931d97e7df8b65509e6fa423e2f3ea49f898bb9e3940b685fcc4a6077d13f67a9913373f89cc60135861c2988d906b93c36c842e9108a64cdb8b92be6caebf20c14b896ec792b96c2c5d29714b89ba8b92b494015d9f9065238674f29532556612ad9406ca245529d5be501caff2a79483cac9955209309117251e2f3e3975a314d23959a57367319acdecc5b9f371662e4fdcc68fdb0e8ad1a467757d4c79b3bc3eb6e259dfa8afe963caf5db97940a4dc8d604ba8cd468d2b6941469842a57aad4c7c8a44ca3168542a7398e500635eb4c28921a22594aa876f088e51191ab3649a9456c22728f9644e649a4958fde124cfacad9cce7db288e1b3873db4e169c3bd66f739c7c17ab2e6dd294a8332d0a77546d9edcdc51d5c5427677244f49e45df53c29be7736d4795509395509a9aaa4aa5595510c3beb754a8becaede5c95b3a3ea997eda5d5f4365568ebfd2150a752b0c35df0e691aaac95dd6b8d4a98f50a9d842add4dd9056c4b186aceee615abe9220702b95e9b32270a01d31ab60a6c9e9aac025faceb2af620a5b02ab521a975aa75bf5af932f2bf5afd29215e1138571257c1c1c469c55a439958072a146c559b184aa7ca604b11531752cc82c6a77dce145f73217b99be2ecc2c9f5d2b1cb3fce0e4084aef0439f7c85f9e1efeaf286ee65ece3fd17fff9d9b2d2f55dd415e727a8e15628e521a77f3b0677aeeecb5fb00e4f35d2f38273773d9d55d3775cd3941557b3e8d5f6a1fe4d5169796f939ece991f58754cefbc8e39c7a4d47241fcd811fb81e365763e26773d973816b630f85b77c57a9cb73f3d00f0ab3d387d137f96ceef3545ccedc9cf749a8e5eba2ca8e0efeedd3c9ebe3ebe34fdbcab67e831d204a80cdb539d7a3044b839c0c4b83821c0883b623027f0b41804339b5310cf03279431708787d206076713f2639be40d54792aaf192bc2fc982224bb2381caada481386d2c1807e5e955e9047f82c6abcb62f8f3449d0c4d150535441d544e160b04816ff02a423c80561b4afa8b2a08d6461288bd288578632410e9fe3c8e191201ff1eabe325401afac299aa0ca2391a7c857c561e2257a724083c7e4f74e94f7355e903551865e0d45e81f696a6ecff87d41954829455044511587aa9adf298a53e2d5e148e21545e201f9a8a04304a7ac0912cf4b9a20f3922a8be9bee4343e3f6433d3befac41427635193f4d16884c9116453d726fc505726434941b222a8636da7519b69bb5a89dbcc7af808a19b59c55df4e62e865e1743af8ba1d7c5d0eb62e875d19bbbe8cd5df4e62e7a7317bdb9b33c3bcbb3b33c3bcbb3b33cbbe8cd5df4e62e7a7317bdb98bdedc456f7e72d19b27966d77b19b1f3976f31994bd4001b0044c10321e8f1bbe5990f79586819715a52f88c3be005644a900bb24ee07020e6f10d03542b1a5a0ae4bf44d03bb9608febb2f0eabe0d9528f5b8cfcbb21f2f4b71577fae90664de181398cefc32618153f3bb4c9c5f16737539d12bc55d2d9adb1b63af2667ed9a80b764ca1180ba016f1b44bb2d1feaf6a906267e94f8bf5d10dce64170d366e1ffe1ffcfd2320c6f7bd5b40cab0d51d9416a3e4c5507aabda12a1eac0ac3959ff5e38c0e5545a3b13ed5916ddd38ba89fc5b7dc6acd64a9a3d371948cd5c2039b868d864d2b842dbf46f625554ad69f3b59554374072ccd4d8a8e835ccae5218b7488ebcda5aa18b871e74cbf12d13afceb237a24bfdcc2e05a6f6fa4c360a8dfb1ffdaf02da7a394b6aae5bd4aab85a19dc56f87cebacdd223713207d62d934ed41a35e03d0545f5ac9d831dbc6b7458266eb6a83b649acd40dd82a4d28c69d5185d5d60a5d1e30bad393f2d901a1e539d8f31b5268ee83f8a38a505fa7b94b626b7701bece6ecba6d3c99a4683b560c9fc3a057959924befbfb19574ccd0590f90b33c2bb66cd6a30ad767699b65508232798649e57697b0454a75a0d0ca28d5931c53623d5ca954454967494add2ffd04055e96827c3feb92fda4fd1fea46ff472de7450507464b4e8cca8e8c9c26c6156c99f259355ab9771b3567a98e16e8c4ea7d608aaf612f72755d8d7ec4b458a99eac55556530a41552653a94737c55f592945fb1b7e129a9ee2b69d35bb241ef56f09864333de5677b2a2cdc9acfa5c6465d335f4b5b7e96967c2c5bf7afb4e85b69d7afb23b9fca36fc29edfa52b6932177b30f8511add47e746bd95ecb784de461b719dbf6666c5d0f499bde915d7946daf78ab4eb11d99d37641b9e906d7941daf3806ccffb5136897009af47358f47256f474b9e8eca5e8e3a1e8eb6bd1bf53d1b75bc1a35932faf14ef263f46451f46cc7f215738bff1ad1cbc28e1aba8eea768d74751d73f51c737d1b65fa2be4fa2993fa2aa2fa2b91fa23b4cd3c2619aa79951ba60a4522bba39b249d8a76cf8a7a54d9349d1bc294933cbd5178bc51826ef1b2409942679fa4d9708fb4f91089b591c96f858c9b02b4449eaf213b7949f587a2af9b023e6ebd8ee9b643bf6b4955cec2c1259cb09b2cbb3e3769364d765ce2e4f768b79b25b9092dbcc945d9e57b7942dbb2e937609b3ab26cc96ba84d95dc2ec665de912667709b3bb84d95dc2ec2e61f6d3ee4b9730bb4b98bdbd4e7409b39f549e69cb09babcdf5db6ec2e5bf6866e77d9b2bfbd6cd954f6d5cc95dda5caee526577a9b2bb54d95b4c954dc5d3ae136e7779b2bb3cd95d9eec2e4f769727bbcb93fdade5c9a60af579a6e6ee92647749b2bb24d94f3c4936952fed25d7ee326497c8909d70bbb277792740a278e740a71e776b99c0c1b4067a438206551f14634a0bbd46c8f2a4602384c562b169a75372b2592b9382b321091b2228235a1bb630256b9b62cb15be8d903269dcb45da1786e054d28af1bf72a14e0cdf18412bd0d44893809955131b050baae00850240a23812c23126a26392386e469a164d4a63d3ab96c9eb490fecdd20bd01977a4db5553e9a033f703d6caef4553c730b804c5c6fca05ae8d3d144613661b68e47da6a0e558c120f7ad41eedab004d0fc0a41ea4b1ee0c4b2f10c05b74749a8e5eba2ca8e0efeedd3c9ebe3ebe34fbffe7a94ad317117897cf0e7334a81e82e52e25dbc12d7b3d1c29d074737d801a204d864cfac8ee5d7380819d678129d31b6cf9d6b7716bf9a33f7f119f2835f889e4f67d5a1b7dbe861cd8be55dab559907aaad632f3257c58e12faf6207b972c9e91e7da9a1dd1fc39e4c70bc63df014bb4177103d72b42bfe692cd4ce2df2694ab157c8c7e62fa0a2c6966d050bb2dd1b654c813a6fcf9d0f20d9278bf7503f4b6a1fa65b716f16cb147357aba42a0f77e36b765b2e96a21c6048c01f82067d090b43d9e8e2d4616f592e55eb692c410e02fd79c93ec75f47988fed1bd7b382db692c334b74d96abaac3506f0da430f9673f353b4ea8f57706d4d730b5fbb362d1abd3e232792e91be0d7a8639175477a83cc73c75e84097e60369f001b927692eb6cc7b67d957cd7e3d89db10b1b19f8d6b5c1827b3765548fd9abf17cf5f0e20b547d24a91a2f6afb82202bda50e2054d1ecae248150e06f4f3aaf4823c0e87aaa86af2beacc92359d344411a2a9a2489dac160912cfe05487744b3038afb823ad4344552048957345155086ef81ac70d8f04f74814f605599447437528aa23559486b24c70af8ac3244c74e4802632cbef9c28ef6b3cb45124d90a794996479258d0311e5a290da1b9d09991389255a1a04f14a724099a38821ea950962fea10c109556aca5019a98aa2a9a4f6645f721a7f6099470547ed75752cf0c25834759e877f648947fa18cbb2ae9a132c637904ad9990d4b409e9128ade2d5c330a67dfe623f3bdd805a3de7e2f6e6fbc8c77f07b76dd37a52ca00d0fae6792fb99311ad3f512c831f67749d19cc2ec8229e97d8cb0fbf17ac33ba7b4c8526b26ae4f16a673ed92b976c95cbb64ae5d32d72e996b97ccb5d564aedb4fe5ba3e91ebba34aea592b83648e15a2b816bedf4ad1593b716a46ea5248c2df7f2b3b452fb8ea51285c516b1d5960fab12334492a326ca655ec5d2d723e7660ec6fe11b162c29fabafc45a3ba2461586052c7d8a7db4029bc0b1bfb1f37763e2f83602662f814ef12dff8fdfed6071ffc7ef1cb1b73cf419cd7db0ee2c8e5a537deeb3ebdc21fa0d488d38e231bbfbe3f74510fcf13f00430a7ae80e5a8fa624880fac22ed794030bbb79fa1712f5e44012902060f562541417c83e40571ac42233e1367bcc57d06fc733770f7b95fb07def12f7f03da298e6fe3db2eee601b4ed6e0e1627a92174375a80817667fac7ef7ffcee41dbc0aa72082e6cedddc7f0a4cbfb73d707b14e4ba3fb39b46e1fd83da250629f2148bc8177d4a23c18c40d4bfadef56e90637d65a78e0f0689c7c43c2055b332cb9ff1efd068831ac1f46fe28a282c330e0693f8b2844c9129b26ce22ca17fe35f3c977202fd937065a53a7500637197744761ec93aa70c273152521a6695bc39f315a79a904a945e675676077067667607706766760770676cb06f62e4cec4d46f67a33bba4a1ddc8d4ae696c3730b72b1bdc8526373550126ebab41f78655a1047fb57968fde72be443f9887ddb4a6a0f6c9ce184d950b280f7b4b8ad35d8010007df91afd586402021fa473cf47e405ae77cd6cf2cfa264f7a1f9944978cffa9bc5964d7a9fe3251f142d480ea2d8315c64a6914d8328860ce502fa79599eed8dd0d0b383a487f5359e9128898e91d8bc621b5c795f8a4fd08034d8a328f7e8e6c7de1439b0aaf13863ee7934e52958a96091c70fa4a440a288e6ac5c6c9bb400f5ead0ccfc8b655bc85bd0d027b1268574fbe8d9b18612468df3dfbb708146bcde249461e27955ec9284298ccaac1e5605ae30f28cdba844ec6955e4c2b3608143375ba39fabab8df1662df972953183ee2a01db85e161c2a7c4591fce8cee714665a2171f41ec1df660f2f460a934b50212cb915d6970a228343957840c633e9ddbcbdb0f8e99ac6d627dc1e6ebb00636c742b4898d6f2874096bdce452a77026e5cd2272ef338d253b830e62f13e59f65d0f7464742e8aee63da240cb31ff686d0d52507a7c68b6813949985fe6a87936d2d02516e6c7c4551c4fb96094d9ace0fccafce2fd8f6323930bf3fac9a1eb86cc0d9ea0953aa069bad126ab69d40b3f96166cb0699cd4945f3860ec6d653d18c29736d35bdfddaf41dcaa82f0a5a5fe49572393cda4a2cb2215f46ff1bc99811255d5f3b0692d267ff5f6a0422946d245249e4842fcea5220d2ba26a4cb73a9ddb9857212792f7bae9b7267f4272d2d0bc061b42ef578eedff3483e3275895822518bc4cea8124ffaecb3e200d1300251310e4306299661535a70be2fe4c83b8d3036ec42b11996744ab270c337254dcb9f139406603d75ce797a376f697205c7d4c5c2720a4bbc30041ad81f044deabbb1bcf3c21b32027d12881fa07889a2b12fbdc61c7e908d230163a3b2f460ede10cefd095b37b7d4bca3707fc79e4361c2e72be83fb3d42fd8395af2f20d9a5ae454d931f15d86f5856894b0aeb06d0adf67ffbf6cd8bb00d996c12e59c1e31926c914e22d256f3f120293d6314b14cd2c02f57565d5d3ee7816d90862ef6e5dcffa4a3619a84d6bbb0f3f05539b16b5fcf81221badbf56179067deee3abf9d8273ec780adddf955d7616291de8747ebd2f28f30ba19de7ef8e07a5352f932883d33dee8793ac6fd402fb4c24c0371a4187742e86a254ee9ae38623c9fc06280637ffe030623ac5810b55ef876738b5939729a90368f3d2ef9880c53f43f258ef42375515199c75e7e7089c54ab984bd88f3167bf32a418815aed40dc75507a7c8bfe3c83f093e856706c5b387f8d9cbe8e3fa3e93526cb6850f69e29177308e541eb048a5642919215ff53dddea3132601aba73c7e4fc5b34c397c8b4ac7fb2b51d7d768315c7d237afa801f00fa22b12938a7e2495c5a033332f8d218d361c46e8523ffa1f1d465a24d6e7a11c8125468855facb5b185876cc963c9f533d1def13e963b6594b8ea24f4b6ac770ac1fa3658fff9586fb57aaee7f65e99bac6e3343ac90956c54b282d81094808f3373ac5b591292095520d1b34ebff88a7e8abc3b985acc1510ea1ff66eb9bc17aa2eeeab1923e573da36cf685b359f6d7bd96c8b73d956c9649bb3f87f1f0e56c5e57f7dba23e23baa949f2e3711ad5e33136d45a781202a7d411af505592a5ab36631aeec011d39063c25ef0165ea2887b5be3fa21af31b9667d8256957cbb7b175ff468b3e8e2df939daf675d4f577d4c0b5cd516ae858c971ae9026ea531cdcba85b9574d0b8ae626bfcbc5082ab90893581ec516a948d1b741bc7ba2478c66426c6d0ef6541650aa18066b4b26937f16395612206909bec6859584a3258b44f97ad8522eb004442874090895cdeb4b6f729ab5e438abec3c6be440abe744cbcbb3b9de8bb69138eba45d391a95f0cb25e0962288bae7e2326b3d1ccb6d4b4552e56ee649a152bd5bc9973213285f88e44356b0f9cb5b9f6dd8fdd52dff366dff0d52b482fd9f754ee63b28f3567a64cb36b9ce4b6ce276abbca7bccaabb5c55b9fea5bd9eaadb8724bfb3176bec6ead646454beaa48fb0bde591e33ef6da681d112f8a355f1b7bc2a5adeda67bc3490b24bdff53d2baae6e213f0b9b37e3ffae68f602076fdfe60d1dbf750cd58d9bc89d1df7d4ecb883c16aab287d6cfb1699ee03c7fe94dc2959967c6bbbe330fe47f83ada6ce0f787a3e47fc324e86bcb0fe280f4e53159fe93e0fb4af47e1553247a13db345aa28ceffec023ddbd8d3d93ad96398971b2af245f1d13bb7515a0847e09b740587fa3fdab650bd9b6099109713cf96fd7d231bd9767764718c319b0e660851fdf271fa40f8f47a716b2871948882414acce1c1cdbd68d43222973331269e6b5e5b156b2b50d3bf94a8e13643e1c9123b1f42e511ecc83876627b7c823bb97369e64c1ff6a93449a337beefbb40174a39f34edc37c3aa6dbbe619c9f7f00a6b3553c57131bd614d934f833874c33aff2b98fdfa32f67d03b06f8c6f58e434c19cfdc01edf614d664e40ac009b9c7629286d3f9774e4e7aec89c0f86154918ba870980a47ec714c1b2eb7254906d1f5526359212dffdb1c996c3e91842b1c1d12ea1a5862a4c28d3d85d159de86c192c808cc30a202043946fc68008b57554286458197deb2c058eeb226508aab7a2656f0ce096b5f0a890c28196c033ae6b996f9cef1ad70373b3acbc3440325ec6b7a97cbef718ba8ef50ce056ef2e64ebc37ac33d98179e7105b2ba709f123095f62b867245c1a552517e1a5db3028e6f565fffaacffeab2ffeaac7fd93feb5f5fc1cfabcb3469432416892bb520196e52dfd7139930456c70521d65b8539c25c40817ea027e45dd7fdcbae11b77298b43e426d5267c9c954e6c8b5ec58a28e16320e6ea44849069d1fadeac105f60cf608cbc9f5ab884a7edc9292c1334d2198d391645c77a83c9153cbc3c4be2822843861deeed87a79d60065f585fb01d1dd0a151b4a8950a5f12604c77922fabd865cb9343ef2d2786460a4f3a914b0eb1d73476341d0133858255683101f5f55d94108acd2fe8fe05f28268de93f86ac77628826684fd41ff3951d7d91d23906ed10b7a7f75d98937f47e22ed0abd82112b4820b177838940f3b37794d669898dcab289aa2caf28db5093794a728d8a3c08cff6151d02ac431ee6b3bd58b7ef037a02ebee44b71c6418e4a01be3a54d24599e548bf0d22a8a97de4968331662b0f727b08c32fd070973edc2d423b3714981b14b7cb36125f43ee2263a860ec10a2e90243c150ac76598043eeaae439dc144a76c440c333fe96c4ea324e654dc3f1de62ea76fd86f06c87e137ce15be6af660f42f86ee5b9662ff8f07dca879d003a222d285ab2916ff1b9c640804563b0f10eb3d7e467b6ed61cfc30facfbec81fd3b28c0b66acefa72a4aa2ab5aed8378e37e25bfa7b1d59e2de698680b9a8cf564314f9a99383345b4144e313faae132f6bd21e9165816e22ff569f21722cd8a942137e3d890d34a3ab932a28d956f706bc733f70a7a4d155302b7f13cba24db9cbaad49234a24a57482aab52cdfbf7eb51c7475467b6638b039b837d4724cbabb975da819a01c54e0cbb28ca648bb45b3a7eabe0a47ee3f57857ced62a88877c9ffdbfa82825f0579fcec4735a023175c556a2f2be54166deb0cd2fa7cdae914dad2ac2160fac4b26166b64819009bea66b85cd5c178de26ee1d0d40b6deb6c7e2ffdfdebf6eb78d23fdc3e8e7f155706bd69a4ea66d99a44e5426e9bd1dc749fb991c1c3b79669ea7572f2e88046dc614e9212927cafebf77d317f07e7a2f60f78d6d003c083c4900495196839e59b144b10aa742a10054fd2a5b0209aedf5abf11ee3be9b9a8e4d6fbee2b04b77a769d719162f55de8072df6e22240ea9a18003aaf25b38173d97d663b23425bbbf1dd58d632bddd60561e174969832fa5cf5a8e2554a931b722c919852544650d2ba12fedba1276892495b15849e5f1e6deaa34d678dbc06a97b13466bda5c5d2aa2a33aa8496b26f52fa9ca1544255345e52e2bc355426782bd3244bb6bed0d4f0c81251060c4bef965a270c9dda443a1a0a441d192818050c34154b3e6f6bd956779686af5bafb9db432dc6cd5a54bdeef2b729bf92b2b46af332c9c0a57411e4ed97eaf5ee589c56d53bad8a3d2dc8c7d8bb62d3d9e5dc76a35bd8e4e8d2f416188c95f954356540df4ad5f5f8ab60fd99d3dbafcc65f0b5efcda3c3dfba2dcdf369bfc1f912da6a37b9aa6ade6cc2669bad2605f035bafcde29be5dca8058c4a8122b708a04886295178ca8b4b20babf55751b96b8af90c9a2634ff15e79032bcc5eaae61cdc5512e9c09f804c30ea32f042b6a449a77a72ca72349afd611e63b0e755a45f39fa7d75f18fa6ef5854ef7b5f05731f249baafccb30c6e61ec7c8591f632df9397ae08645b9c6d69f9ca06d73e985fc6582292197d8faea37f458b2106b19cf7a434e7db5b02259175e27f1e7349984657c7294c2281e880a027addccf4ea25001e25815a79d53b08f95fd1d56399c9564e98aaea923d08e95cbc40c24c004a35542aa57d0f5d0e7c85583f22f48fc24d4097a789380908c52b684095544955f00b9134ffc18de91889d17bd7f47a82651bbe27c60ef222782ab352dbdf1be9e7cb3639781386757a6fe0afc59d6f0bd7becff13dfc29331c8c0917cbeeb4968106267b6bf2609b9920aacaa84f3cccd17f3955b0205178018ac801e68d0c5d570260558e43f42428d7016c9dd73c3d595ad44e1b8a29a5c495737d071a457ceb5a41e4efadae1917238c2c02d74ff44f811b9899a0a68920f371e14e298936d7f8e1075f55599b76426e62599ec513ac8fa912e025aa90568a5f2c896b76468b8235beaf473f12c873376a00062501bc320c7293d6ea9c43efc87cac7a8c57893ca22ea449ce4fc208a47338d8664f3b1517b1d5175acd4b0478a674d8d7aa4494054d1a5a329684209c7daa13245561ba021d5311fa71646b30591deb214b726b8d40159a3f616cea8dae5b6b58e2c3f5b6bd6a725675b2df646d9b9dbb6fa63752ed7b047d61dd635ea9bdc015e235e2d4324570715e700388af6cdf11aa22c1647653cd80a4af61f115c0165adac7bbd2484afda3c59c7280ee2cb1b1ec71bfba3ccbae0ac318341c150f54a5381a10d25f6c03a2ac6b8cc6a908ff5a18e258184eb031d298c5c75bc7abf32cc31df750ce18df948ca5a035d7b6cf986935e2537bf5d5c0b395bb571f9636860c5c2c65bfb68f56a54ffd2058bbb05d452c4d086b5ebcd66fafcaac2d97ed6806e81c3d13a0e47698c6e5984eef3e3b2b3a8e7c7b9d3d5d5a1f2daa3dcf4b5f8398194bd4ae09fa9483c253a10ccc7f7291a1d662453d155e4803286dd5dc585658284e8f49fe5312a1b64a7beccb0ca4a731929ca064930943fe13f2e1b80f4d7248c2f6215a4617d173e34ec142cdac75975e0abc59d631b68b8df7b66140e4567394535bc87a738797d26a12549677f8ab3125dc70969986e5a3e5e07490ce41b1ccf8a98f418478b005f431391052f09de32ebed58259bb36c74cae6f0964a4e6410d844a96c788b9db91ae6dc48ae6e65c88d49d205d0020b273c8af24e457389dccc25f72a54a73c4ff3ee98111e340d120f1d40b530c9376bc2a3d8b6b3159de47bc55334ca79f54fb8c4f137512aac38b6f61c95485ed3e5e168a44c46aa3e5586b23e0426d0b5e140d3c7d3c150b62623d39a0d56998050af912ac5d4a4641d7740625aea9399222b33d5d46519fd331cc8409fc1e1509f98161cc2e174aa4eadb81211087a5cdb5c9bf9aa8735f215490c867a7a46bae6277769fc24dda066bf703cb4eae14fd29de7872f46c3812a058143523321e586454cba459df4936dfe24e1ec752f70c6b468e0dee1a0f1ab856f2125f9bf1211830b640c007f89baf5b36b93db929f949fa410b3893d0e48d5912e30bdd889a44f3d8f3d149ee05e7b8a6f35fc38d2fb24083cc326a3db936c33d3c5b6198daabeea15fc4ccdddb1e01b904b68519d19a7b2c296363586e9d358563257988988554b1d55959cec09a97b8c52177dcb885e3b824718f34a1fcea80d1c60078b8509dd23077cb16bca6296934e38699a3605436ba4434d9ea2a187535d8370a22b435591654b351579b255c92ca954899cd6af7a8b52cb2a989e876dc89c5896b420fa81433acb7a61f5ac1d0d59361e9c121bd8a177bf58040d4435c3425135285b60a8abe321d087c399a183d944d64d1358f278686a100cb72aa3746d4a84b346651f8a54d255e716c74cbb575fda91c34c9faf1540fca4dc808cca2db563931f939d973db751d37c5420f6a3a008e26de27bcfcd250e82a61d46fe59b1cdfb097e0bcfd0c3fca6216257e1bf5670452bbefdfc785554362526aa7f457bee6d3b0cc1220817aefb489a6493acac21c43bcb47d4ac104dba107cc1b32a04b68b54ee236a5c31a5ec631831b4cf867888807d0b1ec9d47a14cd70b0d25bde036cb5dca095ce86a187a7157c5c932abf38d66d13c9a6fc401a54ba0bd8f77661a3f3b1485c7c805077486293ed3231d4b85ac5817774828f404f4c33c61fe3420a2ae5f5fef3dbb7a54c427fc1c003d539c9266fc476746d5e04ceeee59278e53769d725042646f86bc6c3c934a734aaa08cf0eac6fbfadaf3e74d0ac73c3edc4117f379b90843ae5ead42e26c77a644273d8f61ee939d73e40efe585a13a7f5793ccd21c71aea7eb628fe5a7ed984740a08324154e4491aac10c7406476ef7672397bbc892cbf498e2995cd94657bd1985add4c5dbde58b790c98ea9edb59c5b44386f2b31b989870c4d2ecf4edf1e6b759ccf198db84a5ec9cd51b936a4ca4a5f665cc61ba994364c925f2213315195b4c0991c24e142f1e09a5ca56bf584927540346aa581926644366b244e9249494fc3c3fce4ddce7f17d303d93e347a57318dcdd39cb0feee73b1384915706a4b24a67aa9863939fd3f53995cdf1fadcaae77ca3b6e6744083fa657542936e6b42cda2339ad42da7431ab12ad529f539463aa6518d6295d39c47ac819a352656480d99c4faa93197445db1327a7e9cd759d81e0a421fcdde8c1e5b3dc59cf4d5ed895c6e9fb85ee82e1c27fbe2c2b5ffb380d9675471797386a1ccbc22eca8d832add951d1d52ab6bb2ecfe9e3ae5a9e55de9d0d7559514a49514aaea8016f512ccb4267adcead21dd955bbae074547cb43a75d7d678296393af7c814add02e375afc33e8d17c92e4b8c57d46e8b4c96dfc6a5928386fc324c55e42c5dcdab17e9aaa3038cd29033262a09f3eb2b0f6dd922c9435fbdd271b620b75c71d521bbe6f0359fef7d16edcf577e4e85731297ea611e1e9132e52c35d68875a862b5c65bc558377193c50aa6065da225f2a4f4a42f99e0cf57263ce1b70a0c58e1a50023cce984d8be3f213f107faade2970ef4190de20fc7fe5f8bfa3927f92fffeafccb9474571ab7a109face8ac548a5e8a0e48af22b817d3f7ee5e795fdd9e14787e18673092a36f67f44625d3abce62eee672a3906765de4d492a63d44f3de9c636910847f9bc22f09ba37cf6ac0ca7bcd66bc4ac4c0d366258ad179b363aa7289bd532ab391b766143062cbab5610d73cab629b752eddb8869a48e9bd62bd6cfadb0891576e356c51abc399f3b3ad94d3346898eafc92b228bd5eb8a50a920c42b47463b523a9a52c5b4216992e471c02121da996024ef6bf4ec387f1d977b4c96ab7236cf83d0c389ea568bd88a0adf96e10c8952e839d00731b256748b869f175eb45d3b3c2e7d6ae0c839e25f8c91f42a7e2923b46c07de81f0e6972c55fab8aab05f9effbf7e3b7d75f2e9e4b7bf4a477f3f42e6bb69bbd7cfa445681d69f8c941afd73bf8f8e6fc8a24810c2403b8d20db88712902e96e10d5a81ad851b2dc5e10d08251bbf8214a5297dbd81f8192484e8f98177075d68f60f0e3e0710fd80de5c917a386324322e90ad2039deb56de0474bd4dea8584474e686d027fcb0584a9e15f14e38d85159bdb852e7a87de98fbd0332dafd8313171501301a17628bdd448267a47d96efcda5ff5cdb41ff62f931ec7f8c2f3f03c99e634f6ee963f4fde000d91ed27ca9e33ae9b8394f4c1ba0ea1e465ee787528c7df8f4d9c15ff0b4915e244ffa49f8dd93a7077f415216fa9e837e8dc8fb96ed9aa737b6633e894b3a947aef9618318cdcef3e3df8fdf75f8ae290416124ddb4b823e299a030669ed112e0f9a8be1824134f25f229e29e3e2f983f67e4d7d7943497fc5ae5989d5eedaee2090bd7b5d5ac2aaf7b6b715b7b055c8b23c3b570dd76575d15d7ab67c5f571cd6ea4ae946b71e0ba66ae59c7aaabe7baecd65f47d7e29abfa2ae5bb5c2b575234685abecda6d2b5c6fd7e754b8f26ec2aa780d5ec18d323c8a4a9068536c8eac75254d5ecad7b2c25f8bf9f5b84338de4f5acd4282a738db7b89f0f1bc1d4b182349e9c463a4cdea0036a2e21ac142c7a2d258f864164f16829c6a6722a95cb558a88b6b13235566252fa5892c117a4e3d8f5266bb9fbcbbb5d36cf55afebcbb62a27110c4538d8b22996c6c4478bab1be994c38bef7e329c74c543ae998a9b3d38e95ac38f1d82859a61e1ba7cce46323c94d3f46a2ca09c8465f9c82cc74994958411563e46766dd731f2e02f816042171665f3b19b3af324e484ea2785272532513939d300a77657f5b4f811b7869e249ca4558118bcfc1211f29cd4e5a9cb0ecd42c93969d5b66e2b293e5262f0761e50466e7519cc45cb49989bc8612875a97cd5c02a7f62a82082336f20afa7e45fb354e66913eb8f3e1bd0dbfaeae357ec9f43d4699cabf9090cec1dd27fbee97e7c7f18783a876e81b0542f63cf99aa6172067073720b82ac9b280fde56310aa283e867c01a8372fa185cabff964cf2306e4442f8623b33140d589e35c659f25c79b09fe911fb1f8e0be47d2692ddfa1e6806be2541bc1261154b21bcf31a17f3e8f7f494e7ab00f7ffaa5c0ea8cca544055967e9c248748332a7cbd9d453911de7b09f8557a9ff4dc367f210a8444f50330994d27f2449f0e26401f4e644307ea18e81353991803431b0d64f9f9b16d6604213e5edc36ae412f8534e8f57b69957b11605dee881371fdeaf9e65bf43a350bc8351f12a2fb8c2c1f97bc1c01f1e3f6ac3a2706bc230fd3d3dd0c7a557007421b3868c48265f67aeeeb6d88cac5ff1e64810dbf0c7f21e86ae82ffd0be28b3a197575f421fb53f24bee07240d37e811da77461fe8dfa87c14bf604fc7d5b77c7d22443860f89ebb9cc775cb3ecbc496388e7d1778b6b922283ca2df47627ded83bb1bdbb0d0f4fb850480118831fa299d81a7ac4749af50b64534f6ef6008b02450e4761c8a87140416daf40b85e2077cfc947eaff0e880cacee05e2fd06cfd058b42fc71f52bd600bf105984e1f363f28dfad10e1d4c17fda50e1c66f89adb087ff9672266a1f404adcbb70b3704478712d2327670247d0112623b0744189fa2214ec8a8cad96e1621cf8230f8051fe8662e35a01b1dd5e3914a3e5257cb7e566e2b25ba4aa6d749f55ab95e23d9eb659b55baebc837bf8473cb78a594936ba58c7a89d2af6416e772d17f9ec0ed48c910630782047687b499fc9cbe1f2d5b0410f938ab02d36c4799a53d5afecb7ea9f6cc408bf311617944d6d3a339b23daf71b29385ef13c0ced83f83f674c8d1242920e217a99ea860beba8f587c438b3e5a5908600c55a9b8e73efb0e55553c4274c72721bde47041797e9cf9be7aed12a35926efacbeac5eb882c0376e9237a86fab57d002788fac0a3c0d928fabc039ba5acf4388ef988093c95d44b07b5f279982c8b78c17896426d182c93bc98328d114321d306ceadc0e7106ae38355282dd53127f62188bf9c2493deb5d335b9a657f83e6abb884c83689d9666c53f41209e2cfaa1e5c7934dba2bf9945c73589f632b34186792e48d9c65dd472b63673011c6ca716edd5d40ec4b644059868394627368475cbde0cd5c99c816d2b08ac71eda3ca171ab9be89d96b7a9aeb5a58d7e32ea1488ff9a1a488550afc7baf763cee43882c5ef8f65ed7ff0bf0bf40a4fb83bd6ec5d24153c5bb6d0033f4105a813476b8d8ef8120ea18bafbdf06cbdeff3604f77bdd06b49bf3ed103a73b0ef1245b564cfe58a6ac99e4bd7ede21e2c827d97acb8157b2e55712bf65ca2b0ce759637d06d8001f420cc10e002b437d2f7ddb4bdb1a10ffc5b9b9c72ef754bda41d27c5440a77b0e07bab71052d4ae9d1d408a681276d4286a4fca0e16456d01d9d1a1921d173b2654bac16147834af713ec9050a9f9ce8efb94b396d9519f72c6293bd853ce16e4407da26c2f0ed827cad6e1807ca26c0b0ec8a7cc5ace81f994593b4b109faae8726b554239ae0b52a64c1a40a3291a17c499326d866845a994fae835a4c3eb93532aa73e134a05d56792a8a4fa1c5215d5908565376681675d7d163995d60aa3668dcaa9bcfa8c280dd89849b32651fab1d960a7eab281ecd3dab33e9b9c327d00606f6d22d0f100c7b509ce45a9e98e20518818745416b500745422b55a745462b2b474545cba0e75599e65775b1ed69b1d95975b0ebb2fb5c3becd2db41d954aadcadd96d861cf52eb7d87f324350eba5275b425d1519939b3e351631aee0cc2b11530c596b1d128cb8807cb89c8260f0165a3f0905186060f59622df0d0a44b3e379165d720c24a8c8728b782d624e5ad6a6e2de321a516a41a64bc15a59606dea148f53b9784d14a9a8730a7693b82e36b86035806e627e0da1ac1b5517ab711e01291bf461c28cddc880fa5aa1bf14974772326a9326fcec5b2dbe0821553232e39fddf16afc6adcbad108d78514b461b7c1ab78d5a541a4b40baca349b1cf4b2d388536e1d7a3068872d033136004f1428740f1c856e5b4067d7d0459d1242732ddc59823c725c023d725c818270dc763075bc428930ea9d8651e335102c035d1ecd8686aca9ba3cd1347d68c9537d666a43dd9c28aa3202ea70aa28bb8ba4c635450266ae62a9e37a77134e1d172622aa4544f5f622aa89a401570aece0cf3f9c7079ffe71fd23d74ee3d0c7f710fa4f99f7ffcf987ffe71fcbe050fae2390e90bc9b2fa8304482051ad7570a160b172d26c8a65d001c84ed835bd40a3047b20dfa073866dbb3914e926e111bb4b4877ffe814a09a548c853fe21e2148576a39decf22644360dda65d968d7788f782ffad2bbf45509319430960b2a0117e9dd7ad2f236b0316b44851825682f2184e47b0830017a2d6e6f5ffa67a6f45bf216669b7404ea8720ae91ed4a68a9c158208894b47f11dc23cb6d81b65d2140bc7dd2de7b1b487883fa85748283f910d0952fa02f62d1452cfae38b4547a6303e78d8188a1ebf2722d1bb8d441791e7ed459e4b7ffbcfc20bff91c1118b1e49d2fff93f92f4d333e927fc21fb5a62e646a841b73181085fdf6df83a7d6c10676c4f8eafd2b13dba43ed869951ec498916fe273e664f94732f42273f3769727d85a0a78f81a68d3520a3ed8d39d38723c5d4671315eadac818cf469a3a1b1916d979914ae22ec7fc5ef4b8374a714ddee79ad2cfa2f965faa2599db126be22eb191a9166bb316c41bc18c8e34934c0efd0e0da17b82a9bf769d1aca2366bd1833ef59c9eae4f56cd7c8a556e72837c12049e611369e849b649f7bf9e99f6f447dbccce0db284a25d32d5cfaf573742d418bf2ecb4594993b8968b2496b84ba682b8d2596f0d12733455666aaa9cb32fa673890813e83c3a13e312d3884c3e9549d7622b3a4364c52cb53efadcb2da9ccd62497706f437675e56149afda8ef4aaba65aad64cd506fa743a85fa104053d72c79ac8facf16004903a9bccb4cec45765975fd69a3f0601565b9160f56148f0bd8d6cff86d28b417a91b61a68f254917555850a1a7f3040e33f5174653601703a1c6913206f5f7213bce00d52cb51e32d4b2c4ee61259a25b125adcd4560476d099c0e227e5862f3b6cd3be05bd56c03ee7f6618fa24dae0ef101227126b01df018dae4d9f84015c239d8f741424d998320009ee3e9c0b95d3c9ac638dedddde251cc9f180afe11b4e4c7c325a0e2916596e8e58a55801da4a052e9b2431694eb3876f482a24a61c7312899c1ec8806e559abc6ec8465c0067542c7796221cba82ba4a039cb8254346699939206b1a805a96987572c45cdfb2e96aae68c761327db4a840a6b511502cc567e3e1847a95b7e41da3b0b062a9b1a5d854015e6d10e0a8e275db7fd9dccd08e4b6da1c09603bfca623ad6bf5f315feb30294cba1a4c7233872b1aa620fe75a96319aed307b120d62115d1382d47e334f012df7034d30ad7c27469836b6efe3473da2f4ca8d6d8c533ac957e8ca75c2bbc445881082b78b46105527eca64bc82aab59d884378107108ea6420cb5379a2ab06f677511459d75430d421500104103d35a18843107108220e41c4213cba380464b9849927e81999e5cf8fe9c94e9e7bfe3570edef209e4999af99a9e40576fc4efa91fe1db5d020da88fccddc88836f380602fd9b996873603b787691bff42fbe47048bfcc9d880b94689708b1f24dca26c7cb079f03db113be251f22ebc744268f4bec727c8f232196d83041d654fc1ef8f63df9b0cc1d68516efdf99e84beed9985abb44aa7f92ac7f9a899456e45e77972fd96e90091fa50049c8880933d0d38f9092ff864f328310595c41b4e628dc088ae3a6405fdfa932c0fe49f3685a2e45b0ae73388b642e6bfe21db1e12d705441d4041260705f92583dcfe51ef8646a60e7c360458d486d93858e6ce1d711ee3a82e6786f825deaf8aceaf27034522623559f2a43591f2205a96bc381a68fa783a16c4d46a6351b6c745265d972179d54abbc5219ebb46537d4ab856f0103fe6f2b4ea8b4ff29abeb2963bfa61eaa3a7be7b516eb52dfcdbabe83f57836d386e640d655d9d0f4211c8c74a08c345d510d6da61aca603453b724b1f179e03a676ab6daed93ec161ca8b725c005176b96be7c00615bb945bc8e64e7594c009aa7b23ad2e5d1c0d087d3e14cd72cd3d0a1311c0c34793218aad32dc978e158bb5cdaebd5b845b967156d0c3588ec8512c12e35beb624dbeb6484ab0f5b93f7fc38d791fcdcd56c1dc9cfb3980dccd91402451f4dcda93e1c4e0c7d064696ae40790695e1743052275b92fcc24573b9e4d7abf18392fc5c13b62af9a53252a70f5b93fcfc38d790fc8cfb400db1cfd2ab1a84c04086da5035d03f5099ead3f110e886a5a9962c4375642adb91f99c1b44a9c0d7a9eb4392f64cfdb729ea45a1e0efbab6843c3bb00f39b6ec13fc169ea1875c010c15473965070de7013189a330c8886ce6794e7aba418eac7bc79bd87c0ee0afe1dce161517604f370e3e12e63b1b84c84615b0372e238ded713d37c0d41b8f057673f754685f07afff9eddb264c4e6f80edbeb69d10897e299fd05f30b08938acce0b7b0cb02aeb3891099d56a802c185ed00320b777bcccf60056f5d56f952392f360b094772986ec4fab6fea011dfc7974b727cd884cf65ec3cd38c47467fbe4a17bf2a114896c468e309dc10c42b2334d423453b52a6ea91aa8cd047b50f174706ea341f38474adff0e6778b10f6d1acffeeb9e06b809fec72b7c4db37e766559fd4df55f2d6019b3f3cb5e02ee0626501569593da850cbc9dcc64595be3dded4937b6e3eac6fbfadaf3e74d261ae6f1e10eba98cfcb451856a890727dddcd72dc5628f78fbb1c8b65629f9789f2a3859697895a4730ad2f136bce111ed332d1ea018e58265a44c7106b845823f6708d283b906b7781a87164d9f6ea507900f7889686b60e3c7ff445a1358421a42e208efad9d63a00b0eed67124778373321cd9e39ac0d7efbcbbc55d034648bde070291d079f81b04aba97e8bfa377ef8e4c53faf5d767f3f9b38061ca90d1d91e633bf072cc777f9edc1e329490422185bb45f41286f17ac3984db21f855d1cc220f497e1976d5bc5bb70c36bf95485c381b1f5b39482f7dd633a41a9edd8284e4b1aa2228a85409c903cba9560ab8b005bf045ebfaffb1aa7ecea08c1f4ee10b045981202b10640582ac40901508b202415620c80a045981202b1064bb4690558a08b2958013fb012dabc9da36b06595e9a8757059653a6d155d5695e576e1655565d81ebeec68301200b33f32c0ec5fa5a3bf1f491152d53369115a471a7e72d0ebf50e3ebe39bf920896ac640057ba01f75002d2c532bc410ad45ab891260d6f4028d9f815c781a6f4f50663f1dd4042889e1f7877d08566ffe0e07300d10fe8cd15a92701d344cb0252f592e35ddb067eb444ed8d8a4544676e087dc20f4ba4e45911ef84831d95d58b2b758eda97fed83b20a3dd3f38715111607ee7e04ae1d3dce019699fe57b73e93fd776d0bf587e0cfb1fe3d39140b2319651287d8cbe1f1ca0a5439a4777ca3a6ece13d306a8ba8751fce6a16445c7cc4f9f1dfc059f024a2f9227fd0485e6c9d383bf60dc3cdf73d0af1179df425befd31bdb319fc4251d4abd774b9c708f44e03d3dd816fa2f9e4aeb707fd33977467e7d4d4973f1d7530c0788eaecc73aa380ba888628425895ae7d6f71f7d28bd0dfee53e8dc2c9055d9731a8e36d210a7181e295a2a13cc1e32ff32b0a5eb2b7a41001f0b55533aa85a491fb3c412a6676259cec7fcacabcfca9ab2ae3a436bc2d7b103407036537e479c7d70990d1a4f19ea83816ca94363a24f4613a00f4750d5c16866a04f63309a2aa63518cd0a213a750ea07174b01383b3eda478779e74c239019473a2aecbf52356bc06bc8ad5079ef917d8232786ea8ae823658521a031a7e4a91ea9925e117b913cd73377861c77793372261e545d069c38cecbf88d92d3f1b2b2f367e515a2c225506434313eededada76bb2610db5c9405754ec6d89bdefa70355d66740d5c0004ce5a9095a97a95dd54088557db12abc942e513cebd87fafb6100f6b1d5b732b527b3558775bb286693b3dfdd6b6c370b9941ea6b990bf036a6c245077430dbb76f33b85375ee7b75039b4d63cde45f24afef0bcdc8185e7edb85f79480a961b0f71c136e320ce595f8c94947dc542519cd7bc54f1cc2d258bb42b3dda54d6913502b07a297fb25d2e027cefc742c0475410033ef282207091e7448199961206369aa238f0d3c5025141889322e425209776668d60645f64130e7e9a148c9297b004e18f974509541a278b02f214073d2530ec7445a1a9471b0bce1a620ca85426293cf989a88a444f92d887c006b7b6ff05e8a6acc8863a84ba3118437d685a963e1b8c806e8ccc9162c9d64435603b1677ee9895dc2c5499bdb938036c831f25474347d5a116a59e4b595eeefc0859e855d6337fbfac28b869f3e648def7e9f9f1d7bcd753661077b11b7f8883580e13cedd9d3bda883ea21e4dbe076bb2a2d120f6d54b4909747d7ec14a01eb45beb407912f8d07e9677779d39268f25cd6b454f2bacc9e96142ab2a8892c6adbcba2569adf4b24befa31125f1d8bc44f22f1d34e123fdddbc80c424693abcf17c8dc084422a8f61241b9a8cf75cbde94a969d7298fd643ceae6f62d6b98ae6fa70f2281df3035c13fb1327e2ac1d8aca15797abc9d78da856fef75fdbf00ff0b44ba3fd8eb56acc094f7b9154863878bfd1e08a28ea1bbff6db0ecfd6f4370bfd76d9893bb10e8ccc1be4b14d5923d972baa257b2e5db78b7bb008f65db2e256ecb954c5add87389c23ad759de40d785fb6d860017a0bd91beefa66d3645c73eb724c46119aebb0880bde7266ef128648f1bd32045d34eaadf063208b56b670708219a841d0c84da93b2c37f505b4076cc8f64c7c58ef4916e70d8f13dd2fd043bb2476abe17813daa4872d6724ca8711152959c721152555518e481b2bd122a85998aaaa4a23253d1351cb00d40ba9627740ce291593b133a0619c9ad55092583a8e4d686849241628aba3821d658b06756af4f9bc1ce502aa53e4a09e9f0fae494caa9cf845241f599242aa93e875445356461d98d59e059579f454ea5b5c2a859a3722aaf3e234a033666d2ac49947e6c36d8a9ba6c20fbb4f6accf26a74ceb33cae9d606c84ec51bc006784cbb4162a2d474475035440c3a2a8b5a003a2a915a2d3a2a31595a3a2a2e5d87ba2ccfb2bb2d0febcd8ecacb2d87dd97da61dfe616da8e4aa556e56e4becb067a9f5bec379921a075da93ada92e8a8cc9cd9d151a9391ba52bd4bc8241d3197c5d0b78902d03d75196110f761a914d1e02ca46e121a30c0d1eb2c45ae0a149977c6e22cbae418495180f516e05ad49ca5bd5dc5ac6434a2d4835c8782b4a2d0dbc4391ea772e09a395340f614ed3f290e6d42517ca6241e7f121250a8cc41c46a25c8591986aac1af88894326e04934884b211074a5d37e243e9ef467c1285de8849aae19b73b13677b03a1e6f6483d555a3cae45685b67859767bbc1ab7915a48dae0c3d03665ac32306adcb0cce2d36c7ad0ab51234eb9e5a911afdc7ad5885771016b08242b20451f2ba4e8b6502bafa18b3a2584e65aecca043ce6b8043de6b8023ce4b80e26c4f19ae8ec788d1221d50f27a47a79abcbf2086a40d174653c50f5a125437d3a180e7565a019e3a939195b33e58186542f771152bd1421d522a45a84548b906a11522d42aa4548b508a9de1c6f1ce7c54cced1e2333811602d02ac4580b508b01601d622c05a04588b006b11602d02ac4580b508b01601d622c05a04588b006b11602d02ac4580b508b01601d622c05a04588b006b11602d02ac4580b508b01601d622c05a04588b006b11602d02ac4580b508b01601d622c05a04588b006b1160bdc300ebccf88a20eb1f3bc89a818b88b17e9031d64c7c4488b508b11621d622c4fa01865853768408b3de6998b5ab431cb4495643db01fa6c60cea61028fa686a4ea39cef3330b27405ca33a80ca783913a793861d6b9da7713669d2b5484598b306b11662dc2ac4598b508b31661d622cc5a1299ab4560b508ac1681d522b05a04568bc06a11582d02ab4560b508ac1681d522b05a04568bc06a11582d02ab4560b508ac1681d522b05a04568bc06a11582d02ab4560b508ac1681d522b05a04568bc06a11582d02ab4560b508ac1681d522b05a04568bc06a11582d02ab1f7460b5889f16f1d3227e5ac44f8bf869113f2de2a745fc7417f1d32245f5c3889dbe05811da2557019823b70132ee6e819c9be6c0c46433833a13e1d42a80f07a3893e1b6b401fcc66aa295b336069c6430aa3ae6a485711d555e58be06a115c2d82ab4570b508ae16c1d522b85a04576f8c3c3efd70f2f6eceaf4ec8914a11bc69672f4e550fae96f4ef88ff79fdfbefde527e969eff8617066c8bbbd8fcd1621ed22a45d84b48b907611d22e42da4548bb08691721ed22a45d84b48b907611d22e42da4548bb08691721ed22a45d84b48b907611d22e42da4548bb08691721ed22a45d84b48b907611d22e42da4548bb08691721ed22a45d84b48b907611d22e42da4548bb08691721ed22a45d84b48b907611d22e42da4548bb08691721ed8f29a47d1567922e56b9e89216a3dd49fb023a027c73c87b55787ab09ccf3cc7bb5e5e26d1187128f99142c591bf43c6a07db5f02d60c0ff4544f6fccec17cd2b07b850e67bff09ce5b5e7d609654f389f3838ce3ebc9993a7d958fb4cb07f42f0ca075f6df7fad7689fae5404f6675ffee439e4d5e4f15b1ca84e9e5011f5892d9bc30d60c208a88cfd2f0bc65fcc3d30b703247a685d0103cb9495c9401f19ea581f8eb5b13e1dcc46fa780a2150ac893c1e0db714818fe36e5f0ce4f124eaf6ccd0b384e7e3e6a0469899007dba713de9099695a75d05e7d365378dc8bfb8fcf05fa79757bff5ce3e5d5e6953e958faf46e307a7dfefec9d9e1fba7bdc3972757676fce3ebca1dee91d9ebdbf3a7bf7f2ed197ab2c0ea05b8d227e823c944ab1270a474e64957cb208473499922ced00de01cf568eff01d223ebbdc48fcda478d22b4bddf7969a6720d1aa5068d5a83665083665883665c8366c24ba36255c24f33e2a751701f9cbd7d7b7e71f5e1fcd56fbd379757583ae4dee17830d194c1e4509d6a7d75345155559195c3b767efdf7cfaf5f3fbf34fbff5b0224792a7fcfe7b2abc27a7a79f2f4f4effe737b98f1f5f5c9ea3fa20ae3e84ee57dbb8e91dca8727efdfbc3d8b3898f01afd821ef6911a1b8e06ea541de171190c1031aeced9c5d59bdee1501d69e8c1e987f7ff7d767975fee1fd6fbd784261b9fff4eb07f4e627641805f7d00fa0f40efa06c08b00c5023569822b74727982287007bd4533385c9850f22c647d860b1c1e8d34f2b5edb257922a40d364255780e75e5796a04e6a15a1668b20cb8f84942e6aad04c2623bfa5324b18757a72749490b64782df19865f98eb27c5f631c020922430887871e8ec8da563ef6593ee3323e2e5a4e6e0823261e689cd0585ffd760afc100636700fd5df0f4ffe7d8e74e59333a43d71b50e3f5cbe420520d20a818cdfc7da96141f13a895049faf4ede9cfd7675fae1026b6034722e843838560a16fe3d5c1e22e3fb2e416540c6c5dd1dfaad8fe6cec9e5d9096aa8ed3ac035a5230959ee37c89297f037cfb2c817fcdecb971ffefddb48eb6bc34365da97b5c3091aece9e140e98fa61961c78beaefbf5781bafc8cffbc588473e9e7ef9e0b5f0c46d2cfd071ee821768e66ab2f473e87dbd0eb4e10bf990fa9ff4331ef7e005a2723ddd44ab5635388c220faaf16170e5aa216270039e45af6cc08a295d18790064500f7063c890ea4d64652ac0646a82c910eb488a4c26e96679ffe71fb7686b6007d095be783726b21d8174ebdda2f1b08305d27c6803815ec4b6d5225cdc03f23326c61f4260279cf00b61183ff70270840d38b466814369798b4193fefc03ed5602f427a2b8f56e42686798ccfffce3cf3ffc3fffc0efe317fb07198b4ec287430059ec21aa6a5ceabd870c54b49b5e389e740fecdb05aa02e2e82192f825245da86140726ddcd3680710fcf9878398cf6df42d2d91bc8e2b122c3c54d945441eb519f70d74fba5203c86e7869927e81931399f1fd3962779eef9d7c0b5bf8318b626f3353351700da277d28ff4efa8cd063191c95ffa170b7cc30040e8dfcc1c9a03dbc1fb76f297fec5f788a8903f9953955ca3768335242c7061810b0b5c58e0c2021716785b16781736f8262b7cbd1dce688937b2c56b5ae30decf1edc3e4959916f874f77b029cfa2df9101deb9af61c2dfbf89206070c4a88e58b5edae3e4e8392600dfbe271f963917340a952ddfbd48ea3db310a159897156857316b5b7c8ad887546a23a333d21f002055e60a77881fb870fe86309f59154dcab92e5a199e2a35531713622f7650ebc874e10b706f7a387bd9166cbe4b22d320483d54d5a748315a039e5c02bc2826e5bc434b70f22cf62d9955797e78e833ad4b9bb01e4a28a544ff76fa2ca1948d5eaa1a747339edc25e7160724b47881c2d79d7a1900220b0c62191822feb7c7803d574ebdaac9e67771195525197864c83a55e453c4f38b839b58ba24d26aa87f418046fd0adf17c2d76428d2698406e38efc8ac6c1f18cdb686a35efd919112d9db83ae84861e9d8d6d089685575c3e0db33ca3ad9dca5a8dbf0bd6a393355191c2a9a7c38960fd5d1683333b21c606d5ac57086e7ce663ed8be83611513a676452cb6d4693173ccb88ae5bb770c6c16a183444f5f3b0683d161f47fa6114858ae1d85c0736c939d1711bfcac1e8ab634e568dfbad4ee3ca554064f8dc49f70519906ed74fbfe34a46b949831945035c4d124d0bfce66a0655bf9d542f9e25c73c4d2a9f16d52cd070506464e0d694478b2a21cb08783561346634c5c63ec06247134442bab921454164a956557518d75436dddf745de55b59db5a5bd74c2dc6f5f59872744a377ac402ca5cc7e4eda4e7be17821cbccdf3c0fe1e995e198cf4d4a4db0318e8185239b93bc10926c89f70819d3bcb1096cbfa3f5b4f389f41d384e6bf626736c35bb8a906b6f1c7449be73867b8dc039fec5fdea36fc18a1a91e6156e391df1be5b47c801b28cd8b926de70e06dcfea0bed77b8f0e14bfaadc2b3ccaef5c31dc0de4c789795f99ebc7445ccf7d8c16bf9ca06d73e985fc6922599d1f7c861ee579ca1047f45c67ae27c9a6020d356f9f3984bc25422829b6e92d186e2c487a027cd80717beda321334f22db9fa8d7d8ff5519611fb6ef89e75e5ee507259e81d15e06b7cfbd8ef6705839ce80ffaf88e568e503f70aba1efa8c0f7da3ed4d3ce53e90f500d564821d10a17d7d13c65589d81226541115b523ce8cc4456e8ef62cef6078e3a13efaf7af8461d4aed807f11dde63baf06a4d4b6fbcaf27dfecc801307113ccd43f4e9063da7ea4cbe2431f32061f7c1bd520de847ebe43f63c744ff1aaf5a2f7d7c40730a9c0aa4ad8e175be98e387849917094db421806edc9f722fb3e15e0d67528045fe2324d40867eff13c375cb9a74ad4291eaac9957475031d477ae55c4beaa17678a41c8e0e47d9de89c26872d33415cf24c8281e12fcc1c8b63e47883afa2aa7a28b3bd764aae38eabbf7115cb6c2bcb6cf946f62d191ace8d6cbd7e46dafedad54d10dce87748f0a0ef56ee29583ad20077ebf701ff59001f3271228b0cae5815afd13f543e46aded3bd714c1bf8b2a982fd458e81bf6dc35f96dad23caca6aa1477cf055473b30db84fa5de2c9dea047ea1f88e439353f2828e558ef9ca09455ad63826a4e2d8c660b22bd65296e4d7031896ed90e9a0e8dda8b48e63a4eb1075cb4442343b45d6e5bebc86249cdfb34cb935c32b4d81b845f47fd1195d5428f7c85e056cfaa5e176925df857ed0a86f1601d26e646dd3d72dc44cbc5a3e2eaf30bbe8c32872465462df1caf218aed13723c989832ebdec73608797965adac7bbde4ecafda3c59c7283e38cb1b1ec71bfba3ccbae0ac318341c150f54a5381a10d25f6c03a2aa683dc7527a6eb8e4b4b4f26d79d96969d97ae3b2c2d76ddc6b3d2428fd51be8da63cb379cf42ab9f9ede25ac8d9aa8dcb1f43032b1636deda47ab57a3fa972e58dc2da096228636ac5d6f36d3e75715cef6b35dfcf09c4fb0ee9c9b9f51f09e52b4774eb176c9643eab285e0a945d0b9000ff92b3a8e7c7b9b3d5d591f2da83dcf4b5f839f1fdb9822176d70ca4bbe4a4921c9460dd989e5dc6c8fd8ad693bc199271230e51c6721f9db7e2e349278a30bef36d1ce01c1dc47e3f4f60f0e9d890d28ed9243bf5658655569acb48596ac592f3fde3b201d86e8ac5e3b5d91099ee833e5e0749cef537e08eb0ed318e16701cef2b341159f0726159ab6d9ce92d701c42a5055cc9260ead4ff8cc3ccf49b910574b664e6410d844a96c788b9dd9656649fac2103a806a21b958d3cba3d4137fc77f62f8abc40d129f8e2396e766422b0f4723653252f5a93294f5213081ae0d079a3e9e0e86b2351999d66cb0f209c3993b31fd8b5eedb0ffb806ef57f5a75cce4c9a3b63ddb03abe221ea1a89b77891d105f7bae0004a2077dea79f4310610c0571a0952e3491078864d86b627d96683fed56d53a7c482a913114deeae06dfa55c428b1a99d72b0c374a1ad2a75169d9abd04458e97bec72c9664f99da20e1cc27f82d3c430fb912cf70b8ba9d074460a2ab22568d5564f33980bf86738787459573605ba9c9ca2ff2c540ec6020c04add937056503f791f59dc5f7adfb6350c843f34af4264b9d477aec5c2f2ca0e30765074bbcee0f4513a9aae51ab3e9dcd2d8c800796b70114f36bf78a2e8e9816a3b1bbd1486d8aba1d7f199b1f6964ebb646e004ef334e4cf375e49e15341906c20b83ae3561822a9d44eb18b14d599f1941aa7db924ae6f4df85cc6f863cd7864ecc757a9e95fa5cf930d4184ce00dc10c4fb0268a8478a76a44cd5235519a18f6a1f2e8e0cd4693e708e94bee1cdef1621ec8339f88e96d9af017ef200f710bc5d765e791dcab1e7e22df4fd9a739cc2be8189e3c56a735bc538ddf232f07632b3a4b48a5deec536d6f8eac6fbfadaf3e74de612e6f1e10eba98cfcb4518566889d05f6c5ff5b79196934ac7c7947fb16a53c39ea4b3ca1e67cfd8b9defc634fe2b9c17261cfedb95a748bc93deb2436e4c9d4559698ad6a909af12c1bb4566a593288adf02d1bd426e9d39241de4512b556d297b026faa9929fce320d950b5b87c5574b66f7952813e3ce92e62432dfb8c09653e79465c5589fa2a44aa879b9944966cd9a9488574d4e6532c29764241968916aa4d554230d20f0379d2337665b26c96dd5b544b4db625d26eb0dd31424c22f92153cce64057f958efe7e2445f836cfa445681d69f8c941afd73bf8f8e6fc4a2279092403c360827b2801e96219de20d5642ddc4847853720946cfc8ae34053fa7a8341226f202144cf0f3cb4278466ffe0e07300d10fe8cd15a92701d3440a172951c9f1ae6d033f5aa2f646c522a23337843ee1872512c39b11de09073b2aab1757ea1cb52ffdb1774046bb7f70e2a222008eed416cf17958f08cb4cff2bdb9f49f6b3be85f2c3f86fd8ff1ae32906c8c80124a1fa3ef070748294bf3a58eeba4e3e63c316d80aa7b185d3d1f4a711ce5d367077fc1a728d28be4493fb9cc7ff2f4e02f1831d2f71cf46b44deb7d09ee8f4c676cc2771498752efdd12c71f91f3dda707dbca2481a7d2ba1c12e99c3b23bfbea6a4b9e457861ba57407bb725428ec88d773ddb0b76eca77dd6eb929efb53be80ae694de2b8e419ae363cd9d76f24abecae527e22c6f578d2d2b6df9087252978c132787b2d1286511cd0dba9ba94c2a6b7a7ef5527e5b51def76cef57f53e3b7579ff73d3978c00378fb231a86082bd1ef39d9ecb5eb3662cb22fb28d073b4dd598f071281f975a3c4ac6a6169fb2f159c308fbe1940d485bd984aabba9c52c4299343a9b130851b96f4a53ebb0e4c3c9e6f1a94e4a549937874a32f4de4bbfd449344465f8892001d25c47efbdc47fb32c4d8f0340687f01ba365307034519e8a63a00fa50b50c1dc810eaa3a931516660626a23794b097a6ae6e0896bdeeb28ed4e5c5cd3843b55d912aab31c54a73890abf31b6c4c6bc093c1803b7d81c85a50336b8140dfef187dbf1a3a791de4f13abc63791dd83103c6311f9c710d2ce3c700612c908b0572b1402ee6452e2ea6c0dd3724e3870e718773a50a38bb9d05b41d3fa420ac647fd24ddc15cf3e4e445cf1445cf1f4ec238fb5c2ea0d15e42f84f77be7deef68f10e438094ed0e820f8eb7e5d08fcdb010e250e847d4ac7081cf3abf90dc7f0089a10818d9dd94c9d9bb8f41baf02d3d162760df0221529dc720892eefb8cbb1d1213a7d079d7e0b45b777dced3eaa8110f6bd0b2cdd895dd04688546643c71e2b95df8bb047489599fcecd151d596357b6454d128640f86cad95ec588288650b4f1e6b7a3152f7e7fc2f63e56d63185b69922d63331c1b446189822378b03cb485efdc8a5bc243689812a4a667d6ed592daa8adf9e3fbfaf5cb4a72936e6b421d497a337a2cf9f539c433615f63e732d3a8a3c8a9fc9ceb2c60ab38413b2aba7a3677d7e5b9a9df55cbb37aa2b3a1ee2c2234d2401db52b51571d1517ebb61f3ea032a324794207f39a8e2fecb0a8ae78e8ab750e670b728a83ab0ed9d9cfd77cbef7a379c84b8127130f4d3c2344f8e803081fcdccca46418ef969da3062b2386f1b31ac9ec84d1b9d9bd9cd6a999dea0dbbb0218348193466710b1b3289d585089d15a1b322745684ce167f3dc55eeca8ce7eac302ea0bf08e240150927c4bc7be9456ecaf7690c52d6c3b2ec391dd713e98453ec0d580c932d4f7c598c65cd1d2856c6c36ee6923966acc9277ff85893cd9a83dc9a1cab8e7739d8e505e2135aeaed0029f0824c281dc8c4e6f12c1efeaf69ecc6f128bf14a8cd71ed65416dae0c9708eb06fcb86ac4e9957cd33b1d458717bb8f852ed216ac6fa612c44a805508cbbbb19a607935377199482aa58085baa87b18a93233642751eb459960a38ca482fddd542ed849b064b0bd1dcb06dbcb39e96024aa940f36faa28430d3656464e751f5457961a78e6486effd546ef8c8b0ecb053c4f2c34e9093210ec24a3962e75194252eda8c3ced120580888388f8df71c4fffdc2f3bd7b24c78b108905b80337e1624ee21cbed8fa04aa1a045359578738606136b0744d9d0ef4f1501b4d8da966aaa6b13b1800cfc3b9c7681080758de90a19605d1d045c80800b107001022e40c00508b800011720e002045c80800bc0dbaed30f276fcfae4ecf9e482be000dd8ab1030ea59ffee684ffc0497f7ef9497a5a95d3b46bce71103536c2817fef95e11c6caf720241e1f121281cf347a0a7d2f728623917befd28daf105f85f205a89eb47d8124dfe109ab274d004f66ebb0eaddd526bd0621a3e92a87ab25440f7f1b4c5b21f4f5b82fb47d1160cbf6b87d09983c72269548b1e89bc512d7a245277bbb8078be0b1485cdc9a47226d716b1e89a4615ded2c6fa0ebc2c761de0017a0bd93fe58ece81b1bfac0bfb5c9ad9540ab495bf40aed6bf13ded4368516ba0420fa9515dc3da3c240c04ea48811d0181681c76d8036a83cc8e76406d45d9e10d921d1f3ba841bab162873348f72f7c98066419658735c859e3ece80639a3971de520675b96401d54e7db4d6db8844a61a6a22aa9a8cc54740d076c0390aefd091d837864d6d8848e4146726b594239ae8bb2a14c1a607b281a174687326d066e41a994fac002a4c3eb93532aa73e134a05d56792a8a466300f646e35646135069b20b3ae3e8b9c4a6b8551b346e5545e93e4d4a9066ccca4599328fdd86cb05375d940f669ed599f4d4e993e00dc9736c168783064da044fa1d474471809440c3a2a8b5a003a2a915a2d3a2a31595a3ac4ef201aaecbf2ac6ef14988deeca8bcdc72d87da91df66d6ea1eda8546a55eeb6c40e7b965aef3b9c27a971d095aaa32d898ecacc991d8f1a736a67105bad805db58c984459463c583944367908281b85878c323478c8126b81176588a84f6e22ab069e1151623c44b915b426296f55736b190f29b520d520e3ad28b534f00e45aadfb9248c56d23c84394ddb1148573374b032882f8189d508138bd2bb8d808b88fc35e24069e6467c2855dd884fa2bb1b834211d5d39c8bd5064015514c8db8e4f47f5bbc1ab72eb74234e2452d196df069dc366a51692c01e92ad36c72d0cb4e234eb975e8c140cab58c76d700a14ea0ba09543781eaf6d050ddaed188f82084e65a6cb70dc04a39e5c786b1c4f61e654eb1bc4ed9814cafaf56488ed72d9beb75bcdeb1bc9e33493849582b95333058c1a798ab941a79cc2ff354235df6590832ab3b13416c2b6f093a8bb91ef550b2a81d436b0059b999cd8a95c5fa2635bbd908a8f9cd48b09ae15c0496cd4980a5988d2037cfb989d8ab969bebec80621c154be73bc7eb7c9549e73c1b4966d63392c4f37e8bb0681cb5a98b8046cdffd6c1cf727a8007078de76d4a1fb013513a818368a517b8892cbb0611967976a29c8ea845c857cd9caee00391e3ac64aa333849f82b96ea0e76b28cfee0208b754807d0789c356b828247e9941d02e0add00f52d1c9611e0870bc9d82e305d0f10224fe3a9819c03206135d56a1a90f813ad3a72355d167536b30984e46b2aac9bb83c1c3558d01a56320bca4e2dd40de25a509703b016e27c0ed04b89d00b713e07602dc4e80db09703b016eb7c8c1b8d74098a3c8cb30e60412dce34382a32fb9a103a8de241b0e3dbbc991129dff4fec0a962c05bde8eef2dc4c88e4e168a44c46aa3e55309639d28dba361c68fa783a18cad664645ab301d95b92aa2039247579d1e3df0ac645bf5fd578c5376e225fa5b01abf22cb21ead866fb496c80bd18c8e349344eefd018d9570bdf429befffddbcd98c311f573bcee8419f7a1e7d949e6029798af574e2ae7c12049e6193c1ec49b659a763f524fba6cede7b8826abefc8e27d092d6a485eaf3c18a9f17f9dcbf89999ab895cd2164bb910b3a31966f25d7489bf50b13494a9b3f380880cda91a45e4a33cf73521d4a4ce2bc9a2fb2f91cc05fc3b9c3c3a24cd1b78ae391498c21babfd3ee2f4b2c2386a0d321a84e4d2306a26b55b44348218e0100d8d54cc7914aa59d17fa0b86eec7c7f2ae097cfdcebb5bdc3560844c1d7cd7419cd8406adfe7f7144bf4dfd1bb7747a629fdfaebb3f9fc59106c664d46677b8cedc0cb317f00da6077485d42028504ee00844cac3cabad4e6ddcee78577499ec85b635022778e29f98e6ebc80d3968320c8417be726fc204553a393a35e23d6e7d66247cece5921c1935e17319dfe337e391d9d6be4a8f22aad45072404124e916b82188cf29a0a11e29da9132558f5465843eaa7db8383250a7f9c03952fa8637bf5b84b00fe6e0bbe782af017ef200cf3478bbecdcacea2a8e3320de42f1e1d3da62b9395eac4ed9aa18a7676f0cbc9dcc2c29ad622767431bab7a75e37dc5f9989b4c22cce3c31d74319f978b30ac500fe56646cb3abf0d90ccf25ce12c807ce539c119d0f8d6e4fede0c21b839c7777d30c1615d08c3111708e198e5ed64f92ea26ad6c12dcc8c72236cb0cca83741062b4a4103f0b34aa978183868ad81b3f100aa95512752b50b50b68c0c7687fd9211d8ce905f8ad2dd15c64ee55478ec703bbb41176a05e487b5a864fab2b52d5fa0ba3554a1ccd4e6c429c9cc4f3e9492e224e38257a99c29dd21ad34807829036959ff7e223d02daa55568978cf037c542c8cc86864808c5e9d10cf5a172be3c24008836b1291a8049e44fe1042685c0a41098148f0493024fa5756814e99c3b23bfbea6a4b9f8eb298e114075f6639d71017db402444140d2b5ef2dee5e7a9113f87d1ade95f55f2d7b4e874c453ae114fb4a12d5913af091199789abc955bcf442213d91c8323a66e55475845293dd9ad31c0e8e9759e74410d8e0d6f6bf00dd9415d9508750370663a80f4dcbd2678311d08d9139522cd99aa8064c0f2cd363ce5a879ed865cd899d90775401779e74c439f1bb76a2cecbf524d62e06bc8ae70816ef0b7cdf1abbaa46f4d18cc491799853f2548fe64bfe2e297aaa67aeaad65c21654f6467e41436a83a7f3e719c97f11b85e44465e5664f612bc4649d28e527f4276425d9015a800b735ae9604e6f988b9b8f53d74ca24d1a63cd416f6daee5e7d5b5d9559e63afd31dc755234e5b629bde29bcf13a6ff4ac01346245275a696db6b78b23c60a7c938ec996b069aa25757b803579e1680db5861d80663580acef1787901dc9241dc42d028d540fe476d147f283d93a04091f92c86a6079688a83cb0737910e70072810d503dd0d34447ec0b78c0f41d5227ab25353327798400ec4aa0caa9c1b19b6ed8e920dd051b5275de9857996973b3f4296dffa10abc2e5f7f3e3af996befe47bb0068083926d81b4b15ba48d058eb447923a9b4d0613d39275c3d2c6fa706c4c756d0c27e81f19ce46c64056ade98342da882bde11d2465c9a40da10481bdb43da20a2065c29b0833fff70c2e5fd9f7f48d03eba87cebd8717c77b2079375fe0a1f4c5bb0592edcc51fdfefc03bf1420ade5dfdab7812d855e0817e1e236c00793e00e00e90b401f3007648880fec1552ccb127a24a1d51ecdc77001304f4f5a220e21e269071091478e84c81e80907c4776012240afc515ed4bffa426c72d7907334dea8f6a866b81ea8cd6f57b6490a07a0521ae8d7f8baa0eee6d2061a0b52fa02f404604c8880019112023026444808cb40f32224045da031529ee08050cc80f0603828d467874e739cb6bcfb5153dbb21634305213c74dc143d66a44f668aaccc54539765f4cf7020037d0687431d6d4be1100ea753756a55e384f06c648b3821a43a7dba3a55c821b52bbe652c918ba832ad84dd9036d2b1374953597045f040a4e762516f511fdb020521dcd623833049afda92f4aaba65aad64cd506fa743a85fa104053d72c79ac8facf1600486236532d3ba135f955d7e59abfe1804586d438275e561c8f0bd6da7984cb5e517c7d2227535d0e4a922ebaa0a15240060800460a2e8ca6c02e07438d22640ee4076a3b8de8d72cb51e52dcb2cf65e8aeca32d892d6e6a2b22ab3e10b58b5d2b9aab5c6435ea63a069630dc8fad032673a5252a63e9ba850d746c67836d2542471dd980bc4846550b6ec95debaa6c5fee6dbd2b388772b123bd8b5c4d612d3866877cdc452a0ddad1537d68e7dc06877eb946b03b53a9ecdb4a139408ba96c68fa100e463a50469aaea88636530d65309aa95bd5a5eb15285bf5f6497c0b8a736b325c50ad2c9df900b669ae0ef1c5084923633bf594719ec76c60cea61028fa686a4ef5e17062e83330b27405ca33a80ca783913ad99698e7ea5225f0f5aadca2e8b34a37ce92148465b29d6b428c1dbc25f12e15933a9dd89ac8e707ba86f07bb81f4208e74007b775243fcb40d52004065ab586aa81fe81ca549f8e8700f7af6ac9325447a6b225b1cf54a442e6eb54f621097ca6fe5b95f6a25cf0f75d5b729e1dd9ad43f40a50b29d819215562e81512630caf606a36c5bf64ccb6064b5ecbed6b1c9d6d82e0f15aa6cf756e30f076456be4ee44c3db1488845e2c75924caf600edae103576496d2f0f9526ff635a1bdada63fde8ab02eab6390802e0399e0e9cdb8580321750e63b1542c7bbbb135228a450a0bb0ba35818c502ddfdc74577efc217421c8ad017e042f10bc52f14ff3aef9796b53f87df50eb4b40c1e7e551ad03b5fd8944be8f1af93ea83c14327b1e8ac28d2d4fbe8fb2c37cf68c1fc5631f8e4c1fc5dd3a7baa8f02e2e5889d265ea48b093fea24ef6827e94361081bb3cc0d6983541b85216e87573ce45d26cca8e6118bc42e326fec20474141da3a4bc750269a5da5be28c8f10e0a8e85bedbfeee7c8093e9d4b8d4963361d4cdca50982f3598e4849e2b8b454172eb52c7e2d74e660a16aa581044528b56935ab496faa020d86d70cd497ab3fc1305d16f8d5d3c17769b42a2f4f448a4a310e928443a0a918e6203387af5d6bb121e9d955f7e3bceccb0a54c0dc95155ad83ab36323534acc02e3235f0e56968254bc3a61c0d0c191a36085068c3d0c33095b7b79eaec98635d426035d51b14316f6d09d0e54599f015503033095a7e871fb32b4bb3a0831aa2b46af59025b36a79360605b7574da842753e21d163ef993ce0a660f32db45a6053c248571e620ce8d26531e8ac23acc4b15afb67b91c022332a7c448571e122cf8d0c635a89c2d8f0d3c5a3b3971929f42ce4022f6149103b278b424030737e88c2c8d5a38d476fcfd24b34b31b1e627a89bc2dc09b6722dfb33b33ca7eb0dc1db6295276ec3265077f34caeed27624e15271d28eaceeef227147a64491bc4324efd85ef28ed20c1622b5c38f91dae158a43610a90d7692daa098724fa43a682bd5014e53a75bf6a67c07bb4e1c10d73eaa7ca191eb9b98bdffa5b93e9c6c04c7fc6851c4f2c4a9a56a475e70055a1c6f278664e1db7b5dff2fc0ff0291ee0ff6ba154b074d15eff616ec752b90c626e8817bdc04a28ea1bbff6db0ecfd6f4370bfd76d9893236ce8ccc1be4b14d5923d972baa257b2e5db78b7bb008f65db2e256ecb954c5add87389c23ad759de40d785fb6d860017a0bd91beefa6ed8d0d7de0dfdae4047baf5b1262cf51d75d04c0de7313b77814b2c78d698077bc93eab711ec4aeddad9635e8926618f6fa5f6a4ec41add416903d9a35d971b187b0a61b1cf608d6743f518c5d5d4b8297c39864b29924672dc7841a172155c9291721555585411e28db2ba15298a9a84a2a2a33155dc301db00a46b7942c7201e99b533a1639091dc5a955032884a6e6d48281924a6a88b13628d252c7bf5fab4593036a552eac704930eaf4f4ea99cfa4c2815549f49a292ea73485554431696dd98059e75f559e4545a2b8c9a352aa7f2ea33a234606326cd9a44e9c766839daacb06b24f6bcffa6c72cab43ea39c6e6d00a150bc016c807eb01bc8034a4d7714984ec4a0a3b2a805a0a312a9d5a2a31293a5a5a3e2d275a8cbf22cbbdbf2b0deeca8bcdc72d87da91df66d6ea1eda8546a55eeb6c40e7b965aef3b9c27a971d095aaa32d898ecacc991d1d959ab351ba82c72918349d81d5b400bcd432420d6519f1c0ad10d9e421a06c141e32cad0e0214bac051e9a74c9e726b2ec1a445889f110e556d09aa4bc55cdad653ca4d48254838cb7a2d4d2c03b14a97ee792305a49f310e6342d0f694e5d72613215741e1fb89240546a195189d2bb8d907c88fc35e24069e6467c2855dd884fa2bb1b31499579732e96dd0617ac981a71c9e9ffb678356e5d6e8568c48b5a32dae0d3b86dd4a2d25802d255a6d9e4a0979d469c72eb50235eb985a919625a61a56a887426e0cd1e2bbcd9b610b4aea18b3a2584e65a1cad0426e3b80427e3b80299e1b84eacfff19a68e978851221d30f24647a79ab9b0042630cc6fa0428a63e1c69237d6a99960ee0d83226b2aca933f521864c2f3b0f995e8a906911322d42a645c8b408991621d322647a8f42a68f452cb2884516b1c8221659c4228b5864118b2c6291452cb2884516b1c8221659c4228b5864118b2c6291452cb2884516b1c8221659c4228b5864118b2c6291452cb2884516b1c8221659c4228b5864118b2c6291452cb2884516b1c8221659c4228b5864118b2c62911f4a2cf27197d1c1c722524c448a7515292642c4761622969835fa78343126a6a5e953753ad38700c83a98699a3e194c26b3893295a7337377a161383b2d122b330a0e4b6db1ad07852525896030110cd67130185a12c3cc13f48cc8dff3635a0cc973cfbf06aefd1dc4639cf99a19649cdf39d6b8c947faf77bcf36c824217fe95f2cf00d07a2a17f33223007b683c79dfca57ff13dd264f22713869e6b948879fb4162decac607af57df9385eb5bf2215a8e4db406bbc4e0c3ae21126289574ab4bcc7ef816fdf930fcbdc1903155995ef49e8db9e5970c1a98c53aa8a558a9a59e4568c57226e3b990e10317f22e6afd3983f9116b5bdb4a8a71f4ede9e5d9d9e3d91fef69f8517fe23c52c58e0f386e8d9a1f4d3df9cf01fef3fbf7dfbcb4fd2d3de71a7051473b4e6fb05ce67d034a1f9af786366780b374c7ac4c61fe3bae4956a86cb3df0c9447a8fbe052b6a446a9b2c746427b98e70d7a9658f1f4ee4257da6021d40f526ea86d05bde06f6edada75367d4c952f14f0c5397ac2048456076e7668e4e930d6ba84d06baa29a401f0e27863e1da8b23e03aa0606006dfd4c4076a3a45238b815b3a1cec499368f71e9ef0bf55eb18edb5bab7a7839b822cb2aeaec2def47e3a9b9da94460ffad11fbaf2d113acd2932b8b9320f00c9b8c614fb24dde5ed46d53cff40e7757210e59a54956fc4b6851c3f07a759e490d7bfa34536876ce26f2495b3be5c2cc1e45dcc007fb13b2bdced0432e5fec8ad5a54c9b9d07efd0ac4636ca0a3d6de6794eaa4289159d5f018a6c3e07f0d770eef0b028d3f32d46eb64961dd1fd1d77bf17c69ab1cb7edf5a0445565dd46dd365ac592e137db2b7f115945f358b237d6e2ab2c758a452c41e615118ac629c451df76f1e7fc60ae771aa07ea734a7ba4896b66ae8776e1a7d98a8704874b28d5f91df980a423d599cf496e581b97dbb2034ad9ddf24687156adc7868d3cee7bbfccef5a040e56e1595bb015a6cb94dd788592a220d1170733223e0701fa793c35fa5a3bf1f49d1a1f63369115a471a7e72d0ebf50e3ebe39bf92883f83640057ba01f75002d2c532bc4133da5ab8d1d40e6f4028d9f815c781a6f4f506e2679010a2e707de1d74a1d93f3840c63cfa01bdb922f524609a485d21dd2339deb56de0474bd4dea8584474e686d027fcb0604a9e15f14e38d85159bdb852e7a87de98fbd0332dafd8313171501e6770eae94e320b97846da67f9de5cfacfb51df42f961fc3fec7d8c40c241b1f7b86d2c7e8fbc101d265d27ca9e33ae9b8394f4c1ba0ea1e4607278712f6fb58f8f0e9b383bfe03327e945f2a49f1c413d797af0177cc5e67b0efa3522ef5bc8863bbdb11df3495cd2a1d47bb77c8bf64c648bf0f4605b1e28782aadf33d49e7dc19f9f53525cd25bfaed99da626f1ea58ad602057732b9ac9b5d8549bce15ec28a553ec80d43167cd9948f24abe926b775f2c44f9fe65a1497bb1f4e54802e8f6507e466b9ab87a296fd3ad6d241b59be996c5469432b5ec7fe01f996e51ca8d63438fb2257a3d949f30d67a74c1bbf86041ff995b5b62d6fb1d51549be21b98b11e156b653b732078d0cd023cf96dbd0d66753cb009aa1e9a3d168a80fa139d2813118eb43633a1e5b9a09c763b0050fb3b006fa7849f5bbf135cb152adcce84db99c02017fe5802835cf823090c72e19fc4ed3e14c7dd6dc131a93dce94a3137683885d268ef7bdd9c51be25d7b3409807a01502f00ea0540bd00a81700f502a05e00d40b807a01502f00ea0540bd00a81700f502a05e20bc0b847781f02e10de1f23c2bb806c1790ed02b25d40b60bc8f69620db05e8ba005d17a0eb02745d80ae0bd07501ba2e40d71f32e8ba40421748e802095d20a1b78d842ee2b91bc573537ab4510c3591a7461c284ddb880fa57a1bf14974712326a9726ecec5b2dbe082154d232e397dde16afc6adcb69fc661805ab25a00d3e8ddb462d128d25205d359a4d0e7a1969c429b7ae34e2955b681af12aae3c021542a4be78a4a92fa860e664add95e1433695f4047f66e0e65ae0a3b0e96f399e778d7cb148f2d0e113e52a8f8e00b0f1987ff8bdeb6e7770e6690c6512b747c3279ad4e6472c2f7c4c161d3e1cd9c3ccd864e6762b71382573ef86abbd7bf26bbe5f238edeccb9f3c270299881fbfc521c8e40915209d58a0b93070a690efca50ee6c6cb57f8b64f2ce0e42a8cfc078280fc6aaae0055d687a3a1a14f3519ea8635195baaaa59c6146c296b070eaf7c3190c793a8bba391ae91cb63d59a9ef4048bc4d3ed475aafca6c1a617d71f9e1bf4e2faf7eeb9d7dbabcd2a6d2b1f4e9dd60f4fafcfd93b3c3f74f7b872f4faecede9c7d7843bdd33b3c7b7f75f6eee5db33f46481d50670a54fd047a287561be048e98c92ae96a88a73499922ced00de01cf560eff01d223ebbdc48fcdac7503698b6f73b2fcd54ae41a3d4a0516bd00c6ad00c6bd08c6bd04c786954ac2bf86946fc340aee83b3b76fcf2fae3e9cbffaadf7e6f20a4b87dc3b1c0f269a32981caa53adaf8e26aaaa2ab272f8f6ecfd9b4fbf7e7e7ffee9b71ed6d348f294df7f4f85f7e4f4f4f3e5c9e9fffc26f7f1e38bcb73541fc4d587d0fd6a1b37bd43f9f0e4fd9bb7671107135ea35fd0c3beac4c86a3813a5547785c0603448cab737671f5a6773854471a7a70fae1fd7f9f5d5e9d7f78ff5b2f9e5058ee3ffdfa01bdf909193cc13df40328bd83be01b096a758a0264d70854e2e4f1005eea0b76806870b93e03ab9183109f50f52b9d7b6cb5e49aa004d93955c019e7b5d59823aa955849a2d82ac2f9205f09a2681b0d88efe1449ece1d5e94952d20219544b3c6659bea32cdfd738ae5c82c8c0c1e17e8723b278958f7d96cfb88c8f8bd68d1bc28889071a2734d657bf9d023f84810ddc43f5f7c3937f9f235df9e40c694f5cadc30f97af500188b44220e3f7b1b625c5c7046a25c1e7ab933767bf5d9d7eb8c01a188d9c0b210e769482857f0f9787c8a8be4ba2ec91f57077877eeba3b973727976821a6abb0e704de9484216f90db2d025fccdb32cf205bff7f2e5877fff36d2fadaf05099f665ed7082067b7a3850faa36946d8f1eaf9fbef55201d3fe33f2f16e15cfaf9bbe7c2178391f433749cbbe0059ab99a2cfd1c7a5faf036df8423ea4fe27fd8cc73d7881a85c4f37d1aa550df6a1c8836abc0f5cb96ac80fdc8067d12b1bb03f4a17461e4010d403dc9820a47a1359990a701091936a3f7252094b525892c2921496a4b0248525d99625d9852db9c99a5c6f4f325a948d6cca9a566503bb723fd229a63d2ef22a0a1c338163f6f8f32afa58427d2415f72a463e37a08f56c5c49785dce738f01e3a41dc1adc8f1e7676992d93cba0c8100c56373dd1554b80e69403af080bba6d11d3dc3e883c8b6537bdac9903ff16faa84b9dbb1b40ee54480575ff26aa9e8194ad1e7a7a34e7c96d676e7940628b97287c21a79741b3d5cd3185ffed31a0629553af6ab2f95d5c465549061e9b086f9e3917155397447a0df52f08d0b85fe1ab2df82e1e8c742aa1e1b823bfa391703ce3369a5ecdfb1660b1a96ab2bcb9c70c80bd6897d53c82ff2c80cf90010c752fbe2a2c67a28c91f9a50c909979a88e469b9921ebcdfe8e0f151c1db806faa6df45f79b15ec3773244bd1ba76cef0bcddcc679d2c1bb66f380c5d85ed5358d9186435b2b2d0d12aa563035327faa48ae3e0db33ca2465668e1957b17cf78e81cd22c469e5f4b59231181d46ff67928b84e57a89f50a0954d7f1229e2c0d665086cfb646245346d3812155d391a572e399557c4c1bbd8a5636066ef6f7ca76aa6ce45bea35c2ba6967dd63956fd45744e54b4b6452df49f76441b84df4f871e55bb11ac6afae5476f5eb39854bc8c8345c4342deaad2bcd57491e2c4b42b1d5bfd76ac23f1eb449556bf898718bf166bcbea177362b1a2c98b55350b24081419119935e5d12a8b906514dd9a31248a89a6d8d45b72e6ed4853f175c43ae5b4b93f8a6aa79a26d5189832a362aa69d4e865ac41b89a55a63436b666a50e364d82f2395fa462b498d9ecbaa656339fdddc96e5bc46c1315acfc794a35d7a90437638996bc3fc3ee8b9ef8520870af41c0f3191860c367bba65db03f8e90816d936cb309c7fc4c4f4889d6be2a3037c80b1fa427bb82e7cf8927eabf02c73fef4e10e607f3a7c5e92f99ebc744536e2b14fe1f2950dae7d30bf8c65082704c3df23d7cc5f71b613fc156dba1337e7046599de5d3f8fb9244c2522a2e971d7f245efc487a027cd80717beda321334fa23d3c5960624f6b6584dd26bf273ea279a51894f8a046a712b87dee75741a8335e10cf8ff8a588e566e97afa0eba1cff8fa263aa88827d707b222a29a4cb0ab2bb4af6fc2b82a115bc2842aa2a276c46d967865cea11bbe23cbc28bdebf7f250ca376455d8a2b88979cab352dbdf1be9e7cb383c86d34f64ccdd43f4eb163da7ea4b5e2e35b32061f7c1bd5203e4efa7c8776e5d03dc5ebf68bde5f13b7d3a402ab2a61d7eaf9628e1f12665e2434d1b61eba717fcabdccd1d96a3893022cf21f21a146387b238f6caf9523b4449dc7a39a5c495737d071a457ceb5a41e6a8747cae1e87094ed9d28de2a374d53f14c62d3e221c11f8c6ceb7384a8a3af72cab87806954cf5288b78dd0328b1a0b6b2a0961f48bd2543c3791c55af9f91b6bf7675130437fa1d123ce8bb5cbbeb9213aa9a0754054e6491c115abe235fa87cac7a8b59deb9a22f877b00543851a0b7dc3e9534d7e5beb88b2b25ae8111f7cd5d16ed53621b2ee9de5b5d74c48eb1f2fe639353f322be558efc4ac94d5fa03b3be3ae6e3d4c268b620d25b96e2d6041793e896ed908d7683f62292b98ed3f5a12d2ed49121da2eb7ad7564b1a4e67d9ae549ae0b5bec0dc2afa3fe88ca6aa147be4270ab6755af8bb492ef423f68d4378b006937b2b6e9eb1662265e2d9fb857985dc5a3daa27d73bc86287b725b71e247bd8f6d10f2f2ca5a59f77ac9e958b579b28e517c4a96373c8e37f6479975c15963068382a1ea95a602431b4aec8175544c87deebce8cd71d18971e19af3b2fa69b83d7dff4fd8a13e362d76d3ce62d1e4ad71ae8da63cb379cf42ab9f9ede25ac8d9aa8dcb1f43032b1636deda47ab57a3fa972e58dc2da096228636ac5d6f36d3e75715cef6b3dd8ef09c4fb0ee9c9b9f51f09e52b4774eb176c9643eab281eff975d0010288992b3a8e7c7b9b3d5d591f2da83dcf4b5f839f1e2bb822176bc0ea4bbe4a4323a1f414d48cf2ee3d4068ad693bc199271238e8ac7721f9db7e2e349270a6abff36d1c531f1dc47e3f4ff204d0d14aa51db34976eacb0cabac349791b2e48d25e7fbc76503b0dd248ec70f27df227d9d051d400fea624e1ce1a1ab63842b3d1be59ff8dbfe13a37b256eb8f84c17313d378bd4504145ca06d0e5a131d6876300f4d9040e7530d354680c2c6ba0582bef449cdb12737ad1e3464a88ebf0beac0d94fba319f3af574fac5aae889f32eafe66100c1bc116e2d4aa2bc485e8413fce659aad7f7c6927ad40254f82c0336c32b03dc9366bf4a86e9b7abe9bea741be293bb69c0370197d0a2462576cbc51627250be9d37cb9d92bbd4480e99bd77269674f2e8a6b5233b3cc27f82d3c430fb932cc70385e9e07efd0b4b7a32b8f886ce6794eaa1749b8c266f7a2cf01fc359c3b3c2caa9c55db49ed5332cc7587e032968834fc6d5b6381d65bb4e89ae6ebe8e6376832208417460e6ac204553a71e937e2c95f9f19414b7cb924b7ea4df85cc6683acd7864a6f4ab541357fa11c6fa9968d05be0862056d3d0508f14ed4899aa47aa32421fd53e5c1c19a8d37ce01c297dc39bdf2d42d80773f0dd73c1d7003fd9994ae7ed98f3caf3d45a4b1e6ff1efd798846b943813ef8b95ed5155446a9130f07632f323cf69a7cbe5c6da5f215befb5e7cf9bcc28cce3c31d74319f978b30acd015a1bfd8fe52d0466234bc64b367442b5b6d8a09d2ea245fc2f5a89fd7a4ac5ebbc86c825b51842f574ae0cb951c7cf9801737bdacc90f0d391d77070f0473599b040873ab20ccb6d910acb46c8c045ce9e3842bfdab74f4f723298a207e262d42eb48c34f0e7abddec1c737e757124126950ce04a37e01e4a40ba5886376806590b379a4ae10d08251bbfe238d094bede40fc0c1242f4fcc0434b2934fb07076863857e406fae483d099826d21068ae4b8e776d1bf8d112b5372a16119db921f4093f2c9b184082f04e38d85159bdb852e7a87de98fbd0332dafd8313171501b0cf15628b3713c133d23ecb47f6eb7faeeda07fb1fc18f63fc68b7120d938c634943e46df0f0e90ee90e64b1dd749c7cd7962da0055f7303a5a399462ffd6a7cf0efe824fa8a417c9937e7260f5e4e9c15f30268fef39e8d788bc6fa175f5f4c676cc2771498752efdd12fb85916df2d383878125bbe6242079259f3c75d3f6b5942eaa065d22055ebba612ab97f206cea66a5450e213f07cb939ccdc35d5c9bec85ba535d4f8f8a6ac0e6dc1f6e2da0b605e01cc5b02cc8be30574cbb246d6589eeaa309449b34058e74b43b33f529b0a6da7066c9d3b1b20fb8bcb8311dc3f2e222052aafc05213586a024b4d60a9092c3581ca2b5079052a6f0cc57b82363e87d217ef1648383511fa17dca03a48774b9cbf6bb170436007a86fd10f1eb2b46c17a09e09427c8ab7faee4af77ffee1a0c77ffe217d01e8515f80fd0ab05f61a00a035518a8c2401506aa00fb1560bf02ec5780fd0ab05f01f62bc07e05d8af00fbfd91c07e07834345530f15451168bf02ed57a0fd0ab45f81f6bb5db4df9cc61570bf02ee57c0fd0ab85f01f7fbd0e17e4f3f9cbc3dbb3a3d7b2225c0bf79274deccc15fd7628fdf43727fc078e4dfce527e96955c8fe8f52d03aa4e4c7d71b02fb59603f0bec6781fd2cb09f857525b09f05f6b3c07e16d8cf02fb59603f0bec6781fd2cb09f05f6b3c07e16d8cf02fb59603f0bec6781fd2cb09f05f6b3c07e7e34d8cf040e238326c109ff4c1800cd32069a3cd1a783a9aa0fa703a0cf0683a10e27d6c098c98636348c3510d0cc981ceb10a0a3da6f4281e6a8ee8345825eddeab1a0413377ae5e7e7fa8d7edc12d8042933116c0d03f023074349d0538b40087fe41c1a1292dbf358068f6d5708b20d179a5fe6081a277ba920abce81de045478bd0c3c48c8eeaf6c3e14647cd7e7cd8d151bb047ef443c78f8ec64960480b0c6981212d30a4dbc0908e34ca83c0918eaaf2e0b0a493a3bd9de149af3cedab6a97f3af6f117c3a03c3bc19779ac24e2e856666c153cee24057635957e22e5310d5efbdf44b1da06a0a213a72be4e21b2df7b6f12be34ccb3036e420f994b90e0eae90ef862eb434b55a0a24c7508a6963e1c40b4c7924d59574c591dab83d16806b52dc13d33003b7b1ebee321b0ce2595ef6d1bd7b9a4cca6f8ce55e09cd5a09ad5889a72359ce646144d1ec04c6eb44c0192591324b314cd7227308fd5185debb0b5d6016bc9eb50b518c0b4f870b36a8066ed1a2beb5840440988a89d4044dddbc806421693abcf17c8d608f60f326a7f228d5d3406bad55e202eb191aa33666eab7265ae26cc01a65b7131899b18b5b0304cebfb217bb244737d387e2bc7fcb7f5a96cd4be2de6ba1c3edece05f8c2b7f7bafe5f80ff056290f3bd6ec5d24153c5bbbd057bdd0ab4e6848bfd1e08a2a3a1bbff6db0ecfd6f4370bfd76d9803e0db2174e660df258a6ac99ecb15d5923d972e9ce76311ecbb64c5add873a98a5bb1e7128575aeb3bc812ef6f1dc673304b800ed8df47d376d6f6ce803ffd626a7f07bdd9210df49bbee2200f69e9bb8c5c39c3d6e4c037ff39d54bf0dcf3c6ad7ceeea0473449d11bafea756a4f1a13a99b89a82d604c34d84c94ecb8628ae1668a748313938c1849ac550f8c1949f07218934c3693e4ace59850e322a42a39e522a4aaaa30c803657b25540a331555494565a6a26b38601b80742d4fe818c423b37626740c32925bab124a0651c9ad0d092583c414757142acb1f8dcae5e9f3673b0a5544a7d3f5bd2e1f5c92995539f09a582ea334954527d0ea98a6ac8c2b21bb3c0b3ae3e8b9c4a6b8551b346e5545e7d4694066ccca4599328fdd86cb05375d940f669ed599f4d4e99d66794d3adf51995dc61368828d84df400a5a61b7bf1b39548c4a0a3b2a805a0a312a9d5a2a31293a5a5a3e2d275a8cbf22cbbdbf2b0deeca8bcdc72d87da91df66d6ea1eda8546a55eeb6c40e7b965aef3b9c27a971d095aaa32d898ecacc991d1d959ab3513a2ab568d07454702b318c2d07115296114f2c21914d1e02ca46e121a30c0d1eb2c45ae0a149977c6e22cbae418495180f516e05ad49ca5bd5dc5ac6434a2d4835c8782b4a2d0dbc4391ea772e09a395340f614ed3f290e6d4250f6951e7f1450e8b28e196a38429bddb285898c85f230e94666ec48752d58df824babb1193549937e762d96d70c18aa911979cfe6f8b57e3d6e5568846bca825a30d3e8ddb462d2a8d25205d659a4d0e7ad969c429b70e35e2955b981af12aae540dc1140470c263054e7818b1f9c72561f2c715b1eac75b0c124f16abed458593f60574a4f4e6d0f0aa30ee0813d7bb5ea6185b57aba4f269bc35011ebc5af81630e0ffe2d45af33b07f349c3d3153aecfb22c97dc21ff29d703e71703c7a7833a752d327412599a0f884e0950fbedaeef5afd13e5da90880cfbefcc98b107593c76f71707794016c15799ed8b2b9f87aa658faca18f942d03a12b85520b6aeaab23256644d9707e64c1f0ec696ae8dd4993e1d0dc6f24c05aa361b6d29661d47b0be18c8e349d4e999816709685fe1db2521ed99a6f5a427584e9e7612d89e29b9695cfbc5e587ff3abdbcfaad77f6e9f24a9b4ac7d2a77783d1ebf3f74fce0edf3fed1dbe3cb93a7b73f6e10df54eeff0ecfdd5d9bb976fcfd09305562cc0953e411fc9245a8f8023a5734eba5a06219c4bca1471866e00e7a8377b87ef10f1d9e546e2d73ec683c1b4bddf7969a6720d1aa5068d5a83665083665883665c8366c24ba36225c24f33e2a751701f9cbd7d7b7e71f5e1fcd56fbd379757583ae4dee17830d194c1e4509d6a7d75345155559195c3b767efdf7cfaf5f3fbf34fbff5b00a4792a7fcfe7b2abc27a7a79f2f4f4effe737b98f1f5f5c9ea3fa20ae3e84ee57dbb8e91dca8727efdfbc3d8b3898f01afd821ef66565321c0dd4a93ac2e3321820625c9db38bab37bdc3a13ad2d083d30feffffbecf2eafcc3fbdf7af184c272ffe9d70fe8cd4fc8240aeea11f40e91df40d9c88b147b1404d9ae00a9d5c9e200adc416fd10c0e172601477231ec10ea1fa48baf6d97bd9254019a262bb9023cf7bab2047552ab08355b04597824a470516b251016dbd19f22893dbc3a3d494ac2f9059678ccb27c4759beaf7134bf0491098403430f4764552b1ffb2c9f71191f172d25378411130f344e68acaf7e3b057e08031bb887eaef8727ff3e47baf2c919d29eb85a871f2e5fa10210698540c6ef636d4b8a8f09d44a82cf57276fce7ebb3afd708135301a399760f75c4bc1c2bf87cb436476df25d806c8acb8bb43bff5d1dc39b93c3b410db55d07b8a67424219bfd06d9f012fe867386e02ff8bd972f3ffcfbb791d6d78687cab42f6b871334d8d3c381d21f4d33c28e17d4df7faf8246f919ff79b108e7d2cfdf3d17be188ca49fa1e3dc052fd0ccd564e9e7d0fb7a1d68c317548a8943f4188f7bf00251b91e4e8a105443ac28f2a01a650557ae1a680537e059f4ca06c495d28591078605f50037120ba9de4456a60292a54d48160cd09679829e11d3e9f9316d4191e79e7f0d5cfb3b88414c325f3303ee0576fc4efa91fefddeb30d62e891bf19f078f00dc3c1a07f33b23007b683779ee42ffd8bef9126933f9973815ca376833c232c4961490a4b525892c2921496645b966417b6e4266b72bd3dc9685136b2296b5a950deccaed83a6959916f87cf27b0291f92df9b08c7386cdd1b28faf1970c89b8458bee8a53d4e0e4f6302f0ed7bf26159c88dfa3c0f4095742f927acf2cc41856225e55a15ec5a9bb0adc8ac857242e31d313023d4ea0c7758a1eb77f68717e9c91f0e85ec5f0e106f4d1aa98b8cb901b1f07e79a0de2d6e07ef4b03fcd6c995c17458660b0ba0b8aee600292ff304a9848b72d629adb079167b1eccaabeb5fc7411deadcdd0072d542aaa7fb3751e50ca46af5d0d3a3194f6e430fea24cbe4cfe6c49b24932741663bc931ab72ac307549a4d550ff82008dfa15bef182afc950a4d308e79624bfe2f4949e711b4dade63d3b23a2a5b79c583b534494f3b88299a28e0e95c1f450190e48a6e48ddc56d9972b3846899a37f289b319576523676958796ae3967a8d4e7fcc95d93dc766115289a7abea46e7aa6666b97614a234d6ccbca2b4d5558381335cf3b16adc6f751a57951c775d22e275f3efb892517ed69034eee5a9c5f91298afb22c1fae4ffadd42ca6fae84dfd579d5b3125e4db84aac9e15e0357d906456cf4ae9e686142591a55a55d5614e41cd9680ba69fa69bee4d36da59eae9c5b8c2b6c31e97431e574f224eb6416821c44cbf3c0fe1e195f19ccecd4a8db0358e0086237f1be0817d82db10cc1b7acd7b3b583f319344d68c629698e0d6fe1a68ad7c61fef4bd28ae4b9dc039fec5b7072c260458d1378982c74c46f6c1d21073c3062e79a78a381b73bab2fb4c7dcc2872fe9b70acf32bbd50f77007be2e0dd55e67bf2d2dab4e538070ffe1eb97afd8a870b7f45467ae23699a0f7d2d6f8f35c8e7489886bba39461b89131f829e3403c6edb58f86cc3c896c7ea25463cf4d6584bdafbe273e6779451f94f8b4457b18dc3ef73adabb61953803febf2296a395f7d62be87ae8333eec8db635f144fb405601549309769d83f6f54d185725624b98504554d48eb8e1a539dcdfc1f0c6437df4ef5f09c3a85db1f7dcbb28dffbd59a96e204efdfecc8752d7170cbd43f4e8162da7ea4c1e2c31e32061f7c1bd520de7c7ebe43763c744ff15af5a2f7d7c47b2da9c0aa4ad85573be98e387849917094db411806edc9f722fb3d15e0d67528045fe2324d40867efef3c375c39564ad4e91daac9957475031d477ae55c4beaa17678a41c8e0e47d9de89024072d33415cf243c261e12fcc1c8b63e47883afa2aa7988b3bd664aa47f996eb6e58c5e2dacae25abe817d4b868673035baf9f91b6bf7675130437fa1d123ce857268c95593ad20077ebcdffff2c800f993891450657ac8ad7e81f2a1fa3d6b69b6b8ae0df3c158c166a2cf40d5bed9afcb6d6116565b5d0233ef8aaa37d976d42fd2ef1c16ed023f5cf41f29c9a9f0f9472ac773c50caaad6e94035a71646b30591deb214b726b89844b76c074d8746ed4524731d2754032e5aa29121da2eb7ad7564b1a4e67d9ae5492e175aec0dc2afa3fe88ca6aa147be4270ab6755af8bb492ef423f68d4378b006937b2b6e9eb1662265e2d1f9357985df4111439192ab16f8ed710c5f60939144c4c9975ef631b84bcbcb256d6bd5e72e2576d9eac63141f97e50d8fe38dfd51665d70d698c1a060a87aa5a9c0d086127b601d15d3f1edba73d27587a4a5e791ebce48cb4e49d71d9116bb6ee30969a1c7ea0d74edb1e51b4e7a95dcfc76712de46cd5c6e58fa181150b1b6feda3d5ab51fd4b172cee16504b11431bd6ae379be9f3ab0a67fbd9ee7b78ce275877cecdcf28784f29da3ba758bb64329f5514af02ca2e0348687ac959d4f3e3dcd9eaea4879ed416efa5afc9cf8fc5cc110bb6906d25d7252490e4ab06e4ccf2e63cc7945eb49de0cc9b81107d762b98fce5bf1f1a413c5c6def9360ecd8d0e62bf9f2700ee746c4369c76c929dfa32c32a2bcd65a42c2960c9f9fe71d9006c3739e0f1da3c7e4cb7401faf8324abf61b7047d8f618470b388ef7159a882c78b9b0acd536cef41638fea0d202ae64130785277c669ee7a45c888b25332732086ca25436bcc5ceec3227227d4d081d40b590445aebab38673c3123efc67f62b8a6c4e9119f892346e76642210f4723653252f5a93294f5213081ae0d079a3e9e0e86b2351999d66cb0f200c3992631fd8b5ecd30f5b8fcf7ab3a53ee6566cc9ba76658055f11ef4fd4b5bb8c758fb393ae02dea3077dea79f4310e79c7d71809aee0491078864d86b327a14ad4ed5ddd36f5a8f3d8bb10d1e46e67f0edc925b4a87179bdc21ba324217d1a9596bdfc4cc4b35a624b92cdeb6508019be4b88ccfd05215a828531d82a9853a0b027d269bb2ae98b23a5607a3d10c6adb92ea92fa94c878fd5ab728f1ac428d41d1f0ad7d46a44b5a105fe86f49b22b05a64637b621f56503bd760ee027e5fa9c3dc56d830441c44b982b4b108757e7095e61df2fb00769c9121dfa0bb8d903ee1df856e6c7a12ac3c9501b8c87130616b65bc6e228e5a16de6911a5e0c4e2565f45721bc2b23555848d7dc605cddd9ee4bef1bbb27703b29a9b23e3bb5a5ef13fc169ea1870f25addea368488516aaad21628595467e6e555b9c98e6ebc88d2960b7ebab34cfe7b76f9b3041954ea2598c78b5aacf8c6091be5c1217b1267c2e6384a9663c322bceabd478a8d2328949416cba5be08620b62ca0a11e29da91325591361da18f6a1f2e8e0cd4693e708e94bee1cdef1621ec8339f8eeb9e06b809fecd00ae1ed9af3caebc1dab61a6f15deaf39e5d8606d30f1bf5899d255c5a40636036f2733534a2bfc302cbdcdeb2eda84bff6fc79939986797cb8832ee6f3721186153aa4dc14daee12eea029474602035cdc3e8ea50f872c92364568b08f65398fcf447eb41ca054ee3f86648f7993943d0f6864f9b1a700ad32b0d8f38116e61e7b62d08288b327085d49523143689d848a3c19c28ad4f9f16a9615ae59a6b3f2f1accfb130be0d5201e6c7bb513be3f1df455eb75632aab0159517ad0e13107598a0a65c68d9ba385fbcc25b7c41c2bb4ad8959f0edd75773c771a17d87256a0b2841febdecf4f0ede142cbce948cac594874741d6b8b2e2e40586b3f6f1a88b942aada6546900f55f7e00d938e743e3dc05e572de886941f09b65ffc8cf04916be171e65af8ab74f4f7232902377a262d42eb48c34f0e7abddec1c737e7571249ab2019c0956ec03d948074b10c6f90c6b1166ea47ac21b104a367ec571a0297dbd81f8192484e8f98177075d68f60f0e3e0710fd80de5c917a12304da447916e941cefda36f0a3256a6f542c223a7343e8137e583031b61de19d70b0a3b27a71a5ce51fbd21f7b0764b4fb07272e2a02e0002fc4161ff606cf48fb2cdf9b4bffb9b683fec5f263d8ff18ef5303c9c6f037a1f431fa7e708074ad345feab84e3a6ece13d306a8ba87d1adeda11407d33e7d76f0177c352fbd489ef4138f8e274f0ffe82e1427dcf41bf46e47d0b6dad4e6f6cc77c12977428f5de2d71101a394f787ab0ad4418782aad4b8191ceb933f2eb6b4a9a4b7e5d73d593eeab575e2a855d7635b7dc5ebb168f8dfbef5a5cabf7e4b5d855efd32bd8516ab13844690613c6fbb8e4f57c85f3b7c66cef9577370b6da15359880a5dc742140956e99bd18ca07b8f4affc2d8a12b82fce621dfa5ac6f96772a1b75a15bd9c80a1dcb4616756dc5bbd88f35df97b94c3a8c5d9c25dad4cd3c6feb15ee37ac1c0addcd4e5ae87276d2a8dbd7bc8f5d47cafab9ad8445f911daebf444171e71bbd8989688bc2592123125254223f90977813e50cc11d066a66ec823431f0e2686ae6953a04f2d6b321acf201c1b465532a2399c7bfef2ff9d8e011982bf21d3ee1f1897348225d54613f224da9693826df35940ee169fa8b27c283fcdff8ee7d0fa37f0e0acdec8be90d466dd3b890f62d5efab36a66f8c72af44d8b61906dbcf7a948c5a6bd98efef5e64ad286d2b17411c085e91dadd0b33330f5d16b344cfdbf90956a4a6f20b28043b44f58c1d20f4b60e9d7bcfc844077dbe1530abd7cddeb6f260399f95d6d32607e575146ec8c95f164c8fef264ac32bfac2a83e9d32c2a7bd2f9054cf6c1683c60c66457fb728b98ec03759cc364bff0ee160ef025a4ff17205a75d10eb020560962fbbad74b31dc15591d3e240c77b90d08f71cd4fa4340598f2b233df9371fda7a5203e9c9ffd4835dff179c25d0ea043ffd9e968c15d87a347b6630fc8a2458d2467d79fcfffbbfaf0845fce57d8ab87e449e1c1e299a7c187d449fb278eb6879da94b9678ea451fa19bc88e79ff4f36cf5d101a18e167f197d42c6a98c3f7c8bfe2ca33fb72f141a7d1d98d768f90b5efc7ff03d84f4332a167e0b1932fce07a5667f8897f5c97e187bcb221c34fd562c093e4077756dd2c3f1876fec7cef2d3527a9f9de4bda94e5ab02ed9c0ba4c03f2ba34030cd905f81209d4c822b0ebe401c77531f323c3fda122e67b0ec4a9e93702e6c7ef09bc7c8197bfb778f973e0dfe2f8558198ff0010f3dfc583b175cc7c80c5860b47a8802fa8d70418e441d61f2a8753f950193102ebdfa0bdd1779c84cfd1816ba06ffa5d742657c1be3ba8fe75b26cd8bee14001f7ff98e0fe79b1feb73422ede613c055d3e70487b832d8c746af56010865b9d9df2bdba9b2916fa9d708eba69d758f55be515f116d4cc410c3aa113dbe069a3f83a3b6315d404ee1b2e46450c85b559ab7ad5c0eb18ec4af13552ab23eaced03ae940f651db14e39b59b3c22d518247f04ad62aa6922ac3fa241b89a55a63436b666a50e364d82f2392fb261fc38d9308e1f627286ade041c5631e0d792179c7fad41d590f4f9aeb5a90a9e32e81918ef99134e2abe5fd8ab52b6b43a442f6bd15916adae356d07e047bdd90e49077af1bb1f2acd8eb664477163f5e3c70aa9cd98382295dc81e0f4ca91ef6a0e0ec4c670f055e4d2cf618605a8ed9c37f13b16927f8371d8c0651b2abc169c824eaf4fa4cb283579fcf6a30ebf3a007b74174753cd8bb88f44d45a3a3d84c4a8eba2c3112968e4acc4a684785aec4b9a30269d9efa8c864a23cb4b0de74127145caae6602375924593c645999e4a15c09160f152d1d5c11cff1108b18de1a31bcc7226cb3a3b0cd6d45065e4317754a08cdb5f1814988d471498cd4714560cf71db11272d469864822d360797501112a501182c5113d9688fea8095cae80a2a10e5bd977ea9138e42c581443941d33898f75e02e09e0de688429ccc04450ddcea33d998982379a40f6663a00f4d6da44f4770a40fe5d96ca859aa31320655411ddbc620eea5c07fbd7eaf58f7ded6a3280a45368da6a8721fae76e7952b7d79e56a47de8dfebb3c7ebadc3eba3fba6b2e114a180a0f5de1a1db85876e82dbf9507d74635b79b3936ef2a2f0d2edd64bf7de46061032975c7dbe408646b07f5ebb1baf7b99d2de980be060b3b4689ea6665fe1fe74d30d2a0eefd62d7b737699ec9335b7d2e292b89b4b62627b02ffdedbeb5ba4856fef75fdbf00ff0b44ba3fd8eb562c1d3455bcdb5bb0d7ad401a3b5cecf74010750cddfd6f8365ef7f1b82fbbd6ec31c00df0ea13307fb2e51544bf65caea896ecb974454842fb2e59712bf65caae256ecb944619deb2c6fa0ebeeb76354005c80538aecbb697b63431ff8b73639c2deeb96841840148387017bcf4ddce251c81e37e647f41ea476edecfe834493b07b0e527b5276cf416a0bc8ee3698ecb8d89d06d30d0ebbc760ba9f28ba0cae25c1cb614c3261c86892b59663428d8b90aae4948b90aaaac2200f94ed955029cc5454251595998aaee1806d00d2b53ca163108fccda99d031c8486ead4a28194425b73624940c1253d4c509b1c6920567f5fab4990f2ca552ea7b6a920eaf4f4ea99cfa4c2815549f49a2929a25f22173ab210bcb6ecc02cfba06497bb22aad1546cd1a955379f519511ab03193664da2f463b3c14ed56503d9a7b5677d3639655a9f514eb7d667547203d820ffd46efcd12935dd91533111838ecaa216808e4aa4568b8e4a4c96960e1379110dd7657996dd6d79586f7695b42bbb1c765f6a877d9b5b683b2a955a95bb2db1c39ea5d6fb0ee7496a1c74a5ea684ba2a33273664747a5e66c948e4a2d1a349d65106c21ff65cb41469465c413504364938780b25178c8284383872cb11678331b12f5c94d64d93588b012e3ca62985d416b92f25635b796f190520b520d32de8a524b03ef50a4fa9d4bc26825cd4398d3b43ca43975c9435ad4797c493045e85ccbe92f29bddb28a52391bf461c28cddc880fa5aa1bf1497477e37c9e44f534e762d96d70c18aa959eeceacfe6f8b57e3d6e5568846bca825a30d3e8ddb462d2a8d25205d659a4d0e7ad969c429b70e35e2955b981af12aae540db3f28a2cb7225cfad1864bc72b94889a7e2851d3cb5bdd82f24005da489f0155d1879aaaea1a18293a500d65a40ee0c894c70f326a7ad97dd4f452444d8ba86911352da2a645d4b4889a1651d37b14357d2cc2914538b2084716e1c8221c5984238b7064118e2cc2914538b2084716e1c8221c5984238b7064118e2cc2914538b2084716e1c8221c5984238b7064118e2cc2914538b2084716e1c8221c5984238b7064118e2cc2914538b2084716e1c8221c5984238b7064118efc50c2918f456e4d112c26726b8a28b1f6a3c490821e0c644b1d1a137d329a007d3882aa0e4633037d1a83d15431adc168b6bbe03000eea3f02c2a3c2cf4ba8a0a0b3d110c2682c13a0e06434b629879829e11f97b7e4c8b2179eef9d7c0b5bf83788c335f3383ec0576fc4efa91fefddeb30d3249c85ffa170b7cc38168e8df8c08cc81ede071277fe95f7c8f3499fcc944a2e71a2562de7e9098b7b2f1c1ebd5f764e1fa967c88966313adc12e31f8b06b888458e295122deff17be0dbf7e4c33277c6404556e57b12fab667165c702ae394aa6295a26616b915e39588db4ea60344cc9f88f9eb34e64f64466d2f33eadffeb3f0c27fe0d390e8d3a614a9f93ac1f90c9a2634ff156f8a0c6fe186496d6cfc312e28afd0325cee814f84f83dfa16aca811a96db2d0915ddc3ac25d67763d7e38518ff479067400d59b6453820ffec032d0577b122951d3ffc4287189f646d313b33b377374ea6420cb5379a2ab8639d3878a22eb9a0a863a042a8000a2a726243b4152291c588ad9bce8f16ddce2d2df17eabd621db7b756f5b02abe224b1aeaec2def05a379476d08a3077dea795cf978864aabeb829320f00c9b8c614fb24dde5ed46d53cff40e7757210e598545565bb491a786e1f5ea2c911af6f469a6d0ec9c4de4b35a64f32827e09647704ba867b2313147f2481fccc6a8db4c6da44f4770a40fe5d96ca859aa3132062d8b6fb11625425cbbaa3b10e504f82623c8c5066c459cab0582b7ebda10ed92a15d2be0f849b9b6660f516fe0e0ff0919f667e82197a37f85e952b65c9f07efd0b2850ce0153adfccf39cd446205bb4def126369f03f86b38777858941932ed0651894eefb8d3f32bc77e07e594a98aba2dba8cb5ca65a24bb6255a278ee37d3d31cdd710840b7f6580678423f4170ce24558bdfffcf66d131945754eb6c446bc8ad467466e175f2ec9d6a2099fcbf84ea6198fccaaf02a5dd37b15dbba64a52733e416b82188177c68a8478a76a44cd5235519a18f6a1f2e8e0cd46968bf7aa4f40db4275a84b08fa6d577cf055f03fc6477c6016fcf9c9b553d52d780e2ad01b6e9d8ebc0cdfe6265d25695921aba0cbc9dcc34a9a8efceccaf8d0db8421bdfd79e3f6f32b7308f0f77d0c57c5e2ec2b0426b94abb19697b836821da92027992d668c27ccb1b0eab2073b562c72c5c0c73af1583c0106e5a120cdc21b72bdd28855592fed2278a215b7457677db0edd3173a3d55db96543dbb8f4963d43cb9cbe36b9d2f1ba95e5068093b8ac1745d68c56b366344073a7f7c40d11e54b475a80cc3f4ebfc1bf4a477f3f92a27be267d222b48e34fce4a0d7eb1d7c7c737e25111741c900ae7403eea104a48b657883e6a1b570a30919de8050b2f12b8e034de9eb0dc4cf202144cf0f3c64e641b37f70f03980e807f4e68ad49380692255833486e478d7b6811f2d517ba36211d1991b429ff0c3e2297956c43be1604765f5e24a9da3f6a53ff60ec868f70f4e5c540498df39b85278cb1b3c23edb37cb4cbfacfb51df42f961fc3fec7d8500c241bdf2486d2c7e8fbc101d240d27ca9e33ae9b8394f4c1ba0ea1e4607ca8792156dc59f3e3bf80bbe4a925e244ffac9cdd293a7077fc15e2bbee7a05f23f2be85acb0d31bdb319fc4251d4abd77cbb7b60bc9d1d4d3836d3975e2a9b4ce9d339d7367e4d7d7943497fc5a38934b0ddbd51d59c1ccade6b1c96265667a99bdb5207baae56d60dfde7aba261bd6509b0c744535d166683831f4e9409531a6bd0606602a4fd1e3554dd0668c7b5b864fa79df82ebcfbb2dd79d2fc737279ef441d96eb3d3ccd0c78150b0b1ee70bef6e71175fb646f4916862ff4fcc2979aa4782533c14f37c3d73825679b295dd10cec82630a8da149f38cecbf88de3e2062f5f660605b75c2898c5861e46d1adacdd5a78e1757e45ccb9bee42f539257f2739ce1009785345254a56f466da7ab4739b3afa9f1eaa5fc2e85a1ce6cc451ad2bdec51ea5f96ae65ceed7d43efb628d16b033885ab1e67d7c2157566d9e4001aaece84999bb05e3657b234d9cb38ac97e826dee12257294ace447775885b09fb96579b9f323a4627a0cb8e1650769cf8fbfe68fd0329ddaf9f2f6183b35f91eac097189e68e0874d97da0cb4c3515d9542d7d369d8e91ea5067ba3635657dac8e4ca84cd489351e8b401711e822025d44d623110122b21e6d8e80f01c885114360640c4ef89f80711ff20721c3d9a1c47fb8610dda633e6037106148e8d8f0b805cf8e4089f1ce193237c72844f8ef0c911405502a84a0055fdf0e7f748cfa22907ec60b13061ac33354d9b82a135d2a1264ff52180535d8370a22b435591650b9ff34f7677929f446ef4fabd92ca6ffd44bfa44c71b62fcef6b777b6ff2e23701216385702f7c82c0492edccd10f217a43baf56e3de99fd87472d154b1a500bd1bd8c19f7f38e19f7fcc6df40d5f4787e80b2240dfc8abf33ffff8f30fffcf3f96c1ad771342dc3644f4051b46b68425fdce765dc470e9fcf907e18a2a72b7408b2d2abc2fd0b5c4dd8a40d712e85a025d4bdc2eb57fbb5492f6e78744db12c856fb866c55e3ae8bca82d0257cc7966e5b9a243f7e48eda07246d485c0c02ae2213485ca63f108062649aff1089a9266fd782c6db1ecc7d3169ccde311b42597bae571b5e891c85b2ed1cd236811957fe7f1b4e691481b95ade891e8ea3489d263306fe8dc4e8fa03db994538fa045b94c58355bf40aed6bf14de3436851f1b8e51134aa6b0cd287e4eb471d29b0bbfc118dc3eef1476d90d97dfda8ad68d1bfaf8a28d9f1c5144336ef45627cc4242346126bd503634612bc8cc62493cd24396b3c26d4b808a94a4eb908a9aa2a0cf240d9700995c24c4555525199a9e81a0ed806205dfb133a06f1c8acb1091d838ce4d6b284924154726b4642c9203145dd9c106b2caeb5abd7a7cd1c69299552df899574787d724ae5d46742a9a0fa4c1295d4ccb598ccad862c2cbb310b3cebeab3c8a9b45618356b544ee5d5674469c0c64c9a3589d28fcd063b55970d649fd69ef5d9e494697d4639dd5a9f51c9ad630377fdddf8e6536aba23eff52e33c5530b40472552ab454725264b4b47c5a5eb5097e55976b7e561bdd95179b9e5b0fb523becdbdc42db51a9d4aadc6d891df62cb5de77384f52e3a02b55475b121d9599333b3a2a3567a374546ad1a0e92ca2ad8508c196c3d728cb8827ac8cc8260f0165a3f0905186060f59622df006e611f5c94d64d93588b012e321caada0354979ab9a5bcb7848a905a906196f45a9a581772852fdce2561b492e621cc695a1ed29cbae4212dea3cbe20521131da328a3ba5771b21b113f96bc481d2cc8df850aaba119f447737c6b827aaa73917cb6e830b564c8db8e4f47f5bbc1ab72eb74234e2452d196df069dc366a51692c01e92ad36c72d0cb4e234eb975a811afdcc2d4885771a56a98a942a4a5106929445a8a479396820fc281cdfd8a0d479eed3dca9c62799db203995e5fad901caf5b36d7eb78bd63793d67927092b0562a6760b002f733572935f2985fe6a946baecb3106456772682d856667937b748b39030d7a3b868b350513b86d6922ce466366bbe05d637a9d9cd4640cd6f4682d50ce722b06c4e022cc56c04b979ce4dc45eb5dc5c674f78c151b174be73bcce579974ceb39164663d23493cefd9dececd7c36228eda14673f1b1d35ff5b4f5792d3033c994b78dea6f4013b11a5133888567a819bc8b26b1061996727cae9885a847cd5cce90abed4329c954c750627097fc552ddc14e96d11f1c64b10e61a7c8e9117642ce9a15f5093b2da553b69c3c681d785b2c2f02c36d57186eee620ea18f86d1d5b1a2d5cda13c1a1be3b13e1a8ea18ebe28facc1c0cf5311ccd4c4335e429000f24134baeea5b476fcb952790db04729bc8ca2290c34456169195456465115959445696479e95a511c6d683c009b1c310c48945f73d250b9d2455246359ff7626929b2106372b275c9958b2c3f21072b0348d39cd7646a3042cd9ce79e4a9573a0d22cb0e52777957b223baef1957f8bddbb3fdce996e25db79c26d56245a11895644a2157148bff9901e2a681b261b409787c6581f8e01d0671338d4c14c53a131b0ac816289437a71482f0ee97770482fb29888bb0891c544643111594cc46d4cfe3686ecc87fe8fb18a6bc25e6023878a351dc70a4867ce14665d39dcae98793b76757a7674fa4bffd67e185ffc0d661f4e950fae96f4ef88ff79fdfbefde527e969ef58b0e5645be02649ffe7ff483fa1ffa13ff18ff45151fc92e8e9aed8e633ec885441fb9f2a883ec2830ea07a933e58d5f31b7029b146fe894f3f1323a51745b99d9b396a4d36aca13619e88a6a027d389c18fa74a0cafa0ca81a1880a93c3589036954357cd38dd9bce8d539b188ebf0bed086550171db6b5512db1d57c47e431dbfe54390684a522721d1837ef487ae7cf404db0ec9fdc0491078864dc6b327d966bdbed473e7eb3a7787210ed9159a189897d0a20683b26a2811785d7ec29f99c589c4d2c675b97877e25e500bb1bbc29429d36fe7c13b34cf9149bc8a6b9f799e932a55b269cbaf0445369f03f86b387778589469fe07e212213a7d876e1ca2f377eb7a72192bc0cb44ed6d6b204e702cfc8969be8e82d58326a34178610bb3091354e964436fc4ab5c7d66e4b6f4e592d88d4df85cc6774ccd786456b057a9bdd1ab30e6132b84d809b7c00d416c8c40433d52b42365aa1ea9ca087d54fb707164a04e437bed23a56f20837711c23e9883ef9e0bbe06f8c96e0c17de5e3937ab7a83dfa4e32d1b5b962ca57333be5899d455fc53439b81b7939916794ebb33073756fd0aed5f5e7bfebcc92cc23c3edc4117f379b908c30afd10fa8bedeb7ee1aa275cf584ab9e70d513ae7ac2556f7b08970cc86b83a9b60ebbad0578ccac78344492cbc9cb066ec8e010b87202574ee0caed07ae1c9e4aeb7c55d33977467e7d4d4973c9af85c3c4d4f65ddd86142ce16a1e15f6702d5ed5363233bbcbecc5ccade7dfc2457067072144bbabf1501e8c555d0168af351c0dd1ae4b93a16e5893b1a5aa9a654cf1ae2b7f81a3d7dcffe1237a277613d86d3ddc79d22de7c4c7c1893a32d7ab78121bf02a16452c4517dedde22ebeb48be823c1c7aeb39853f2548fc4b27800e7f97ae6b4aef2142dbb239d915d6850b51f3f719c97f11bc7c51d66becc4c6067b9b0942c5fc5a9b409b8911d299115afb1301d98300933f3b135f03a1e9c3876ccba420b19b1d8326d6c1da08b17ff8a0f97abd0660e5ca94cbbb70c2244d5217af210546ace6825bb06369d4294db51b2d01edd61d5c67e6a96e5e5ce8f90ea5bef6d5138017b7efc3573f6957c0fd60480ac9c4f22a1ccb99c88f89007121f8205401faad6443546486895f1501f425341328c2684329b8c01540d7534501e668c08ae7ed77122b84c112b22624504a09308a210804e02d049003a09402701e8f4c8019df0a9e8dcde7f582780f6e08fa11d029eea8784a7a2a72187e70b2df5ec8e2fa5170483fa0e33c35d3accd03dd7800bdd93c2fba66bef1b7a103b4bbc4e8db8f0fbd923bf1f5a58f8d21353232edc8604c297706611085f02e1eb41dfe000cd32069a3cd1a783a9aa0fa703a0cf0683a10e27d6c098c98636340c7183236e70c40d8eb8c1113738e20647c040893b1c0102c50254b4da45d370454719b8a2d586397e8701d16813e8ceaed16b1efb15563d481c62adee041687d9cc17d0384cd038ccfd29e071c465adb8ac1597b5e2b2565cd68acb5a71592b2e6bc565adb8ac1597b5bbc478d884cfb092a5668c68e1da57c8882a6e0231425cb23ff44b76293397e993c7ecdca4ce1bb3534ddcd2efea96deb371acf13db06f176108ed60b140ea4577c0175b9f80e1d45271b4f05053f4e158013a988e547d32b06623381ec83375bcbbcb7acf435421b9aaaf6ec3d66fecab8b1617f7e2e25e5cdc8b8b7b71712f2eee1fcdc5fdbd8d0c236446b9fa7c810c90405ce4b777918f0d68ddb2c585fbdec58c125b74efafbf16bebdd7f5ff02fc2f10e9fe60af5bb174d054f16e6fc15eb702696c8c8db0cf4d20ea18bafbdf06cbdeff3604f77bee21017c3b84ce1cecbb44512dd973b9a25ab2e7d275bbb8078b60df252b6ec59e4b55dc8a3d9728ac739de50d7471a6ab7d3643800bd0de48df77d3f6c6863ef06f6d7294bdd72d093128baeb2e0260efb9895b3c0ad96b8fc11fcf4990dab5b3fb0a124dc2ee2448ed49d95d04a92d20bb7f60b2e32aba055651a41b9c9864c44862ad7a60cc488297c39864c2e25999b19663428d8b90aae4948b90aaaac2200f94ed955029cc5454251595998aaee1806d00d2b53ca163108fccda99d031c8486ead4a28194425b73624940c1253d4c509b1c6e259bb7a7ddacc9b965229f5fd4f4987d727a7544e7d26940aaacf245149f539a42aaa210bcb6ecc02cfba262ece1995d60aa3668dcaa9bcfa8c280dd89849b32651fab1d960a7eab281ecd3dab33e9b9c32adcf28a75beb332ab9016ce069bf1be77a4a4d77e4074ec4a0a3b2a805a0a312a9d5a2a31293a5a5a3e2d275a8cbf22cbbdbf2b0deec2cfe23b31c765f6a877d9b5b683b2a955a95bb2db1c39ea5d6fb0ee7496a1c74a5ea684ba2a33273664747a5e66c948e4a2d1a349dc586b510e2d77238186519f1845a11d9e421a06c141e32cad0e0214bac051e9a74c9e726b2ec1a445889f1c5d36556d09aa4bc55cdad653ca4d48254838cb7a2d4d2c03b14a97ee792305a49f310e6342d0f694e5df29016751e5f60a588a56c399692d2bb8d820e89fc35e24069e6467c2855dd884fa2bb1b31499579732e96dd0617ac981a86bc66f47f5bbc1ab72eb74234e2452d196df069dc366a51692c01e92ad36c72d0cb4e234eb975a811afdcc2d4885771a56a18942de2b0451cf6a38dc38e5728114dbdb368ea00e93e3b0817733bd0bf008ce0677bc824c681c1ae9b2cb2b2ac80a136d2a102491adba93eb3d4813e422d9919700447aaf94040d059dab3fd186b864a88686b116ddd71b4355a6ac3cc13f48cc8dff3635a0cc973cfbf06aefd1dc4639cf99a19642fb0e377d28ff4eff79e6d90f943fe66b03ac1371ce98dfecd88c01cd80e1e77f297fec5f74893c99f8cd1926b94082aff4182cacbc6072f80df9395f05bf2215adf4db4a8bbc490c44e8d126289975e642fc4ef816fdf930fcbdce93815ba9cef49e8db9e59701ead0c04ae0a068e9a59e4560c08260ea7990e1041f522a85e04d53f92a07ab4e13fe6793f02e8b64d36f0fb7c0be07c064d139aff8ab76a86b770c3a4ee36fe1817935787192ef7c027530043a3072b6a8c046eb2d091bde53ac25d43081cef75b43f013a437dbd6810e0fc092d3967e82157f044c5242a1385f3e01dea12a49a57478c33cf7352f923c6437e6614d97c0ee0afe1dce1615136495a0dba094380847581cf1745f777dcfdd1c62b843044ff8a21d8c51084685d0ac11770ebdd848064891003b12b55d44efc9f18805d8692d6eafd8717852984a8c3c8d18c05c81e3b9a375ed8c348cbd65df678d2ea25833dbcb432c26e5837ae6fc41599376e16989719b146c12f99116c12fa521cd106d13d9523fc30027d5a8b3eda55c450467eba734cce085b676ec945c9ecca01bc528c1fbb2ff86e5cdf1fa2077a66a671fab466a60b9f476b51e6b95c712b05b73bafdc06eec0c2a1b77587de8c1837f580cbc87543ffb7a2a037f3f5ab94fc87e4f6d7a647a270217cbc2e847f958efe7e244557bbcfa445681d69f8c941afd73bf8f8e6fc4a22de8292015ce906dc43094817cbf006a9326be1463a2dbc01a164e35790c499d2d71b889f4142889e1f7877d08566ffe000ed84d10fe8cd15a92701d344aa19295dc9f1ae6d033f5aa2f646c522a23337843ee1876551f2ac8877c2c18ecaeac5953a47ed4b7fec1d90d1ee1f9cb8a80830bf7370a51c07c9c533d23ecbf7e6d27faeeda07fb1fc18f63fc61be940b2f1655f287d8cbe1f1c20252ecd973aae938e9bf3c4b401aaee6194cff750c25e950b1f3e7d76f0177c7f23bd489ef493eb9c274f0ffe821d4d7ccf41bf46e47d0bedf44e6f6cc77c12977428f5de2ddf229d42ce359e1e6ccbbf134fa5759e9de99c3b23bfbea6a4b9f8eb29f69f4175f6636d71017da4ba23773ae9daf716772fbdc841e23ef59fccdeed963da77d12239d708a6f1689ea48afbbc88ccbf89ce52abef6f032ddce67191eb372acdae473b0bbcce6b706810d6e6dff0bd04d59910d750875633086fad0b42c7d361801dd189923c592ad896a409cfe98c9fbb235174d3d4a82ecc497f07b515d779e74f239f15270a281c98d12d63706bc8a670d16f80bef6e71175ff546f4d11cc5ceb09853f2548f6650fe14327aaa67ce36d71c3e66cf0c918084940b40fec6fec4715ec66f148e65cbcacd9e1856882087981287595d1e8e46ca64a4ea536528eb4360025d1b0e347d3c1d0cd1888f4c6b36d8b9883ef8aa0af16c2e9ef915e8131e8700598c854548e960115abf68941fa4af5932d6b35b7b4c5e9b6be5b17d6d8e0c07f2eb96cde3aa11cf24d7d8f04ee18dd7792b3de74197bfa84a5ec95f606cf21760a1cbc8050b41cefa6022a91c0416eaa201c5489511a5529a482fd0bd4f8512ad1990d54bf9a3c04d43c2469919143692dcb03012550e0c1b7d716898e93283534185c30bf2a3918beb5a3348d91779078a9d3a3358ec64b901e320ac1c34761ec581e3a2cd0cde1a4aecdf5d365a3c4178542da2277bb467c99d4c9163d12a63276bea10bbeb28d94d1fdd61ab8bfd2a3fcbcb9d1f21ab6cbd776be18efff9f1d7fced7ea6fb1fba81fb88ba3ef91eac0947b54d1189baab48d400d974f748fb934cbe8aaa41d902435d1d0f813e1cce0c1dcc26b26e9ac092c743538360f82032f9d2b5de7a5c295d98881f15f1a3db8b1fbdb2bf20a3c8b55d299639540109dc2f1c0748365a40907c02e04a64f9c2ef047ffee1847ffe31b7d16bffc40fe77ffef1e71ffe9f7f2c036c6041dc00f45a8e698066942d79375f201e26b43e057de924807340f8226d850ab06f6f6d89f0408ba6770fc2948d43aaf0c5bbf5227e36c8b2b3415ffa1f07d9672937aa2d780ab97153e01cdb7f125a6eeec11d00f026f470fbfa2265b148592ca22b4574a588ae7c34d1952265f1be06318a94c52265b148592c52168b94c5db6a8348592c52166faf252265b148592c52168b94c59248592c52168b94c5226571359148592c52168b94c5ebe844ca6291b258a42c16298b45ca6291b258a42c16298b45ca6291b258a42c16298b45ca6291b258a42c16298b45ca6291b258a42c16298b05c29948592c52168b94c52265b148592c52160bbc4191b258a42cdefb40f110de062131e4f4a9ac0d344d1be96375aae8c3a132d3b5d16ca01b703c1d4e8d993c9a8d1f4862e255adb71e26be2a4a04898b20f18e930c8bf868111fbdd7f1d1c83cc39be18de1d1f17b223abadbe868110ddd5e34749433161b0a6cd9634558f4830b8bde37a7f25cf5f73ea03b58ba21b80dec3d8f4cd0d1e40dbd256ac8edadf7e3852950eec90cfee8997806064ff4958cb0c7271486a418a550c7799ac71bb048ddd4eb7ad5114dfc19731db30be7c656dc0ad88aead4857235409df967e446b371b92d3b6b94ddc3ae7b9fdfaf63d5e77cf7c3b98e1397c5ad5e1637b8c4a02d9b66374fa96434bc8fc9898ab89c1197338ff472a6171fb08bbb99dddfcd4075640c865057a740d687a3d944072ab0f4f178a8c8f24c35076353dccd88bb197137d3d9dd0c4e619779829e11f97b7e4c8b2179eef9d7c0b5bf83788c335f3383ec0576fc4efa91fefddeb30d324bc85ffa170b7cc3f742e8df8c08cc81ede071277fe95f7c8f3499fcc95819b946892ba81fe40aaa6c7cf092f53d59bbbe251fa215d944cbb04b2c3f925e09b1c48b255ae1e3f7c0b7efc987656e2f4b5d75e47b12fab66716ceb82a2f12aa2e13a26616b9152f14c8b958a6030444b1b8841397703fc8255cbe4e703e8368276ec6d96fd17ab870c355ae94302d28afd0325cee814f84f83dfa16accfb4524a47b673eb08777d7778fc70aef9e8838d6c6a4efa9c46a7762552a2a7ff898fdc12f5dd8b1218e37c9119424d36aca13619e88a6ae2e42913439f0e54599f015503033095a726499515d50a5fa562362f7a9c9bb7b8f8f7859aaf78c72dae553fac8cafc8a286ba7bcbfbc168e6519bc2e8413ffa43573e9ea3d2ea2cfa24083cc326a3d8936c93bb1bf5dcf99ccedd5785444d64c145db796a1c5eaf8eb3a9817f5d7e989c99b67e2e85277e522ecf9ddc5a7f42a60fc9afcd73d7b826376a5ea19d07efd0c44626c22a706073baaa229bcf01fc359c3b3c2cca54fd03b969afd5e90ff5c6fd2135a6ad9bf724cfee653235b7353d4e1cc7fb7a629aaf210817fe6ac5af334708aff79fdfbe6dc204553a31c28d5809d767462e8f5e2e8931d384cf657c10dc8c4746cbbe4a97c3aac4cdc9224996b15b806649bc5642433d52b42365aa1ea9ca087d54fb707164a04e4316f291d2379015b608611fccc177b4f9ff1ae027bb5957797be5dcacea0d7e8b83b76c6cf8b094cecdf86265ec55f14f4d4006de4e665a146aba0b6b6563adaf903d8df33b37994098c7873be8623e5146f3526ea1bfd8fe622c9c948493927052124e4ac24949382975eaa4345487c24b4978293d202fa5bf4a477f3f92a2cba867d222b48e34fce4a0d7eb1d7c7c737e25118724c900ae7403eea104a48b65788366b2b570a3291dde8050b2f12b8e034de9eb0dc4cf202144cf0f3c64f441b37f70f03980e807f4e68ad4938069223585748ee478d7b6811f2d517ba36211d1991b429ff0c382297956c43be1604765f5e24a9da3f6a53ff60ec868f70f4e5c540498df39b85278971b3c23edb37cb4b1facfb51df42f961fc3fec7d86c0c241b5f5784d2c7e8fbc101d261d27ca9e33ae9b8394f4c1ba0ea1e4647ae8792156dbf9f3e3bf80b3eaf965e244ffac9f1f593a7077fc157e3bee7a05f23f2be850cb4d31bdb319fc4251d4abd77cbb7b60bc981c8d3836db990e1a9b4ce792c9d7367e4d7d7943497fc5a38d64acddcd5417cc1e8ade65162fad6e2536d0e57b0a3744db1dda943ddda03bde4a57c35f3a7ad6cefe5eacf42b4eabcd2b7a3f1a69b41b905ae6dd9eab5bcc9966f1beb9bb9d6b191adda57f13e76dec93728e7e6b8b69dd95737b595e76d3d7f29c34aba6af31a1a7c0f50d648e1caf9485c39790f761e8a33272df45b77e7a40a130e9dc2a15338740a874ee1d0291c3a8543a770e8dc2787ce928c33c2c1b32507cfd30f276fcfae4ecf9e48d1253706108c3e1d4a3ffdcd09ff815d207ef9497a9abf85146c055bc1563842ff808ed0910f937763c2a33ba46f61ee286b933bf48a5cc7add0ef90f913ea63a069630dbbb658e64c1f8e14539f4d54a86b23633c1b69ea6c6458a57ed1fccecb9467f4aa2efd555d4a5ca49bd4b9455f69bc43793190c79368808933ec05ae4a536faf55fba2efd29355339fae77a84efb1f7b1f51fd447d6cc1057ac56dbd03f47a69f59ce5b5e7da4a6389257cf4c94c9195996aeab28cfe190e64a0cfe070a84f4c0b0ee1703a55a79dc82ca90d93d4f2d47beb724b2ab335c925dcdb905d5d7958d2abb623bdaa6e99aa3553b5813e9d4ea13e04d0d4354b1eeb236b3c1801a4ce2633ad33f155d9e597b5e68f4180d55624587d18128c36b2f7a0a1f4e2d80fa4ad069a3c55645d55a182c61f0cd0f84f145d994d009c0e47da04c8db97dc280c65a3d472d478cb128b7d0922837f4b428b9bda8ac00e1e84c0d617d5f16ca60dcd011a6ed9d0f4211c8c74a08c34246a8636530d65309aa9db14d0f562c956bb2d0be3d5c2b78001ff773ba2c82a85ec7ef115c2cad2970fc000c66989c032a823d109a93a19c8f2549ee8aa81773b0a52669a0a863a042a8000a2a7b4dcb52ad37115aaa49aaf860f277695ae3c4bec6a6da94d3a88bbb75a93dc6404ebc86eb0c0579d8b5ac29bd2ce669301dadfc8ba6169637d3836a6ba368613f48f0cd13e7d20abd6744bd29bd4a14a7c39ebf8c0e437a9fd560538ed22fe0e6b4d84d361e4946107f53a6939a7fcaee80603d95287c6449f8c26a8ab4650d5c16866a04f63309a2aa6851699f665372dbf446e79ebf6706436adf9b6e475d5357c9dd4869cae866ceb2801f86600f5b0bfc07a4dc005740a1780f6d161081641b8c0490645f777dcfd917b59086188fe1543b08b210891ee0ec117bc210a016a9cab8b81d8952acaf9a68801e876266473cd8adeef7829105dde719763c353747ae7724e1f403e0e20a4726c113e1c24361eddc220b1d5e9074141dac5cd437b3849bc77366da224955f383c408ca4eeef721e1242d2ae9603ea7450ac066235f82130f1f267c7ed297acef3f436f57ce999f12351f34dcee27f3818bc0a933fbd7bdf899a3fde6ee35657b37bddba36100c33173aec5086f9bb087650c3b263747678c3ea13e022cee19abae70e2f63da2143f9d973b79870c4d2ecf4edf1e6b7a3d38ef8fd0913ea23bd518f09352642caa48be9a6ec05a66a221100999d76350b1362a51948654696eb2345e665bb09e66451d6eb73ab96fd466dcd0799d6af5f766e34e9b626d4d1dc6904144acfa5468ca8b9d5bc42e95c6bce6a35f57681829a99a71d0186e627756738a5450dd051d1d5eaa2bb2ecfe996ae5a9e55449d0d7567d8be918aeb0e6a97d687dd954a29cf8e9b9a6ada8ecb5da9e58706679c51d93c78c379bdcb87555c549e3cf4d51a90b3053935c65587ac2ee26b3edffb9156e00483a6a7362729353feb149a4eb23ac4ab9922f0ab5bc5afce4cf446e8d1f999df108abaa80a1a31acd60d4d1b9d5316cd6a99d51e0dbbb0218348bf344514a7154e535e9406ea069abcaa3da92e6ba57756ca8d8b9dc04d17b8e902377dbf70d34f31b026aab31fab804fe97dd79fff0f1a9d084057baf6bdc5dd4b2f8250bc4f9191b3e86f65cf69b4e148399c6204a6222c7b1695b61a4f3d77305d89c9be1195bdf4b8ba3ebbb2436c0e6e97d9d82dbcda6290287d309c98036ba6e83290358c380174301a5afa4803ca64a8cab23650da49bf2525d13abb29dd9d275d704e700a9da8db727d88158b01afe2e98125fbc2bb5bdcc59057117d3419318c35e6943cd5a3a992bf268b9eea995bb8352e1ed95bd419b9390daaae8e4f1ce765fc46e1c2adacdcecf55b8580f008d117e0dec0f0d6d635a0cd146d047473a24df4a13c19e91a84b26e8eacc1c8189923a04ddb97a25d142fc4a87531baf590794172018e471363625a9a3e55a7330c2622eb60a669fa643099cc260a1a8599d9ba18eda4782146ad8b91bb9843e8938d2e194da818d0940da0cb4303c75003a0cf267088875485c6c0b2068ad5ba30edb01242a4b62d52c464019a650c3479824661aaeac3e9008de86030d4e1c41a1833d9d08686b16db1eaba2242b45a17ad9d64c0a5246a37e50b416a5f90c8a12e19c89969c2e9d832f4f1643cd4877066e99a3652f4e96c684c272a1ccba6dcbe20eda47c2148bc825478253d98a97d76135f273cb6b39b7287d19acc2add486b9f04ad712eadc993c1e5b43a35610b6275f1e71ff6fd9f7f20c1820fea28708d1b6ddd9eae70ae6dd0bd8dd239722469a48f337948d28b231ea2d5fd102315753aca46519c452c749182617d3355222c0439d16022a99cb72cd445e966a4cae8b3d6f26f72e5d4a485918f2815473eb2954032d35122c94a53144a36ca482cd9df4d05938d24279a8c4495c2c9465f144f66ba8c80b69e40953b216a16bd9697908208e525a5f119396833f878ec7445e165a78e0498effd5488d9c97282cc415829ccec3c8a02cd459b11ea1d66c85d65d289462d973f47a4ce7d10a9730d750647e664a61bca60ac0f67f2489f0e354d57344b19a9a3c9d05414913a57a4ce15a9733b4d9d2b72cafe1839658f1f6b4e55cf81d8a0dc9852357e4f64541519551f4b46d555e2c878e75106965284aed875e6c5b83551630a8d5edfe4dc4924c5f5e1a4733cde0dc4f74300fb68092efb61e096b4063dfd109ad33a8cf30311b77620911fc408b5022ffc30a6ce5e57bf11eced43825c6a0621fb405ad21cfdf0210d495388af4785e82500bc04809700f012005e02c04b007809002f01e02500bc04809700f012005e02c04b007809002f01e02500bc04809700f07a78005e0f1087ab36ba9800f0ea1ac06b5b1851d7d0459d1242732d52541206725c1207725ce1767fdcb6c77266c110fec93bf34fe60b147e28dec969adb7ef9b9c16253c93856772c79ec9187d30f3043d23f2f7fc981643f2dcf3af816b7f07f11867be6606191b17d13be947faf77bcf36c82c217fe95f2cf00d7b45a37f33223007b683c79dfca57ff13dd264f227636ce41a251cb07f1007ecb2f1c14bd6f764edfa967c885664132dc32e3100491c3d6289174bb4c2c7ef816fdf930fcbdce919e5e89bef49e8db9e59b861af749bad729d8d9a59e456749f25b7f2990e786c0ee8f131c7660ff4e445e182dead0bba7039df86cb399baf79be4e703e83c8d43663e062b41e2edc30a98d8d3fde97449ee6b9a09d1311629c6c33585163103293858eecead611eeda45fef8e178b3d3e71b399ca70c68d26a5722ddadb29552794923ec690c69c40db0447683a456386200b3e146798a8b7f5fa8f98a77dce25af533d314bcab64bbdbda0faecf9c4b573e9ea3d2eaf2eb24083cc38ed3bfdae68ec0b2b29635d6d2683b4f8dc3ebd55d0e35f0e9d34ca1d969ebe750a6f0937279660fce68e0cefc09993e041a7d4bf9b6cf837768622313c1854d72e37e0ee0afe1dc793859cf1bb9608b4eafd7e93ebc45e600b2e99b86868801a8ed589d5d997692299963204e706e8a13d37c1d258f089a8c06e185313b9a3041954e36394626c7791d66e472f8e592188b4df85cc607edcd786456b157a9b95185dd981821d1cd21704310db22d0508f14ed4899aa47aa32421fd53e5c1c19a8d3d00ee448e91bc8ca5d84b00fe6e0bbe782af017eb21bbb85b757cecdd652da73978d0d4b96d2b9195fac8ce92afea989cdc0dbc94c8b424d77610d6eacf515daaf600cc1261308f3f870075dcc2702352de516fa8bedabfd364250a8d0089933348221dea4680ab0479b1456b16290499d3885ddfab7173ba4913f79b68376e14efe581d6f8b03d59d3b6a76541f9a37eaf63d238b7dcfe9a598ed40e1a4d8aa93e24370652b4a4853a7b1acc8089f3191f451247d14491f3940f9d7e0deafe3b1c642aec5afda6aae60d715ca7ab656ed4292173b7137e0ddd936b68f705d6ce7ee31a0f37760db02462eb67d8750c151ed85c7edae3c6eefa18f7adb0e17ba37fb026f435b8f1cfff02765228fa03a1dea261c4ff4a16229fa5496555d990d8dd1c0d06643606cc10537ace383bba61d5b77ca5d53b6f0d2155eba023f58b8af0afc60e1be291084853ba740101608c202415820080b046181202c5039052a271f2aa74093fc51d024054ea1c029fc51710a05e6db5e60be09e71f81502610ca84d79240ba124857e2de9df7de7d39bf03be8d8f68b1faba0da0eb802fb6bebcd5b58935501503e8703631f5a1a24d746d68c9ba3c99198a2a9b9a02c1ee80af3ccfc4b5c657ee954dd8fa857b65c9e2ba5d5cb78beb7671dd2eaedbc575bbb86e17d7ed1bef9e4f3f9cbc3dbb3a3d7b22ad2ede752b86523a947efa9b13fe0387c0fff293f4341f85faf838c7f1e0d8c6c311c7e541dffbd76ce12eb107ee12a9d4edf585efc2dfef44a55f80ff05a2b57cbfafdd970e9a2adeed9e27ed452b70b8e7ce1c44474377ffdb60d9fbdf86e07eafdb80b35ad82174e660df258a6ac99ecb15d5923d97aedbc53d5804fb2e59712bf65caae256ecb944619deb2c6fa0ebee77c6f700b800ed8df47d376d6f6ce803ffd6263713c2ab5438fbb6ef5dfee379f852bb7676ff5ea249d89d7aa93d29bb2f2fb5056477de4d765cec2ebbe906a7e8acbb96c45af5c09891042f8731c9643349ce5a8e09352e42aa92532e42aaaa0a833c50b65742a5305351955454662aba8603b60148d7f2848e413c326b6742c72023b9b52aa11cd7f52157260d3cd7158dc5f17ef5fab499c33aa552eabb5d930eaf4f4ea99cfa4c2815549f49a2929a012d92b9d5908565376681675d7d163995d60aa3668dcaa9bcfa8c280dd89849b32651fab1d960a7eab281ecd3dab33e9b9c32ed3c9663bb01263c28ac6d4695506abaa3380322061d95452d001d9548ad161d95982c2d1d1597ae435d9667d9dd9687f56647e5e596c3ee4bedb06f730b6d47a552ab72b72576d8b3d47adfe13c498d83ae541d6d49745466ceecd8d360bc071e7bd80a687acb01879465c4136e4764938780b25178c8284383872cb1167801cb89fae426b2ec1a445889f110e556d09aa4bc55cdad653ca4d48254838cb7a2d4d2c03b14a97ee792305a49f310e6346d8b31aedb0bae2dc3fe1711b58d226a29bddb281694c85f230e94666ec48752d58df824babb71b201a27a9a73b1ec36b860c5d4884b4effb7c5ab71eb722b44235ed492d1069fc66da31695c61290ae32cd2607bdec34e2945b871e4040fa5662e51ba42d1101f22240fea107c8afe24cd2c52a175dd2306a3e0d7e74d2f4c751d09fe7a7c181d103920fda0137a147720360f80c1cf5acabaaac8c1559d3e58139d38783b1a56b2375a64f4783b13c5381aacdd24b668ad3ade7dfa2bec3b9d575cbb246d6589eeaa3091ceb43058e744d85a63e05d6541bce2c793a56aa59dce10402fa0c8c87f260acea0a50657d381a1afa5493a16e5893b1a5aa9a654c41190f0cdceeeab78bb907e688116e9a0e0696292b93813e3254549fb136d6a783d9481f4f21048a3591c7a36115af5befc684fa7836d386e640d655d9d0f4211c8c74a08c345d510d6da61aca603453ab38e8f27034522623559f2a43d41460025d1b0e3454fc60285b939169cd0625c4387fe155e84318be0377fa78a499231902d49d03342cca0475a73c51755999a91363381d0f8683f56d982ad3e160a20df481a168b817863a182a337d6258a81183f1d09aaa1bab218f6613d91c011d551b31b15097cc2c6ba2032423a83dea746c940d2df9f4094f3f7da020726d66ea863c32907c4d0c5dd3a6409f2236a3f10cc2b161ac6f080e31d2ef3c6779edb9aa6e99aa355351b3a6d32944bd8be44cb3e4b18e2470300243d4f3338d9d9f3e9929b84b4d5d96d13fc3810cf4191c0ef58969c1211c4ea7ead4626287f659fa1868da580368d02d3c97468aa9cf262a4413ca18cf469a3a1b192ccc70ea63548b81264f1524822a54503bc100b573a2e8ca6c02e07438d226203ee18a810ad219ff3c1f79f6fc55b46fbbca2e40a79ee3f997607e970b0e430a27fd297df9b5ed38c5f7f0d3f4159c34a8f80a7e9abef20e9934389552fea5e879fada873b80c12292e8316f8104a987e36de31fd2172f816b7a7352db804ef8f90bcef4f9fc98fe39d19e257df1fc957d8dd6e8ef541cfdf3937bcf36cf71e2a7200a2d0f70346d5c061aeb1e5eafca5f4a79a095c62319a5808393f820f6343d6a4ef185b496b91a3d7fb3b0570347f6dca4592fd1aa7501fc9066ac8e4668048bef94d1bf4113ddddc4207da98cc3253437d1c7afa4d457d089ba8bfc7ae2dcdd80521615ef55f029eb0a39cfa4d017d99fabbba3e2bd0a3e559d52fa5632e6e9103f8fc222a9b84727c4b9aa9142ce08790c4b40fd9cb0a219a04967f8de6adadf913465a72b69a6e6e1eab784134dfcfc1d04c1c25f09f85982a290e7747671f5e6d94456a6cf8fd377528e349384e51cbaabbe3cf121c0b1ec419eed5c45732ef9317dfd155af7816bc072128867279e50d44bb9aaac0a7f7e71f2961672d3c65e1001d66117d03f7d97d3489198e75f2a617011ad36653cd47e860bfde6aa853ef87a890407c31c954900fd7b86e8b37b87918acc2aa2e4f79488001be1fe3873af517bfe9b64a371736aabfc256a2a6050847710899259988cab9f56efdf785fd1589d380e89090eca2a9b7f274fbceac035d4ab97f2e4781adae8dd920a442b49e97b2b450fbf8538411bc82b9fd50fe9bb4997130d909756a4240e65f43fa22c326f26229b0ae8f30bb40b5b55e16416a0ed6d084bea9efc94b258113ebff002b23b4d23d0570cd1ee1ed51ba7432c724c7e5b091b229f0387484690517b78c5a57ea328ae9112cdf45ada0def3e63aad5ef69cdcb6bfbfc12a398f8eff02ec981650290792126ba8a105b2ea17545610d5da45832418cc99517fec20b49ed4a183effd7e95514c59e6d2209d33f5ebdf3d92f31aea2e7c94baf1918bdbefaf436dd07c6bdecc01056d360641437807eb8f695c8196c4dc9c7f9a2715dca1bf59a6ed4bbab130309053213d23bd33c098e784064256f524c4cf35fb761828d562600859756c48863080cb4dbb1cbaa9bf9bd40f4c1bf06aefd1d94402c6488e9f70a4c90ae0fd693476f1409d15a0dd7d2e1178a64f12c5a4b19bfb3228eed663487c8128aaaf46e5e34d02b5e5cb1791d25253d772def73004f9213383ccfaf304ea87b1d548c1f03255d0c2c48527a1417480bf7d6f5beba315f48111238bf8f0be0acf61f64e64f65f232fdf38ae89f2b84b99249b282682ae2d311a6ffcc03d4619eefc0b793d00141dcec20a7864ade58d1223b00adcb97f1f15ee938675f5991a6aa354fa511b2bce6458f2e3d2f7c8ff3e2961593fcb87afd0a5e63d3c1fe0ea901dd3075d7d2d0acfd7bdb802731b05a698572ef14884fc11d200093360c2a6b5378b3c0e613c67d5b57814f2b60384c86d7a5970bcb4a37c7890591f96df57eb96e7d97d5ad9ff1d126d2c9e7afaa9a42bd91927dba7ae3db26754c7079b576718862bed62e0e599ea48cffba83d7b9b5ea8def2deed6164508d6be11afce65cd8d7fa22b95af04a9d9ce6b55a8d1bb181094168d912ccbd1ebc9af14c185bbfbbecdd581d4ab426a3f25624b4eb3a9a32bfa181ecf1be85fe48fb62a31bfb2785ff8dfde4610a42ccdaa2e556f607e555c0dcf89f7faab89b0028a8a504dd734edf97d8a747b842f06928b86e7486db901be24c12b35da5e1c27477e7800b22882eb0131d9c130ab813023104c1afdb20cf9b21af512dfb2851406e67382b6fafc3803baead1c6d3f363af604be1b624f60a6a43c674c13de9217d8b975df2373d5401df30b226fa37bd319a6313eff971f437bd21f24873c89f83f44e6f55e90c682701b9449bb52be086e142ba582e6f6ffffc7f5ce846a897e936cef061547f55569523797a242b9f14f5d960f04c51316424042b412919dae727aeeb85e49d582ade92cbaff8cb4bcfbb9d033fae55326fffdb865f53130b29fef831d11d14bed8f3e8c171f6e8f8bfc90d15c6ae949673db7dd11b8f27ea449bf4e5e150992a83893c5134f43f65d093becd010e919d68aa3ced0f47b232c4cf87aaa28c87c311fe1d33184c26536dda57b481aacada743ad16455431f7aa8004c8f0b982aa33e7a3a1d690aa29c4e26f254d15633bc0a7313e3995e5c7ef82fb472fdd63bfb7479a54da563e9d3bbc1e8f5f9fb276787ef9ff60e5f9e5c9dbd39fbf0867aa77778f6feeaecddcbb767e8c902cf46e04a9fa08f661f9adac0912e136432096df042389714d40209a2fdd31cdbbf87ef10f1d9e546e2d73eb696306def775e9aa95c8346a941a3d6a019d4a019d6a019d7a099f0d2a86881ad4133e2a751701f9cbd7d7b7e71f5e1fcd56fbd37c8e042d221f70ec76812a1b975a84eb5be3a9aa8aaaac8cae1dbb3f76f3efdfaf9fdf9a7df7ad8024692a7fcfe7b2abc27a7a79f2f4f4effe737b98f1f5f5c9ea3fa20aef8c8faab6ddcf40ee5c393f76fde9e451c4c72ce821ef66565321c0dd4a93ac2e3321820625c1d7c96db3b1caa230d3d38fdf0febfcf2eafce3fbcffad174f282cf79f7efd80defc8497269cc01a4aefa06f008cf547b1404d9ae00a9d5c9e200adc416f014e0c6142c9b3d08a8a0c7bd43f9e6f5fdb2e7b25a902344d56720578ee756509eaa456116ab688c832b30046369440586c477f8a24f6f0eaf424296981b6c54b3c6659bea32cdfd7d8b2922008b0c2ee1d8e88e764f9d867f98ccbf8b89e1fde10464c3cd038a1b1befaed14f8210c6ce01eaabf1f9efcfb1ce9ca2767487be26a1d7eb87c850a40a4150219bf8fb52d293e26502b093e5f9dbc39fbedeaf4c305d6c0e46c19629b4a0a16c8405a1e4aa1779720304b737077877eeba3b973727976821a6abbc83831a52309ad8a68a98512fee65916f982df7bf9f2c3bf7f1b697d6d78a84cfbb2763841833d3d1c28fdd13423ec03798c7a20078c1d8362ff8cffbc588473e9e7ef9e0b5f0c46d2cfd071ee821768de6ab2f473e87dbd0eb4e10bf990fa9ff4331ef5e005a2723ddd442b56015c3b06d656e441115b3bc2d5c6d5ca436b27b0dae4c6257a218faf9dc1d62e5d0e2b00b74bc0b651bbd7e26d17b1b6a9aba06ad06d2ec0ed52b0edf4627765a944e65389f5435b45384b446a15c548c8f63dfc14c30e133462e28d16e2174378473ccc2cacba2f4980acb2fa29c25fbee965ccae577680dd757247542f21c0921d1f7f63278059f4a4b07f294333ce611947e7eb7a0091f94e946eb22539bd017e39d66b1983d4970f6f3013aaf11a32db8fa440b74833cac8e56a72b4237531aeb94eefa218693180ac7ee7acfc90c96e342124d2b3811819e38b00298862af6558e1fb8e4d9c7cb45dc0edf80e7daf5685aaeb52358259cce1e7c71971cac87d41fc9e1fffe7da467fffff504b01023f0314000200080064852754153314c9377b010012de11002a0000000000000000000000b681000000007b62323336616238352d303063382d343161362d396232382d6266623666333137623161327d2e716773504b05060000000001000100580000007f7b01000000');


--
-- TOC entry 4017 (class 0 OID 17728)
-- Dependencies: 204
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 278
-- Name: aikavali_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.aikavali_id_seq', 1, false);


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 276
-- Name: ajanhetki_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.ajanhetki_id_seq', 1, false);


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 242
-- Name: asiakirja_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.asiakirja_id_seq', 1, false);


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 268
-- Name: geometria_arvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.geometria_arvo_id_seq', 1, false);


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 238
-- Name: kaava_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaava_id_seq', 2, true);


--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 260
-- Name: kaavakohde_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavakohde_id_seq', 48, true);


--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 250
-- Name: kaavamaarays_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavamaarays_id_seq', 28, true);


--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 234
-- Name: kaavan_kumoamistieto_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavan_kumoamistieto_id_seq', 1, false);


--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 240
-- Name: kaavan_laatija_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavan_laatija_id_seq', 2, true);


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 258
-- Name: kaavaselostus_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavaselostus_id_seq', 1, false);


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 262
-- Name: kaavasuositus_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavasuositus_id_seq', 1, false);


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 289
-- Name: kasittelytapahtuma_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kasittelytapahtuma_id_seq', 1, false);


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 280
-- Name: koodiarvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.koodiarvo_id_seq', 1, false);


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 286
-- Name: korkeuspiste_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.korkeuspiste_id_seq', 5, true);


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 264
-- Name: korkeusvali_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.korkeusvali_id_seq', 1, true);


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 244
-- Name: lahtotietoaineisto_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.lahtotietoaineisto_id_seq', 1, false);


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 252
-- Name: lisatieto_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.lisatieto_id_seq', 1, false);


--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 282
-- Name: numeerinen_arvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.numeerinen_arvo_id_seq', 46, true);


--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 284
-- Name: numeerinen_arvovali_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.numeerinen_arvovali_id_seq', 3, true);


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 248
-- Name: osallistumis_ja_arviointisuunnitelma_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.osallistumis_ja_arviointisuunnitelma_id_seq', 1, false);


--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 266
-- Name: tekstiarvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.tekstiarvo_id_seq', 63, true);


--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 274
-- Name: tietoyksikko_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.tietoyksikko_id_seq', 136, true);


--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 270
-- Name: tunnusarvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.tunnusarvo_id_seq', 1, false);


--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 291
-- Name: vuorovaikutustapahtuma_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.vuorovaikutustapahtuma_id_seq', 1, false);


--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 236
-- Name: asiakirjan_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.asiakirjan_laji_id_seq', 22, true);


--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 215
-- Name: digitaalinen_alkupera_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.digitaalinen_alkupera_id_seq', 4, true);


--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 209
-- Name: kaavalaji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavalaji_id_seq', 16, true);


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 227
-- Name: kaavamaarays_laji_ak_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavamaarays_laji_ak_id_seq', 277, true);


--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 225
-- Name: kaavamaarays_laji_yk_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavamaarays_laji_yk_id_seq', 243, true);


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 219
-- Name: kaavan_elinkaaritila_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavan_elinkaaritila_id_seq', 14, true);


--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 256
-- Name: kaavan_kasittelytapahtuman_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavan_kasittelytapahtuman_laji_id_seq', 13, true);


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 229
-- Name: kaavan_vuorovaikutustapahtuman_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavan_vuorovaikutustapahtuman_laji_id_seq', 7, true);


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 223
-- Name: kaavoitusteema_ak_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavoitusteema_ak_id_seq', 11, true);


--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 221
-- Name: kaavoitusteema_yk_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavoitusteema_yk_id_seq', 1, true);


--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 246
-- Name: lahtoaineiston_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.lahtoaineiston_laji_id_seq', 24, true);


--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 254
-- Name: lisatiedon_laji_ak_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.lisatiedon_laji_ak_id_seq', 13, true);


--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 272
-- Name: lisatiedon_laji_yk_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.lisatiedon_laji_yk_id_seq', 11, true);


--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 213
-- Name: maanalaisuuden_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.maanalaisuuden_laji_id_seq', 2, true);


--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 232
-- Name: oikeusvaikutteisuuden_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.oikeusvaikutteisuuden_laji_id_seq', 2, true);


--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 211
-- Name: sitovuuslaji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.sitovuuslaji_id_seq', 2, true);


--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 217
-- Name: ymparistomuutoksenlaji_yk_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.ymparistomuutoksenlaji_yk_id_seq', 2, true);


--
-- TOC entry 4120 (class 2606 OID 18951)
-- Name: aikavali aikavali_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.aikavali
    ADD CONSTRAINT aikavali_pk PRIMARY KEY (id);


--
-- TOC entry 4118 (class 2606 OID 18944)
-- Name: ajanhetki ajanhetki_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.ajanhetki
    ADD CONSTRAINT ajanhetki_pk PRIMARY KEY (id);


--
-- TOC entry 4082 (class 2606 OID 18626)
-- Name: asiakirja asiakirja_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT asiakirja_pk PRIMARY KEY (id);


--
-- TOC entry 4110 (class 2606 OID 18813)
-- Name: geometria_arvo geometria_arvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.geometria_arvo
    ADD CONSTRAINT geometria_arvo_pk PRIMARY KEY (id);


--
-- TOC entry 4076 (class 2606 OID 18602)
-- Name: kaava kaava_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaava_pk PRIMARY KEY (id);


--
-- TOC entry 4078 (class 2606 OID 18675)
-- Name: kaava kaava_uq; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaava_uq UNIQUE (id_osallistumis_ja_arviointisuunnitelma);


--
-- TOC entry 4102 (class 2606 OID 18756)
-- Name: kaavakohde kaavakohde_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT kaavakohde_pk PRIMARY KEY (id);


--
-- TOC entry 4090 (class 2606 OID 18682)
-- Name: kaavamaarays kaavamaarays_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavamaarays_pk PRIMARY KEY (id);


--
-- TOC entry 4072 (class 2606 OID 18579)
-- Name: kaavan_kumoamistieto kaavan_kumoamistieto_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_kumoamistieto
    ADD CONSTRAINT kaavan_kumoamistieto_pk PRIMARY KEY (id);


--
-- TOC entry 4080 (class 2606 OID 18614)
-- Name: kaavan_laatija kaavan_laatija_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_laatija
    ADD CONSTRAINT kaavan_laatija_pk PRIMARY KEY (id);


--
-- TOC entry 4098 (class 2606 OID 18744)
-- Name: kaavaselostus kaavaselostus_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus
    ADD CONSTRAINT kaavaselostus_pk PRIMARY KEY (id);


--
-- TOC entry 4100 (class 2606 OID 18830)
-- Name: kaavaselostus kaavaselostus_uq; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus
    ADD CONSTRAINT kaavaselostus_uq UNIQUE (id_kaava);


--
-- TOC entry 4104 (class 2606 OID 18768)
-- Name: kaavasuositus kaavasuositus_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaavasuositus_pk PRIMARY KEY (id);


--
-- TOC entry 4130 (class 2606 OID 19078)
-- Name: kasittelytapahtuma kasittelytapahtuma_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma
    ADD CONSTRAINT kasittelytapahtuma_pk PRIMARY KEY (id);


--
-- TOC entry 4122 (class 2606 OID 18966)
-- Name: koodiarvo koodiarvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.koodiarvo
    ADD CONSTRAINT koodiarvo_pk PRIMARY KEY (id);


--
-- TOC entry 4128 (class 2606 OID 19016)
-- Name: korkeuspiste korkeuspiste_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.korkeuspiste
    ADD CONSTRAINT korkeuspiste_pk PRIMARY KEY (id);


--
-- TOC entry 4106 (class 2606 OID 18788)
-- Name: korkeusvali korkeusvali_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.korkeusvali
    ADD CONSTRAINT korkeusvali_pk PRIMARY KEY (id);


--
-- TOC entry 4084 (class 2606 OID 18641)
-- Name: lahtotietoaineisto lahtotietoaineisto_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lahtotietoaineisto
    ADD CONSTRAINT lahtotietoaineisto_pk PRIMARY KEY (id);


--
-- TOC entry 4092 (class 2606 OID 18707)
-- Name: lisatieto lisatieto_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lisatieto
    ADD CONSTRAINT lisatieto_pk PRIMARY KEY (id);


--
-- TOC entry 4124 (class 2606 OID 18981)
-- Name: numeerinen_arvo numeerinen_arvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.numeerinen_arvo
    ADD CONSTRAINT numeerinen_arvo_pk PRIMARY KEY (id);


--
-- TOC entry 4126 (class 2606 OID 18991)
-- Name: numeerinen_arvovali numeerinen_arvovali_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.numeerinen_arvovali
    ADD CONSTRAINT numeerinen_arvovali_pk PRIMARY KEY (id);


--
-- TOC entry 4088 (class 2606 OID 18668)
-- Name: osallistumis_ja_arviointisuunnitelma osallistumis_ja_arviointisuunnitelma_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.osallistumis_ja_arviointisuunnitelma
    ADD CONSTRAINT osallistumis_ja_arviointisuunnitelma_pk PRIMARY KEY (id);


--
-- TOC entry 4108 (class 2606 OID 18803)
-- Name: tekstiarvo tekstiarvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tekstiarvo
    ADD CONSTRAINT tekstiarvo_pk PRIMARY KEY (id);


--
-- TOC entry 4116 (class 2606 OID 18902)
-- Name: tietoyksikko tietoyksikko_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT tietoyksikko_pk PRIMARY KEY (id);


--
-- TOC entry 4112 (class 2606 OID 18823)
-- Name: tunnusarvo tunnusarvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tunnusarvo
    ADD CONSTRAINT tunnusarvo_pk PRIMARY KEY (id);


--
-- TOC entry 4132 (class 2606 OID 19096)
-- Name: vuorovaikutustapahtuma vuorovaikutustapahtuma_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma
    ADD CONSTRAINT vuorovaikutustapahtuma_pk PRIMARY KEY (id);


--
-- TOC entry 4074 (class 2606 OID 18589)
-- Name: asiakirjan_laji abstrakti_koodilista_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.asiakirjan_laji
    ADD CONSTRAINT abstrakti_koodilista_pk PRIMARY KEY (id);


--
-- TOC entry 4054 (class 2606 OID 18481)
-- Name: digitaalinen_alkupera digitaalinen_alkupera_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.digitaalinen_alkupera
    ADD CONSTRAINT digitaalinen_alkupera_pk PRIMARY KEY (id);


--
-- TOC entry 4048 (class 2606 OID 18451)
-- Name: kaavalaji kaavalaji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavalaji
    ADD CONSTRAINT kaavalaji_pk PRIMARY KEY (id);


--
-- TOC entry 4066 (class 2606 OID 18541)
-- Name: kaavamaarays_laji_ak kaavamaarays_laji_ak_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavamaarays_laji_ak
    ADD CONSTRAINT kaavamaarays_laji_ak_pk PRIMARY KEY (id);


--
-- TOC entry 4064 (class 2606 OID 18531)
-- Name: kaavamaarays_laji_yk kaavamaarays_laji_yk_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavamaarays_laji_yk
    ADD CONSTRAINT kaavamaarays_laji_yk_pk PRIMARY KEY (id);


--
-- TOC entry 4058 (class 2606 OID 18501)
-- Name: kaavan_elinkaaritila kaavan_elinkaaritila_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavan_elinkaaritila
    ADD CONSTRAINT kaavan_elinkaaritila_pk PRIMARY KEY (id);


--
-- TOC entry 4096 (class 2606 OID 18727)
-- Name: kaavan_kasittelytapahtuman_laji kaavan_kasittelytapahtuman_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavan_kasittelytapahtuman_laji
    ADD CONSTRAINT kaavan_kasittelytapahtuman_laji_pk PRIMARY KEY (id);


--
-- TOC entry 4068 (class 2606 OID 18551)
-- Name: kaavan_vuorovaikutustapahtuman_laji kaavan_vuorovaikutustapahtuman_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavan_vuorovaikutustapahtuman_laji
    ADD CONSTRAINT kaavan_vuorovaikutustapahtuman_laji_pk PRIMARY KEY (id);


--
-- TOC entry 4062 (class 2606 OID 18521)
-- Name: kaavoitusteema_ak kaavoitusteema_ak_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavoitusteema_ak
    ADD CONSTRAINT kaavoitusteema_ak_pk PRIMARY KEY (id);


--
-- TOC entry 4060 (class 2606 OID 18511)
-- Name: kaavoitusteema_yk kaavoitusteema_yk_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavoitusteema_yk
    ADD CONSTRAINT kaavoitusteema_yk_pk PRIMARY KEY (id);


--
-- TOC entry 4086 (class 2606 OID 18651)
-- Name: lahtoaineiston_laji lahtoaineiston_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.lahtoaineiston_laji
    ADD CONSTRAINT lahtoaineiston_laji_pk PRIMARY KEY (id);


--
-- TOC entry 4094 (class 2606 OID 18717)
-- Name: lisatiedon_laji_ak lisatiedon_laji_ak_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.lisatiedon_laji_ak
    ADD CONSTRAINT lisatiedon_laji_ak_pk PRIMARY KEY (id);


--
-- TOC entry 4114 (class 2606 OID 18890)
-- Name: lisatiedon_laji_yk lisatiedon_laji_yk_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.lisatiedon_laji_yk
    ADD CONSTRAINT lisatiedon_laji_yk_pk PRIMARY KEY (id);


--
-- TOC entry 4052 (class 2606 OID 18471)
-- Name: maanalaisuuden_laji maanalaisuuden_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.maanalaisuuden_laji
    ADD CONSTRAINT maanalaisuuden_laji_pk PRIMARY KEY (id);


--
-- TOC entry 4070 (class 2606 OID 18569)
-- Name: oikeusvaikutteisuuden_laji oikeusvaikutteisuuden_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.oikeusvaikutteisuuden_laji
    ADD CONSTRAINT oikeusvaikutteisuuden_laji_pk PRIMARY KEY (id);


--
-- TOC entry 4050 (class 2606 OID 18461)
-- Name: sitovuuslaji sitovuuslaji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.sitovuuslaji
    ADD CONSTRAINT sitovuuslaji_pk PRIMARY KEY (id);


--
-- TOC entry 4056 (class 2606 OID 18491)
-- Name: ymparistomuutoksenlaji_yk ymparistomuutoksenlaji_yk_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.ymparistomuutoksenlaji_yk
    ADD CONSTRAINT ymparistomuutoksenlaji_yk_pk PRIMARY KEY (id);


--
-- TOC entry 4134 (class 2606 OID 19164)
-- Name: qgis_projects qgis_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qgis_projects
    ADD CONSTRAINT qgis_projects_pkey PRIMARY KEY (name);


--
-- TOC entry 4148 (class 2606 OID 19027)
-- Name: asiakirja asiakirja_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT asiakirja_asiakirja FOREIGN KEY (id_asiakirja) REFERENCES kaavatiedot.asiakirja(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4143 (class 2606 OID 18846)
-- Name: asiakirja asiakirjan_laji_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT asiakirjan_laji_asiakirja FOREIGN KEY (id_asiakirjan_laji) REFERENCES koodistot.asiakirjan_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4136 (class 2606 OID 18627)
-- Name: kaava digitaalinen_alkupera_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT digitaalinen_alkupera_kaava FOREIGN KEY (id_digitaalinen_alkupera) REFERENCES koodistot.digitaalinen_alkupera(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4142 (class 2606 OID 19127)
-- Name: kaavan_laatija kaava_fk; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_laatija
    ADD CONSTRAINT kaava_fk FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4141 (class 2606 OID 19132)
-- Name: kaava kaava_fk; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaava_fk FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4153 (class 2606 OID 19137)
-- Name: lahtotietoaineisto kaava_fk; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lahtotietoaineisto
    ADD CONSTRAINT kaava_fk FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4151 (class 2606 OID 19142)
-- Name: asiakirja kaava_fk; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kaava_fk FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4163 (class 2606 OID 18789)
-- Name: kaavakohde kaava_kaavakohde; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT kaava_kaavakohde FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4158 (class 2606 OID 18866)
-- Name: kaavamaarays kaava_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaava_kaavamaarays FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4135 (class 2606 OID 18871)
-- Name: kaavan_kumoamistieto kaava_kaavan_kumoamistieto; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_kumoamistieto
    ADD CONSTRAINT kaava_kaavan_kumoamistieto FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4161 (class 2606 OID 18824)
-- Name: kaavaselostus kaava_kaavaselostus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus
    ADD CONSTRAINT kaava_kaavaselostus FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4168 (class 2606 OID 18831)
-- Name: kaavasuositus kaava_kaavasuositus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaava_kaavasuositus FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4185 (class 2606 OID 19117)
-- Name: kasittelytapahtuma kaava_kasittelytapahtuma; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma
    ADD CONSTRAINT kaava_kasittelytapahtuma FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4187 (class 2606 OID 19112)
-- Name: vuorovaikutustapahtuma kaava_vuorovaikutustapahtuma; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma
    ADD CONSTRAINT kaava_vuorovaikutustapahtuma FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4165 (class 2606 OID 19022)
-- Name: kaavakohde kaavakohde_kaavakohde; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT kaavakohde_kaavakohde FOREIGN KEY (id_kaavakohde) REFERENCES kaavatiedot.kaavakohde(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4157 (class 2606 OID 18861)
-- Name: kaavamaarays kaavakohde_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavakohde_kaavamaarays FOREIGN KEY (id_kaavakohde) REFERENCES kaavatiedot.kaavakohde(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4169 (class 2606 OID 18856)
-- Name: kaavasuositus kaavakohde_kaavasuositus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaavakohde_kaavasuositus FOREIGN KEY (id_kaavakohde) REFERENCES kaavatiedot.kaavakohde(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4174 (class 2606 OID 19032)
-- Name: tietoyksikko kaavakohde_tietoyksikko; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT kaavakohde_tietoyksikko FOREIGN KEY (id_kaavakohde) REFERENCES kaavatiedot.kaavakohde(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4139 (class 2606 OID 18836)
-- Name: kaava kaavalaji_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaavalaji_kaava FOREIGN KEY (id_kaavalaji) REFERENCES koodistot.kaavalaji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4147 (class 2606 OID 18923)
-- Name: asiakirja kaavamaarays_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kaavamaarays_asiakirja FOREIGN KEY (id_kaavamaarays) REFERENCES kaavatiedot.kaavamaarays(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4154 (class 2606 OID 18683)
-- Name: kaavamaarays kaavamaarays_laji_ak_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavamaarays_laji_ak_kaavamaarays FOREIGN KEY (id_kaavamaarays_laji_ak) REFERENCES koodistot.kaavamaarays_laji_ak(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4160 (class 2606 OID 19122)
-- Name: lisatieto kaavamaarays_lisatieto; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lisatieto
    ADD CONSTRAINT kaavamaarays_lisatieto FOREIGN KEY (id_kaavamaarays) REFERENCES kaavatiedot.kaavamaarays(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4176 (class 2606 OID 19047)
-- Name: tietoyksikko kaavamaarays_tietoyksikko; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT kaavamaarays_tietoyksikko FOREIGN KEY (id_kaavamaarays) REFERENCES kaavatiedot.kaavamaarays(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4140 (class 2606 OID 18841)
-- Name: kaava kaavan_elinkaaritila_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaavan_elinkaaritila_kaava FOREIGN KEY (id_kaavan_elinkaaritila) REFERENCES koodistot.kaavan_elinkaaritila(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4155 (class 2606 OID 18688)
-- Name: kaavamaarays kaavan_elinkaaritila_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavan_elinkaaritila_kaavamaarays FOREIGN KEY (id_kaavan_elinkaaritila) REFERENCES koodistot.kaavan_elinkaaritila(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4166 (class 2606 OID 18769)
-- Name: kaavasuositus kaavan_elinkaaritila_kaavasuositus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaavan_elinkaaritila_kaavasuositus FOREIGN KEY (id_kaavan_elinkaaritila) REFERENCES koodistot.kaavan_elinkaaritila(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4184 (class 2606 OID 19079)
-- Name: kasittelytapahtuma kaavan_kasittelytapahtuman_laji_kasittelytapahtuma; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma
    ADD CONSTRAINT kaavan_kasittelytapahtuman_laji_kasittelytapahtuma FOREIGN KEY (id_kaavan_kasittelytapahtuman_laji) REFERENCES koodistot.kaavan_kasittelytapahtuman_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4186 (class 2606 OID 19097)
-- Name: vuorovaikutustapahtuma kaavan_vuorovaikutustapahtuman_laji_vuorovaikutus_d41d8c; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma
    ADD CONSTRAINT kaavan_vuorovaikutustapahtuman_laji_vuorovaikutus_d41d8c FOREIGN KEY (id_kaavan_vuorovaikutustapahtuman_laji) REFERENCES koodistot.kaavan_vuorovaikutustapahtuman_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4145 (class 2606 OID 18913)
-- Name: asiakirja kaavaselostus_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kaavaselostus_asiakirja FOREIGN KEY (id_kaavaselostus) REFERENCES kaavatiedot.kaavaselostus(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4144 (class 2606 OID 18908)
-- Name: asiakirja kaavasuositus_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kaavasuositus_asiakirja FOREIGN KEY (id_kaavasuositus) REFERENCES kaavatiedot.kaavasuositus(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4177 (class 2606 OID 19052)
-- Name: tietoyksikko kaavasuositus_tietoyksikko; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT kaavasuositus_tietoyksikko FOREIGN KEY (id_kaavasuositus) REFERENCES kaavatiedot.kaavasuositus(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4156 (class 2606 OID 18693)
-- Name: kaavamaarays kaavoitusteema_ak_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavoitusteema_ak_kaavamaarays FOREIGN KEY (id_kaavoitusteema_ak) REFERENCES koodistot.kaavoitusteema_ak(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4167 (class 2606 OID 18774)
-- Name: kaavasuositus kaavoitusteema_ak_kaavasuositus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaavoitusteema_ak_kaavasuositus FOREIGN KEY (id_kaavoitusteema_ak) REFERENCES koodistot.kaavoitusteema_ak(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4150 (class 2606 OID 19107)
-- Name: asiakirja kasittelytapahtuma_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kasittelytapahtuma_asiakirja FOREIGN KEY (id_kasittelytapahtuma) REFERENCES kaavatiedot.kasittelytapahtuma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4152 (class 2606 OID 18851)
-- Name: lahtotietoaineisto lahtoaineiston_laji_lahtotietoaineisto; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lahtotietoaineisto
    ADD CONSTRAINT lahtoaineiston_laji_lahtotietoaineisto FOREIGN KEY (id_lahtoaineiston_laji) REFERENCES koodistot.lahtoaineiston_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4159 (class 2606 OID 18728)
-- Name: lisatieto lisatiedon_laji_ak_lisatieto; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lisatieto
    ADD CONSTRAINT lisatiedon_laji_ak_lisatieto FOREIGN KEY (id_lisatiedon_laji_ak) REFERENCES koodistot.lisatiedon_laji_ak(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4175 (class 2606 OID 19042)
-- Name: tietoyksikko lisatieto_tietoyksikko; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT lisatieto_tietoyksikko FOREIGN KEY (id_lisatieto) REFERENCES kaavatiedot.lisatieto(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4162 (class 2606 OID 18757)
-- Name: kaavakohde maanalaisuuden_laji_kaavakohde; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT maanalaisuuden_laji_kaavakohde FOREIGN KEY (id_maanalaisuuden_laji) REFERENCES koodistot.maanalaisuuden_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4183 (class 2606 OID 19017)
-- Name: korkeuspiste numeerinen_arvo_korkeuspiste; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.korkeuspiste
    ADD CONSTRAINT numeerinen_arvo_korkeuspiste FOREIGN KEY (id_numeerinen_arvo) REFERENCES kaavatiedot.numeerinen_arvo(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4170 (class 2606 OID 19002)
-- Name: korkeusvali numeerinen_arvovali_korkeusvali; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.korkeusvali
    ADD CONSTRAINT numeerinen_arvovali_korkeusvali FOREIGN KEY (id_numeerinen_arvovali) REFERENCES kaavatiedot.numeerinen_arvovali(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4137 (class 2606 OID 18652)
-- Name: kaava oikeusvaikutteisuuden_laji_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT oikeusvaikutteisuuden_laji_kaava FOREIGN KEY (id_oikeusvaikutteisuuden_laji) REFERENCES koodistot.oikeusvaikutteisuuden_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4146 (class 2606 OID 18918)
-- Name: asiakirja osallistumis_ja_arviointisuunnitelma_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT osallistumis_ja_arviointisuunnitelma_asiakirja FOREIGN KEY (id_osallistumis_ja_arviointisuunnitelma) REFERENCES kaavatiedot.osallistumis_ja_arviointisuunnitelma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4138 (class 2606 OID 18669)
-- Name: kaava osallistumis_ja_arviointisuunnitelma_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT osallistumis_ja_arviointisuunnitelma_kaava FOREIGN KEY (id_osallistumis_ja_arviointisuunnitelma) REFERENCES kaavatiedot.osallistumis_ja_arviointisuunnitelma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4164 (class 2606 OID 18876)
-- Name: kaavakohde sitovuuslaji_kaavakohde; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT sitovuuslaji_kaavakohde FOREIGN KEY (id_sitovuuslaji) REFERENCES koodistot.sitovuuslaji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4179 (class 2606 OID 18952)
-- Name: aikavali tietoyksikko_aikavali; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.aikavali
    ADD CONSTRAINT tietoyksikko_aikavali FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4178 (class 2606 OID 19037)
-- Name: ajanhetki tietoyksikko_ajanhetki; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.ajanhetki
    ADD CONSTRAINT tietoyksikko_ajanhetki FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4172 (class 2606 OID 18928)
-- Name: geometria_arvo tietoyksikko_geometria_arvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.geometria_arvo
    ADD CONSTRAINT tietoyksikko_geometria_arvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4180 (class 2606 OID 18967)
-- Name: koodiarvo tietoyksikko_koodiarvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.koodiarvo
    ADD CONSTRAINT tietoyksikko_koodiarvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4181 (class 2606 OID 18992)
-- Name: numeerinen_arvo tietoyksikko_numeerinen_arvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.numeerinen_arvo
    ADD CONSTRAINT tietoyksikko_numeerinen_arvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4182 (class 2606 OID 18997)
-- Name: numeerinen_arvovali tietoyksikko_numeerinen_arvovali; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.numeerinen_arvovali
    ADD CONSTRAINT tietoyksikko_numeerinen_arvovali FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4171 (class 2606 OID 18903)
-- Name: tekstiarvo tietoyksikko_tekstiarvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tekstiarvo
    ADD CONSTRAINT tietoyksikko_tekstiarvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4173 (class 2606 OID 18933)
-- Name: tunnusarvo tietoyksikko_tunnusarvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tunnusarvo
    ADD CONSTRAINT tietoyksikko_tunnusarvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4149 (class 2606 OID 19102)
-- Name: asiakirja vuorovaikutustapahtuma_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT vuorovaikutustapahtuma_asiakirja FOREIGN KEY (id_vuorovaikutustapahtuma) REFERENCES kaavatiedot.vuorovaikutustapahtuma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2022-02-23 11:36:46

--
-- PostgreSQL database dump complete
--

