--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: kaavatiedot; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA kaavatiedot;


ALTER SCHEMA kaavatiedot OWNER TO postgres;

--
-- Name: koodistot; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA koodistot;


ALTER SCHEMA koodistot OWNER TO postgres;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
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
-- Name: ajanhetki; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.ajanhetki (
    id bigint NOT NULL,
    arvo timestamp without time zone,
    id_tietoyksikko bigint
);


ALTER TABLE kaavatiedot.ajanhetki OWNER TO postgres;

--
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
-- Name: COLUMN versioitu_objekti_abstrakti.nimiavaruus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.nimiavaruus IS 'tunnusten nimiavaruus';


--
-- Name: COLUMN versioitu_objekti_abstrakti.viittaustunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.viittaustunnus IS 'johdettu nimiavaruudesta, luokan englanninkielisestä nimestä ja paikallisesta tunnuksesta';


--
-- Name: COLUMN versioitu_objekti_abstrakti.identiteettitunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.identiteettitunnus IS 'kohteen versioriippumaton tunnus';


--
-- Name: COLUMN versioitu_objekti_abstrakti.tuottajakohtainen_tunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.tuottajakohtainen_tunnus IS 'kohteen tunnus tuottajatietojärjestelmässä';


--
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
-- Name: COLUMN asiakirja.asiakirjan_tunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.asiakirja.asiakirjan_tunnus IS 'asiakirjan pysyvä tunnus, esim. diaarinumero tai muu dokumentinhallinnan tunnus';


--
-- Name: COLUMN asiakirja.nimi; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.asiakirja.nimi IS 'asiakirjan nimi';


--
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
    geom_poly public.geometry(MultiPolygon,3067)
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.kaavakohde OWNER TO postgres;

--
-- Name: TABLE kaavakohde; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.kaavakohde IS 'kaavaan sisältyvä aluerajaus tai kohde, jonka alueella maankäyttöä tai rakentamista halutaan ohjata

Kaavakohteella on maantieteellinen sijainti ja muoto. Velvoittava ohjausvaikutus kuvataan liittyvien kaavamääräysten ja ei-velvoittava liittyvien kaavasuositusten avulla.';


--
-- Name: COLUMN kaavakohde.liittyvan_lahtotietokohteen_tunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.kaavakohde.liittyvan_lahtotietokohteen_tunnus IS 'viittaus kaavan lähtötietoaineistoon sisältyvään tietokohteeseen, joka liittyy kaavakohteeseen. Esim. pohjavesialue';


--
-- Name: COLUMN kaavakohde.geom; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.kaavakohde.geom IS 'Kaikkien kaavaan liittyvien paikkatietokohteiden yhteinen abstrakti yläluokka. Kohteen geometria voi olla 2-ulotteinen piste, viiva tai alue, tai 3-ulotteinen kappale. Moniosaiset geometriat (multigeometry) ovat sallittuja. Haluttaessa korkeusulottuvuus voidaan ilmaista 2-ulotteisen geometria-attribuutin arvo ja pystysuuntainenRajaus-attribuutin kuvaamien korkeusvälien avulla, myös useampana erillisenä kerroksena. Tällöin kohteen ulottuvuus vastaa 3-ulotteista avaruusgeometriaa, joka muodostuu työntämällä 2-ulotteista pintaa ylös- ja/tai alaspäin annatun korkeusvälin rajoihin saakka. Huomaa, että Korkeusvali-luokan ylä- tai alaraja (korkeuden maksimi- tai minimiarvo) voi myös puuttua, jolloin kohde kattaa alueen ylöspäin tai alaspäin annetusta korkeudesta.';


--
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
-- Name: TABLE kaavamaarays; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.kaavamaarays IS 'kaavaan sisältyvä velvoittava määräys, jolla ohjataan alueiden suunnittelua ja rakentamista.
Kaavoissa käytettävät kaavamääräysten lajit on yhteisesti sovittu. Määräys voi kohdistua joko yksittäiseen kaavakohteeseen tai koko kaavaan. Kaavamääräykseen voi sisältyä sen lajiin perustuvaa ohjausvaikutusta tarkentavia arvoja ja lisätietoja.';


--
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
-- Name: TABLE kaavan_kumoamistieto; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.kaavan_kumoamistieto IS 'tieto kaavan hyväksymisen johdosta kokonaisuudessaan kumoutuvasta kaavasta tai kaavan kumottavasta osa-alueesta, yksittäisistä kaavakohteista tai kaavamääräyksistä.
kumoamistieto kuvaa miten kaavan voimaantulo vaikuttaa toisten kaavojen ja niiden sisältämien määräysten tai suositusten kumoutumiseen.';


--
-- Name: COLUMN kaavan_kumoamistieto.kumottavan_kaavan_tunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.kaavan_kumoamistieto.kumottavan_kaavan_tunnus IS 'URI';


--
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
-- Name: kaavaselostus; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.kaavaselostus (
    id bigint NOT NULL,
    id_kaava bigint
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.kaavaselostus OWNER TO postgres;

--
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
-- Name: TABLE kaavasuositus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.kaavasuositus IS 'kaavaan sisältyvä ei-velvoittava ohje, joka ilmentää esimerkiksi toteutuksen tapaa ja tavoitetta.
Suositus voi kohdistua joko yksittäiseen kaavakohteeseen tai koko kaavaan. Kaavasuositukseen voi sisältyä sen ohjausvaikutusta tarkentavia arvoja.';


--
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
-- Name: korkeuspiste; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.korkeuspiste (
    id bigint NOT NULL,
    geom public.geometry(PointZ,3067),
    id_numeerinen_arvo bigint
);


ALTER TABLE kaavatiedot.korkeuspiste OWNER TO postgres;

--
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
-- Name: korkeusvali; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.korkeusvali (
    id bigint NOT NULL,
    geom public.geometry(PointZ,3067),
    id_numeerinen_arvovali bigint
);


ALTER TABLE kaavatiedot.korkeusvali OWNER TO postgres;

--
-- Name: TABLE korkeusvali; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON TABLE kaavatiedot.korkeusvali IS 'Arvo, joka kuvaa kahden pystysuuntaisella koordinaatiston koordinaatin välistä janaa.';


--
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
-- Name: COLUMN lahtotietoaineisto.aineistotunnus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.aineistotunnus IS 'lähtötietoaineiston tunnus';


--
-- Name: COLUMN lahtotietoaineisto.lisatietolinkki; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.lisatietolinkki IS 'viittaus ulkoiseen lisätietokuvaukseen asiakirjasta';


--
-- Name: COLUMN lahtotietoaineisto.metatietokuvaus; Type: COMMENT; Schema: kaavatiedot; Owner: postgres
--

COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.metatietokuvaus IS 'viittaus ulkoiseen metatietokuvaukseen';


--
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
-- Name: osallistumis_ja_arviointisuunnitelma; Type: TABLE; Schema: kaavatiedot; Owner: postgres
--

CREATE TABLE kaavatiedot.osallistumis_ja_arviointisuunnitelma (
    id bigint NOT NULL
)
INHERITS (kaavatiedot.versioitu_objekti_abstrakti);


ALTER TABLE kaavatiedot.osallistumis_ja_arviointisuunnitelma OWNER TO postgres;

--
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
-- Name: asiakirjan_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.asiakirjan_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.asiakirjan_laji OWNER TO postgres;

--
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
-- Name: digitaalinen_alkupera; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.digitaalinen_alkupera (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.digitaalinen_alkupera OWNER TO postgres;

--
-- Name: TABLE digitaalinen_alkupera; Type: COMMENT; Schema: koodistot; Owner: postgres
--

COMMENT ON TABLE koodistot.digitaalinen_alkupera IS 'Digitaalisella alkuperällä tarkoitetaan kaava-aineiston digitoinnin tapaa.';


--
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
-- Name: kaavalaji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavalaji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavalaji OWNER TO postgres;

--
-- Name: TABLE kaavalaji; Type: COMMENT; Schema: koodistot; Owner: postgres
--

COMMENT ON TABLE koodistot.kaavalaji IS 'Kaavalajit (maakunta-, yleis- ja asemakaava)';


--
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
-- Name: kaavamaarays_laji_ak; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavamaarays_laji_ak (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavamaarays_laji_ak OWNER TO postgres;

--
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
-- Name: kaavamaarays_laji_yk; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavamaarays_laji_yk (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavamaarays_laji_yk OWNER TO postgres;

--
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
-- Name: kaavan_elinkaaritila; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavan_elinkaaritila (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavan_elinkaaritila OWNER TO postgres;

--
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
-- Name: kaavan_kasittelytapahtuman_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavan_kasittelytapahtuman_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavan_kasittelytapahtuman_laji OWNER TO postgres;

--
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
-- Name: kaavan_vuorovaikutustapahtuman_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavan_vuorovaikutustapahtuman_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavan_vuorovaikutustapahtuman_laji OWNER TO postgres;

--
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
-- Name: kaavoitusteema_ak; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavoitusteema_ak (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavoitusteema_ak OWNER TO postgres;

--
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
-- Name: kaavoitusteema_yk; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.kaavoitusteema_yk (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.kaavoitusteema_yk OWNER TO postgres;

--
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
-- Name: lahtoaineiston_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.lahtoaineiston_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.lahtoaineiston_laji OWNER TO postgres;

--
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
-- Name: lisatiedon_laji_ak; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.lisatiedon_laji_ak (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.lisatiedon_laji_ak OWNER TO postgres;

--
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
-- Name: lisatiedon_laji_yk; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.lisatiedon_laji_yk (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.lisatiedon_laji_yk OWNER TO postgres;

--
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
-- Name: maanalaisuuden_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.maanalaisuuden_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.maanalaisuuden_laji OWNER TO postgres;

--
-- Name: TABLE maanalaisuuden_laji; Type: COMMENT; Schema: koodistot; Owner: postgres
--

COMMENT ON TABLE koodistot.maanalaisuuden_laji IS 'Maanalaisuuden lajin avulla ilmaistaan koko Kaavan tai sen sisältämien yksittäisten Kaavamääräyskohteiden sijainti maanpinnan ylä tai alapuolella.';


--
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
-- Name: oikeusvaikutteisuuden_laji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.oikeusvaikutteisuuden_laji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.oikeusvaikutteisuuden_laji OWNER TO postgres;

--
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
-- Name: sitovuuslaji; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.sitovuuslaji (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.sitovuuslaji OWNER TO postgres;

--
-- Name: TABLE sitovuuslaji; Type: COMMENT; Schema: koodistot; Owner: postgres
--

COMMENT ON TABLE koodistot.sitovuuslaji IS 'Sijainnin sitovuuden avulla ilmaistaan kaavan sisältämien Kaavamääräyskohteiden sijainnin sitovuus tai ohjeellisuus. Asemakaavassa kaikki kohteet ovat sijainniltaan joko sitovia tai ohjeellisia. Yleiskaavassa sitovuuden lajin ilmaiseminen on vapaaehtoista.';


--
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
-- Name: ymparistomuutoksenlaji_yk; Type: TABLE; Schema: koodistot; Owner: postgres
--

CREATE TABLE koodistot.ymparistomuutoksenlaji_yk (
    id integer NOT NULL
)
INHERITS (koodistot.koodilista_abstrakti);


ALTER TABLE koodistot.ymparistomuutoksenlaji_yk OWNER TO postgres;

--
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
-- Name: Istutettava; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."Istutettava" AS
 SELECT kk.geom,
    k.nimi_fi
   FROM kaavatiedot.kaavakohde kk,
    (koodistot.kaavamaarays_laji_ak k
     LEFT JOIN kaavatiedot.kaavamaarays km ON ((k.id = km.id_kaavamaarays_laji_ak)))
  WHERE (((kk.geom)::text <> 'NULL'::text) AND ((k.nimi_fi)::text = 'Istutettava alueen osa'::text));


ALTER TABLE public."Istutettava" OWNER TO postgres;

--
-- Name: qgis_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qgis_projects (
    name text NOT NULL,
    metadata jsonb,
    content bytea
);


ALTER TABLE public.qgis_projects OWNER TO postgres;

--
-- Name: testi_2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.testi_2 AS
 SELECT kaavakohde.nimiavaruus,
    kaavakohde.viittaustunnus,
    kaavakohde.identiteettitunnus,
    kaavakohde.tuottajakohtainen_tunnus,
    kaavakohde.viimeisin_muutos,
    kaavakohde.tallennusaika,
    kaavakohde.id,
    kaavakohde.liittyvan_lahtotietokohteen_tunnus,
    kaavakohde.id_sitovuuslaji,
    kaavakohde.id_maanalaisuuden_laji,
    kaavakohde.geom,
    kaavakohde.id_kaava,
    kaavakohde.id_kaavakohde,
    kaavakohde.geom_line,
    kaavakohde.geom_point,
    kaavakohde.geom_poly
   FROM kaavatiedot.kaavakohde;


ALTER TABLE public.testi_2 OWNER TO postgres;

--
-- Name: testi_poly2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.testi_poly2 AS
 SELECT kaavakohde.nimiavaruus,
    kaavakohde.viittaustunnus,
    kaavakohde.identiteettitunnus,
    kaavakohde.tuottajakohtainen_tunnus,
    kaavakohde.viimeisin_muutos,
    kaavakohde.tallennusaika,
    kaavakohde.id,
    kaavakohde.liittyvan_lahtotietokohteen_tunnus,
    kaavakohde.id_sitovuuslaji,
    kaavakohde.id_maanalaisuuden_laji,
    kaavakohde.geom,
    kaavakohde.id_kaava,
    kaavakohde.id_kaavakohde,
    kaavakohde.geom_line,
    kaavakohde.geom_point,
    kaavakohde.geom_poly
   FROM kaavatiedot.kaavakohde
  WHERE (kaavakohde.geom_poly IS NOT NULL);


ALTER TABLE public.testi_poly2 OWNER TO postgres;

--
-- Name: asiakirja viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: asiakirja tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: kaavakohde viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: kaavakohde tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: kaavan_laatija viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_laatija ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: kaavan_laatija tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_laatija ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: kaavaselostus viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: kaavaselostus tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: kasittelytapahtuma viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: kasittelytapahtuma tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: kasittelytapahtuma peruttu; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma ALTER COLUMN peruttu SET DEFAULT false;


--
-- Name: osallistumis_ja_arviointisuunnitelma viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.osallistumis_ja_arviointisuunnitelma ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: osallistumis_ja_arviointisuunnitelma tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.osallistumis_ja_arviointisuunnitelma ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: tapahtuma_abstrakti viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tapahtuma_abstrakti ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: tapahtuma_abstrakti tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tapahtuma_abstrakti ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: tietoyksikko viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: tietoyksikko tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: vuorovaikutustapahtuma viimeisin_muutos; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma ALTER COLUMN viimeisin_muutos SET DEFAULT now();


--
-- Name: vuorovaikutustapahtuma tallennusaika; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma ALTER COLUMN tallennusaika SET DEFAULT now();


--
-- Name: vuorovaikutustapahtuma peruttu; Type: DEFAULT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma ALTER COLUMN peruttu SET DEFAULT false;


--
-- Data for Name: aikavali; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.aikavali (id, alku, loppu, id_tietoyksikko) FROM stdin;
\.


--
-- Data for Name: ajanhetki; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.ajanhetki (id, arvo, id_tietoyksikko) FROM stdin;
\.


--
-- Data for Name: asiakirja; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.asiakirja (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, asiakirjan_tunnus, nimi, lisatietolinkki, metatietokuvaus, id_asiakirjan_laji, id_kaavasuositus, id_kaavaselostus, id_osallistumis_ja_arviointisuunnitelma, id_kaavamaarays, id_asiakirja, id_vuorovaikutustapahtuma, id_kasittelytapahtuma, id_kaava) FROM stdin;
\.


--
-- Data for Name: geometria_arvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.geometria_arvo (id, geom_poly, geom_point, geom_line, id_tietoyksikko) FROM stdin;
1	\N	\N	01050000A0FB0B000001000000010200008012000000E6B418391FB21441CD48BED4F4EF594100000000000000002E66849921B214412C4FD6E1F4EF59410000000000000000051F5FA464B2144159A97E5FF7EF59410000000000000000641C273398B2144167DC00A1F7EF59410000000000000000C0199C09B8B2144142D713D4F7EF594100000000000000008EC43246CBB2144138475716F8EF59410000000000000000186AB88EE5B214412E57D54BF9EF59410000000000000000EA40127E52B314416C50DE7EFDEF594100000000000000001A529531A4B314416E0125A500F059410000000000000000CF5F0FE1D2B314418A9E346602F059410000000000000000E27AF569D4B41441342A09740AF059410000000000000000ABDEEADD0CB514415C4D4B720FF059410000000000000000B0ED768024B514414D62DA3510F05941000000000000000082E17B911FB514416BF58E2E12F059410000000000000000E3E337BE1EB514413FEBBD0318F05941000000000000000004F7098300B51441108B5D3923F059410000000000000000DEF803A0EFB414411F1F67FD26F059410000000000000000ECB115F6EBB41441B1FB757A27F059410000000000000000	\N
2	\N	\N	01050000A0FB0B00000100000001020000800200000014139F9ECCB314413073173402F05941000000000000000076DF9EA11FB41441BAB3EAF9F8EF59410000000000000000	\N
3	\N	\N	01050000A0FB0B000001000000010200008004000000292FC4C6B6B51441B3ADDDD709F0594100000000000000005CD5D1AFA6B51441FC7416860AF059410000000000000000CDFEF25230B5144178C8ED6C0FF059410000000000000000B0ED768024B514414D62DA3510F059410000000000000000	\N
4	\N	\N	01050000A0FB0B000001000000010200008008000000A6F01C64E5B51441147BE6DF05F059410000000000000000F4DE301C1EB6144158CE4A7B01F059410000000000000000718B8BFC82B61441B9217AB8F9EF5941000000000000000068824956ABB61441504AC09DF6EF594100000000000000001BE8B178B9B614410A62C9DAF5EF594100000000000000007C0B2EB6D2B6144196F30513F4EF594100000000000000007C0B2EB6D2B6144196F30513F4EF594100000000000000004CC47C6726B7144125E8C4DFEDEF59410000000000000000	\N
5	\N	\N	01050000A0FB0B0000010000000102000080050000001BE8B178B9B614410A62C9DAF5EF5941000000000000000024648266A6B614415412044DF4EF594100000000000000008E4F7C958AB61441D169A649F3EF59410000000000000000A4DFA2FF5FB61441ED7FDCA8F1EF5941000000000000000026DA39B555B614413BA74546F1EF59410000000000000000	\N
\.


--
-- Data for Name: kaava; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.kaava (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, kaavatunnus, vireilletulo_aika, hyvaksymisen_aika, id_digitaalinen_alkupera, id_oikeusvaikutteisuuden_laji, id_kaavalaji, id_osallistumis_ja_arviointisuunnitelma, nimi, id_kaavan_elinkaaritila, kuvaus, geom, voimassaolo_alku, voimassaolo_loppu, metatietokuvaus, id_kaava) FROM stdin;
\N	\N	\N	\N	2022-01-09 19:09:05.938	\N	1	70753ceb-d1fa-4f44-8ac2-cb3624dae233	2020-02-17 00:00:00	\N	4	1	9	\N	Tanssilavan asemakaava	4	Asemakaava koskee pääosin rakentumatonta Valkeakosken kaupungin omistamaa aluetta ja sillä muodostetaan alueelle asuinpientalojen korttelialuetta sekä lähivirkistys- ja\nkatualuetta. Lisäksi asemakaavoitetaan alueella sijaitsevat neljä yksityisessä omistuksessa olevaa jo rakentunutta asuinkiinteistöä sekä yksi kaupungin omistama kiinteistö,\njolta rakennukset on purettu vuoden 2020 aikana.\nAlueen ensimmäisen asemakaavan yhteydessä siihen liitetään pieneltä osin muutettavan\nasemakaavan (Länsi-Lintula 476) lähivirkistysaluetta (372 m2) asuinpientalojen\nkorttelialueeksi. Myös muutettavan asemakaavan (Lintula 403) katualuetta (2410 m2) on\nliitetty kaava-alueeseen, jotta katujen nimistö saadaan tarkoituksenmukaiseksi.	010C0000A0FB0B000001000000010A000080010000000102000080540000003E44D61F10B4144188C8C14821F05941000000000000000030E3C01471B71441F4D3E5303DF059410000000000000000788109CC7FB714417BCE51833BF05941000000000000000098F8411293B71441E45AAD5039F059410000000000000000A976051EB1B71441259598E335F059410000000000000000DA851D72CEB714410B66758B32F0594100000000000000009ABB6C1AF7B714411E30B68E2DF059410000000000000000047B1F7FF7B714411A1DF2802DF0594100000000000000007DE47059FFB714414E839A372CF05941000000000000000006125E0E06B8144141AA55EE2AF0594100000000000000000ABB65F409B8144174F8A2102AF0594100000000000000004E6DAF4E0DB81441D797783729F05941000000000000000082FCFBD410B81441C69CDC2A28F0594100000000000000004C0D747615B814415353024B26F059410000000000000000107C991C20B8144142ECBA9A1EF05941000000000000000097C8769A21B814415592F37F1DF059410000000000000000A6AEEA0223B81441ED5ABDB81BF0594100000000000000005A811C7A26B81441A6FC4F5817F05941000000000000000028F0975526B81441C68F82E616F059410000000000000000E8E16C4824B814418F6C07F010F0594100000000000000009EE3979F20B81441E6E66DCC0CF059410000000000000000F4B0309820B81441D1C202C60CF059410000000000000000D6FDA05020B81441C991BB930CF0594100000000000000004AD825931DB81441327DE1A60AF059410000000000000000BAF32E7A1DB814419E5357950AF0594100000000000000007D5AB0711DB81441EF7A5F8F0AF059410000000000000000485617FE13B814410C6E64EB03F059410000000000000000D08878B80CB81441124670CFFEEF594100000000000000000F7A426F09B81441637CE575FCEF594100000000000000008A9CAC3905B8144196971FB9FAEF59410000000000000000C43530D601B814410BC18DB0F9EF5941000000000000000017478188FFB71441504E4C15F9EF5941000000000000000058E2E4BDFEB714413C5758E3F8EF5941000000000000000024AA8A70FCB7144183F01A5AF8EF5941000000000000000063DF7661F9B7144118020BB3F7EF59410000000000000000A747B9B7F7B714414457345EF7EF59410000000000000000425EA9F1F5B714412E97AA07F7EF594100000000000000003EAADF47EFB71441E8AB01E0F5EF5941000000000000000069206D9CE7B7144134D108B7F4EF59410000000000000000EB5A19B4D8B714413C2974CEF2EF5941000000000000000088E55E40C5B71441A8A1D8C3F0EF594100000000000000008CE3D189B0B7144138B082F5EEEF59410000000000000000D0983E7E9FB71441F4537FADEDEF59410000000000000000416E2FFF86B7144198115115ECEF59410000000000000000E174B6F967B71441DCD93364EAEF594100000000000000007BE660AD45B71441D382BDC1E8EF59410000000000000000D5AEF34D06B71441F7C2AAAEE6EF59410000000000000000022572959FB61441D9B389A5E3EF5941000000000000000001EBB5D94BB61441F280A759E1EF59410000000000000000E63735920DB614414C6D1AB3DFEF59410000000000000000C44EB7C65AB51441949686ECDAEF59410000000000000000D481C834F9B41441FEF2ED4AD8EF59410000000000000000BD5E823FA3B4144157D950DCD5EF59410000000000000000A795BBB18BB41441855C1812D5EF594100000000000000004EFBF6A56FB414419226A016D4EF594100000000000000006CD5960EF1B314419E4238A0CFEF59410000000000000000A00008D5C5B314417634686AD4EF59410000000000000000479EDE7EF2B3144110E683FDD5EF59410000000000000000184D6E8A1CB414418A06FE78D7EF59410000000000000000DEC67F69ABB314413D93341DD9EF594100000000000000003A1B372E85B31441B62937ABD9EF594100000000000000001AFFFDE534B31441FDD06BD5DAEF59410000000000000000B60E5604ADB2144131121CCEDCEF59410000000000000000142071E592B21441A3BB6FDCE0EF59410000000000000000AE33B8A88AB21441453E13E0E0EF5941000000000000000018CA588B78B2144170946473E3EF594100000000000000001C77624D5CB21441FFCE4F77E7EF594100000000000000000EC525B94FB2144168F0E6E5E8EF594100000000000000007875468534B21441988DECECEBEF5941000000000000000079FB2C3625B21441147616A1EDEF59410000000000000000601073DAFBB11441F9476A3BF2EF5941000000000000000041A508A9F9B11441D369E579F2EF59410000000000000000A54825A219B214416AC0C6B0F3EF594100000000000000005853AEF9F7B114417466B9EAF8EF59410000000000000000BA0FD433EAB114419D3A360EFBEF59410000000000000000B324BADABBB1144186329A4002F0594100000000000000009442412813B21441405913DA05F059410000000000000000103BD80F7FB214412EAFFF4C0AF05941000000000000000020CD604783B2144104E988D20AF05941000000000000000021E17F0C91B214410BBF95860CF0594100000000000000004C30B370B6B21441D95DA52611F0594100000000000000005F9EFDC306B3144114ED47161BF059410000000000000000E24A6B2539B314410AC4314514F0594100000000000000003E44D61F10B4144188C8C14821F059410000000000000000	\N	\N	\N	\N
\.


--
-- Data for Name: kaavakohde; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.kaavakohde (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, liittyvan_lahtotietokohteen_tunnus, id_sitovuuslaji, id_maanalaisuuden_laji, geom, id_kaava, id_kaavakohde, geom_line, geom_point, geom_poly) FROM stdin;
\N	\N	\N	\N	\N	\N	1	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800500000024D0B0D389B214414EEAADD5E2EF5941000000000000000031ED6EFB61B214419B94C565E8EF59410000000000000000BB003BA6C1B21441A5404401ECEF5941000000000000000067F696A6C2B2144132D0A558EBEF5941000000000000000024D0B0D389B214414EEAADD5E2EF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	3	\N	1	2	010C0000A0FB0B000001000000010A000080010000000102000080100000005BCB72C4E1B314412DDB6418D9EF59410000000000000000D042C1D0B5B21441563E8572DDEF5941000000000000000054733ED6A3B21441C74B303DE0EF59410000000000000000FC269A2FE8B2144127A81A7AEAEF59410000000000000000B495D04BFCB21441B041AFE3EBEF59410000000000000000549C3C6DFFB214410CCBFFF8EBEF594100000000000000000A93226303B31441E401618AEBEF594100000000000000004C0F58D92AB31441B65B4737E7EF59410000000000000000B592EB0931B314417EE31ADCE6EF5941000000000000000005CFDEA432B3144149AE75C4E6EF59410000000000000000B38982FA58B314414ADDCC8FE4EF59410000000000000000718CD77491B3144162E8A9F4DEEF59410000000000000000B3BE3DEC3AB41441227F0B19E1EF5941000000000000000091821D136EB41441BFE19F0BDAEF59410000000000000000BF6EDDAC51B4144139030C0DD9EF594100000000000000005BCB72C4E1B314412DDB6418D9EF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	5	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800C00000031ED6EFB61B214419B94C565E8EF59410000000000000000126340703EB2144176B06F5AECEF59410000000000000000993406E435B21441FCD3F74DEDEF594100000000000000001A5F9DCC09B2144194162A36F2EF59410000000000000000A0A38B6670B21441C285C61BF6EF594100000000000000000443E6538DB21441A4BA9EE3F2EF59410000000000000000AEAD76BFBDB21441414E1880EDEF59410000000000000000A25244FAC0B21441B8171424EDEF59410000000000000000E0EF6456C1B21441E89642C1ECEF594100000000000000006DAD4209C2B214417F426701ECEF59410000000000000000BB003BA6C1B21441A5404401ECEF5941000000000000000031ED6EFB61B214419B94C565E8EF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	7	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800E00000005CFDEA432B3144149AE75C4E6EF59410000000000000000B592EB0931B314417EE31ADCE6EF59410000000000000000BE1C58D92AB31441F05A4737E7EF594100000000000000004C0F58D92AB31441B65B4737E7EF59410000000000000000BE1C58D92AB31441F05A4737E7EF594100000000000000002D8F33D703B314412591A78EEBEF594100000000000000001F90B8BA01B31441F33BCECAEBEF59410000000000000000F0E2939800B314418F9E18EBEBEF594100000000000000008AAB48C3FFB214417D82D502ECEF59410000000000000000A1D7071DC3B31441265922DEF2EF59410000000000000000568733AF24B414417CD5D84AF6EF59410000000000000000911C5FD124B414417D9C084CF6EF59410000000000000000681412D253B41441D171E410F1EF5941000000000000000005CFDEA432B3144149AE75C4E6EF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	8	\N	1	2	010C0000A0FB0B000001000000010A00008001000000010200008009000000225F57D27CB41441F59C1BC6F0EF5941000000000000000076240F8B42B4144114994B54F7EF594100000000000000000129ED5406B51441D6AFE020FEEF594100000000000000008D3DDB3968B51441F6322B8701F059410000000000000000F4B3C81ECAB5144198B075ED04F05941000000000000000006F04CDECBB51441A52900FD04F059410000000000000000F7B3C81ECAB5144198B075ED04F059410000000000000000BD180E6604B61441A9CE455FFEEF59410000000000000000225F57D27CB41441F59C1BC6F0EF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	2	\N	1	2	010C0000A0FB0B000001000000010A00008003000000010200008026000000600E139128B2144194585261F3EF59410000000000000000B033A1A5CAB1144124DDBDF601F05941000000000000000059E0245588B2144144E9DAC809F0594100000000000000005C85084806B314410C6D3B5D19F059410000000000000000A634DB5B35B31441AB708FFE12F05941000000000000000022040E9815B41441260FE19D20F059410000000000000000036785557CB51441FF327D192CF0594100000000000000005181E2CD88B51441ECD846A929F0594100000000000000000A8D561E98B51441485B73F329F059410000000000000000729CBBF7A0B51441E2C67D3828F0594100000000000000002DB72C98A1B51441AB22A8F427F05941000000000000000076F79A18A8B51441912EF03425F05941000000000000000042375508A0B514411E31162525F059410000000000000000D27D1C0629B51441340E233B24F059410000000000000000D0A355D457B514416051147110F059410000000000000000A14265E8D4B51441CB2FF66611F0594100000000000000006AEF35AAD2B5144118D96E0310F059410000000000000000C735212AB2B5144131E3A7D208F0594100000000000000000E9DAA6E7DB514416F92C91F05F059410000000000000000A4CA16F664B514411E18244604F0594100000000000000001B667BF564B51441D092354604F05941000000000000000060839CE12AB51441CA6C9DCE0AF0594100000000000000006B6984CB26B5144130CC48440BF059410000000000000000C77095E6C4B414412B53FEDD07F0594100000000000000000EDAA50163B41441A9D4B37704F059410000000000000000F0A3B51C01B414419E50691101F059410000000000000000985F4A473FB414412B854413FAEF59410000000000000000497B4CFA0BB414414399CD4AF8EF594100000000000000008923074BCDB3144118E9BB44FFEF59410000000000000000BC98D4656BB31441FAFD6EDEFBEF59410000000000000000C55BDAD509B314414EB0177BF8EF594100000000000000009C6EA18009B31441540D2278F8EF594100000000000000007EC0DD8504B314412840DD4BF8EF5941000000000000000058A66D9BA7B214413017D511F5EF5941000000000000000068509333B0B214417054F91CF4EF594100000000000000002F1CE6538DB2144147B99EE3F2EF59410000000000000000A0A38B6670B21441C285C61BF6EF59410000000000000000600E139128B2144194585261F3EF5941000000000000000001020000800B000000D638EB0229B41441EA3711851DF05941000000000000000082FB25B02AB4144165C5ED441FF059410000000000000000E28BF30635B414418F2C651120F0594100000000000000000183A37948B414413A7A138620F059410000000000000000C8DC635E61B414414C67876D20F059410000000000000000353E31226EB41441D3DABE381FF05941000000000000000060370B4B6BB41441698FF7021EF0594100000000000000007641CB4260B41441B5A0F9CC1CF05941000000000000000086CE6BA34AB4144115B606921CF05941000000000000000090B86BF730B41441BF5225AB1CF059410000000000000000D638EB0229B41441EA3711851DF05941000000000000000001020000800C000000B92AFE0A29B41441258C33EF09F059410000000000000000BEC8740D27B41441B47580910AF059410000000000000000EA9BE64027B414412BC2305F0BF05941000000000000000080FEAEBA28B41441C3035D510CF0594100000000000000003A4F7C1133B41441346ED41D0DF059410000000000000000B3222C8446B41441F9C182920DF059410000000000000000BE84EC685FB41441D3B6F6790DF059410000000000000000B69B755D69B41441F44E21300DF059410000000000000000D2A0945569B41441FBE1660F0BF059410000000000000000570C554D5EB41441C7EF68D909F059410000000000000000E2AAF5AD48B414415DFE759E09F059410000000000000000B92AFE0A29B41441258C33EF09F059410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	10	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800A000000985F4A473FB414412B854413FAEF59410000000000000000D6C941473FB41441627C4513FAEF59410000000000000000F0A3B51C01B414419E50691101F0594100000000000000000EDAA50163B41441A9D4B37704F059410000000000000000C77095E6C4B414412B53FEDD07F0594100000000000000006B6984CB26B5144130CC48440BF05941000000000000000060839CE12AB51441CA6C9DCE0AF0594100000000000000001B667BF564B51441D092354604F059410000000000000000A4CA16F664B514411E18244604F059410000000000000000985F4A473FB414412B854413FAEF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	100	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000600000019C1CC37E8B51441AB95C2301BF05941425C3086D5B5144199C0B42323F059414EFF2EB9E0B5144198FE488324F05941F077897C19B614415DCE876A26F05941C853A24A42B61441484BD14C1DF0594119C1CC37E8B51441AB95C2301BF05941
\N	\N	\N	\N	\N	\N	6	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800E000000D6AE5DDEF4B21441DC51237AEEEF59410000000000000000C8A0D8F7F4B21441D3990F80EEEF59410000000000000000F73C1B16EAB21441BD15F1B0EEEF5941000000000000000035D65D34DFB21441B591D2E1EEEF5941000000000000000068509333B0B214417054F91CF4EF5941000000000000000058A66D9BA7B214413017D511F5EF594100000000000000007EC0DD8504B314412840DD4BF8EF594100000000000000009C6EA18009B31441540D2278F8EF59410000000000000000C55BDAD509B314414EB0177BF8EF59410000000000000000BC98D4656BB31441FAFD6EDEFBEF594100000000000000008923074BCDB3144118E9BB44FFEF59410000000000000000497B4CFA0BB414414399CD4AF8EF59410000000000000000C8D1E534F7B214411D922F8FEEEF59410000000000000000D6AE5DDEF4B21441DC51237AEEEF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	101	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000006000000C853A24A42B61441484BD14C1DF05941F077897C19B614415DCE876A26F05941E7EDD8B42BB614412A5ACB0227F05941B84D760D6FB61441F95288B627F0594184A920FE94B61441FAFDAB3C1FF05941C853A24A42B61441484BD14C1DF05941
\N	\N	\N	\N	\N	\N	9	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800D000000D0A355D457B514416051147110F059410000000000000000A14265E8D4B51441CB2FF66611F0594100000000000000006AEF35AAD2B5144118D96E0310F059410000000000000000861F45BBD5B51441E35D88E911F05941000000000000000026D599E0ADB51441E20233C322F059410000000000000000BED4A804ADB514411DA5302023F059410000000000000000EDC564A6ABB51441731B48B423F059410000000000000000BB8730E5A9B514418F45347224F059410000000000000000AC5FE125A8B51441BA57532F25F05941000000000000000076F79A18A8B51441912EF03425F05941000000000000000042375508A0B514411E31162525F059410000000000000000D27D1C0629B51441340E233B24F059410000000000000000D0A355D457B514416051147110F059410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	102	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000A298EA8DFBB614418B18DA4D22F059410CDF69B48FB61441BC3F196B20F05941B84D760D6FB61441F95288B627F05941FCDB8B28DEB61441553B0FDF28F05941A298EA8DFBB614418B18DA4D22F05941
\N	\N	\N	\N	\N	\N	11	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000801400000002BB826CC9B514414272478528F0594100000000000000002BF3ADBAB1B51441E15859272DF059410000000000000000C4D7C9D9AEB51441E47C6FB72DF059410000000000000000BA9AC9D9AEB51441D3886FB72DF059410000000000000000CEA9F50DFAB5144144C8AC1F30F059410000000000000000A6E3F40DFAB5144133C6AC1F30F059410000000000000000DF8E727F7CB61441F897CF7B31F05941000000000000000045477320DFB6144172D9098332F059410000000000000000B25E73C141B714413E19448A33F0594100000000000000006DCD208A45B71441A4C74F1F32F05941000000000000000046CC4A2F47B714412B63818131F059410000000000000000D5A9A5C04EB71441EEBF98AB2EF05941000000000000000069A8CF6550B714418F5BCA0D2EF05941000000000000000044167D2E54B71441490AD6A22CF059410000000000000000D3C1E2ECFCB51441F6D3BA0E29F0594100000000000000002E0B3112F0B51441B2646CEC28F0594100000000000000003A0F125AEEB5144180C4D5E728F059410000000000000000DE36E621E3B51441F050E4C928F059410000000000000000C87A3447D6B514419EE195A728F05941000000000000000002BB826CC9B514414272478528F059410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	104	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000006487607FFEB51441BE1C4DC511F0594119C1CC37E8B51441AB95C2301BF0594184A920FE94B61441FAFDAB3C1FF05941B83D73CCADB614416616FAB119F059416487607FFEB51441BE1C4DC511F05941
\N	\N	\N	\N	\N	\N	103	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000008000000F264020D22B71441004E2CB419F059416EE80CAAF6B614419A2654FD18F059411D7719798EB6144179F9754718F05941B83D73CCADB614416616FAB119F0594184A920FE94B61441FAFDAB3C1FF059410CDF69B48FB61441BC3F196B20F059412EB177EFFBB6144179F90E3822F05941F264020D22B71441004E2CB419F05941
\N	\N	\N	\N	\N	\N	105	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000007000000D955F11E25B61441FD70E75B03F059413EF6398C00B61441C3C44F820CF0594147A6D349F4B514416F224E820CF0594122E8E5DEFCB51441CE998E7610F0594117CAFADD8DB614410211880417F059413E04AEE281B61441C6A3C02006F05941D955F11E25B61441FD70E75B03F05941
\N	\N	\N	\N	\N	\N	106	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000800000012297EFF96B61441F2B4FD6403F059413E04AEE281B61441C6A3C02006F0594117CAFADD8DB614410211880417F05941512ED450FAB61441E3B0D4C117F059412A86E6AD2FB71441F59CAA520BF05941376D7B6FCFB71441D6B4791B10F05941A87FFE71CCB71441FD40A8B30CF0594112297EFF96B61441F2B4FD6403F05941
\N	\N	\N	\N	\N	\N	107	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000D2317182CEB71441DD6F901910F059412A86E6AD2FB71441F59CAA520BF05941BA66C7CF11B714418FB0494812F059414DCBCAF7D1B71441B0A2FCCA15F05941D2317182CEB71441DD6F901910F05941
\N	\N	\N	\N	\N	\N	108	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000BA66C7CF11B714418FB0494812F05941512ED450FAB61441E3B0D4C117F05941EAD3E503CFB71441ECFE67971BF059414DCBCAF7D1B71441B0A2FCCA15F05941BA66C7CF11B714418FB0494812F05941
\N	\N	\N	\N	\N	\N	109	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000A0000008FF9767027B71441DCDAFE7F18F05941F2E9907AE6B61441AAA4330327F059419E452E24B0B714415A967D782AF0594171D2310FB9B71441D49859A628F0594120178A09C0B714417772DA9226F05941C2D2BDECC3B7144197EC7C7324F0594147687DD4C7B71441D0BF798F21F05941D0E708C6CDB7144120736A281DF05941EAD3E503CFB71441ECFE67971BF059418FF9767027B71441DCDAFE7F18F05941
\N	\N	\N	\N	\N	\N	153	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000900000022E8E5DEFCB51441CE998E7610F059416487607FFEB51441BE1C4DC511F059411D7719798EB6144179F9754718F059416EE80CAAF6B614419A2654FD18F05941F264020D22B71441004E2CB419F059418FF9767027B71441DCDAFE7F18F05941512ED450FAB61441E3B0D4C117F0594117CAFADD8DB614410211880417F0594122E8E5DEFCB51441CE998E7610F05941
\N	\N	\N	\N	\N	\N	16	\N	1	2	010C0000A0FB0B000001000000010A00008001000000010200008007000000A6E3F40DFAB5144133C6AC1F30F0594100000000000000005B82EAB22CB71441F37AFF1D3AF05941000000000000000070725F9188B714413AD746972FF059410000000000000000CA31754282B71441DBB5DA3A2EF05941000000000000000044167D2E54B71441490AD6A22CF0594100000000000000002C5F73C141B714413F19448A33F059410000000000000000A6E3F40DFAB5144133C6AC1F30F059410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	17	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800A000000F2E9907AE6B61441AAA4330327F059410000000000000000FCDB8B28DEB61441553B0FDF28F0594100000000000000007B138217F1B61441E721971129F0594100000000000000007F4268F4FAB61441C6C2E92B29F059410000000000000000318754D220B714417C95F99029F05941000000000000000051B53AAF2AB7144158364CAB29F059410000000000000000EE18D5139DB71441200599DC2AF05941000000000000000098B934A1AFB71441152AA78E2AF0594100000000000000009E452E24B0B714415A967D782AF059410000000000000000F2E9907AE6B61441AAA4330327F059410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	158	\N	1	2	\N	1	112	0105000020FB0B00000100000001020000000200000048140ECB3DB314415761F2A0F1EF5941FA23C3F5F3B2144193FA8609EFEF5941	\N	\N
\N	\N	\N	\N	\N	\N	4	\N	1	2	010C0000A0FB0B000001000000010A00008001000000010200008071000000B38982FA58B314414ADDCC8FE4EF5941000000000000000005CFDEA432B3144149AE75C4E6EF59410000000000000000B592EB0931B314417EE31ADCE6EF59410000000000000000681412D253B41441D171E410F1EF594100000000000000008F1C5FD124B414417D9C084CF6EF5941000000000000000073240F8B42B4144114994B54F7EF59410000000000000000225F57D27CB41441F59C1BC6F0EF59410000000000000000BD180E6604B61441A9CE455FFEEF59410000000000000000F4B3C81ECAB5144198B075ED04F05941000000000000000006F04CDECBB51441A52900FD04F059410000000000000000A6F01C64E5B51441147BE6DF05F05941000000000000000051D8D349F4B514416F224E820CF0594100000000000000003EF6398C00B61441C3C44F820CF0594100000000000000001C15CC6503B6144140C2C8CB0BF059410000000000000000D955F11E25B61441FD70E75B03F0594100000000000000003E04AEE281B61441C6A3C02006F05941000000000000000012297EFF96B61441F2B4FD6403F059410000000000000000A87FFE71CCB71441FD40A8B30CF059410000000000000000C21201B7C8B71441F2E6671C0AF059410000000000000000FA5492EDB7B714415E42CA73FEEF594100000000000000002E10E98BB7B714414506A713FEEF59410000000000000000C460CD0FB7B71441FB4FA2B3FDEF59410000000000000000B6AD4879B6B71441DF65C353FDEF59410000000000000000745E66C8B5B71441718B11F4FCEF59410000000000000000D16134BAB5B71441E51BF7ECFCEF59410000000000000000D4D933FDB4B71441C8009494FCEF594100000000000000000985C017B4B7144104025235FCEF594100000000000000007CC21D18B3B71441C3C652D6FBEF5941000000000000000077F05EFEB1B7144192819D77FBEF59410000000000000000B36799CAB0B71441645F3919FBEF59410000000000000000B279E47CAFB7144109872DBBFAEF59410000000000000000D0B28AD8AEB7144151D65B90FAEF59410000000000000000046F5915AEB714419D18815DFAEF5941000000000000000055851394ACB71441042D3B00FAEF5941000000000000000060ED2FF9AAB714415BD562A3F9EF59410000000000000000B9C8CD44A9B71441751AFF46F9EF594100000000000000006F270E77A7B714414BFC16EBF8EF594100000000000000008E051490A5B714417D71B18FF8EF5941000000000000000077480490A3B71441C466D534F8EF5941000000000000000011BC0577A1B714416DBE89DAF7EF59410000000000000000DF0F41459FB71441D64FD580F7EF59410000000000000000E6D3E0FA9CB71441E8E6BE27F7EF59410000000000000000747511989AB7144193434DCFF6EF59410000000000000000C43B011D98B7144149198777F6EF594100000000000000007D44E08995B71441820E7320F6EF594100000000000000000880E0DE92B7144134BC17CAF5EF59410000000000000000CEAD351C90B7144157AD7B74F5EF59410000000000000000485815428DB71441665EA51FF5EF59410000000000000000F0D0B6508AB71441DF3C9BCBF4EF59410000000000000000132C534887B71441C9A66378F4EF594100000000000000007D3C252984B7144137EA0426F4EF59410000000000000000018F69F380B71441CE4485D4F3EF59410000000000000000E9655EA77DB714414CE3EA83F3EF5941000000000000000036B443457AB714410FE13B34F3EF59410000000000000000D1185BCD76B71441A2477EE5F2EF594100000000000000008AD9E73F73B71441450EB897F2EF5941000000000000000003DE2E9D6FB714417819EF4AF2EF5941000000000000000078AA76E56BB714418C3A29FFF1EF59410000000000000000665A071968B71441322F6CB4F1EF59410000000000000000169B2A3864B7144108A1BD6AF1EF5941000000000000000004A62B4360B7144130252322F1EF59410000000000000000313B573A5CB71441E03BA2DAF0EF594100000000000000004F9BFB1D58B71441F84F4094F0EF59410000000000000000D68168EE53B714419AB6024FF0EF59410000000000000000F61EEFAB4FB71441C5AEEE0AF0EF594100000000000000007211E2564BB71441E76009C8EFEF594100000000000000005E6095EF46B7144183DE5786EFEF59410000000000000000C2745E7642B71441C821DF45EFEF594100000000000000001E1394EB3DB71441330DA406EFEF59410000000000000000DC548E4F39B714412F6BABC8EEEF594100000000000000009DA1A6A234B71441B9EDF98BEEEF594100000000000000007AA837E52FB71441072E9450EEEF59410000000000000000C26A99B32DB714415F910C36EEEF594100000000000000001F599D172BB7144128AC7E16EEEF59410000000000000000D7DC343A26B71441B6CEBDDDEDEF594100000000000000007D8F5C4D21B7144179E255A6EDEF5941000000000000000054F873511CB71441181A4B70EDEF59410000000000000000CCC2DB4617B71441C48DA13BEDEF594100000000000000002EB7F52D12B71441EF3A5D08EDEF5941000000000000000035B324070DB71441F50382D6ECEF594100000000000000008DA2CCD207B71441D9AF13A6ECEF594100000000000000004477529102B71441F9E91577ECEF5941000000000000000024221C43FDB61441C5418C49ECEF59410000000000000000F98A90E8F7B614417D2A7A1DECEF59410000000000000000C2881782F2B61441EAFAE2F2EBEF59410000000000000000DAD91910EDB6144123EDC9C9EBEF59410000000000000000021C0193E7B61441491E32A2EBEF59410000000000000000CDDB1FAAE2B61441400FA07CEBEF594100000000000000003BA7BF117AB614417B6A3A5CE8EF59410000000000000000700A2B8C7AB614410E6FF049E8EF594100000000000000003BA7BF117AB614417B6A3A5CE8EF5941000000000000000032625F7777B61441233CC8BFE8EF59410000000000000000410D686677B61441350954BFE8EF59410000000000000000309DD2E84FB614414C046198EEEF59410000000000000000CF190C4363B614415CB0040FEFEF594100000000000000002087CD2A57B61441DEEF3209F1EF59410000000000000000AB17FC7D53B61441788401A3F1EF59410000000000000000DA6C49B246B614417C2686BAF3EF5941000000000000000050339DFFFBB514415A6D97F0F1EF59410000000000000000061F9DFFFBB51441DE6C97F0F1EF5941000000000000000050339DFFFBB514415A6D97F0F1EF59410000000000000000800D87FDE2B514410DE73707F6EF59410000000000000000C47B6A9785B5144103B8E8CBF3EF59410000000000000000AD594D3128B5144186859990F1EF594100000000000000003AD3731CD4B414414BB0488EEFEF594100000000000000003401EA5AD8B414417DA867A6EDEF5941000000000000000069D41AE2D0B41441DD3CB378EDEF594100000000000000003291045585B41441972C90AAEBEF59410000000000000000F221048172B4144132D06437EBEF594100000000000000009930DF176CB414415E222E10EBEF5941000000000000000022C0311E68B414411E20DDF7EAEF59410000000000000000840555E020B41441BF217CF4E8EF59410000000000000000B38982FA58B314414ADDCC8FE4EF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	110	\N	1	2	\N	1	67	\N	\N	0106000020FB0B000001000000010300000001000000060000007A732BE764B2144156ECF017E9EF59414067BC9144B2144195D426B1ECEF594140488A7D9DB21441CE7EBF11F0EF59419C1A6319B9B21441418A27FFECEF59410E95F6BBB9B214415B56C550ECEF59417A732BE764B2144156ECF017E9EF5941
\N	\N	\N	\N	\N	\N	154	\N	2	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000006000000072C1F3B7BB6144179726F5D32F059419310752576B6144107B1D65F33F0594171EE8A4519B71441766A909B38F05941B227983939B71441891BD30B35F05941A43E17172CB71441CBEDCE1634F05941072C1F3B7BB6144179726F5D32F05941
\N	\N	\N	\N	\N	\N	159	\N	1	2	\N	1	113	0105000020FB0B000001000000010200000002000000660020BE4BB31441A2D1491EF2EF5941E0558B709FB31441B56E560EF5EF5941	\N	\N
\N	\N	\N	\N	\N	\N	160	\N	1	2	\N	1	114	0105000020FB0B0000010000000102000000020000000C329D63ADB3144168DDAD8BF5EF5941142B081601B414410471BA7BF8EF5941	\N	\N
\N	\N	\N	\N	\N	\N	161	\N	1	2	\N	1	124	0105000020FB0B0000010000000102000000020000006395F8595EB314411C55F5C1EEEF59411F348DA70AB3144125ACE8D1EBEF5941	\N	\N
\N	\N	\N	\N	\N	\N	162	\N	1	2	\N	1	123	0105000020FB0B000001000000010200000002000000E6353A0EC0B31441BB18DE2FF2EF59414A730A4D6CB31441C8C54C3FEFEF5941	\N	\N
\N	\N	\N	\N	\N	\N	163	\N	1	2	\N	1	122	0105000020FB0B000001000000010200000002000000666B7BC221B4144142D1C69DF5EF594162044C01CEB31441D68735ADF2EF5941	\N	\N
\N	\N	\N	\N	\N	\N	164	\N	1	2	\N	1	115	0105000020FB0B00000100000001020000000200000098480E6242B41441D02663C1FAEF5941FE61DB4A96B4144116EC59ABFDEF5941	\N	\N
\N	\N	\N	\N	\N	\N	165	\N	1	2	\N	1	116	0105000020FB0B0000010000000102000000020000006A88FD46A4B41441DBB6AD27FEEF5941BA44CA2FF8B41441B072A41101F05941	\N	\N
\N	\N	\N	\N	\N	\N	166	\N	1	2	\N	1	117	0105000020FB0B0000010000000102000000020000000A5BEC2B06B51441EE3BF88D01F059414DB9B8145AB514415DEEEE7704F05941	\N	\N
\N	\N	\N	\N	\N	\N	167	\N	1	2	\N	1	139	0105000020FB0B000001000000010200000002000000828690EFCEB51441BE52BF1529F05941787FA11623B614414AF856F629F05941	\N	\N
\N	\N	\N	\N	\N	\N	168	\N	1	2	\N	1	140	0105000020FB0B000001000000010200000002000000CF0450A642B614410B97924A2AF0594172AAA2B785B61441444791FD2AF05941	\N	\N
\N	\N	\N	\N	\N	\N	169	\N	1	2	\N	1	141	0105000020FB0B0000010000000102000000020000000CFD5047A5B61441F3E4CC512BF05941B237A358E8B61441E492CB042CF05941	\N	\N
\N	\N	\N	\N	\N	\N	170	\N	1	2	\N	1	142	0105000020FB0B000001000000010200000002000000D05951E807B71441812F07592CF05941362AA3F94AB7144126DB050C2DF05941	\N	\N
\N	\N	\N	\N	\N	\N	171	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000DC89CEA119B71441C45DF69E32F059410342FA7029B71441548586B22CF05941	\N	\N
\N	\N	\N	\N	\N	\N	172	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000EE944AF7B6B61441C2B64C9B31F059415F1AFACFC6B61441EC3B4CAB2BF05941	\N	\N
\N	\N	\N	\N	\N	\N	173	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000CA03C64C54B61441720CA39730F05941A057F92E64B6144128EF11A42AF05941	\N	\N
\N	\N	\N	\N	\N	\N	174	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000FD021903F9B5144184250B8629F059410A090063EAB514418EAA7D0F2FF05941	\N	\N
\N	\N	\N	\N	\N	\N	175	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000CFB2E65553B61441C67D20CCE7EF594131B51CC32DB61441F952FA3DEDEF5941	\N	\N
\N	\N	\N	\N	\N	\N	176	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000AF8026D1FBB51441263E5479E5EF5941E14F574CD4B5144197D38519EBEF5941	\N	\N
\N	\N	\N	\N	\N	\N	177	\N	1	2	\N	1	\N	0105000020FB0B0000010000000102000000020000009EECBF40A4B5144108783A28E3EF5941D621E6A37AB5144100CFE0F3E8EF5941	\N	\N
\N	\N	\N	\N	\N	\N	178	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000E9C62EF246B51441B0B1ABA6E0EF5941DFD850421DB51441429568B7E6EF5941	\N	\N
\N	\N	\N	\N	\N	\N	179	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000135E2A3EF5B514419F1DE9A4F1EF59411D7E5BCFA6B514415FD514C4EFEF5941	\N	\N
\N	\N	\N	\N	\N	\N	180	\N	1	2	\N	1	\N	0105000020FB0B0000010000000102000000020000004486D2DE97B51441B6AE7E68EFEF5941913F037049B51441A760AA87EDEF5941	\N	\N
\N	\N	\N	\N	\N	\N	181	\N	1	2	\N	1	\N	0105000020FB0B0000010000000102000000020000002A347A7F3AB51441DE38142CEDEF5941E2D5E6E9EEB414419671B65CEBEF5941	\N	\N
\N	\N	\N	\N	\N	\N	182	\N	1	2	\N	1	\N	0105000020FB0B00000100000001020000000200000063E39749D8B41441282A68DCEAEF59411A346DA082B41441942C8AC7E8EF5941	\N	\N
\N	\N	\N	\N	\N	\N	183	\N	1	2	\N	1	\N	\N	0104000020FB0B00000100000001010000004B6E7B55FFB41441EE7EF2B7EFEF5941	\N
\N	\N	\N	\N	\N	\N	184	\N	1	2	\N	1	\N	\N	0104000020FB0B00000100000001010000000685B0B414B514413A556544ECEF5941	\N
\N	\N	\N	\N	\N	\N	185	\N	1	2	\N	1	\N	\N	0104000020FB0B0000010000000101000000EAE26AA770B51441AE871478EEEF5941	\N
\N	\N	\N	\N	\N	\N	186	\N	1	2	\N	1	\N	\N	0104000020FB0B000001000000010100000018EEC206CEB514417FF97EB4F0EF5941	\N
\N	\N	\N	\N	\N	\N	187	\N	1	2	\N	1	\N	\N	0104000020FB0B000001000000010100000028591E055CB51441BDA6C27CF1EF5941	\N
\N	\N	\N	\N	\N	\N	188	\N	1	2	\N	1	\N	\N	0104000020FB0B000001000000010100000013F29395BDB51441DB6373A9F3EF5941	\N
\N	\N	\N	\N	\N	\N	189	\N	1	2	\N	1	\N	\N	0104000020FB0B0000010000000101000000E4CF3F1A32B5144179230AAFE3EF5941	\N
\N	\N	\N	\N	\N	\N	190	\N	1	2	\N	1	\N	\N	0104000020FB0B00000100000001010000003A0753728FB5144184A30D0EE6EF5941	\N
\N	\N	\N	\N	\N	\N	191	\N	1	2	\N	1	\N	\N	0104000020FB0B000001000000010100000048E8BE0EE8B51441DE086D49E8EF5941	\N
\N	\N	\N	\N	\N	\N	192	\N	1	2	\N	1	\N	\N	0104000020FB0B000001000000010100000000B4818C40B6144160680D85EAEF5941	\N
\N	\N	\N	\N	\N	\N	193	\N	1	2	\N	1	\N	\N	0104000020FB0B0000010000000101000000B5ADDF3D5CB61441CD7DDA9D2DF05941	\N
\N	\N	\N	\N	\N	\N	194	\N	1	2	\N	1	\N	\N	0104000020FB0B0000010000000101000000A657A2E3BEB6144157794CA32EF05941	\N
\N	\N	\N	\N	\N	\N	195	\N	1	2	\N	1	\N	\N	0104000020FB0B0000010000000101000000F065648921B714418C71BEA82FF05941	\N
\N	\N	\N	\N	\N	\N	13	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000801E000000BA1D92440AB6144131F7659BEFEF594100000000000000001A3311BEE9B5144124C271D4EEEF594100000000000000005A089E24E8B514411334A9CAEEEF59410000000000000000A9F82500E0B51441C0C2DA98EEEF594100000000000000008BBD9CD3DAB5144134BC3479EEEF594100000000000000002FFC91B0D6B514414DB4E65FEEEF59410000000000000000BCBEA6F2CCB51441D7B44F24EEEF59410000000000000000AECCC1A1C8B51441DB33E909EEEF594100000000000000005EBF12A3C3B5144151A65BEBEDEF59410000000000000000FDD850E2BDB51441DBF82AC8EDEF594100000000000000000B7F27E5B9B51441CAA6C4AFEDEF594100000000000000008B85E6DCDCB4144174ABBD67E8EF594100000000000000008C392BCBDCB4144121355167E8EF59410000000000000000932A9574D0B414416385D81BE8EF5941000000000000000069CB3323C5B4144141999DD6E7EF59410000000000000000C0A14273C3B414413B764BCCE7EF594100000000000000003B944A39C1B41441FE07ADBEE7EF594100000000000000006041F10AB7B4144109506680E7EF59410000000000000000CCE4A2A888B4144144A1AC64E6EF594100000000000000009A30DF176CB414415E222E10EBEF59410000000000000000F221048172B4144132D06437EBEF594100000000000000003291045585B41441972C90AAEBEF5941000000000000000067D41AE2D0B41441DD3CB378EDEF594100000000000000003401EA5AD8B414417DA867A6EDEF594100000000000000003AD3731CD4B414414BB0488EEFEF59410000000000000000AD594D3128B5144186859990F1EF59410000000000000000C47B6A9785B5144103B8E8CBF3EF59410000000000000000800D87FDE2B514410DE73707F6EF5941000000000000000052339DFFFBB514415A6D97F0F1EF59410000000000000000BA1D92440AB6144131F7659BEFEF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	12	\N	1	2	010C0000A0FB0B000001000000010A000080010000000102000080460000005B38EC70D5B514416A23192123F059410000000000000000425C3086D5B5144199C0B42323F059410000000000000000312FDDBCD7B514418384326923F0594100000000000000001AAEAF1FDBB51441A2DF7ED323F059410000000000000000BBC71A76DEB51441D0D4453C24F0594100000000000000004EFF2EB9E0B5144198FE488324F0594100000000000000007FA94948E1B514414B7FD59424F059410000000000000000C94F92BCE2B5144152AAFCA024F059410000000000000000AA2EEBFDECB5144166A3B0F624F0594100000000000000003CB29E0DEEB514416B3D8FFF24F059410000000000000000CA11AB5EF9B514416CD0215E25F059410000000000000000E7C8299EFDB51441D9FCA18125F059410000000000000000163329D905B61441FA1F6AC625F0594100000000000000006E7A38D011B61441790D682A26F05941000000000000000068681DFF12B6144173554B3426F0594100000000000000005279897C19B614410ECE876A26F059410000000000000000E7EDD8B42BB614412A5ACB0227F0594100000000000000007655760D6FB614413E5188B627F059410000000000000000D6E88B28DEB6144176380FDF28F059410000000000000000F2E9907AE6B61441AAA4330327F059410000000000000000F264020D22B71441004E2CB419F05941000000000000000034E9907AE6B61441AAA4330327F0594100000000000000008FF9767027B71441DCDAFE7F18F059410000000000000000F2E9907AE6B61441AAA4330327F059410000000000000000DDDC1EA015B71441E5662CD227F059410000000000000000DE452E24B0B7144157967D782AF059410000000000000000A493741FB2B714412BEF421C2AF0594100000000000000006CB98701B4B714416C8181BF29F059410000000000000000F8EE43CAB5B714419E2F406229F0594100000000000000008D4D8779B7B71441C2E5850429F05941000000000000000071D2310FB9B71441D49859A628F0594100000000000000004C61258BBAB714414646C24728F05941000000000000000067C645EDBBB714417CF3C6E827F059410000000000000000C3B87835BDB7144146AD6E8927F0594100000000000000000ADCA563BEB714415B87C02927F0594100000000000000005FC2B677BFB71441D09BC3C926F0594100000000000000000CEE9671C0B71441950A7F6926F05941000000000000000000D33351C1B71441E9F8F90826F05941000000000000000038D87C16C2B71441D6903BA825F059410000000000000000F15863C1C2B71441A8004B4725F059410000000000000000C8A5DA51C3B71441647A2FE624F0594100000000000000005CAA28A7C3B71441D5F303A724F059410000000000000000C1E13A44CAB71441167942C11FF059410000000000000000D0E708C6CDB7144120736A281DF059410000000000000000EAD3E503CFB71441ECFE67971BF05941000000000000000024169786CBB714411C2CED861BF059410000000000000000EAD3E503CFB71441ECFE67971BF059410000000000000000B91B5A83CFB7144101CF9CF61AF059410000000000000000969FB108D0B71441D71F644E1AF059410000000000000000B9954171D2B7144173618C4417F0594100000000000000004DCBCAF7D1B71441B0A2FCCA15F0594100000000000000009823AB8BD0B714416000235F11F059410000000000000000376D7B6FCFB71441D6B4791B10F059410000000000000000D6E797CDCDB71441A72F8A3F0EF0594100000000000000006C5A3569CDB7144165F935CD0DF059410000000000000000A87FFE71CCB71441FD40A8B30CF05941000000000000000012297EFF96B61441F2B4FD6403F0594100000000000000003E04AEE281B61441C6A3C02006F059410000000000000000D955F11E25B61441FD70E75B03F0594100000000000000001C15CC6503B6144140C2C8CB0BF0594100000000000000003EF6398C00B61441C3C44F820CF05941000000000000000047A6D349F4B514416F224E820CF05941000000000000000033DBC216FCB5144159569FFB0FF0594100000000000000000EE9E5DEFCB51441D9998E7610F0594100000000000000008C797ACBFEB514415D3220A511F0594100000000000000007C6A461BDBB514411376E4BB20F059410000000000000000503D635ED9B514415A66FD7721F0594100000000000000005D6008A1D7B514410FF1483422F059410000000000000000E4C98FE8D5B51441ADDE83EE22F0594100000000000000005B38EC70D5B514416A23192123F059410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	111	\N	1	2	\N	1	68	\N	\N	0106000020FB0B00000100000001030000000100000005000000A3576FE434B21441E49BCC6FEEEF59415D82008F14B21441D8890209F2EF5941EFF6CE7A6DB21441E32E9B69F5EF594111683DD08DB21441684465D0F1EF5941A3576FE434B21441E49BCC6FEEEF5941
\N	\N	\N	\N	\N	\N	155	\N	1	2	\N	1	\N	\N	0104000020FB0B0000010000000101000000362906BAB2B41441023BC730FCEF5941	\N
\N	\N	\N	\N	\N	\N	156	\N	1	2	\N	1	\N	\N	0104000020FB0B000001000000010100000042A89F6625B5144196B03541E8EF5941	\N
\N	\N	\N	\N	\N	\N	157	\N	1	2	\N	1	\N	\N	0104000020FB0B0000010000000101000000145EE676BEB6144194EB806A29F05941	\N
\N	\N	\N	\N	\N	\N	14	\N	1	2	010C0000A0FB0B000001000000010A00008001000000010200008036000000D0EB7FE723B5144122695B29DFEF59410000000000000000603398BF1EB514416519D347DFEF59410000000000000000E477F90C19B51441267E7E69DFEF59410000000000000000EB34088413B5144170961C1EE0EF594100000000000000005C4685AA08B51441F32E2980E1EF59410000000000000000C2D4071101B51441DC002778E2EF59410000000000000000CC5502D1FDB41441B8C735E2E2EF59410000000000000000C4274D38FCB41441D5DA4E16E3EF5941000000000000000047637FF7F2B41441BC604244E4EF59410000000000000000D2B5EDA6EDB4144133E1B0F1E4EF59410000000000000000FBF3BACAF1B41441C8A48F48E5EF59410000000000000000D7448C10F5B4144156513C8DE5EF59410000000000000000FA12D9C8F9B41441552747F0E5EF594100000000000000005630F7C601B51441C1A9FE97E6EF59410000000000000000BC5025D313B51441627DA206E7EF59410000000000000000D6ADEAE436B514417259A0DDE7EF59410000000000000000CB8851DA42B514410226F026E8EF594100000000000000007025CCE39CB51441A60AE84EEAEF594100000000000000001F8830C3CDB51441449F847AEBEF5941000000000000000074AD428CF5B51441EDC86B6EECEF59410000000000000000B1FDFD4FF6B51441C6B51B73ECEF594100000000000000009687AA4C02B614414F1798BCECEF59410000000000000000B560B05F02B61441B7B50CBDECEF594100000000000000005762743603B61441685231C2ECEF594100000000000000005A101E330FB614416BA2AD0BEDEF59410000000000000000018F1DE70FB61441E31AFD0FEDEF59410000000000000000B33C8BBA1CB614418B079E5EEDEF5941000000000000000037D02B4321B614412635697AEDEF59410000000000000000B9E6F88D29B614411CF43EADEDEF5941000000000000000046B8A59629B61441C02274ADEDEF59410000000000000000BC94D2E84FB614418C056198EEEF59410000000000000000410D686677B61441350954BFE8EF594100000000000000002A162D4679B614413C694878E8EF594100000000000000005E2D00067AB614410D85E05BE8EF594100000000000000002A162D4679B614413C694878E8EF59410000000000000000410D686677B61441350954BFE8EF5941000000000000000032625F7777B61441233CC8BFE8EF594100000000000000003BA7BF117AB614417B6A3A5CE8EF594100000000000000009A47FD526FB6144148B3000AE8EF59410000000000000000CF11019F64B61441756E19B8E7EF59410000000000000000F63FC0CE62B6144128D038AAE7EF594100000000000000004E5AC9B459B61441CACB5D6CE7EF59410000000000000000B654B9CC4EB61441C73E3E22E7EF59410000000000000000B44A411345B614413C3227E0E6EF594100000000000000005A54E9D943B614412952CBD7E6EF5941000000000000000081AAE4022EB614413155A542E6EF59410000000000000000E94F09D623B61441A25528FDE5EF59410000000000000000510CE61123B614419BE0ECF7E5EF59410000000000000000A4F8DF2B18B6144102587FADE5EF594100000000000000008156E13A0DB6144151E3C662E5EF594100000000000000000B3FDB5402B614419F5A5918E5EF594100000000000000000D99DC63F7B51441D3E5A0CDE4EF594100000000000000001B28829FEDB514415492ED8AE4EF59410000000000000000D0EB7FE723B5144122695B29DFEF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	15	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000801900000091821D136EB41441BFE19F0BDAEF59410000000000000000C0970077F0B41441B4D13BC6DDEF5941000000000000000053E86837F4B41441EA4CC268DEEF5941000000000000000028519348F4B4144130F2A96BDEEF59410000000000000000E539FD30F0B414419B1833F1DEEF594100000000000000007DF5D617EFB414417AA60915DFEF5941000000000000000015339178EAB41441A68DDEABDFEF594100000000000000003F991AE7E9B41441D75A69BEDFEF59410000000000000000AAD6D447E5B4144109423E55E0EF5941000000000000000062138FA8E0B41441512913ECE0EF59410000000000000000376A216BDFB41441FFC0EAF8E0EF59410000000000000000F5FEB9D6D4B414411E957D66E1EF59410000000000000000B88A0C8AC7B4144118B03BF0E1EF594100000000000000002A7137B8BBB414411A1CA66AE2EF59410000000000000000006801BB8CB414416F275051E4EF59410000000000000000FF3E3E7F85B41441E2EAB1FBE3EF594100000000000000004AA305037DB41441A9984297E3EF594100000000000000007B7842C775B41441075CA441E3EF59410000000000000000AADA094B6DB41441B40935DDE2EF59410000000000000000F0671DB253B41441A8AFBC0DE6EF59410000000000000000840555E020B41441BF217CF4E8EF59410000000000000000B38982FA58B314414ADDCC8FE4EF59410000000000000000718CD77491B3144162E8A9F4DEEF59410000000000000000B3BE3DEC3AB41441227F0B19E1EF5941000000000000000091821D136EB41441BFE19F0BDAEF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	45	\N	1	2	\N	1	\N	0105000020FB0B0000010000000102000000040000007EE9297DB6B51441DCE794C709F059417E810B5880B5144174E4951C0CF05941CCFEF25230B5144176C8ED6C0FF059414E69521A18B5144190EA1C8210F05941	\N	\N
\N	\N	\N	\N	\N	\N	46	\N	1	2	\N	1	\N	\N	0104000020FB0B0000010000000101000000001C9E8AF8B6144112408D63F5EF5941	\N
\N	\N	\N	\N	2022-01-12 00:22:58.801531	2022-01-12 00:22:58.801531	44	\N	1	2	010C0000A0FB0B0000030000000103000080010000001100000062138FA8E0B41441512913ECE0EF59410000000000000000006801BB8CB414416F275051E4EF59410000000000000000AADA094B6DB41441B40935DDE2EF59410000000000000000F0671DB253B41441A8AFBC0DE6EF59410000000000000000840555E020B41441BF217CF4E8EF5941000000000000000022C0311E68B414411E20DDF7EAEF594100000000000000002630DF176CB4144171222E10EBEF59410000000000000000CCE4A2A888B4144144A1AC64E6EF59410000000000000000BA1D92440AB6144131F7659BEFEF59410000000000000000061F9DFFFBB51441DE6C97F0F1EF59410000000000000000DA6C49B246B614417C2686BAF3EF59410000000000000000CF190C4363B614415CB0040FEFEF594100000000000000005630F7C601B51441C1A9FE97E6EF59410000000000000000D2B5EDA6EDB4144133E1B0F1E4EF59410000000000000000E477F90C19B51441267E7E69DFEF5941000000000000000028519348F4B4144130F2A96BDEEF5941000000000000000062138FA8E0B41441512913ECE0EF594100000000000000000103000080010000006A000000AED22879EFB71441A69AE03EF8EF59410000000000000000A0EE405BE8B714411106EBDDF6EF5941000000000000000025DA8091DAB714413270BFBAF4EF59410000000000000000D123167ECAB71441A42042BFF2EF5941000000000000000021E70352B7B7144140E3D9CFF0EF594100000000000000004F56FF7DA7B7144188291B74EFEF59410000000000000000FF63472594B7144144B26002EEEF594100000000000000006613E77A7EB71441D43CA29CECEF59410000000000000000C6B8711967B71441FBA6C34FEBEF59410000000000000000ECBE27163FB71441309A2B62E9EF59410000000000000000749B90E92DB71441080581D2E8EF594100000000000000007A972012F8B61441681A1B10E7EF59410000000000000000E24BE315C5B6144109B75292E5EF59410000000000000000B184DC138FB614411D23E8FDE3EF594100000000000000003BA7BF117AB614417B6A3A5CE8EF59410000000000000000BB34580DC9B61441C96BA1B8EAEF59410000000000000000F98A90E8F7B614417D2A7A1DECEF594100000000000000008DA2CCD207B71441D9AF13A6ECEF594100000000000000007D8F5C4D21B7144179E255A6EDEF594100000000000000007AA837E52FB71441072E9450EEEF594100000000000000001E1394EB3DB71441330DA406EFEF594100000000000000007211E2564BB71441E76009C8EFEF59410000000000000000D68168EE53B714419AB6024FF0EF5941000000000000000004A62B4360B7144130252322F1EF5941000000000000000078AA76E56BB714418C3A29FFF1EF59410000000000000000D1185BCD76B71441A2477EE5F2EF59410000000000000000018F69F380B71441CE4485D4F3EF59410000000000000000CEAD351C90B7144157AD7B74F5EF59410000000000000000C43B011D98B7144149198777F6EF5941000000000000000011BC0577A1B714416DBE89DAF7EF594100000000000000006F270E77A7B714414BFC16EBF8EF59410000000000000000A3086ABEABB7144152552DCFF9EF594100000000000000002885E723B0B7144136074AE9FAEF5941000000000000000077F05EFEB1B7144192819D77FBEF59410000000000000000E11DBC93B4B71441A3A16767FCEF5941000000000000000099758DCAB6B7144106666885FDEF59410000000000000000FA5492EDB7B714415E42CA73FEEF59410000000000000000A87FFE71CCB71441FD40A8B30CF0594100000000000000004DCBCAF7D1B71441B0A2FCCA15F059410000000000000000B5B05DDFCFB714416F7A749B1BF0594100000000000000005CAA28A7C3B71441D5F303A724F05941000000000000000020178A09C0B714417772DA9226F05941000000000000000071D2310FB9B71441D49859A628F059410000000000000000A493741FB2B714412BEF421C2AF05941000000000000000098B934A1AFB71441152AA78E2AF059410000000000000000EE18D5139DB71441200599DC2AF059410000000000000000E7EDD8B42BB614412A5ACB0227F0594100000000000000004EFF2EB9E0B5144198FE488324F0594100000000000000005B38EC70D5B514416A23192123F059410000000000000000E4C98FE8D5B51441ADDE83EE22F0594100000000000000005D6008A1D7B514410FF1483422F059410000000000000000503D635ED9B514415A66FD7721F0594100000000000000007C6A461BDBB514411376E4BB20F0594100000000000000008C797ACBFEB514415D3220A511F0594100000000000000000DE9E5DEFCB51441D9998E7610F05941000000000000000033DBC216FCB5144159569FFB0FF05941000000000000000051D8D349F4B514416F224E820CF059410000000000000000A6F01C64E5B51441147BE6DF05F0594100000000000000008AAB48C3FFB214417D82D502ECEF59410000000000000000B495D04BFCB21441B041AFE3EBEF59410000000000000000FC269A2FE8B2144127A81A7AEAEF5941000000000000000054733ED6A3B21441C74B303DE0EF59410000000000000000CA8120179BB21441F8C0DF98E1EF594100000000000000001090F19592B21441B481A19CE1EF5941000000000000000024D0B0D389B214414EEAADD5E2EF5941000000000000000067F696A6C2B2144132D0A558EBEF59410000000000000000A25244FAC0B21441B8171424EDEF594100000000000000002F1CE6538DB2144147B99EE3F2EF5941000000000000000068509333B0B214417054F91CF4EF5941000000000000000035D65D34DFB21441B591D2E1EEEF59410000000000000000D6AE5DDEF4B21441DC51237AEEEF594100000000000000000E9DAA6E7DB514416F92C91F05F059410000000000000000C735212AB2B5144131E3A7D208F0594100000000000000006AEF35AAD2B5144118D96E0310F059410000000000000000861F45BBD5B51441E35D88E911F05941000000000000000026D599E0ADB51441E20233C322F059410000000000000000729CBBF7A0B51441E2C67D3828F0594100000000000000000A8D561E98B51441485B73F329F0594100000000000000005181E2CD88B51441ECD846A929F059410000000000000000036785557CB51441FF327D192CF0594100000000000000002BF3ADBAB1B51441E15859272DF05941000000000000000002BB826CC9B514414272478528F05941000000000000000044167D2E54B71441490AD6A22CF059410000000000000000CA31754282B71441DBB5DA3A2EF05941000000000000000070725F9188B714413AD746972FF0594100000000000000005B82EAB22CB71441F37AFF1D3AF0594100000000000000002623462E6CB7144152A383303CF059410000000000000000DE5C991FDBB7144174367B5A2FF0594100000000000000000438E746E6B71441ECCEA2F92DF059410000000000000000502C5365ECB71441459610382DF0594100000000000000009D2AE96FF6B7144152D0AF9B2BF059410000000000000000C4E10707FEB71441801875162AF0594100000000000000006D5C810C02B81441D69F651829F059410000000000000000A416CE5D05B81441E78AEC1928F0594100000000000000003D61C27408B81441C7420CE626F059410000000000000000637A8BBB0CB814415676B80924F059410000000000000000EE81966C10B81441A04BE54D21F059410000000000000000399C52BE16B814419A17F20A1CF0594100000000000000000EB0D8781AB81441B22F7D5517F0594100000000000000009487DB8118B81441EFBBFE3511F059410000000000000000FBE379BA0CB81441FD098A4707F059410000000000000000D98759D0FFB71441C37BB134FEEF59410000000000000000188759D0FFB71441C47BB134FEEF59410000000000000000D862365FFCB714418AF86FFEFBEF59410000000000000000F055423CF6B71441AC402DE2F9EF59410000000000000000AED22879EFB71441A69AE03EF8EF594100000000000000000103000080010000001100000015354E3BDAB514415632F527DFEF59410000000000000000448376F000B514417EF16851D9EF59410000000000000000D944AE1997B414413FDFCD4FD6EF594100000000000000007B900D9DF5B31441AB4FC1A5D0EF59410000000000000000F0A2842DD6B3144188048321D4EF59410000000000000000784769523DB41441E56A6FC4D7EF59410000000000000000BD36FB6DE4B314416754810ED9EF59410000000000000000BF6EDDAC51B4144139030C0DD9EF5941000000000000000091821D136EB41441BFE19F0BDAEF59410000000000000000C0970077F0B41441B4D13BC6DDEF5941000000000000000053E86837F4B41441EA4CC268DEEF59410000000000000000E477F90C19B51441267E7E69DFEF59410000000000000000D0EB7FE723B5144122695B29DFEF594100000000000000005E2D00067AB614410D85E05BE8EF59410000000000000000B184DC138FB614411D23E8FDE3EF594100000000000000005BEE35734FB61441CCCDA142E2EF5941000000000000000015354E3BDAB514415632F527DFEF59410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	47	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000005000000700A2B8C7AB614410E6FF049E8EF5941D0EB7FE723B5144122695B29DFEF5941BEF5A31319B5144163C68E72DFEF5941D2B5EDA6EDB4144133E1B0F1E4EF59415630F7C601B51441C1A9FE97E6EF5941	\N	\N
\N	\N	\N	\N	\N	\N	48	\N	1	2	\N	1	\N	0105000020FB0B00000100000001020000001200000030350A951FB214416F7477C6F4EF5941051F5FA464B2144159A97E5FF7EF5941C0199C09B8B2144142D713D4F7EF59417AE1E152CAB214418416133FF8EF594118529531A4B314416E0125A500F05941D15F0FE1D2B314418D9E346602F05941DE6E5CB928B41441637F7B1505F05941A622A9917EB414419958C2C407F05941E47AF569D4B41441352A09740AF059414E69521A18B5144190EA1C8210F0594182E17B911FB514416BF58E2E12F05941AE37F7E620B51441AF28DBFE13F059418D61E73B1AB514410071BD7719F0594112EFA02310B5144136C4D56A1DF05941D26302D10CB5144105568E4C1FF05941772506AA06B5144158F0F54221F05941F2F39B58F8B41441EA0BD41025F05941BEBFC43DEAB41441C2D55D6C27F05941	\N	\N
\N	\N	\N	\N	\N	\N	49	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000003000000DE5D72A020B41441A270BDF1F8EF5941A2C9AA8BF8B31441091C6257FDEF5941426ACEC0CCB314414ACD472B02F05941	\N	\N
\N	\N	\N	\N	\N	\N	112	\N	1	2	\N	1	69	\N	\N	0106000020FB0B00000100000001030000000100000006000000FA23C3F5F3B2144193FA8609EFEF59413C658E8EE4B21441F2C6B74EEFEF59410E03C6C2CAB21441EF3AAA2DF2EF5941270B32751EB3144136DEB61DF5EF594148140ECB3DB314415761F2A0F1EF5941FA23C3F5F3B2144193FA8609EFEF5941
\N	\N	\N	\N	\N	\N	113	\N	1	2	\N	1	70	\N	\N	0106000020FB0B00000100000001030000000100000005000000660020BE4BB31441A2D1491EF2EF5941B20544682CB31441F44D0E9BF5EF59418EB2AF1A80B31441B9E71A8BF8EF5941E0558B709FB31441B56E560EF5EF5941660020BE4BB31441A2D1491EF2EF5941
\N	\N	\N	\N	\N	\N	114	\N	1	2	\N	1	71	\N	\N	0106000020FB0B000001000000010300000001000000050000000C329D63ADB3144168DDAD8BF5EF5941B99BC10D8EB31441ED557208F9EF59415FEB2CC0E1B3144134E67EF8FBEF5941142B081601B414410471BA7BF8EF59410C329D63ADB3144168DDAD8BF5EF5941
\N	\N	\N	\N	\N	\N	115	\N	1	2	\N	1	72	\N	\N	0106000020FB0B0000010000000103000000010000000500000098480E6242B41441D02663C1FAEF59415A93BE2A23B41441B0344944FEEF594106D261DD76B414410AB2573401F05941FE61DB4A96B4144116EC59ABFDEF594198480E6242B41441D02663C1FAEF5941
\N	\N	\N	\N	\N	\N	116	\N	1	2	\N	1	73	\N	\N	0106000020FB0B000001000000010300000001000000050000006A88FD46A4B41441DBB6AD27FEEF5941F8FE7CD084B41441CB70AFB101F05941B0E01F83D8B41441ABE4BDA104F05941BA44CA2FF8B41441B072A41101F059416A88FD46A4B41441DBB6AD27FEEF5941
\N	\N	\N	\N	\N	\N	117	\N	1	2	\N	1	74	\N	\N	0106000020FB0B000001000000010300000001000000050000000A5BEC2B06B51441EE3BF88D01F05941BAFE3A76E6B41441DDA1151F05F059410084DD283AB51441430C240F08F059414DB9B8145AB514415DEEEE7704F059410A5BEC2B06B51441EE3BF88D01F05941
\N	\N	\N	\N	\N	\N	118	\N	1	2	\N	1	75	\N	\N	0106000020FB0B000001000000010300000001000000050000002F6106B8A8B514413E3A1155FCEF5941742A9B187AB5144189F49D9301F059417BF05503C7B51441ECBD6A3F04F0594140B0C0A2F5B514414008DE00FFEF59412F6106B8A8B514413E3A1155FCEF5941
\N	\N	\N	\N	\N	\N	119	\N	1	2	\N	1	76	\N	\N	0106000020FB0B0000010000000103000000010000000500000006E018D346B51441DFB5C6EEF8EF59418612AD3318B514410976532DFEEF5941642E57205EB51441CE63F69A00F059417490C2BF8CB51441D9A7695CFBEF594106E018D346B51441DFB5C6EEF8EF5941
\N	\N	\N	\N	\N	\N	120	\N	1	2	\N	1	77	\N	\N	0106000020FB0B0000010000000103000000010000000500000063F12AEEE4B414417C267C88F5EF59419A8DBE4EB6B4144185EC08C7FAEF5941E8F7683BFCB4144121E2AB34FDEF5941BCF0D4DA2AB5144149201FF6F7EF594163F12AEEE4B414417C267C88F5EF5941
\N	\N	\N	\N	\N	\N	121	\N	1	2	\N	1	78	\N	\N	0106000020FB0B00000100000001030000000100000005000000DC8A2B0B7CB4144139A507E4F1EF59418685BE6B4DB414418A719422F7EF5941C0527A569AB41441815561CEF9EF5941D6E2E6F5C8B41441C18DD48FF4EF5941DC8A2B0B7CB4144139A507E4F1EF5941
\N	\N	\N	\N	\N	\N	122	\N	1	2	\N	1	79	\N	\N	0106000020FB0B000001000000010300000001000000050000005E53E341F1B314416088D8C0EEEF594162044C01CEB31441D68735ADF2EF5941666B7BC221B4144142D1C69DF5EF5941D458120345B4144180D569B1F1EF59415E53E341F1B314416088D8C0EEEF5941
\N	\N	\N	\N	\N	\N	123	\N	1	2	\N	1	80	\N	\N	0106000020FB0B000001000000010300000001000000050000009333A28D8FB3144101C2EF52EBEF59414A730A4D6CB31441C8C54C3FEFEF5941E6353A0EC0B31441BB18DE2FF2EF59419895D14EE3B314419A188143EEEF59419333A28D8FB3144101C2EF52EBEF5941
\N	\N	\N	\N	\N	\N	124	\N	1	2	\N	1	81	\N	\N	0106000020FB0B00000100000001030000000100000005000000966625E82DB31441FDA38BE5E7EF59411F348DA70AB3144125ACE8D1EBEF59416395F8595EB314411C55F5C1EEEF59412467909A81B31441AE5098D5EAEF5941966625E82DB31441FDA38BE5E7EF5941
\N	\N	\N	\N	\N	\N	93	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000A2C1C6204CB51441BAFD976315F059413146386D40B51441F8AB1B561AF059416E65B67FBFB51441BEE0E84F1BF059416AB44433CBB51441B23C655D16F05941A2C1C6204CB51441BAFD976315F05941
\N	\N	\N	\N	\N	\N	94	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000003146386D40B51441F8AB1B561AF059410030AAB934B514411F5C9F481FF05941F67B28CCB3B51441B6866C4220F059416E65B67FBFB51441BEE0E84F1BF059413146386D40B51441F8AB1B561AF05941
\N	\N	\N	\N	\N	\N	95	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000000030AAB934B514411F5C9F481FF05941D27D1C0629B51441340E233B24F05941AC5FE125A8B51441BA57532F25F05941F67B28CCB3B51441B6866C4220F059410030AAB934B514411F5C9F481FF05941
\N	\N	\N	\N	\N	\N	96	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000600000002BB826CC9B514414272478528F05941BA9AC9D9AEB51441D3886FB72DF05941A6E3F40DFAB5144133C6AC1F30F05941D0A25D4B1AB614418109B87530F05941949E7B4B2CB61441D625278D29F0594102BB826CC9B514414272478528F05941
\N	\N	\N	\N	\N	\N	97	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000949E7B4B2CB61441D625278D29F05941D0A25D4B1AB614418109B87530F05941DF8E727F7CB61441F897CF7B31F059410AB87CEC8EB61441557561942AF05941949E7B4B2CB61441D625278D29F05941
\N	\N	\N	\N	\N	\N	98	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000000AB87CEC8EB61441557561942AF05941147E4CAA7DB614417C32ED7E31F0594145477320DFB6144172D9098332F0594144357D8DF1B614417DC19B9B2BF059410AB87CEC8EB61441557561942AF05941
\N	\N	\N	\N	\N	\N	99	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000500000044357D8DF1B614417DC19B9B2BF0594145477320DFB6144172D9098332F059412C5F73C141B714413F19448A33F0594144167D2E54B71441490AD6A22CF0594144357D8DF1B614417DC19B9B2BF05941
\N	\N	\N	\N	\N	\N	125	\N	1	2	\N	1	82	\N	\N	0106000020FB0B00000100000001030000000100000007000000EEC793B990B31441204375F7DFEF59414DD8D81665B31441D245444CE4EF59413747D1031FB41441F91A5762E8EF5941A8CEFA4C4EB4144166123DAFE5EF594110CC9FA65FB414417F1BE972E3EF5941E991C9B14AB4144135063E51E2EF5941EEC793B990B31441204375F7DFEF5941
\N	\N	\N	\N	\N	\N	126	\N	1	2	\N	1	83	\N	\N	0106000020FB0B00000100000001030000000100000007000000D76957B571B41441E6D45DC1DAEF5941723ED94F4BB41441C0CE940CE0EF5941ACD6303594B41441244D686BE3EF59419E789473DAB41441B670E593E0EF594144A99097EBB414410E658F64DEEF594150930326EAB414414ED00526DEEF5941D76957B571B41441E6D45DC1DAEF5941
\N	\N	\N	\N	\N	\N	127	\N	1	2	\N	1	84	\N	\N	0106000020FB0B00000100000001030000000100000007000000F22B71AC23B51441E8EA28B3DFEF59410E50FFD21EB514413FF6D0CFDFEF5941BFABEA02F7B41441A70700E3E4EF594108A1C3C206B5144122E17B2DE6EF59418C5512B73EB51441DE7A8284E7EF5941E061EC376AB5144178782E9AE1EF5941F22B71AC23B51441E8EA28B3DFEF5941
\N	\N	\N	\N	\N	\N	128	\N	1	2	\N	1	85	\N	\N	0106000020FB0B00000100000001030000000100000005000000313DBA9387B5144114360F66E2EF5941F3C44CA85CB5144147DB113CE8EF5941BA7E7F9F98B51441B8C2AFABE9EF59410A9CC5EDC0B51441FDB965EAE3EF5941313DBA9387B5144114360F66E2EF5941
\N	\N	\N	\N	\N	\N	129	\N	1	2	\N	1	86	\N	\N	0106000020FB0B00000100000001030000000100000005000000EAEC2D69DEB51441C0477AB1E4EF5941DAC6E988B6B514410A3C0F63EAEF5941E8D8C40FF2B51441246BFCCFEBEF594174141F3919B614418C342E41E6EF5941EAEC2D69DEB51441C0477AB1E4EF5941
\N	\N	\N	\N	\N	\N	130	\N	1	2	\N	1	87	\N	\N	0106000020FB0B00000100000001030000000100000005000000924121AD36B6144193F95909E7EF5941247E00FA0FB61441C4E66087ECEF59413EEC388C4BB614412EBF93F4EDEF59410C24ACFE6FB61441F801E78EE8EF5941924121AD36B6144193F95909E7EF5941
\N	\N	\N	\N	\N	\N	131	\N	1	2	\N	1	88	\N	\N	0106000020FB0B00000100000001030000000100000005000000B6A9A485B1B514415044C403EEEF5941845212199CB514416E666584F1EF5941E44DE187EAB51441BDAC3965F3EF5941426E73F4FFB51441818E98E4EFEF5941B6A9A485B1B514415044C403EEEF5941
\N	\N	\N	\N	\N	\N	132	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000007C8C4C2654B514414ACD59C7EBEF5941A6F2B9B93EB5144104F4FA47EFEF5941FE5489288DB514411C40CF28F1EF59418BB71B95A2B514414F1D2EA8EDEF59417C8C4C2654B514414ACD59C7EBEF5941
\N	\N	\N	\N	\N	\N	133	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000A34230A0F9B4144103DC659CE9EF594120699D33E4B414412807071DEDEF594131E230C92FB5144197CC64ECEEEF59412486C33545B5144126A5C36BEBEF5941A34230A0F9B4144103DC659CE9EF5941
\N	\N	\N	\N	\N	\N	134	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000C016FE648DB414416200E404E7EF59417551DCDB77B41441C758308AEAEF5941F429CD5BCDB4144135B6CBA5ECEF5941D29C6237E3B414411A9E0413E9EF5941C016FE648DB414416200E404E7EF5941
\N	\N	\N	\N	\N	\N	135	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000001839EF995EB514415EEA57FF10F05941369F40F453B51441197BC17F15F05941C00B4981C3B514417F98444E16F05941084A1DCACDB514418089EBD911F059411839EF995EB514415EEA57FF10F05941
\N	\N	\N	\N	\N	\N	136	\N	1	2	\N	1	93	\N	\N	0106000020FB0B00000100000001030000000100000005000000369F40F453B51441197BC17F15F05941FAFF2A6448B51441F0E145631AF059413B3E1690B7B514413BC2A63F1BF05941C00B4981C3B514417F98444E16F05941369F40F453B51441197BC17F15F05941
\N	\N	\N	\N	\N	\N	137	\N	1	2	\N	1	94	\N	\N	0106000020FB0B00000100000001030000000100000005000000FAFF2A6448B51441F0E145631AF059410C2E52933CB5144197FC0D581FF05941C0B89A34ACB5144156D87F3320F059413B3E1690B7B514413BC2A63F1BF05941FAFF2A6448B51441F0E145631AF05941
\N	\N	\N	\N	\N	\N	138	\N	1	2	\N	1	95	\N	\N	0106000020FB0B000001000000010300000001000000050000000C2E52933CB5144197FC0D581FF05941C693D22232B51441501B19CC23F05941EF390153A1B514418898ACA624F05941C0B89A34ACB5144156D87F3320F059410C2E52933CB5144197FC0D581FF05941
\N	\N	\N	\N	\N	\N	139	\N	1	2	\N	1	96	\N	\N	0106000020FB0B00000100000001030000000100000006000000828690EFCEB51441BE52BF1529F059413A9E3789B8B51441F05200772DF05941386F6CC6FEB5144103F88EB62FF05941C08A262E13B61441586C42EC2FF05941787FA11623B614414AF856F629F05941828690EFCEB51441BE52BF1529F05941
\N	\N	\N	\N	\N	\N	140	\N	1	2	\N	1	97	\N	\N	0106000020FB0B00000100000001030000000100000005000000CF0450A642B614410B97924A2AF059410A84E0C032B6144110005A3F30F059418A83ABD875B61441D518ECEF30F0594172AAA2B785B61441444791FD2AF05941CF0450A642B614410B97924A2AF05941
\N	\N	\N	\N	\N	\N	141	\N	1	2	\N	1	98	\N	\N	0106000020FB0B000001000000010300000001000000060000002418BE0FA4B614414D4C8BC62BF05941004B656B95B614417FAB034331F05941DCDE2F83D8B6144106C295F331F05941B237A358E8B61441E492CB042CF059410CFD5047A5B61441F3E4CC512BF059412418BE0FA4B614414D4C8BC62BF05941
\N	\N	\N	\N	\N	\N	142	\N	1	2	\N	1	99	\N	\N	0106000020FB0B00000100000001030000000100000005000000D05951E807B71441812F07592CF05941C174E915F8B61441A153AD4632F05941F69EB32D3BB71441E7673FF732F05941362AA3F94AB7144126DB050C2DF05941D05951E807B71441812F07592CF05941
\N	\N	\N	\N	\N	\N	143	\N	1	2	\N	1	100	\N	\N	0106000020FB0B00000100000001030000000100000006000000749FEBAEEEB51441E07F34E01BF05941FE185ABADDB514411E8D630B23F059417D55E93FE7B51441386F4E3624F05941EC09207114B614414F1FFAAF25F05941B229339C38B61441857F739B1DF05941749FEBAEEEB51441E07F34E01BF05941
\N	\N	\N	\N	\N	\N	144	\N	1	2	\N	1	101	\N	\N	0106000020FB0B00000100000001030000000100000005000000149DAA3150B614410549E5C21FF059411CFA30BB31B6144118B71D9126F05941E410BC4869B61441772D612527F05941566B6FD284B614411A7370FE20F05941149DAA3150B614410549E5C21FF05941
\N	\N	\N	\N	\N	\N	145	\N	1	2	\N	1	102	\N	\N	0106000020FB0B00000100000001030000000100000005000000D6B44C81A2B61441CF270FC921F05941BE98540789B61441E7021A7A27F05941B7A5D163D8B61441F916E84D28F0594110855F8AEFB61441540AE22123F05941D6B44C81A2B61441CF270FC921F05941
\N	\N	\N	\N	\N	\N	146	\N	1	2	\N	1	103	\N	\N	0106000020FB0B0000010000000103000000010000000600000060455907CBB61441177729B118F0594180BB9B6FAFB6144181D884E51EF05941166AAE78FCB6144170BE573E20F0594165ED14481AB7144125C6729519F059416EE80CAAF6B614419A2654FD18F0594160455907CBB61441177729B118F05941
\N	\N	\N	\N	\N	\N	147	\N	1	2	\N	1	104	\N	\N	0106000020FB0B0000010000000103000000010000000500000060D6DC1419B614411F8EDC3414F059417648D30F08B6144135BE01671BF05941D9DC271579B614410D62A60C1EF0594111DDF9918DB614419312EE7819F0594160D6DC1419B614411F8EDC3414F05941
\N	\N	\N	\N	\N	\N	148	\N	1	2	\N	1	105	\N	\N	0106000020FB0B000001000000010300000001000000060000001AB237822AB61441CC28E91204F0594170590DD600B61441BFFCEB7F0EF05941A607601B03B61441CF12CF820FF059418409EF6A7CB614419B4AAEFE14F0594110451BED71B61441B470A33406F059411AB237822AB61441CC28E91204F05941
\N	\N	\N	\N	\N	\N	149	\N	1	2	\N	1	106	\N	\N	0106000020FB0B00000100000001030000000100000006000000855682BA9AB61441BAF1C00F04F05941489BC74C91B614414666424805F059419C67073E9DB614414535DF1D16F05941A4AFA06AEEB61441122D90AB16F05941AC8DB1942BB71441C276146B08F05941855682BA9AB61441BAF1C00F04F05941
\N	\N	\N	\N	\N	\N	150	\N	1	2	\N	1	107	\N	\N	0106000020FB0B000001000000010300000001000000050000004146AB3F3CB714417CFDF4400CF059419EDB3D5125B714415200D39811F0594190452395C9B71441C339149914F05941E62D3B3FC8B71441518F497210F059414146AB3F3CB714417CFDF4400CF05941
\N	\N	\N	\N	\N	\N	151	\N	1	2	\N	1	108	\N	\N	0106000020FB0B00000100000001030000000100000005000000227A94061DB714415DE36C8713F059418434B7DF0DB714419C3B3D0F17F059411C61E10AC8B71441C068AE481AF05941A090BE41CAB71441F3DD9CB116F05941227A94061DB714415DE36C8713F05941
\N	\N	\N	\N	\N	\N	152	\N	1	2	\N	1	109	\N	\N	0106000020FB0B000001000000010300000001000000080000007630AE253AB71441BF6D3EE319F0594108E39EEE01B71441B626487226F05941AA57CB6BADB71441042F1C6329F05941A9A403DBB3B714415E5D9ADF27F0594171CCBF32BAB714413CC8D69125F05941CF8926E1BEB714416139163E22F059417E9E994EC6B714412D3A2D791CF059417630AE253AB71441BF6D3EE319F05941
\N	\N	\N	\N	\N	\N	51	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000004000000B072874BB9B61441F67582EFF5EF594178A12455A5B6144151A92661F4EF59413B3B3CFD6EB61441BBE86D44F2EF5941B190CD8055B614418BA3D74EF1EF5941	\N	\N
\N	\N	\N	\N	\N	\N	52	\N	1	2	\N	1	\N	0105000020FB0B00000100000001020000000500000091821D136EB41441BFE19F0BDAEF5941FE960077F0B41441B2D13BC6DDEF594128519348F4B4144130F2A96BDEEF594162138FA8E0B41441512913ECE0EF59416053D8D2AFB41441CAE5DAE5E2EF5941	\N	\N
\N	\N	\N	\N	\N	\N	50	\N	1	2	\N	1	\N	0105000020FB0B0000010000000102000000080000000905234727B71441F8D7D2E9EDEF5941714B36B61CB714414945BDA7EEEF594190C25765DEB61441DF78FA37F3EF594118CA18DAB4B61441D2F5CD42F6EF594158F7C8558EB61441BCDCF5D8F8EF59411C416E7529B614417286C69B00F059410E97D1EEECB51441145FDD4305F05941A6F01C64E5B51441147BE6DF05F05941	\N	\N
\N	\N	\N	\N	\N	\N	53	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000006801BB8CB414416F275051E4EF5941AADA094B6DB41441B40935DDE2EF5941	\N	\N
\N	\N	\N	\N	\N	\N	54	\N	1	2	\N	1	\N	0105000020FB0B0000010000000102000000020000001CB316B7AAB414411257FE34E7EF59418B85E6DCDCB4144174ABBD67E8EF5941	\N	\N
\N	\N	\N	\N	\N	\N	55	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000385EFAEEAFB51441BC88D572EDEF59411A3311BEE9B5144124C271D4EEEF5941	\N	\N
\N	\N	\N	\N	\N	\N	56	\N	1	2	\N	1	\N	0105000020FB0B00000100000001020000000300000074AD428CF5B51441EDC86B6EECEF5941018F1DE70FB61441E31AFD0FEDEF5941B9E6F88D29B614411CF43EADEDEF5941	\N	\N
\N	\N	\N	\N	\N	\N	57	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000D18481D028B31441A1245571EDEF59418AAB48C3FFB214417D82D502ECEF5941	\N	\N
\N	\N	\N	\N	\N	\N	58	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000A8ECE6FCF4B21441DFE3F87FEEEF594135D65D34DFB21441B591D2E1EEEF5941	\N	\N
\N	\N	\N	\N	\N	\N	59	\N	1	2	\N	1	\N	0105000020FB0B0000010000000102000000020000006DAD4209C2B214417F426701ECEF5941A25244FAC0B21441B8171424EDEF5941	\N	\N
\N	\N	\N	\N	\N	\N	60	\N	1	2	\N	1	\N	0105000020FB0B000001000000010200000002000000B21661C5ADB51441212150F722F05941AC5FE125A8B51441BA57532F25F05941	\N	\N
\N	\N	\N	\N	\N	\N	61	\N	1	2	\N	1	\N	0105000020FB0B00000100000001020000000400000014AABA25E2B514412C196ABE1DF059415B38EC70D5B514416A23192123F059414EFF2EB9E0B5144198FE488324F05941F077897C19B614415DCE876A26F05941	\N	\N
\N	\N	\N	\N	\N	\N	62	\N	1	2	\N	1	\N	0105000020FB0B00000100000001020000000200000002BB826CC9B514414272478528F05941D3C1E2ECFCB51441F6D3BA0E29F05941	\N	\N
\N	\N	\N	\N	\N	\N	63	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800B00000090B86BF730B41441BF5225AB1CF059410000000000000000D638EB0229B41441EA3711851DF05941000000000000000082FB25B02AB4144165C5ED441FF059410000000000000000E28BF30635B414418F2C651120F0594100000000000000000183A37948B414413A7A138620F059410000000000000000C8DC635E61B414414C67876D20F059410000000000000000353E31226EB41441D3DABE381FF05941000000000000000060370B4B6BB41441698FF7021EF0594100000000000000007641CB4260B41441B5A0F9CC1CF05941000000000000000086CE6BA34AB4144115B606921CF05941000000000000000090B86BF730B41441BF5225AB1CF059410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	64	\N	1	2	010C0000A0FB0B000001000000010A0000800100000001020000800C000000B92AFE0A29B41441258C33EF09F059410000000000000000BEC8740D27B41441B47580910AF059410000000000000000EA9BE64027B414412BC2305F0BF05941000000000000000080FEAEBA28B41441C3035D510CF0594100000000000000003A4F7C1133B41441346ED41D0DF059410000000000000000B3222C8446B41441F9C182920DF059410000000000000000BE84EC685FB41441D3B6F6790DF059410000000000000000B69B755D69B41441F44E21300DF059410000000000000000D2A0945569B41441FBE1660F0BF059410000000000000000570C554D5EB41441C7EF68D909F059410000000000000000E2AAF5AD48B414415DFE759E09F059410000000000000000B92AFE0A29B41441258C33EF09F059410000000000000000	1	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	65	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000003C2DBE6F83B71441744F331106F0594146F3B60779B714417F7C306B07F059410709D0DC95B71441F615314908F05941D238D744A0B7144171E933EF06F059413C2DBE6F83B71441744F331106F05941
\N	\N	\N	\N	\N	\N	66	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000009C12BE3A62B514411885F10A28F05941E83DB7D257B5144125C4EE6429F05941ECD3D1A774B514414055EF422AF05941389FD80F7FB51441B816F2E828F059419C12BE3A62B514411885F10A28F05941
\N	\N	\N	\N	\N	\N	67	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000600000031ED6EFB61B214419B94C565E8EF5941700206E435B2144114D2F74DEDEF5941E2ABF37D9CB21441BC469433F1EF5941A25244FAC0B21441B8171424EDEF59416DAD4209C2B214417F426701ECEF594131ED6EFB61B214419B94C565E8EF5941
\N	\N	\N	\N	\N	\N	68	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000700206E435B2144114D2F74DEDEF59411A5F9DCC09B2144194162A36F2EF5941A0A38B6670B21441C285C61BF6EF5941E2ABF37D9CB21441BC469433F1EF5941700206E435B2144114D2F74DEDEF5941
\N	\N	\N	\N	\N	\N	69	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000006000000D6AE5DDEF4B21441DC51237AEEEF594135D65D34DFB21441B591D2E1EEEF594158A66D9BA7B214413017D511F5EF5941C55BDAD509B314414EB0177BF8EF5941288D52AF48B314412B8A0570F1EF5941D6AE5DDEF4B21441DC51237AEEEF5941
\N	\N	\N	\N	\N	\N	70	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000288D52AF48B314412B8A0570F1EF59414C3DA18009B31441D1122278F8EF59418867D4656BB3144174036FDEFBEF5941EAB9CF54AAB314413F9769DDF4EF5941288D52AF48B314412B8A0570F1EF5941
\N	\N	\N	\N	\N	\N	71	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000EAB9CF54AAB314413F9769DDF4EF59418867D4656BB3144174036FDEFBEF59418923074BCDB3144118E9BB44FFEF5941497B4CFA0BB414414399CD4AF8EF5941EAB9CF54AAB314413F9769DDF4EF5941
\N	\N	\N	\N	\N	\N	72	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000985F4A473FB414412B854413FAEF5941F0A3B51C01B414419E50691101F059418CA9A50163B414411EDAB37704F05941E69A392CA1B414417A168F79FDEF5941985F4A473FB414412B854413FAEF5941
\N	\N	\N	\N	\N	\N	73	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000E69A392CA1B414417A168F79FDEF59418CA9A50163B414411EDAB37704F05941344095E6C4B41441A258FEDD07F059410069281103B51441CB9CD9DF00F05941E69A392CA1B414417A168F79FDEF5941
\N	\N	\N	\N	\N	\N	74	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000000069281103B51441CB9CD9DF00F05941344095E6C4B41441A258FEDD07F059416B6984CB26B5144130CC48440BF05941A4CA16F664B514411E18244604F059410069281103B51441CB9CD9DF00F05941
\N	\N	\N	\N	\N	\N	75	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000BD180E6604B61441A9CE455FFEEF594106F04CDECBB51441A52900FD04F0594190EADA3968B514414C3C2B8701F05941D60D2181A2B51441CC52FBF8FAEF5941BD180E6604B61441A9CE455FFEEF5941
\N	\N	\N	\N	\N	\N	76	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000D60D2181A2B51441CC52FBF8FAEF5941E896339C40B51441DACBB092F7EF5941E8B6EC5406B51441ACBCE020FEEF594190EADA3968B514414C3C2B8701F05941D60D2181A2B51441CC52FBF8FAEF5941
\N	\N	\N	\N	\N	\N	77	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000E896339C40B51441DACBB092F7EF5941BEB145B7DEB41441E739662CF4EF59414815FE6FA4B41441103296BAFAEF5941E8B6EC5406B51441ACBCE020FEEF5941E896339C40B51441DACBB092F7EF5941
\N	\N	\N	\N	\N	\N	78	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000BEB145B7DEB41441E739662CF4EF5941225F57D27CB41441F59C1BC6F0EF59416E060F8B42B41441749C4B54F7EF59414815FE6FA4B41441103296BAFAEF5941BEB145B7DEB41441E739662CF4EF5941
\N	\N	\N	\N	\N	\N	79	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000681412D253B41441D171E410F1EF5941AA71D11DF2B31441BEB4FBA2EDEF5941FFA4071DC3B31441C95E22DEF2EF5941568733AF24B414417CD5D84AF6EF5941681412D253B41441D171E410F1EF5941
\N	\N	\N	\N	\N	\N	80	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000AA71D11DF2B31441BEB4FBA2EDEF59413263906990B31441A2EC1235EAEF59410FFFC56861B31441729C3970EFEF5941FFA4071DC3B31441C95E22DEF2EF5941AA71D11DF2B31441BEB4FBA2EDEF5941
\N	\N	\N	\N	\N	\N	81	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000003263906990B31441A2EC1235EAEF59410EA813C42EB31441E3CCAEC7E6EF59418AAB48C3FFB214417D82D502ECEF59410FFFC56861B31441729C3970EFEF59413263906990B31441A2EC1235EAEF5941
\N	\N	\N	\N	\N	\N	82	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000008000000718CD77491B3144162E8A9F4DEEF5941B38982FA58B314414ADDCC8FE4EF5941840555E020B41441BF217CF4E8EF5941F0671DB253B41441A8AFBC0DE6EF5941AADA094B6DB41441B40935DDE2EF5941F076C0AB4BB41441FC923D4FE1EF5941B3BE3DEC3AB41441227F0B19E1EF5941718CD77491B3144162E8A9F4DEEF5941
\N	\N	\N	\N	\N	\N	83	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000800000091821D136EB41441BFE19F0BDAEF5941B3BE3DEC3AB41441227F0B19E1EF5941F076C0AB4BB41441FC923D4FE1EF5941006801BB8CB414416F275051E4EF594162138FA8E0B41441512913ECE0EF594128519348F4B4144130F2A96BDEEF5941C0970077F0B41441B4D13BC6DDEF594191821D136EB41441BFE19F0BDAEF5941
\N	\N	\N	\N	\N	\N	84	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000007000000D0EB7FE723B5144122695B29DFEF5941E477F90C19B51441267E7E69DFEF5941D2B5EDA6EDB4144133E1B0F1E4EF59415630F7C601B51441C1A9FE97E6EF59412B6E51DA42B51441A129F026E8EF5941686C32E874B5144156B59358E1EF5941D0EB7FE723B5144122695B29DFEF5941
\N	\N	\N	\N	\N	\N	85	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000686C32E874B5144156B59358E1EF59412B6E51DA42B51441A129F026E8EF59418EFBCBE39CB51441A110E84EEAEF59414AC64A85CBB5144152EA6AA6E3EF5941686C32E874B5144156B59358E1EF5941
\N	\N	\N	\N	\N	\N	86	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B000001000000010300000001000000050000004AC64A85CBB5144152EA6AA6E3EF59418EFBCBE39CB51441A110E84EEAEF594145D9FD4FF6B51441F1BA1B73ECEF5941F6193FD623B6144160B320FDE5EF59414AC64A85CBB5144152EA6AA6E3EF5941
\N	\N	\N	\N	\N	\N	87	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000F6193FD623B6144160B320FDE5EF594145D9FD4FF6B51441F1BA1B73ECEF5941BC94D2E84FB614418C056198EEEF59413BA7BF117AB614417B6A3A5CE8EF5941F6193FD623B6144160B320FDE5EF5941
\N	\N	\N	\N	\N	\N	88	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000BA1D92440AB6144131F7659BEFEF5941800D87FDE2B514410DE73707F6EF5941E3676A9785B5144143BBE8CBF3EF594194F075DEACB51441FBC21660EDEF5941BA1D92440AB6144131F7659BEFEF5941
\N	\N	\N	\N	\N	\N	89	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B0000010000000103000000010000000500000094F075DEACB51441FBC21660EDEF5941984859784FB51441DC87C724EBEF5941BC464D3128B514419F889990F1EF5941E3676A9785B5144143BBE8CBF3EF594194F075DEACB51441FBC21660EDEF5941
\N	\N	\N	\N	\N	\N	90	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000006000000984859784FB51441DC87C724EBEF5941F04FADEBF4B41441742EE6FAE8EF59413401EA5AD8B414417DA867A6EDEF594137D3731CD4B414414BB0488EEFEF5941BC464D3128B514419F889990F1EF5941984859784FB51441DC87C724EBEF5941
\N	\N	\N	\N	\N	\N	91	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000005000000F04FADEBF4B41441742EE6FAE8EF5941CCE4A2A888B4144144A1AC64E6EF59412630DF176CB4144171222E10EBEF59413401EA5AD8B414417DA867A6EDEF5941F04FADEBF4B41441742EE6FAE8EF5941
\N	\N	\N	\N	\N	\N	92	\N	1	2	\N	1	\N	\N	\N	0106000020FB0B00000100000001030000000100000006000000861F45BBD5B51441E35D88E911F05941A14265E8D4B51441CB2FF66611F05941D0A355D457B514416051147110F05941A2C1C6204CB51441BAFD976315F059416AB44433CBB51441B23C655D16F05941861F45BBD5B51441E35D88E911F05941
\.


--
-- Data for Name: kaavamaarays; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.kaavamaarays (id, id_kaavamaarays_laji_ak, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaavakohde, id_kaava) FROM stdin;
23	52	4	5	\N	\N	1	1
24	52	4	5	\N	\N	2	1
25	52	4	5	\N	\N	3	1
26	136	4	5	\N	\N	3	1
27	52	4	5	\N	\N	4	1
28	4	4	2	\N	\N	5	1
29	4	4	2	\N	\N	6	1
30	4	4	2	\N	\N	7	1
31	4	4	2	\N	\N	8	1
32	4	4	2	\N	\N	9	1
33	4	4	2	\N	\N	10	1
34	4	4	2	\N	\N	11	1
35	4	4	2	\N	\N	12	1
36	4	4	2	\N	\N	14	1
38	4	4	2	\N	\N	15	1
39	93	4	5	\N	\N	16	1
40	93	4	5	\N	\N	17	1
41	80	4	6	\N	\N	44	1
42	156	4	5	\N	\N	45	1
43	275	4	11	\N	\N	46	1
44	230	4	6	\N	\N	47	1
45	156	4	5	\N	\N	48	1
46	156	4	5	\N	\N	49	1
47	156	4	5	\N	\N	50	1
48	156	4	5	\N	\N	51	1
49	230	4	8	\N	\N	52	1
50	230	4	6	\N	\N	53	1
51	230	4	6	\N	\N	54	1
52	230	4	6	\N	\N	55	1
53	230	4	6	\N	\N	56	1
54	230	4	6	\N	\N	57	1
55	230	4	6	\N	\N	58	1
56	230	4	6	\N	\N	59	1
57	230	4	6	2022-01-12 09:15:36.279	\N	60	1
58	230	4	6	\N	\N	61	1
59	230	4	6	\N	\N	62	1
60	131	4	7	\N	\N	63	1
61	131	4	7	\N	\N	64	1
62	134	4	7	\N	\N	65	1
63	134	4	7	\N	\N	66	1
64	251	4	1	\N	\N	67	1
65	251	4	1	\N	\N	68	1
66	196	4	1	\N	\N	110	1
67	276	4	11	\N	\N	5	1
105	196	4	1	\N	\N	123	1
69	276	4	11	\N	\N	10	1
70	276	4	11	\N	\N	7	1
71	276	4	11	\N	\N	8	1
72	276	4	11	\N	\N	9	1
73	276	4	11	\N	\N	11	1
74	276	4	11	\N	\N	12	1
75	276	4	11	\N	\N	14	1
76	276	4	11	\N	\N	15	1
77	276	4	11	\N	\N	13	1
78	4	4	2	\N	\N	13	1
79	184	4	1	\N	\N	110	1
80	184	4	1	\N	\N	111	1
81	196	4	1	\N	\N	111	1
82	196	4	1	\N	\N	112	1
83	184	4	1	\N	\N	112	1
84	196	4	1	\N	\N	113	1
85	184	4	1	\N	\N	113	1
86	184	4	1	\N	\N	114	1
87	196	4	1	\N	\N	114	1
88	196	4	1	\N	\N	115	1
89	184	4	1	\N	\N	115	1
90	196	4	1	\N	\N	116	1
91	184	4	1	\N	\N	116	1
92	184	4	1	\N	\N	117	1
93	196	4	1	\N	\N	117	1
94	196	4	1	\N	\N	118	1
95	184	4	1	\N	\N	118	1
96	184	4	1	\N	\N	119	1
97	196	4	1	\N	\N	119	1
98	196	4	1	\N	\N	120	1
99	184	4	1	\N	\N	120	1
100	184	4	1	\N	\N	121	1
101	196	4	1	\N	\N	121	1
102	196	4	1	\N	\N	122	1
103	184	4	1	\N	\N	122	1
104	184	4	1	\N	\N	123	1
106	196	4	1	\N	\N	124	1
107	184	4	1	\N	\N	124	1
108	184	4	1	\N	\N	125	1
109	196	4	1	\N	\N	125	1
110	196	4	1	\N	\N	126	1
111	184	4	1	\N	\N	126	1
112	184	4	1	\N	\N	127	1
113	196	4	1	\N	\N	127	1
114	196	4	1	\N	\N	128	1
115	184	4	1	\N	\N	128	1
116	184	4	1	\N	\N	129	1
117	196	4	1	\N	\N	129	1
118	196	4	1	\N	\N	130	1
119	184	4	1	\N	\N	130	1
120	184	4	1	\N	\N	131	1
121	196	4	1	\N	\N	131	1
122	196	4	1	\N	\N	132	1
123	184	4	1	\N	\N	132	1
124	184	4	1	\N	\N	133	1
125	196	4	1	\N	\N	133	1
126	196	4	1	\N	\N	134	1
127	184	4	1	\N	\N	134	1
129	196	4	1	\N	\N	135	1
130	196	4	1	\N	\N	136	1
131	196	4	1	\N	\N	137	1
132	196	4	1	\N	\N	138	1
133	196	4	1	\N	\N	139	1
134	184	4	1	\N	\N	139	1
135	184	4	1	\N	\N	140	1
136	196	4	1	\N	\N	140	1
137	196	4	1	\N	\N	141	1
138	184	4	1	\N	\N	141	1
139	184	4	1	\N	\N	142	1
140	196	4	1	\N	\N	142	1
141	196	4	1	\N	\N	143	1
142	184	4	1	\N	\N	143	1
143	184	4	1	\N	\N	144	1
144	196	4	1	\N	\N	144	1
145	196	4	1	\N	\N	145	1
146	184	4	1	\N	\N	145	1
147	184	4	1	\N	\N	146	1
148	196	4	1	\N	\N	146	1
149	196	4	1	\N	\N	147	1
150	184	4	1	\N	\N	147	1
151	184	4	1	\N	\N	148	1
152	196	4	1	\N	\N	148	1
153	196	4	1	\N	\N	149	1
154	184	4	1	\N	\N	149	1
155	184	4	1	\N	\N	150	1
156	196	4	1	\N	\N	150	1
157	196	4	1	\N	\N	151	1
158	184	4	1	\N	\N	151	1
159	184	4	1	\N	\N	152	1
160	196	4	1	\N	\N	152	1
161	119	4	7	\N	\N	153	1
163	187	4	1	\N	\N	5	1
68	276	4	11	2022-01-13 13:40:51.568	\N	6	1
164	187	4	1	\N	\N	6	1
165	187	4	1	\N	\N	7	1
166	187	4	1	\N	\N	8	1
167	187	4	1	\N	\N	9	1
168	187	4	1	\N	\N	10	1
169	187	4	1	\N	\N	11	1
170	187	4	1	\N	\N	12	1
171	187	4	1	\N	\N	13	1
172	187	4	1	\N	\N	14	1
173	187	4	1	\N	\N	15	1
174	189	4	1	\N	\N	7	1
175	189	4	1	\N	\N	8	1
176	186	4	1	\N	\N	9	1
177	267	4	7	\N	\N	154	1
178	272	4	11	\N	\N	155	1
179	272	4	11	\N	\N	156	1
180	272	4	11	\N	\N	157	1
181	197	4	1	\N	\N	158	1
182	197	4	1	\N	\N	159	1
183	197	4	1	\N	\N	160	1
184	197	4	1	\N	\N	161	1
185	197	4	1	\N	\N	162	1
186	197	4	1	\N	\N	163	1
187	197	4	1	\N	\N	164	1
188	197	4	1	\N	\N	165	1
189	197	4	1	\N	\N	166	1
190	197	4	1	\N	\N	167	1
191	197	4	1	\N	\N	168	1
192	197	4	1	\N	\N	169	1
193	197	4	1	\N	\N	170	1
194	203	4	1	\N	\N	171	1
195	203	4	1	\N	\N	172	1
196	203	4	1	\N	\N	173	1
197	203	4	1	\N	\N	174	1
198	203	4	1	\N	\N	175	1
199	203	4	1	\N	\N	176	1
200	203	4	1	\N	\N	177	1
201	203	4	1	\N	\N	178	1
202	203	4	1	\N	\N	179	1
203	203	4	1	\N	\N	180	1
204	203	4	1	\N	\N	181	1
205	203	4	1	\N	\N	182	1
206	215	4	11	\N	\N	183	1
207	215	4	11	\N	\N	184	1
208	215	4	11	\N	\N	185	1
209	215	4	11	\N	\N	186	1
210	215	4	11	\N	\N	187	1
211	215	4	11	\N	\N	188	1
212	215	4	11	\N	\N	189	1
213	215	4	11	\N	\N	190	1
214	215	4	11	\N	\N	191	1
215	215	4	11	\N	\N	192	1
216	215	4	11	\N	\N	193	1
217	215	4	11	\N	\N	194	1
218	215	4	11	\N	\N	195	1
\.


--
-- Data for Name: kaavan_kumoamistieto; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.kaavan_kumoamistieto (id, kumottavan_kaavan_tunnus, kumoaa_kaavan_kokonaan, geom, kumottavan_maarayksen_tunnus, kumottavan_suosituksen_tunnus, id_kaava) FROM stdin;
\.


--
-- Data for Name: kaavan_laatija; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.kaavan_laatija (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, nimike, rooli, id_kaava) FROM stdin;
\N	\N	\N	\N	2022-01-04 09:09:08.115297	2022-01-04 09:09:08.115297	1	John Doe	Urban Planner	GIS analysis	\N
\N	\N	\N	\N	2022-01-04 09:09:08.125657	2022-01-04 09:09:08.125657	2	Jane Doe	Architect	Head of planning	\N
\.


--
-- Data for Name: kaavaselostus; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.kaavaselostus (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, id_kaava) FROM stdin;
\.


--
-- Data for Name: kaavasuositus; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.kaavasuositus (id, id_kaavan_elinkaaritila, id_kaavoitusteema_ak, voimassaolo_alku, voimassaolo_loppu, id_kaava, id_kaavakohde) FROM stdin;
\.


--
-- Data for Name: kasittelytapahtuma; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.kasittelytapahtuma (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, nimi, tapahtuma_aika, kuvaus, sijainti, lisatietolinkki, peruttu, id, id_kaavan_kasittelytapahtuman_laji, id_kaava) FROM stdin;
\.


--
-- Data for Name: koodiarvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.koodiarvo (id, koodistotunnus, otsikko, id_tietoyksikko) FROM stdin;
\.


--
-- Data for Name: korkeuspiste; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.korkeuspiste (id, geom, id_numeerinen_arvo) FROM stdin;
1	01010000A0FB0B0000E4CF3F1A32B5144179230AAFE3EF59410000000000000000	1
2	01010000A0FB0B00003A0753728FB5144184A30D0EE6EF59410000000000000000	1
3	01010000A0FB0B000048E8BE0EE8B51441DE086D49E8EF59410000000000000000	1
4	01010000A0FB0B000000B4818C40B6144160680D85EAEF59410000000000000000	1
5	01010000A0FB0B000018EEC206CEB514417FF97EB4F0EF59410000000000000000	1
6	01010000A0FB0B0000EAE26AA770B51441AE871478EEEF59410000000000000000	1
7	01010000A0FB0B00000685B0B414B514413A556544ECEF59410000000000000000	1
8	01010000A0FB0B00007D63736D09B51441F154B63EEFEF59410000000000000000	1
9	01010000A0FB0B000081DBDF8C62B514416A04BD84F1EF59410000000000000000	1
10	01010000A0FB0B0000A01EC8F2C2B51441D08730CDF3EF59410000000000000000	1
\.


--
-- Data for Name: korkeusvali; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.korkeusvali (id, geom, id_numeerinen_arvovali) FROM stdin;
\.


--
-- Data for Name: lahtotietoaineisto; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.lahtotietoaineisto (id, aineistotunnus, nimi, id_lahtoaineiston_laji, geom, lisatietolinkki, metatietokuvaus, id_kaava) FROM stdin;
\.


--
-- Data for Name: lisatieto; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.lisatieto (id, nimi, id_kaavamaarays, id_lisatiedon_laji_ak) FROM stdin;
\.


--
-- Data for Name: numeerinen_arvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.numeerinen_arvo (id, arvo, mittayksikko, id_tietoyksikko) FROM stdin;
1	32	\N	2
2	300	m2	18
3	300	m2	19
4	300	m2	20
5	300	m2	21
6	300	m2	22
7	300	m2	23
8	300	m2	24
9	300	m2	25
10	300	m2	26
11	300	m2	27
12	300	m2	28
13	300	m2	29
14	300	m2	30
15	300	m2	31
16	300	m2	32
17	350	m2	33
18	300	m2	34
19	300	m2	35
20	300	m2	36
21	300	m2	37
22	300	m2	38
23	300	m2	39
24	300	m2	40
25	300	m2	41
26	300	m2	42
27	300	m2	43
28	300	m2	44
29	300	m2	45
30	300	m2	46
31	300	m2	47
32	300	m2	48
33	300	m2	49
34	300	m2	50
35	300	m2	51
36	250	m2	52
37	250	m2	53
38	250	m2	55
39	500	m2	56
40	2	\N	\N
41	2	\N	58
42	2	\N	59
43	2	\N	60
44	2	\N	61
45	2	\N	62
46	2	\N	63
47	2	\N	64
48	2	\N	65
49	2	\N	66
50	2	\N	67
51	2	\N	68
52	50	%	69
53	50	%	70
55	0.3	\N	71
56	107	\N	77
57	108	\N	78
58	108	\N	79
59	107	\N	80
60	107	\N	81
61	106	\N	82
62	108	\N	83
63	108	\N	84
64	108	\N	85
65	107	\N	86
\.


--
-- Data for Name: numeerinen_arvovali; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.numeerinen_arvovali (id, minimiarvo, maksimiarvo, mittayksikko, id_tietoyksikko) FROM stdin;
1	95	97	\N	87
2	95	97	\N	88
3	95	97	\N	89
\.


--
-- Data for Name: osallistumis_ja_arviointisuunnitelma; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.osallistumis_ja_arviointisuunnitelma (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id) FROM stdin;
\.


--
-- Data for Name: tapahtuma_abstrakti; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.tapahtuma_abstrakti (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, nimi, tapahtuma_aika, kuvaus, sijainti, lisatietolinkki, peruttu) FROM stdin;
\.


--
-- Data for Name: tekstiarvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.tekstiarvo (id, arvo, syntaksi, id_tietoyksikko) FROM stdin;
2	32	\N	2
5	33	\N	5
6	34	\N	8
7	35	\N	9
8	36	\N	10
9	37	\N	11
10	38	\N	12
11	39	\N	13
12	40	\N	14
13	41	\N	15
14	42	\N	16
15	Rytmiriihenkatu	\N	73
16	Tanssilavankatu	\N	74
17	Polkkapolku	\N	75
18	Alueelle saa rakentaa likimäärin 2 metriä korkean meluvallin.	\N	76
\.


--
-- Data for Name: tietoyksikko; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.tietoyksikko (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, id, nimi, id_kaavakohde, id_lisatieto, id_kaavamaarays, id_kaavasuositus) FROM stdin;
\N	\N	\N	\N	2022-01-13 23:39:09.898579	2022-01-13 23:39:09.898579	70	kerrosalaosuus_50	8	\N	175	\N
\N	\N	\N	\N	2022-01-13 09:23:31.148401	2022-01-13 09:23:31.148401	2	korttelinumero_32	5	\N	67	\N
\N	\N	\N	\N	2022-01-13 13:23:52.309225	2022-01-13 13:23:52.309225	5	korttelinumero_33	6	\N	60	\N
\N	\N	\N	\N	2022-01-13 13:50:24.903904	2022-01-13 13:50:24.903904	6	korttelinumero_33	1	\N	68	\N
\N	\N	\N	\N	2022-01-13 13:54:59.027721	2022-01-13 13:54:59.027721	8	korttelinumero_34	10	\N	69	\N
\N	\N	\N	\N	2022-01-13 13:58:32.436096	2022-01-13 13:58:32.436096	9	korttelinumero_35	7	\N	70	\N
\N	\N	\N	\N	2022-01-13 14:05:31.155914	2022-01-13 14:05:31.155914	10	korttelinumero_36	8	\N	71	\N
\N	\N	\N	\N	2022-01-13 14:28:08.800952	2022-01-13 14:28:08.800952	11	korttelinumero_37	9	\N	72	\N
\N	\N	\N	\N	2022-01-13 14:30:29.601279	2022-01-13 14:30:29.601279	12	korttelinumero_38	11	\N	73	\N
\N	\N	\N	\N	2022-01-13 14:33:55.564996	2022-01-13 14:33:55.564996	13	korttelinumero_39	12	\N	60	\N
\N	\N	\N	\N	2022-01-13 14:39:13.797019	2022-01-13 14:39:13.797019	14	korttelinumero_40	14	\N	75	\N
\N	\N	\N	\N	2022-01-13 14:41:56.54694	2022-01-13 14:41:56.54694	15	korttelinumero_41	15	\N	76	\N
\N	\N	\N	\N	2022-01-13 14:44:01.005469	2022-01-13 14:44:01.005469	16	korttelinumero_42	13	\N	77	\N
\N	\N	\N	\N	2022-01-13 17:39:50.442964	2022-01-13 17:39:50.442964	17	tonttinumero_1	1	\N	64	\N
\N	\N	\N	\N	2022-01-13 17:53:05.909835	2022-01-13 17:53:05.909835	18	rakennusoikeus_300	110	\N	79	\N
\N	\N	\N	\N	2022-01-13 18:53:41.640625	2022-01-13 18:53:41.640625	19	kerrosala_300	111	\N	80	\N
\N	\N	\N	\N	2022-01-13 18:56:48.973759	2022-01-13 18:56:48.973759	20	kerrosala_300	112	\N	83	\N
\N	\N	\N	\N	2022-01-13 19:00:33.781427	2022-01-13 19:00:33.781427	21	kerrosala_300	113	\N	85	\N
\N	\N	\N	\N	2022-01-13 19:03:05.885786	2022-01-13 19:03:05.885786	22	kerrosala_300	114	\N	86	\N
\N	\N	\N	\N	2022-01-13 19:05:25.131307	2022-01-13 19:05:25.131307	23	kerrosala_300	115	\N	60	\N
\N	\N	\N	\N	2022-01-13 19:11:00.3508	2022-01-13 19:11:00.3508	24	kerrosala_300	116	\N	91	\N
\N	\N	\N	\N	2022-01-13 19:13:48.884385	2022-01-13 19:13:48.884385	25	kerrosala_300	117	\N	92	\N
\N	\N	\N	\N	2022-01-13 19:16:18.634274	2022-01-13 19:16:18.634274	26	kerrosala_300	118	\N	95	\N
\N	\N	\N	\N	2022-01-13 19:17:45.813198	2022-01-13 19:17:45.813198	27	kerrosala_300	119	\N	96	\N
\N	\N	\N	\N	2022-01-13 19:19:08.305657	2022-01-13 19:19:08.305657	28	kerrosala_300	120	\N	99	\N
\N	\N	\N	\N	2022-01-13 19:20:41.150215	2022-01-13 19:20:41.150215	29	kerrosala_300	121	\N	100	\N
\N	\N	\N	\N	2022-01-13 19:23:08.205691	2022-01-13 19:23:08.205691	30	kerrosala_300	122	\N	103	\N
\N	\N	\N	\N	2022-01-13 19:24:27.929985	2022-01-13 19:24:27.929985	31	kerrosala_300	123	\N	104	\N
\N	\N	\N	\N	2022-01-13 19:25:44.379883	2022-01-13 19:25:44.379883	32	kerrosala_300	124	\N	107	\N
\N	\N	\N	\N	2022-01-13 19:27:35.529091	2022-01-13 19:27:35.529091	33	kerrosala_350	125	\N	108	\N
\N	\N	\N	\N	2022-01-13 19:29:09.209812	2022-01-13 19:29:09.209812	34	kerrosala_300	126	\N	111	\N
\N	\N	\N	\N	2022-01-13 19:31:06.9682	2022-01-13 19:31:06.9682	35	kerrosala_300	127	\N	112	\N
\N	\N	\N	\N	2022-01-13 19:32:31.888232	2022-01-13 19:32:31.888232	36	kerrosala_300	128	\N	115	\N
\N	\N	\N	\N	2022-01-13 19:33:54.249164	2022-01-13 19:33:54.249164	37	kerrosala_300	129	\N	116	\N
\N	\N	\N	\N	2022-01-13 19:35:09.928038	2022-01-13 19:35:09.928038	38	kerrosala_300	130	\N	119	\N
\N	\N	\N	\N	2022-01-13 19:36:46.760163	2022-01-13 19:36:46.760163	39	kerrosala_300	131	\N	120	\N
\N	\N	\N	\N	2022-01-13 19:37:58.197837	2022-01-13 19:37:58.197837	40	kerrosala_300	132	\N	123	\N
\N	\N	\N	\N	2022-01-13 19:40:36.695922	2022-01-13 19:40:36.695922	41	kerrosala_300	133	\N	124	\N
\N	\N	\N	\N	2022-01-13 19:43:38.046313	2022-01-13 19:43:38.046313	42	kerrosala_300	134	\N	127	\N
\N	\N	\N	\N	2022-01-13 21:37:41.054052	2022-01-13 21:37:41.054052	43	kerrosala_300	139	\N	134	\N
\N	\N	\N	\N	2022-01-13 21:40:22.948194	2022-01-13 21:40:22.948194	44	kerrosala_300	140	\N	135	\N
\N	\N	\N	\N	2022-01-13 23:44:29.933746	2022-01-13 23:44:29.933746	71	tehokkuusluku_03	9	\N	176	\N
\N	\N	\N	\N	2022-01-13 21:44:14.07226	2022-01-13 21:44:14.07226	45	kerrosala_300	141	\N	138	\N
\N	\N	\N	\N	2022-01-13 21:48:28.132788	2022-01-13 21:48:28.132788	46	kerroala_300	142	\N	139	\N
\N	\N	\N	\N	2022-01-13 21:50:14.466855	2022-01-13 21:50:14.466855	47	kerrosala_300	143	\N	142	\N
\N	\N	\N	\N	2022-01-13 21:51:29.222243	2022-01-13 21:51:29.222243	48	kerrosala_300	144	\N	143	\N
\N	\N	\N	\N	2022-01-13 21:52:39.06731	2022-01-13 21:52:39.06731	49	kerrosala_300	145	\N	146	\N
\N	\N	\N	\N	2022-01-13 21:53:58.817549	2022-01-13 21:53:58.817549	50	kerrosala_300	146	\N	147	\N
\N	\N	\N	\N	2022-01-13 21:55:05.557998	2022-01-13 21:55:05.557998	51	kerrosala_300	147	\N	150	\N
\N	\N	\N	\N	2022-01-13 21:58:24.606527	2022-01-13 21:58:24.606527	52	kerrosala_250	148	\N	151	\N
\N	\N	\N	\N	2022-01-13 21:59:30.483435	2022-01-13 21:59:30.483435	53	kerrosala_250	149	\N	154	\N
\N	\N	\N	\N	2022-01-13 22:00:58.948191	2022-01-13 22:00:58.948191	54	kerrosala_250	150	\N	155	\N
\N	\N	\N	\N	2022-01-13 22:01:56.933242	2022-01-13 22:01:56.933242	55	kerrosala_250	151	\N	158	\N
\N	\N	\N	\N	2022-01-13 22:03:39.210471	2022-01-13 22:03:39.210471	56	kerrosala_500	152	\N	159	\N
\N	\N	\N	\N	2022-01-13 23:05:32.050996	2022-01-13 23:05:32.050996	58	kerrosluku_2	5	\N	163	\N
\N	\N	\N	\N	2022-01-13 23:08:30.509986	2022-01-13 23:08:30.509986	59	kerrosluku_2	6	\N	164	\N
\N	\N	\N	\N	2022-01-13 23:09:55.408715	2022-01-13 23:09:55.408715	60	kerrosluku_2	7	\N	165	\N
\N	\N	\N	\N	2022-01-13 23:12:02.196429	2022-01-13 23:12:02.196429	61	kerrosluku_2	8	\N	166	\N
\N	\N	\N	\N	2022-01-13 23:15:13.981114	2022-01-13 23:15:13.981114	62	kerrosluku_2	9	\N	167	\N
\N	\N	\N	\N	2022-01-13 23:16:52.227913	2022-01-13 23:16:52.227913	63	kerrosluku_2	10	\N	168	\N
\N	\N	\N	\N	2022-01-13 23:18:28.479687	2022-01-13 23:18:28.479687	64	kerrosluku_2	11	\N	169	\N
\N	\N	\N	\N	2022-01-13 23:20:10.70463	2022-01-13 23:20:10.70463	65	kerrosluku_2	12	\N	170	\N
\N	\N	\N	\N	2022-01-13 23:22:29.814545	2022-01-13 23:22:29.814545	66	kerrosluku_2	13	\N	171	\N
\N	\N	\N	\N	2022-01-13 23:23:39.295871	2022-01-13 23:23:39.295871	67	kerrosluku_2	14	\N	172	\N
\N	\N	\N	\N	2022-01-13 23:26:58.511895	2022-01-13 23:26:58.511895	68	kerrosluku_2	15	\N	173	\N
\N	\N	\N	\N	2022-01-13 23:36:53.565952	2022-01-13 23:36:53.565952	69	kerrosalaosuus_50	7	\N	174	\N
\N	\N	\N	\N	2022-01-17 13:10:31.850354	2022-01-17 13:10:31.850354	80	korkeusasema_107	186	\N	209	\N
\N	\N	\N	\N	2022-01-14 09:14:49.733067	2022-01-14 09:14:49.733067	73	nimi_rytmiriihenkatu	155	\N	178	\N
\N	\N	\N	\N	2022-01-14 09:17:41.839656	2022-01-14 09:17:41.839656	74	tanssilavankatu_nimi	156	\N	179	\N
\N	\N	\N	\N	2022-01-14 09:19:40.414517	2022-01-14 09:19:40.414517	75	polkkapolku_nimi	157	\N	180	\N
\N	\N	\N	\N	2022-01-17 11:33:44.225354	2022-01-17 11:33:44.225354	76	meluvallin_korkeus	154	\N	177	\N
\N	\N	\N	\N	2022-01-17 13:06:31.539	2022-01-17 13:06:31.539	77	korkeusasema_107	183	\N	206	\N
\N	\N	\N	\N	2022-01-17 13:08:36.169073	2022-01-17 13:08:36.169073	78	korkeusasema_108	184	\N	207	\N
\N	\N	\N	\N	2022-01-17 13:09:27.754227	2022-01-17 13:09:27.754227	79	korkeusasema_108	185	\N	208	\N
\N	\N	\N	\N	2022-01-17 13:11:18.8482	2022-01-17 13:11:18.8482	81	korkeusasema_107	187	\N	210	\N
\N	\N	\N	\N	2022-01-17 13:12:11.357105	2022-01-17 13:12:11.357105	82	korkeusasema_106	188	\N	211	\N
\N	\N	\N	\N	2022-01-17 13:13:08.891373	2022-01-17 13:13:08.891373	83	korkeusasema_108	189	\N	212	\N
\N	\N	\N	\N	2022-01-17 13:14:03.771518	2022-01-17 13:14:03.771518	84	korkeusasema_108	190	\N	213	\N
\N	\N	\N	\N	2022-01-17 13:14:57.592815	2022-01-17 13:14:57.592815	85	korkeusasema_108	191	\N	214	\N
\N	\N	\N	\N	2022-01-17 13:15:58.778611	2022-01-17 13:15:58.778611	86	korkeusasema_107	192	\N	215	\N
\N	\N	\N	\N	2022-01-17 13:17:20.239234	2022-01-17 13:17:20.239234	87	korkeusasema_95_97	193	\N	216	\N
\N	\N	\N	\N	2022-01-17 13:18:01.388429	2022-01-17 13:18:01.388429	88	korkeusasema_95_97	194	\N	217	\N
\N	\N	\N	\N	2022-01-17 13:18:45.653401	2022-01-17 13:18:45.653401	89	korkeusasema_95_97	195	\N	218	\N
\.


--
-- Data for Name: tunnusarvo; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.tunnusarvo (id, nimi, rekisteri_tunnus, id_tietoyksikko) FROM stdin;
\.


--
-- Data for Name: versioitu_objekti_abstrakti; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.versioitu_objekti_abstrakti (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika) FROM stdin;
\.


--
-- Data for Name: vuorovaikutustapahtuma; Type: TABLE DATA; Schema: kaavatiedot; Owner: postgres
--

COPY kaavatiedot.vuorovaikutustapahtuma (nimiavaruus, viittaustunnus, identiteettitunnus, tuottajakohtainen_tunnus, viimeisin_muutos, tallennusaika, nimi, tapahtuma_aika, kuvaus, sijainti, lisatietolinkki, peruttu, id, id_kaavan_vuorovaikutustapahtuman_laji, id_kaava) FROM stdin;
\.


--
-- Data for Name: asiakirjan_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.asiakirjan_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/01	1	\N	DRAFT	\N	Hakemus	\N	\N	\N	\N	\N	Kaava-asiaan liittyvä hakemus, esimerkiksi kaavoitusaloite tai -hakemus.	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	1
2	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/02	2	\N	DRAFT	\N	Havainnekuva	\N	\N	Kaavaa havainnollistava visualisointi	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	2
3	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/03	3	\N	DRAFT	\N	Kaavakartta	\N	\N	\N	\N	\N	Juridisen kaavakartan sähköinen versio. Esimerkiksi vanhan, digitoidun kaavakartan skannattu versio.	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	3
4	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/04	4	\N	DRAFT	\N	Kaavaselostus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	4
5	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/05	5	\N	DRAFT	\N	Karttaliite	\N	\N	\N	\N	\N	Kaavaan liitetty karttaa esittävä dokumentti.	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	5
6	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/06	6	\N	DRAFT	\N	Kirje	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	6
7	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/07	7	\N	DRAFT	\N	Kuulutus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	7
8	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/08	8	\N	DRAFT	\N	Lausunto	\N	\N	asiakirja tai asiakirjojen muodostama kokonaisuus, jolla lausuntopyynnön saanut toimija esittää näkemyksensä tarkastelun kohteesta asiankäsittelyn aikana	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	8
9	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/09	9	\N	DRAFT	opinion	Mielipide	åsikt	\N	osallisen tai yhteisön jäsenen esittämä kannanotto viranomaisen valmisteluaineistoon	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	9
10	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/10	10	\N	DRAFT	\N	Muistio	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	10
11	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/11	11	\N	DRAFT	objection	Muistutus	anmärkning	\N	asianosaisen esittämä kannanotto kaavaehdotukseen	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	11
12	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/12	12	\N	DRAFT	\N	Osallistumis- ja arviointisuunnitelma	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	12
13	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/13	13	\N	DRAFT	\N	Päätös	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	13
14	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/14	14	\N	DRAFT	\N	Pöytäkirja	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	14
15	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/15	15	\N	DRAFT	\N	Raportti	\N	\N	Raportti voi olla esimerkiksi yhteenveto vuorovaikutustapahtumasta tai -tapahtumien kokonaisuudesta.	\N	\N	asiakirja, joka sisältää yhteenvedon kaavan valmisteluun liittyvästä asiasta	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	15
16	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/16	16	\N	DRAFT	\N	Selvitys	\N	\N	Kaavan laadinnassa hyödynnetyt selvitykset. Selvityksiä voivat olla esimerkiksi luonto-, maisema-, kulttuuriperintö-, liikenne- tai palveluverkkoselvitykset.	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	16
17	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/17	17	\N	DRAFT	\N	Sopimus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	17
18	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/18	18	\N	DRAFT	\N	Suunnitelma	\N	\N	Kaavatyöhön liittyvä erillinen suunnitelma, esimerkiksi katujen tai yleisten alueiden suunnitelma	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	18
19	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/19	19	\N	DRAFT	\N	Suunnitteluohje	\N	\N	Suunnitteluohje voi olla esimerkiksi rakentamistapaohje tai lähiympäristön suunnitteluohje.	\N	\N	Kaavan suunnitteluratkaisuja täydentävä ohjeistus jatkosuunnittelua varten.	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	19
20	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/20	20	\N	DRAFT	\N	Valitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	20
21	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/21	21	\N	DRAFT	\N	Vastine	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	21
22	http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/22	22	\N	DRAFT	\N	Muu asiakirja	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:32:11	2021-01-13 19:32:11	22
\.


--
-- Data for Name: digitaalinen_alkupera; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.digitaalinen_alkupera (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/01	1	\N	DRAFT	\N	Tietomallin mukaan laadittu	\N	\N	\N	\N	\N	\N	\N	Kaavan kansallisen tietomallin mukaisesti tuotettu aineisto.	\N	1	2020-12-11 06:20:58	2020-12-11 06:22:41	1
2	http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/02	2	\N	DRAFT	\N	Kokonaan digitoitu	\N	\N	\N	\N	\N	\N	\N	Kaava on jälkikäteen digitoitu tietomallin mukaiseksi. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.	\N	1	2020-12-11 06:20:58	2020-12-11 06:27:41	2
3	http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/03	3	\N	DRAFT	\N	Osittain digitoitu	\N	\N	\N	\N	\N	Osa kaavasta (esim. kaavan rajauksen lisäksi aluevaraukset) on jälkikäteen digitoitu tietomallin mukaiseksi. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.	\N	\N	\N	1	2020-12-11 06:20:58	2020-12-11 06:29:44	3
4	http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/04	4	\N	DRAFT	\N	Kaavan rajaus digitoitu	\N	\N	Digitoitu kaavan rajaus, johon on liitetty muut tiedot linkitettyinä dokumentteina. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.	\N	\N	\N	\N	\N	\N	1	2020-12-11 06:20:58	2020-12-11 06:32:27	4
\.


--
-- Data for Name: kaavalaji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.kaavalaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/1	1	\N	DRAFT	Regional land use plan	Maakuntakaava	Landskapsplan	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:24:39	2020-12-11 11:24:39	1
11	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/11	2	1.0	DRAFT	Regional land use plan	Kokonaismaakuntakaava	Helhetslandskapsplan	\N	\N	\N	\N	Koko maakunnan aluetta tai sen osa-aluetta koskeva kaava.	Plan som berör hela landskapet eller dess delområde.	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	2
12	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/12	3	1.0	DRAFT	Phased regional land use plan	Vaihemaakuntakaava	Etapplandskapsplan	\N	\N	\N	\N	Koko maakuntaa tai sen osa-aluetta koskeva rajattuja teemoja käsittelevä maakuntakaava.	Landskapsplan som berör hela landskapet eller dess delområde och behandlar begränsade teman.	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	3
2	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/2	4	\N	DRAFT	Local master plan	Yleiskaava	Generalplan	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:24:39	2020-12-11 11:24:39	4
21	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/21	5	2.0	DRAFT	Local master plan	Yleiskaava	Generalplan	\N	yleiskaavan määritelmä	\N	\N	Koko kunnan aluetta koskeva yleiskaava.	\N	\N	http://uri.suomi.fi/terminology/rak/concept-37	2	2020-12-11 11:24:39	2020-12-11 11:24:39	5
22	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/22	6	2.0	DRAFT	Phased  local master plan	Vaiheyleiskaava	Etappgeneralplan	\N	\N	\N	\N	Koko kuntaa tai kunnan osa-aluetta koskeva rajattuja teemoja käsittelevä yleiskaava.	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	6
23	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/23	7	2.0	DRAFT	Partial local master plan	Osayleiskaava	Delgeneralplan	\N	\N	\N	\N	Kunnan osa-aluetta koskeva yleiskaava.	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	7
24	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/24	8	2.0	DRAFT	Joint municipal master plan / Joint master plan	Kuntien yhteinen yleiskaava	Gemensam generalplan	\N	\N	\N	\N	Kahden tai useamman kunnan aluetta tai osa-aluetta koskeva yleiskaava (MRL 46 §) tai vaiheyleiskaava.	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	8
3	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/3	9	\N	DRAFT	Local detailed plan	Asemakaava	Detaljplan	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:24:39	2020-12-11 11:24:39	9
31	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/31	10	3.0	DRAFT	Local detailed plan	Asemakaava	Detaljplan	\N	\N	\N	\N	MRL 50 § mukaan laadittu yksityiskohtainen asemakaava tai asemakaavan muutos.	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	10
32	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/32	11	3.0	DRAFT	Phased local detailed plan	Vaiheasemakaava	Etappdetaljplan	\N	\N	\N	\N	MRL 50 § mukaan laadittu rajattuja teemoja käsittelevä asemakaava tai asemakaavan muutos,	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	11
33	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/33	12	3.0	DRAFT	Detailed shore plan	Ranta-asemakaava	Stranddetaljplan	\N	\N	\N	\N	Asemakaava, joka laaditaan pääasiassa loma-asutuksen järjestämiseksi	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	12
25	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/25	13	2.0	DRAFT	\N	Oikeusvaikutukseton yleiskaava	Generalplan utan rättsverkningar	\N	\N	\N	\N	Koko kuntaa tai kunnan osa-aluetta koskeva yleiskaava, jolla ei ole maankäyttö- ja rakennuslaissa tarkoitettuja oikeusvaikutuksia (MRL 45§).	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	13
34	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/34	14	3.0	DRAFT	\N	Vaiheranta-asemakaava	Etappsranddetaljplan	\N	\N	\N	\N	Rajattuja teemoja käsittelevä asemakaava, joka laaditaan pääasiassa loma-asutuksen järjestämiseksi.	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	14
35	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/35	15	3.0	DRAFT	\N	Maanalaisten tilojen asemakaava	Underjordisk detaljplan	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	15
26	http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/26	17	2.0	DRAFT	\N	Maanalainen yleiskaava	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-11 11:24:39	2020-12-11 11:24:39	16
\.


--
-- Data for Name: kaavamaarays_laji_ak; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.kaavamaarays_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/01	1	\N	DRAFT	\N	Alueen käyttötarkoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:48	2020-12-17 09:11:48	1
101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0101	2	1.0	DRAFT	\N	Asuminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:48	2020-12-17 09:11:48	2
10101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010101	3	101.0	DRAFT	\N	Asuinkerrostaloalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	3
10102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010102	4	101.0	DRAFT	\N	Asuinpientaloalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	4
10103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010103	5	101.0	DRAFT	\N	Rivitalojen ja muiden kytkettyjen asuinrakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	5
10104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010104	6	101.0	DRAFT	\N	Erillispientaloalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	6
10105	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010105	7	101.0	DRAFT	\N	Asumista palveleva yhteiskäyttöinen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	7
10106	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010106	8	101.0	DRAFT	\N	Maatilan talouskeskuksen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	8
10107	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010107	9	101.0	DRAFT	\N	Kyläalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	9
10108	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010108	10	101.0	DRAFT	\N	Erityisryhmien palveluasuminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	10
10109	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010109	11	101.0	DRAFT	\N	Muu asuminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	11
102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0102	12	1.0	DRAFT	\N	Keskustatoiminnot	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:48	2020-12-17 09:11:48	12
10201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010201	13	102.0	DRAFT	\N	Keskustatoimintojen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	13
10202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010202	14	102.0	DRAFT	\N	Keskustatoimintojen alakeskus	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	14
10203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010203	15	102.0	DRAFT	\N	Muut keskustatoiminnot	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	15
103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0103	16	1.0	DRAFT	\N	Liike- ja toimistorakentaminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:48	2020-12-17 09:11:48	16
10301	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010301	17	103.0	DRAFT	\N	Liikerakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	17
10302	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010302	18	103.0	DRAFT	\N	Toimistorakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	18
10303	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010303	19	103.0	DRAFT	\N	Toimitilarakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	19
10304	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010304	20	103.0	DRAFT	\N	Kaupallisten palveluiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	20
10305	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010305	21	103.0	DRAFT	\N	Muu liike- ja toimistorakentaminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	21
104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0104	22	1.0	DRAFT	\N	Palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:48	2020-12-17 09:11:48	22
10401	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010401	23	104.0	DRAFT	\N	Palvelurakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	23
10402	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010402	24	104.0	DRAFT	\N	Lähipalveluiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	24
10403	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010403	25	104.0	DRAFT	\N	Huvi- ja viihdepalveluiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	25
10404	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010404	26	104.0	DRAFT	\N	Muut palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:48	2020-12-17 09:11:48	26
105	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0105	27	1.0	DRAFT	\N	Julkiset palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:48	2020-12-17 09:11:48	27
10501	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010501	28	105.0	DRAFT	\N	Julkiset palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	28
10502	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010502	29	105.0	DRAFT	\N	Yleisten rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	29
10503	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010503	30	105.0	DRAFT	\N	Julkisten lähipalveluiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	30
10504	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010504	31	105.0	DRAFT	\N	Hallinto- ja virastorakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	31
10505	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010505	32	105.0	DRAFT	\N	Opetustoimintaa palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	32
10506	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010506	33	105.0	DRAFT	\N	Sosiaalitointa ja terveydenhuoltoa palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	33
10507	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010507	34	105.0	DRAFT	\N	Kulttuuritoimintaa palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	34
10508	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010508	35	105.0	DRAFT	\N	Museorakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	35
10509	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010509	36	105.0	DRAFT	\N	Kirkkojen ja muiden seurakunnallisten rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	36
10510	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010510	37	105.0	DRAFT	\N	Urheilutoimintaa palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	37
10511	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010511	38	105.0	DRAFT	\N	Julkisten palveluiden ja hallinnon alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	38
10512	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010512	39	105.0	DRAFT	\N	Muut julkiset palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	39
106	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0106	40	1.0	DRAFT	\N	Työ ja tuotanto	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	40
10601	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010601	41	106.0	DRAFT	\N	Työpaikka-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	41
10602	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010602	42	106.0	DRAFT	\N	Teollisuusalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	42
10603	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010603	43	106.0	DRAFT	\N	Varastorakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	43
10604	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010604	44	106.0	DRAFT	\N	Alue, jolle saa sijoittaa merkittävän, vaarallisia kemikaaleja valmistavan tai varastoivan laitoksen	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	44
10605	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010605	45	106.0	DRAFT	\N	Ympäristövaikutuksiltaan merkittävien teollisuustoimintojen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	45
10606	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010606	46	106.0	DRAFT	\N	Kiertotalous	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	46
10607	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010607	47	106.0	DRAFT	\N	Ympäristöhäiriötä aiheuttava tuotantotoiminta	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	47
10608	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010608	48	106.0	DRAFT	\N	Muu työpaikka- tai tuontantoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	48
107	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0107	49	1.0	DRAFT	\N	Virkistys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	49
10701	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010701	50	107.0	DRAFT	\N	Virkistysalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	50
10702	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010702	51	107.0	DRAFT	\N	Puisto	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	51
10703	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010703	52	107.0	DRAFT	\N	Lähivirkistysalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	52
10704	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010704	53	107.0	DRAFT	\N	Leikkipuisto	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	53
10705	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010705	54	107.0	DRAFT	\N	Urheilupalvelujen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	54
10706	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010706	55	107.0	DRAFT	\N	Retkeily- ja ulkoilualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	55
10707	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010707	56	107.0	DRAFT	\N	Uimaranta-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	56
10708	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010708	57	107.0	DRAFT	\N	Lähimetsä	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	57
10709	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010709	58	107.0	DRAFT	\N	Muu virkistysalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	58
108	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0108	59	1.0	DRAFT	\N	Loma-asuminen ja matkailu	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	59
10801	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010801	60	108.0	DRAFT	\N	Loma-asuntojen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	60
10802	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010802	61	108.0	DRAFT	\N	Matkailua palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	61
10803	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010803	62	108.0	DRAFT	\N	Leirintäalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	62
10804	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010804	63	108.0	DRAFT	\N	Asuntovaunualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	63
10805	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010805	64	108.0	DRAFT	\N	Siirtolapuutarha-/palstaviljelyalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	64
10806	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010806	65	108.0	DRAFT	\N	Muu loma-asumisen tai matkailun alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	65
109	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0109	66	1.0	DRAFT	\N	Liikenne	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	66
10901	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010901	67	109.0	DRAFT	\N	Liikennealue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	67
10902	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010902	68	109.0	DRAFT	\N	Yleisen tien alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	68
10903	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010903	69	109.0	DRAFT	\N	Rautatieliikenteen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	69
10904	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010904	70	109.0	DRAFT	\N	Lentoliikenteen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	70
10905	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010905	71	109.0	DRAFT	\N	Satama-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	71
10906	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010906	72	109.0	DRAFT	\N	Kanava-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	72
10907	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010907	73	109.0	DRAFT	\N	Venesatama/venevalkama	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	73
10908	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010908	74	109.0	DRAFT	\N	Yleinen pysäköintialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	74
10909	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010909	75	109.0	DRAFT	\N	Huoltoasema-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	75
10910	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010910	76	109.0	DRAFT	\N	Henkilöliikenteen terminaalialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	76
10911	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010911	77	109.0	DRAFT	\N	Tavaraliikenteen terminaalialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	77
10912	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010912	78	109.0	DRAFT	\N	Yleisten pysäköintilaitosten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	78
10913	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010913	79	109.0	DRAFT	\N	Autopaikkojen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	79
10914	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010914	80	109.0	DRAFT	\N	Katualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	80
10915	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010915	81	109.0	DRAFT	\N	Muu liikennealue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	81
110	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0110	82	1.0	DRAFT	\N	Erityisalueet	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	82
11001	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011001	83	110.0	DRAFT	\N	Erityisalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	83
11002	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011002	84	110.0	DRAFT	\N	Yhdyskuntateknisen huollon alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	84
11003	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011003	85	110.0	DRAFT	\N	Energiahuollon alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	85
11004	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011004	86	110.0	DRAFT	\N	Jätteenkäsittelyalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	86
11005	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011005	87	110.0	DRAFT	\N	Maa-ainesten ottoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	87
11006	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011006	88	110.0	DRAFT	\N	Kaivosalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	88
11007	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011007	89	110.0	DRAFT	\N	Mastoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	89
11008	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011008	90	110.0	DRAFT	\N	Ampumarata-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	90
11009	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011009	91	110.0	DRAFT	\N	Puolustusvoimien alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	91
11010	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011010	92	110.0	DRAFT	\N	Hautausmaa-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	92
11011	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011011	93	110.0	DRAFT	\N	Suojaviheralue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	93
11012	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011012	94	110.0	DRAFT	\N	Tuulivoimaloiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	94
11013	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011013	95	110.0	DRAFT	\N	Moottorirata	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	95
11014	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011014	96	110.0	DRAFT	\N	Maa-ainesten vastaanotto- tai läjitysalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	96
11015	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011015	97	110.0	DRAFT	\N	Vankila-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	97
11016	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011016	98	110.0	DRAFT	\N	Muu erityisalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	98
111	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0111	99	1.0	DRAFT	\N	Suojelu	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	99
11101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011101	100	111.0	DRAFT	\N	Suojelualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	100
11102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011102	101	111.0	DRAFT	\N	Luonnonsuojelualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	101
11103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011103	102	111.0	DRAFT	\N	Muinaismuistoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	102
11104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011104	103	111.0	DRAFT	\N	Rakennuslainsäädännön nojalla suojeltava alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	103
11105	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011105	104	111.0	DRAFT	\N	Rakennussuojelulakien nojalla suojeltu alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	104
11106	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011106	105	111.0	DRAFT	\N	Muu suojelualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	105
112	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0112	106	1.0	DRAFT	\N	Maa- ja metsätalous	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	106
11201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011201	107	112.0	DRAFT	\N	Maa- ja metsätalousalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	107
11202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011202	108	112.0	DRAFT	\N	Maatalousalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	108
11203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011203	109	112.0	DRAFT	\N	Kotieläintalouden suuryksikön alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	109
11204	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011204	110	112.0	DRAFT	\N	Puutarha- ja kasvihuonealue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	110
11205	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011205	111	112.0	DRAFT	\N	Maisemallisesti arvokas peltoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	111
11206	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011206	112	112.0	DRAFT	\N	Poronhoitovaltainen maa- ja metsätalousalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	112
11207	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011207	113	112.0	DRAFT	\N	Muu maa- ja metsätalousalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	113
113	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0113	114	1.0	DRAFT	\N	Vesialueet	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	114
11301	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011301	115	113.0	DRAFT	\N	Vesialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	115
11302	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011302	116	113.0	DRAFT	\N	Muu vesialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	116
2	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/02	117	\N	DRAFT	\N	Alueen osan käyttötarkoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:49	2020-12-17 09:11:49	117
201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0201	118	2.0	DRAFT	\N	Yhdyskuntatekninen käyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	118
20101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020101	119	201.0	DRAFT	\N	Johto, putki tai linja	\N	\N	\N	\N	\N	Maan alaista tai maan päällistä johtoa, putkea tai linjaa varten varattu alue.	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	119
20102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020102	120	201.0	DRAFT	\N	Sähkölinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	120
20103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020103	121	201.0	DRAFT	\N	Kaasulinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	121
20104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020104	122	201.0	DRAFT	\N	Vesi- tai jätevesitunneli	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	122
20105	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020105	123	201.0	DRAFT	\N	Vesijohto tai siirtoviemäri	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	123
20106	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020106	124	201.0	DRAFT	\N	Kaukolämpölinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	124
20107	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020107	125	201.0	DRAFT	\N	Kaukokylmälinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	125
20108	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020108	126	201.0	DRAFT	\N	Tulvapenger	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	126
20109	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020109	127	201.0	DRAFT	\N	Tulvareitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	127
20110	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020110	128	201.0	DRAFT	\N	Pumppaamo	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	128
20111	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020111	129	201.0	DRAFT	\N	Muuntamo	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	129
20112	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020112	130	201.0	DRAFT	\N	Suojavyöhyke	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	130
20113	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020113	131	201.0	DRAFT	\N	Hulevesijärjestelmä	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	131
20114	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020114	132	201.0	DRAFT	\N	Hulevesien viivytysallas	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	132
20115	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020115	133	201.0	DRAFT	\N	Avo-oja	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	133
20116	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020116	134	201.0	DRAFT	\N	Muu yhdyskuntatekniseen huoltoon liittyvä käyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	134
202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0202	135	2.0	DRAFT	\N	Ulkoalueiden käyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	135
20201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020201	136	202.0	DRAFT	\N	Istutettava alueen osa	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	136
20202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020202	137	202.0	DRAFT	\N	Leikkialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	137
20203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020203	138	202.0	DRAFT	\N	Oleskelualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	138
20204	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020204	139	202.0	DRAFT	\N	Puurivi	\N	\N	\N	\N	\N	Säilytettävä/istutettava puurivi	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	139
20205	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020205	140	202.0	DRAFT	\N	Muuri	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	140
20206	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020206	141	202.0	DRAFT	\N	Pengerrys	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	141
20207	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020207	142	202.0	DRAFT	\N	Muu tontinkäyttöön liittyvä käyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	142
203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0203	143	2.0	DRAFT	\N	Liikennekäyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:49	2020-12-17 09:11:49	143
20301	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020301	144	203.0	DRAFT	\N	Ajoluiska	\N	\N	\N	\N	\N	Maanalaisiin tiloihin johtava ajoluiska	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	144
20302	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020302	145	203.0	DRAFT	\N	Ajoyhteys	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:49	2020-12-17 09:11:49	145
20303	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020303	146	203.0	DRAFT	\N	Alikulku	\N	\N	\N	\N	\N	Kadun tai liikennealueen alittava kevyen liikenteen yhteys	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	146
20304	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020304	147	203.0	DRAFT	\N	Auton säilytyspaikka	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	147
20305	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020305	148	203.0	DRAFT	\N	Eritasoristeys	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	148
20306	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020306	149	203.0	DRAFT	\N	Hidaskatu	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	149
20307	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020307	150	203.0	DRAFT	\N	Katuaukio/Tori	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	150
20308	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020308	151	203.0	DRAFT	\N	Liikennetunneli	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	151
20309	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020309	152	203.0	DRAFT	\N	Pelastustie	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	152
20310	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020310	153	203.0	DRAFT	\N	Pihakatu	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	153
20311	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020311	154	203.0	DRAFT	\N	Pysäköintialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	154
20312	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020312	155	203.0	DRAFT	\N	Tontille ajo sallittu	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	155
20313	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020313	156	203.0	DRAFT	\N	Ulkoilureitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	156
20314	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020314	157	203.0	DRAFT	\N	Varattu alueen sisäiselle huoltoajolle	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	157
20315	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020315	158	203.0	DRAFT	\N	Varattu alueen sisäiselle jalankululle	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	158
20316	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020316	159	203.0	DRAFT	\N	Varattu alueen sisäiselle polkupyöräilylle	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	159
20317	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020317	160	203.0	DRAFT	\N	Varattu huoltoajolle	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	160
20318	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020318	161	203.0	DRAFT	\N	Varattu jalankululle	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	161
20319	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020319	162	203.0	DRAFT	\N	Varattu joukkoliikenteelle	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	162
20320	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020320	163	203.0	DRAFT	\N	Varattu polkypyöräilylle	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	163
20321	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020321	164	203.0	DRAFT	\N	Yleisen tien näkemäalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	164
20322	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020322	165	203.0	DRAFT	\N	Yleisen tien suoja-alue	\N	\N	\N	\N	\N	Yleisen tien suoja-alueeksi varattu alueen osa	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	165
20323	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020323	166	203.0	DRAFT	\N	Ylikulku	\N	\N	\N	\N	\N	Kadun tai liikennealueen ylittävä kevyen liikenteen yhteys	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	166
20324	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020324	167	203.0	DRAFT	\N	Muu liikennejärjestelmään liittyvä käyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	167
204	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0204	168	2.0	DRAFT	\N	Virkistyskäyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	168
20401	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020401	169	204.0	DRAFT	\N	Asuntovaunualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	169
20402	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020402	170	204.0	DRAFT	\N	Frisbeegolf	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	170
20403	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020403	171	204.0	DRAFT	\N	Golf-väylä	\N	\N	\N	\N	\N	Golf-väylä suoja-alueineen	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	171
20404	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020404	172	204.0	DRAFT	\N	Kenttä	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	172
20405	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020405	173	204.0	DRAFT	\N	Koirapuisto	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	173
20406	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020406	174	204.0	DRAFT	\N	Mäenlaskupaikka	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	174
20407	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020407	175	204.0	DRAFT	\N	Ratsastuskenttä	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	175
20408	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020408	176	204.0	DRAFT	\N	Telttailu	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	176
20409	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020409	177	204.0	DRAFT	\N	Muu virkistyskäyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	177
205	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0205	178	2.0	DRAFT	\N	Maatalouskäyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	178
20501	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020501	179	205.0	DRAFT	\N	Laidun	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	179
20502	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020502	180	205.0	DRAFT	\N	Muu maatalouskäyttö	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	180
206	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0206	181	2.0	DRAFT	\N	Rakennusalan käyttötarkoitus	\N	\N	\N	\N	\N	Rakennuksen käyttötarkoitusta tarkentava kaavamääräys. Käyttötarkoitus ilmaistaan Rakennusluokitus 2018 -koodiston avulla tai tekstiarvona.	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	181
207	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0207	182	2.0	DRAFT	\N	Muu alueen osan käyttötarkoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	182
3	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/03	183	\N	DRAFT	\N	Rakentamisen määrä	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:50	2020-12-17 09:11:50	183
301	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0301	184	3.0	DRAFT	\N	Sallittu kerrosala	\N	\N	\N	\N	\N	Sallittu kerrosala kerrosneliömetreinä (m2)	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	184
302	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0302	185	3.0	DRAFT	\N	Sallittu rakennustilavuus	\N	\N	\N	\N	\N	Rakennuksen sallittu tilavuus kuutiometreinä (m3)	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	185
303	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0303	186	3.0	DRAFT	\N	Tehokkuusluku	\N	\N	\N	\N	\N	sallitun kerrosalan suhde tontin/rakennuspaikan pinta-alaan	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	186
304	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0304	187	3.0	DRAFT	\N	Maanpäällinen kerrosluku	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	187
305	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0305	188	3.0	DRAFT	\N	Maanalainen kerrosluku	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	188
306	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0306	189	3.0	DRAFT	\N	Kellarin sallittu kerrosalaosuus	\N	\N	\N	\N	\N	ilmaisee kuinka suuren osan rakennuksen suurimman kerroksen alasta saa kellarikerroksessa käyttää kerrosalaan luettavaksi tilaksi.	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	189
307	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0307	190	3.0	DRAFT	\N	Ullakon sallittu kerrosalaosuus	\N	\N	\N	\N	\N	ilmaiseen kuinka suuren osan rakennuksen suurimman kerroksen alasta ullakon tasolla saa käyttää kerrosalaan laskettavaksi tilaksi.	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	190
308	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0308	191	3.0	DRAFT	\N	Rakennuspaikkojen määrä	\N	\N	\N	\N	\N	Ranta-asemakaavassa osoitettavien rakennuspaikkojen määrä	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	191
309	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0309	192	3.0	DRAFT	\N	Lisärakennusoikeus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	192
4	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/04	193	\N	DRAFT	\N	Rakennusten sijoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:50	2020-12-17 09:11:50	193
401	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0401	194	4.0	DRAFT	\N	Rakentamisen suhde alueen pinta-alaan	\N	\N	\N	\N	\N	Luku osoittaa, kuinka suuren osan alueesta tai rakennusalasta saa käyttää rakentamiseen.	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	194
402	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0402	195	4.0	DRAFT	\N	Etäisyys naapuritontin rajasta	\N	\N	\N	\N	\N	Rakennusten etäisyyden naapuritontin rajasta on oltava vähintään kaavamääräykseen liitetyn numeerisen arvon mukainen.	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	195
403	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0403	196	4.0	DRAFT	\N	Rakennusala	\N	\N	\N	\N	\N	asemakaavassa rakentamiselle osoitettu, rajoiltaan määrätty korttelin tai tontin osa	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	196
404	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0404	197	4.0	DRAFT	\N	Rakennettava kiinni rajaan	\N	\N	\N	\N	\N	Rakennusalan sivu, johon rakennus on rakennettava kiinni	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	197
405	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0405	198	4.0	DRAFT	\N	Rakennuspaikka	\N	\N	\N	\N	\N	Ranta-asemakaavan mukainen rakennuspaikka	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	198
406	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0406	199	4.0	DRAFT	\N	Muu rakennusten sijoitukseen liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	199
5	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/05	200	\N	DRAFT	\N	Rakentamistapa	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:50	2020-12-17 09:11:50	200
501	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0501	201	5.0	DRAFT	\N	Kattokaltevuus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	201
502	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0502	202	5.0	DRAFT	\N	Uloke	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	202
503	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0503	203	5.0	DRAFT	\N	Rakennuksen harjansuunta	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	203
504	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0504	204	5.0	DRAFT	\N	Kulkuaukko	\N	\N	\N	\N	\N	Rakennukseen jätettävä kulkuaukko	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	204
505	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0505	205	5.0	DRAFT	\N	Valokatteinen tila	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	205
506	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0506	206	5.0	DRAFT	\N	Suora uloskäynti porrashuoneista	\N	\N	\N	\N	\N	Rakennuksen sivu, jolla tulee olla suora uloskäynti porrashuoneista	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	206
507	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0507	207	5.0	DRAFT	\N	Ei saa rakentaa ikkunoita	\N	\N	\N	\N	\N	Rakennusalan sivu, jonka puoleiseen rakennuksen seinään ei saa sijoittaa ikkunoita	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	207
508	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0508	208	5.0	DRAFT	\N	Ääneneristävyys	\N	\N	\N	\N	\N	Rakennusalan sivu, jonka puoleisten rakennusten ulkoseinien sekä ikkunoiden ja muiden rakenteiden ääneneristävyyden liikennemelua vastaan on oltava vähintää xx dBA	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	208
509	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0509	209	5.0	DRAFT	\N	Parvekkeet sijoitettava rungon sisään	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	209
510	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0510	210	5.0	DRAFT	\N	Hissi	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	210
511	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0511	211	5.0	DRAFT	\N	Viherkatto	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	211
512	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0512	212	5.0	DRAFT	\N	Kelluvat asuinrakennukset	\N	\N	\N	\N	\N	Rakennukset saa toteuttaa kelluvina	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	212
513	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0513	213	5.0	DRAFT	\N	Muu rakentamistapaan liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	213
6	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/06	214	\N	DRAFT	\N	Korkeusasema	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:50	2020-12-17 09:11:50	214
601	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0601	215	6.0	DRAFT	\N	Maanpinnan korkeusasema	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	215
602	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0602	216	6.0	DRAFT	\N	Rakennuksen vesikaton ylimmän kohdan korkeusasema	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	216
603	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0603	217	6.0	DRAFT	\N	Rakennuksen julkisivupinnan ja vesikaton leikkauskohdan korkeusasema	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	217
604	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0604	218	6.0	DRAFT	\N	Rakennuksen julkisivun enimmäiskorkeus metreinä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	218
605	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0605	219	6.0	DRAFT	\N	Rakennuksen, rakenteiden ja laitteiden ylin korkeusasema	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	219
606	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0606	220	6.0	DRAFT	\N	Maanalaisen kohteen korkeusasema	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	220
607	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0607	221	6.0	DRAFT	\N	Muu korkeusasemaan liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	221
7	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/07	222	\N	DRAFT	\N	Ulkoalueet	\N	\N	\N	\N	\N	Rakennusten ulkopuoleisten alueiden toteuttaminen	\N	\N	\N	1	2020-12-17 09:11:50	2020-12-17 09:11:50	222
701	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0701	223	7.0	DRAFT	\N	Vihertehokkuus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	223
702	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0702	224	7.0	DRAFT	\N	Puusto tai kasvillisuus säilytettävä tai korvattava	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	224
703	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0703	225	7.0	DRAFT	\N	Olemassa oleva puusto säilytettävä	\N	\N	\N	\N	\N	Olemassa oleva puusto tulee mahdollisuuksien mukaan säilyttää.	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	225
704	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0704	226	7.0	DRAFT	\N	Maisema säilytettävä avoimena	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	226
705	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0705	227	7.0	DRAFT	\N	Muu ulkoalueiden toteuttamiseen liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	227
8	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/08	228	\N	DRAFT	\N	Liikenne	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:50	2020-12-17 09:11:50	228
801	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0801	229	8.0	DRAFT	\N	Ajoneuvoliittymä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	229
802	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0802	230	8.0	DRAFT	\N	Ajoneuvoliittymän kielto	\N	\N	\N	\N	\N	Katualueen rajan osa, jonka kohdalta ei saa järjestää ajoneuvoliittymää	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	230
803	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0803	231	8.0	DRAFT	\N	Autopaikkojen määrä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	231
804	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0804	232	8.0	DRAFT	\N	Polkupyöräpysäköinnin määrä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	232
805	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0805	233	8.0	DRAFT	\N	Muu liikenteeseen liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	233
9	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/09	234	\N	DRAFT	\N	Ympäristöarvojen vaaliminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:50	2020-12-17 09:11:50	234
901	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0901	235	9.0	DRAFT	\N	Kulttuurihistoriallisesti arvokas alue tai kohde	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	235
90101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090101	236	901.0	DRAFT	\N	Suojeltava alue tai alueen osa	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	236
90102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090102	237	901.0	DRAFT	\N	Suojeltava rakennus	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	237
90103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090103	238	901.0	DRAFT	\N	Suojeltava rakennelma	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	238
90104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090104	239	901.0	DRAFT	\N	Kiinteä suojeltava kohde	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	239
90105	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090105	240	901.0	DRAFT	\N	Kiinteä muinaisjäännös	\N	\N	\N	\N	\N	Alue tai alueen osa, jolla sijaitsee muinaismuistolailla rauhoitettu kiinteä muinaisjäännös	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	240
902	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0902	241	9.0	DRAFT	\N	Luontoarvoiltaan arvokas alue tai kohde	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 17:42:13	241
90201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090201	242	902.0	DRAFT	\N	Suojeltu puu	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	242
90202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090202	243	902.0	DRAFT	\N	Säilytettävä puu	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	243
90203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090203	244	902.0	DRAFT	\N	Suojeltava vesistö tai vesialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	244
90204	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090204	245	902.0	DRAFT	\N	Luonnon monimuotoisuuden kannalta tärkeä alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	245
90205	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090205	246	902.0	DRAFT	\N	Ekologinen yhteys	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:11:50	2020-12-17 09:11:50	246
903	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0903	247	9.0	DRAFT	\N	Alue, jolla ympäristö säilytetään	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	247
904	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0904	248	9.0	DRAFT	\N	Alue, jolla on erityistä ulkoilun ohjaamistarvetta	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:50	2020-12-17 09:11:50	248
10	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/10	249	\N	DRAFT	\N	Tonttijako	\N	\N	\N	\N	\N	maa-alueen jakautuminen asemakaavassa osoitetuiksi yksiköiksi, joista on muodostettu tai joista on tarkoitus muodostaa tontteja soveltuvalla kiinteistönmuodostustoimituksella	\N	\N	\N	1	2020-12-17 09:11:51	2020-12-17 09:11:51	249
1001	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1001	250	10.0	DRAFT	\N	Sitova tonttijako laadittava	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	250
1002	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1002	251	10.0	DRAFT	\N	Esitontti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	251
11	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/11	252	\N	DRAFT	\N	Yleismääräykset	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:51	2020-12-17 09:11:51	252
1101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1101	253	11.0	DRAFT	\N	Yleismääräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	253
1102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1102	254	11.0	DRAFT	\N	Ajanmukaisuuden arvioinnin aikaraja	\N	\N	\N	\N	\N	Asemakaavan ajanmukaisuuden arviointi on tehtävä kaavamääräyksen numeerisen arvon osoittaman vuoden kuluttua kaavan voimaantulosta.	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	254
1103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1103	255	11.0	DRAFT	\N	Aluetta koskee sitovat rakentamistapaohjeet	\N	\N	\N	\N	\N	Aluetta koskee sitovat rakennustapaohjeet	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	255
1104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1104	256	11.0	DRAFT	\N	Aluetta koskee rakentamistapaohjeet	\N	\N	\N	\N	\N	Alueelle on laadittu rakentamistapaohjeet	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	256
12	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/12	257	\N	DRAFT	\N	Yhdyskuntatekninen huolto	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:51	2020-12-17 09:11:51	257
1201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1201	258	12.0	DRAFT	\N	Alin painovoimainen viemäröintitaso	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	258
1202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1202	259	12.0	DRAFT	\N	Aurinkokennojen alin sijoittumistaso	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	259
1203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1203	260	12.0	DRAFT	\N	Vaatimus hulevesisuunnitelman laatimisesta	\N	\N	\N	\N	\N	Alueelle tulee laatia hulevesisuunnitelma.	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	260
1204	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1204	261	12.0	DRAFT	\N	Liitettävä kaukolämpöverkkoon	\N	\N	\N	\N	\N	Alue on liitettävä kaukolämpöverkkoon.	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	261
1205	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1205	262	12.0	DRAFT	\N	Hulevesien imeyttämisen periaate tai vaatimus	\N	\N	\N	\N	\N	Hulevesien imeyttämisvaatimus	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	262
1206	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1206	263	12.0	DRAFT	\N	Muu yhdyskuntatekniseen huoltoon liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	263
13	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/13	264	\N	DRAFT	\N	Ympäristön ja terveyden suojelu	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:51	2020-12-17 09:11:51	264
1301	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1301	265	13.0	DRAFT	\N	Pilaantunut maa-alue	\N	\N	\N	\N	\N	Alue, jolla on maaperän haitta-aineita	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	265
1302	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1302	266	13.0	DRAFT	\N	Meluaita	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	266
1303	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1303	267	13.0	DRAFT	\N	Meluvalli	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	267
1304	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1304	268	13.0	DRAFT	\N	Melualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	268
1305	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1305	269	13.0	DRAFT	\N	Radonhaitta huomioitava	\N	\N	\N	\N	\N	Rakentamisessa on huomioitava mahdollinen radonhaitta.	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	269
1306	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1306	270	13.0	DRAFT	\N	Muu ympäristönsuojeluun liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	270
14	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/14	271	\N	DRAFT	\N	Nimistö	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:11:51	2020-12-17 09:11:51	271
1401	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1401	272	14.0	DRAFT	\N	Kadun tai tien nimi	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	272
1402	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1402	273	14.0	DRAFT	\N	Torin tai katuaukion nimi	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	273
1403	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1403	274	14.0	DRAFT	\N	Puiston tai muun yleisen alueen nimi	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	274
1404	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1404	275	14.0	DRAFT	\N	Kaupungin- tai kunnanosan nimi	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	275
1405	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1405	276	14.0	DRAFT	\N	Korttelinumero	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	276
1406	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1406	277	14.0	DRAFT	\N	Muu nimistö	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:11:51	2020-12-17 09:11:51	277
\.


--
-- Data for Name: kaavamaarays_laji_yk; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.kaavamaarays_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/01	1	\N	DRAFT	\N	Alueen käyttötarkoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:10	2020-12-17 09:18:10	1
101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0101	2	1.0	DRAFT	\N	Asuminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:10	2020-12-17 09:18:10	2
10101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010101	3	101.0	DRAFT	\N	Asuinkerrostaloalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	3
10102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010102	4	101.0	DRAFT	\N	Asuinpientaloalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	4
10103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010103	5	101.0	DRAFT	\N	Rivitalojen ja muiden kytkettyjen asuinrakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	5
10104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010104	6	101.0	DRAFT	\N	Erillispientaloalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	6
10105	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010105	7	101.0	DRAFT	\N	Asumista palveleva yhteiskäyttöinen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	7
10106	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010106	8	101.0	DRAFT	\N	Maatilan talouskeskuksen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	8
10107	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010107	9	101.0	DRAFT	\N	Kyläalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	9
10108	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010108	10	101.0	DRAFT	\N	Erityisryhmien palveluasuminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	10
10109	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010109	11	101.0	DRAFT	\N	Muu asuminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	11
102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0102	12	1.0	DRAFT	\N	Keskustatoiminnot	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:10	2020-12-17 09:18:10	12
10201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010201	13	102.0	DRAFT	\N	Keskustatoimintojen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	13
10202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010202	14	102.0	DRAFT	\N	Keskustatoimintojen alakeskus	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	14
10203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010203	15	102.0	DRAFT	\N	Muut keskustatoiminnot	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	15
103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0103	16	1.0	DRAFT	\N	Elinkeinot, työ ja tuotanto	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:10	2020-12-17 09:18:10	16
10301	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010301	17	103.0	DRAFT	\N	Liikerakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	17
10302	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010302	18	103.0	DRAFT	\N	Toimistorakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	18
10303	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010303	19	103.0	DRAFT	\N	Toimitilarakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	19
10304	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010304	20	103.0	DRAFT	\N	Kaupallisten palveluiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	20
10305	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010305	21	103.0	DRAFT	\N	Vähittäiskaupan suuryksikkö	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	21
10306	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010306	22	103.0	DRAFT	\N	Vähittäiskaupan myymäläkeskittymä	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	22
10307	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010307	23	103.0	DRAFT	\N	Työpaikka-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	23
10308	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010308	24	103.0	DRAFT	\N	Teollisuusalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	24
10309	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010309	25	103.0	DRAFT	\N	Varastorakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	25
10310	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010310	26	103.0	DRAFT	\N	Alue, jolle saa sijoittaa merkittävän, vaarallisia kemikaaleja valmistavan tai varastoivan laitoksen	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	26
10311	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010311	27	103.0	DRAFT	\N	Ympäristövaikutuksiltaan merkittävien teollisuustoimintojen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	27
10312	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010312	28	103.0	DRAFT	\N	Kiertotalous	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	28
10313	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010313	29	103.0	DRAFT	\N	Ympäristöhäiriötä aiheuttava tuotantotoiminta	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	29
10314	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010314	30	103.0	DRAFT	\N	Muu elinkeinotoiminta	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	30
104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0104	31	1.0	DRAFT	\N	Palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:10	2020-12-17 09:18:10	31
10401	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010401	32	104.0	DRAFT	\N	Palvelurakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	32
10402	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010402	33	104.0	DRAFT	\N	Lähipalveluiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	33
10403	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010403	34	104.0	DRAFT	\N	Huvi- ja viihdepalveluiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	34
10404	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010404	35	104.0	DRAFT	\N	Julkiset palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	35
10405	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010405	36	104.0	DRAFT	\N	Yleisten rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	36
10406	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010406	37	104.0	DRAFT	\N	Julkisten lähipalveluiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	37
10407	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010407	38	104.0	DRAFT	\N	Hallinto- ja virastorakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	38
10408	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010408	39	104.0	DRAFT	\N	Opetustoimintaa palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	39
10409	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010409	40	104.0	DRAFT	\N	Sosiaalitointa ja terveydenhuoltoa palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	40
10410	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010410	41	104.0	DRAFT	\N	Kulttuuritoimintaa palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	41
10411	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010411	42	104.0	DRAFT	\N	Museorakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	42
10412	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010412	43	104.0	DRAFT	\N	Kirkkojen ja muiden seurakunnallisten rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	43
10413	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010413	44	104.0	DRAFT	\N	Urheilutoimintaa palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	44
10414	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010414	45	104.0	DRAFT	\N	Julkisten palveluiden ja hallinnon alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	45
10415	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010415	46	104.0	DRAFT	\N	Muut palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	46
105	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0105	47	1.0	DRAFT	\N	Virkistys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:10	2020-12-17 09:18:10	47
10501	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010501	48	105.0	DRAFT	\N	Virkistysalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	48
10502	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010502	49	105.0	DRAFT	\N	Puisto	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	49
10503	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010503	50	105.0	DRAFT	\N	Lähivirkistysalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	50
10504	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010504	51	105.0	DRAFT	\N	Leikkipuisto	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	51
10505	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010505	52	105.0	DRAFT	\N	Urheilupalvelujen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	52
10506	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010506	53	105.0	DRAFT	\N	Retkeily- ja ulkoilualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	53
10507	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010507	54	105.0	DRAFT	\N	Uimaranta-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	54
10508	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010508	55	105.0	DRAFT	\N	Lähimetsä	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	55
10509	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010509	56	105.0	DRAFT	\N	Muu virkistysalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	56
106	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0106	57	1.0	DRAFT	\N	Loma-asuminen ja matkailu	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:10	2020-12-17 09:18:10	57
10601	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010601	58	106.0	DRAFT	\N	Loma-asuntojen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	58
10602	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010602	59	106.0	DRAFT	\N	Matkailua palvelevien rakennusten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	59
10603	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010603	60	106.0	DRAFT	\N	Leirintäalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	60
10604	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010604	61	106.0	DRAFT	\N	Asuntovaunualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	61
10605	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010605	62	106.0	DRAFT	\N	Siirtolapuutarha-/palstaviljelyalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	62
10606	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010606	63	106.0	DRAFT	\N	Muu loma-asumisen tai matkailun alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	63
107	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0107	64	1.0	DRAFT	\N	Liikenne	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:10	2020-12-17 09:18:10	64
10701	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010701	65	107.0	DRAFT	\N	Liikennealue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	65
10702	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010702	66	107.0	DRAFT	\N	Yleisen tien alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	66
10703	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010703	67	107.0	DRAFT	\N	Rautatieliikenteen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	67
10704	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010704	68	107.0	DRAFT	\N	Lentoliikenteen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	68
10705	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010705	69	107.0	DRAFT	\N	Satama-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	69
10706	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010706	70	107.0	DRAFT	\N	Kanava-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	70
10707	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010707	71	107.0	DRAFT	\N	Venesatama/venevalkama	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	71
10708	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010708	72	107.0	DRAFT	\N	Yleinen pysäköintialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	72
10709	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010709	73	107.0	DRAFT	\N	Huoltoasema-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	73
10710	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010710	74	107.0	DRAFT	\N	Henkilöliikenteen terminaalialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	74
10711	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010711	75	107.0	DRAFT	\N	Tavaraliikenteen terminaalialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	75
10712	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010712	76	107.0	DRAFT	\N	Yleisten pysäköintilaitosten alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	76
10713	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010713	77	107.0	DRAFT	\N	Autopaikkojen alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	77
10714	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010714	78	107.0	DRAFT	\N	Katualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	78
10715	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010715	79	107.0	DRAFT	\N	Muu liikennealue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	79
108	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0108	80	1.0	DRAFT	\N	Erityisalueet	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:10	2020-12-17 09:18:10	80
10801	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010801	81	108.0	DRAFT	\N	Erityisalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	81
10802	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010802	82	108.0	DRAFT	\N	Yhdyskuntateknisen huollon alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	82
10803	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010803	83	108.0	DRAFT	\N	Energiahuollon alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	83
10804	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010804	84	108.0	DRAFT	\N	Jätteenkäsittelyalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	84
10805	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010805	85	108.0	DRAFT	\N	Maa-ainesten ottoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	85
10806	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010806	86	108.0	DRAFT	\N	Kaivosalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	86
10807	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010807	87	108.0	DRAFT	\N	Mastoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	87
10808	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010808	88	108.0	DRAFT	\N	Ampumarata-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	88
10809	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010809	89	108.0	DRAFT	\N	Puolustusvoimien alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	89
10810	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010810	90	108.0	DRAFT	\N	Hautausmaa-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	90
10811	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010811	91	108.0	DRAFT	\N	Suojaviheralue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	91
10812	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010812	92	108.0	DRAFT	\N	Tuulivoimaloiden alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	92
10813	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010813	93	108.0	DRAFT	\N	Moottorirata	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	93
10814	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010814	94	108.0	DRAFT	\N	Maa-ainesten vastaanotto- tai läjitysalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	94
10815	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010815	95	108.0	DRAFT	\N	Vankila-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:10	2020-12-17 09:18:10	95
10816	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010816	96	108.0	DRAFT	\N	Muu erityisalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	96
109	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0109	97	1.0	DRAFT	\N	Suojelu	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	97
10901	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010901	98	109.0	DRAFT	\N	Suojelualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	98
10902	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010902	99	109.0	DRAFT	\N	Luonnonsuojelualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	99
10903	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010903	100	109.0	DRAFT	\N	Muinaismuistoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	100
10904	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010904	101	109.0	DRAFT	\N	Rakennuslainsäädännön nojalla suojeltava alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	101
10905	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010905	102	109.0	DRAFT	\N	Rakennussuojelulakien nojalla suojeltu alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	102
10906	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010906	103	109.0	DRAFT	\N	Muu suojelualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	103
110	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0110	104	1.0	DRAFT	\N	Maa- ja metsätalous	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	104
11001	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011001	105	110.0	DRAFT	\N	Maa- ja metsätalousalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	105
11002	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011002	106	110.0	DRAFT	\N	Maatalousalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	106
11003	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011003	107	110.0	DRAFT	\N	Kotieläintalouden suuryksikön alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	107
11004	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011004	108	110.0	DRAFT	\N	Puutarha- ja kasvihuonealue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	108
11005	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011005	109	110.0	DRAFT	\N	Maisemallisesti arvokas peltoalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	109
11006	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011006	110	110.0	DRAFT	\N	Poronhoitovaltainen maa- ja metsätalousalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	110
11007	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011007	111	110.0	DRAFT	\N	Muu maa- ja metsätalousalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	111
111	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0111	112	1.0	DRAFT	\N	Vesialueet	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	112
11101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011101	113	111.0	DRAFT	\N	Vesialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	113
11102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011102	114	111.0	DRAFT	\N	Muu vesialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	114
2	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/02	115	\N	DRAFT	\N	Rakentaminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:11	2020-12-17 09:18:11	115
201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0201	116	2.0	DRAFT	\N	Rakennusala	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	116
202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0202	117	2.0	DRAFT	\N	Rakennuspaikka	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	117
203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0203	118	2.0	DRAFT	\N	Asunnon rakennuspaikka	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	118
204	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0204	119	2.0	DRAFT	\N	Loma-asunnon rakennuspaikka	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	119
205	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0205	120	2.0	DRAFT	\N	Saunan rakennuspaikka	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	120
206	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0206	121	2.0	DRAFT	\N	Maatalouden talouskeskuksen rakennuspaikka	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	121
207	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0207	122	2.0	DRAFT	\N	Sallittu kokonaiskerrosala	\N	\N	kokonaiskerrosalan suhde korttelin pinta-alaan	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	122
208	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0208	123	2.0	DRAFT	\N	Aluetehokkuus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	123
209	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0209	124	2.0	DRAFT	\N	Korttelitehokkuus	\N	\N	kokonaiskerrosalan suhde tontin/rakennuspaikan pinta-alaan	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	124
210	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0210	125	2.0	DRAFT	\N	Tonttitehokkuus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	125
211	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0211	126	2.0	DRAFT	\N	Sallittujen rakennuspaikkojen lukumäärä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	126
212	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0212	127	2.0	DRAFT	\N	Rakennuspaikan vähimmäiskoko	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	127
213	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0213	128	2.0	DRAFT	\N	Sallittu tuulivoimaloiden määrä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	128
214	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0214	129	2.0	DRAFT	\N	Vähittäiskaupan suuryksikön sallittu kerrosala	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	129
215	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0215	130	2.0	DRAFT	\N	Vähittäiskaupan myymäläkeskittymän sallittu kerrosala	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	130
3	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/03	131	\N	DRAFT	\N	Liikenne	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:11	2020-12-17 09:18:11	131
301	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0301	132	3.0	DRAFT	\N	Alueverkon pyöräilyreitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	132
302	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0302	133	3.0	DRAFT	\N	Eritasoliittymä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	133
303	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0303	134	3.0	DRAFT	\N	Eritasoristeys ilman liittymää	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	134
304	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0304	135	3.0	DRAFT	\N	Joukkoliikenteen runkoyhteys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	135
305	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0305	136	3.0	DRAFT	\N	Kaksiajoratainen päätie/-katu	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	136
306	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0306	137	3.0	DRAFT	\N	Kevyen liikenteen reitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	137
307	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0307	138	3.0	DRAFT	\N	Laivaväylä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	138
308	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0308	139	3.0	DRAFT	\N	Liikennetunneli	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	139
309	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0309	140	3.0	DRAFT	\N	Liittymä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	140
310	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0310	141	3.0	DRAFT	\N	Linja-autoasema/julkisen liikenteen vaihtopaikka/matkakeskus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	141
311	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0311	142	3.0	DRAFT	\N	Metroasema	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	142
312	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0312	143	3.0	DRAFT	\N	Metrolinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	143
313	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0313	144	3.0	DRAFT	\N	Moottori- tai moottoriliikennetie	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	144
314	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0314	145	3.0	DRAFT	\N	Moottorikelkkailureitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	145
315	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0315	146	3.0	DRAFT	\N	Pysäkki/seisake	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	146
316	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0316	147	3.0	DRAFT	\N	Pyöräilyn pää-/runkoreitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	147
317	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0317	148	3.0	DRAFT	\N	Päärata	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	148
318	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0318	149	3.0	DRAFT	\N	Raitiotie/Pikaraitiotie	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	149
319	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0319	150	3.0	DRAFT	\N	Ratsastusreitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	150
320	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0320	151	3.0	DRAFT	\N	Rautatieasema	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	151
321	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0321	152	3.0	DRAFT	\N	Seututie/pääkatu	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	152
322	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0322	153	3.0	DRAFT	\N	Seutuverkon pyöräilyreitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	153
323	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0323	154	3.0	DRAFT	\N	Suuntaisliittymä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	154
324	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0324	155	3.0	DRAFT	\N	Ulkoilu- tai virkistysreitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	155
325	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0325	156	3.0	DRAFT	\N	Valtatie/kantatie	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	156
326	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0326	157	3.0	DRAFT	\N	Varattu joukkoliikenteelle	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	157
327	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0327	158	3.0	DRAFT	\N	Varikko	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	158
328	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0328	159	3.0	DRAFT	\N	Venesatama/venevalkama	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	159
329	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0329	160	3.0	DRAFT	\N	Veneväylä	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	160
330	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0330	161	3.0	DRAFT	\N	Yhdysrata/sivurata/kaupunkirata	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	161
331	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0331	162	3.0	DRAFT	\N	Yhdystie/kokoojakatu	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	162
334	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0334	163	3.0	DRAFT	\N	Liityntäpysäköinti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	163
335	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0335	164	3.0	DRAFT	\N	Muu liikenteeseen liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	164
4	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/04	165	\N	DRAFT	\N	Kehittämisperiaatteet	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:11	2020-12-17 09:18:11	165
401	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0401	166	4.0	DRAFT	\N	Yhdyskuntarakenteen laajenemissuunta	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	166
402	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0402	167	4.0	DRAFT	\N	Yhdyskuntarakenteen mahdollinen laajenemisalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	167
403	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0403	168	4.0	DRAFT	\N	Alueen eheyttämis- tai tiivistämistarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	168
404	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0404	169	4.0	DRAFT	\N	Ohjeellinen tai vaihtoehtoinen tielinjaus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	169
405	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0405	170	4.0	DRAFT	\N	Tieliikenteen yhteystarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	170
406	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0406	171	4.0	DRAFT	\N	Joukkoliikenteen kehittämiskäytävä tai yhteystarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	171
407	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0407	172	4.0	DRAFT	\N	Kevyen liikenteen yhteystarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	172
408	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0408	173	4.0	DRAFT	\N	Johdon, putken tai linjan yhteystarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	173
409	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0409	174	4.0	DRAFT	\N	Viheryhteystarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	174
410	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0410	175	4.0	DRAFT	\N	Virkistyksen yhteystarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	175
411	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0411	176	4.0	DRAFT	\N	Julkisen virkistyksen kehittämistarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	176
412	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0412	177	4.0	DRAFT	\N	Kävely-ympäristön kehittämistarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	177
413	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0413	178	4.0	DRAFT	\N	Kaupunkikuvallinen kehittämistarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	178
414	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0414	179	4.0	DRAFT	\N	Meluntorjuntatarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	179
415	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0415	180	4.0	DRAFT	\N	Ympäristö- tai maisemavaurion korjaustarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	180
416	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0416	181	4.0	DRAFT	\N	Terveyshaitan poistamistarve	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	181
418	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0418	182	4.0	DRAFT	\N	Uusi tai olennaisesti muuttuva alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	182
419	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0419	183	4.0	DRAFT	\N	Pienin toimenpitein kehitettävä alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	183
421	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0421	184	4.0	DRAFT	\N	Muu kehittämisperiaate	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	184
5	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/05	185	\N	DRAFT	\N	Rajoitukset	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:11	2020-12-17 09:18:11	185
501	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0501	186	5.0	DRAFT	\N	Rakentamisrajoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	186
502	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0502	187	5.0	DRAFT	\N	Määräaikainen rakentamisrajoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	187
503	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0503	188	5.0	DRAFT	\N	Toimenpiderajoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	188
504	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0504	189	5.0	DRAFT	\N	Rakennuksen purkamisrajoitus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	189
6	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/06	190	\N	DRAFT	\N	Alueen osan erityisominaisuudet	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:11	2020-12-17 09:18:11	190
601	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0601	191	6.0	DRAFT	\N	Erityisharkinta-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	191
602	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0602	192	6.0	DRAFT	\N	Kehittämisalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	192
603	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0603	193	6.0	DRAFT	\N	Vaara-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	193
604	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0604	194	6.0	DRAFT	\N	Suojavyöhyke	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	194
605	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0605	195	6.0	DRAFT	\N	Suunnittelutarvealue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	195
606	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0606	196	6.0	DRAFT	\N	Reservialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	196
607	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0607	197	6.0	DRAFT	\N	Muu alueen osan erityisominaisuus	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	197
7	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/07	198	\N	DRAFT	\N	Ympäristöarvojen vaaliminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:11	2020-12-17 09:18:11	198
701	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0701	199	7.0	DRAFT	\N	Kulttuurihistoriallisesti arvokas alue tai kohde	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 09:18:11	199
70101	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070101	200	701.0	DRAFT	\N	Suojeltava alue tai alueen osa	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	200
70102	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070102	201	701.0	DRAFT	\N	Suojeltava rakennus	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	201
70103	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070103	202	701.0	DRAFT	\N	Suojeltava rakennelma	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	202
70104	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070104	203	701.0	DRAFT	\N	Kiinteä suojeltava kohde	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	203
70105	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070105	204	701.0	DRAFT	\N	Kiinteä muinaisjäännös	\N	\N	Alue tai alueen osa, jolla sijaitsee muinaismuistolailla rauhoitettu kiinteä muinaisjäännös	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	204
702	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0702	205	7.0	DRAFT	\N	Luontoarvoiltaan arvokas alue tai kohde	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:11	2020-12-17 17:43:33	205
70201	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070201	206	702.0	DRAFT	\N	Suojeltu puu	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	206
70202	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070202	207	702.0	DRAFT	\N	Säilytettävä puu	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	207
70203	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070203	208	702.0	DRAFT	\N	Suojeltava vesistö tai vesialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:11	2020-12-17 09:18:11	208
70204	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070204	209	702.0	DRAFT	\N	Luonnon monimuotoisuuden kannalta tärkeä alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:12	2020-12-17 09:18:12	209
70205	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070205	210	702.0	DRAFT	\N	Ekologinen yhteys	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2020-12-17 09:18:12	2020-12-17 09:18:12	210
703	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0703	211	7.0	DRAFT	\N	Alue, jolla ympäristö säilytetään	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	211
704	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0704	212	7.0	DRAFT	\N	Alue, jolla on erityistä ulkoilun ohjaamistarvetta	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	212
8	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/08	213	\N	DRAFT	\N	Yleismääräykset	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:12	2020-12-17 09:18:12	213
801	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0801	214	8.0	DRAFT	\N	Yleismääräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	214
802	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0802	215	8.0	DRAFT	\N	Yleiskaavan käyttö rakennusluvan myöntämisen perusteena	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	215
9	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/09	216	\N	DRAFT	\N	Yhdyskuntatekninen huolto	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:12	2020-12-17 09:18:12	216
901	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0901	217	9.0	DRAFT	\N	Johto, putki tai linja	\N	\N	Yhdyskuntatekniikkaa palveleva johto, putki tai linja, joka voi sijaita maan päällä tai alla. Tällaisia ovat esimerkiksi sähkölinjat, vesijohdot, maakaasun runkoputket ja jätevesiviemärit.	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	217
902	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0902	218	9.0	DRAFT	\N	Sähkölinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	218
903	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0903	219	9.0	DRAFT	\N	Kaasulinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	219
904	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0904	220	9.0	DRAFT	\N	Vesi- tai jätevesitunneli	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	220
905	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0905	221	9.0	DRAFT	\N	Vesijohto tai siirtoviemäri	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	221
906	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0906	222	9.0	DRAFT	\N	Kaukolämpölinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	222
907	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0907	223	9.0	DRAFT	\N	Kaukokylmälinja	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	223
908	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0908	224	9.0	DRAFT	\N	Hulevesien hallinta-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	224
909	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0909	225	9.0	DRAFT	\N	Hulevesien hallinnan kannalta merkittävä alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	225
910	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0910	226	9.0	DRAFT	\N	Hulevesien purkuoja/-reitti	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	226
911	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0911	227	9.0	DRAFT	\N	Hulevesien viivytysalue	\N	\N	Hulevesien käsittelytapaa ohjaava määräys	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	227
912	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0912	228	9.0	DRAFT	\N	Hulevesien käsittelytapa	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	228
913	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0913	229	9.0	DRAFT	\N	Pohjavedenottamo	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	229
914	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0914	230	9.0	DRAFT	\N	Pohjavedenottamon lähisuoja-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	230
915	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0915	231	9.0	DRAFT	\N	Muu yhdyskuntatekniseen huoltoon liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	231
10	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/10	232	\N	DRAFT	\N	Ympäristön ja terveyden suojelu	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:18:12	2020-12-17 09:18:12	232
1001	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1001	233	10.0	DRAFT	\N	Pilaantunut maa-alue	\N	\N	\N	\N	\N	Alue, jolla on maaperän haitta-aineita	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	233
1002	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1002	234	10.0	DRAFT	\N	Tulvavaara-alue	\N	\N	Alue, joka on tulvavaarassa	\N	\N	Tulvavaara voi liittyä meritulvaan tai hulevesien aiheuttamaan tulvimiseen	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	234
1003	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1003	235	10.0	DRAFT	\N	Meritulvavaara-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	235
1004	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1004	236	10.0	DRAFT	\N	Hulevesitulvavaara-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	236
1005	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1005	237	10.0	DRAFT	\N	Valuma-alue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	237
1006	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1006	238	4.0	DRAFT	\N	Virkistyskohde	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	238
1007	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1007	239	10.0	DRAFT	\N	Melualue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	239
1008	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1008	240	10.0	DRAFT	\N	Pohjavesialue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	240
1009	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1009	241	10.0	DRAFT	\N	Pohjaveden muodostumisalue	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	241
1010	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1010	242	10.0	DRAFT	\N	Arvokas harjualue tai muu geologinen muodostuma	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	242
1011	http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1011	243	10.0	DRAFT	\N	Muu ympäristönsuojeluun liittyvä määräys	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-17 09:18:12	2020-12-17 09:18:12	243
\.


--
-- Data for Name: kaavan_elinkaaritila; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.kaavan_elinkaaritila (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/01	1	\N	DRAFT	\N	Kaavoitusaloite	\N	\N	Kuntaan saapunut kaavoitusaloite	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	1
2	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/02	2	\N	DRAFT	\N	Vireilletullut	\N	\N	viranomainen on ottanut kaava-asian käsiteltäväksi	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/jhs/J336	1	2020-12-11 11:13:51	2020-12-11 11:13:51	2
3	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/03	3	\N	DRAFT	material used in preparation	Valmistelu	beredningsmaterial	\N	\N	\N	\N	kaavaprosessin vaihe, jossa laaditaan kaavan valmisteluaineisto. Valmisteluaineisto koostuu kaavaehdotuksen tai muun päätösehdotuksen laatimista varten laadituista ja kerätyistä aineistoista	\N	\N	http://uri.suomi.fi/terminology/mrl/concept-203	1	2020-12-11 11:13:51	2021-01-13 19:35:58	3
4	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/04	4	\N	DRAFT	plan proposal	Kaavaehdotus	planförslag	\N	julkisesti nähtäville asetettava ehdotus kaavaksi	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/mrl/concept-147	1	2020-12-11 11:13:51	2020-12-11 11:13:51	4
5	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/05	5	\N	DRAFT	\N	Tarkistettu kaavaehdotus	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	5
6	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/06	6	\N	DRAFT	\N	Hyväksytty kaava	\N	\N	Toimivaltainen viranomainen on hyväksynyt kaavaehdotuksen	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	6
7	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/07	7	\N	DRAFT	\N	Oikaisukehotuksen alainen	\N	\N	Kaavasta on jätetty oikaisukehotus	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	7
8	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/08	8	\N	DRAFT	\N	Valituksen alainen	\N	\N	Kaavasta on tehty valitus	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/luvat/c87	1	2020-12-11 11:13:51	2020-12-11 11:13:51	8
9	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/09	9	\N	DRAFT	\N	Osittain voimassa	\N	\N	Kaava on kuulutettu osittain voimaan.	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	9
10	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/10	10	\N	DRAFT	\N	Voimassa	\N	\N	Kaava on saanut lainvoiman	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	10
11	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/11	11	\N	DRAFT	\N	Kumottu	\N	\N	Kaava on kumottu	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	11
12	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/12	12	\N	DRAFT	\N	Kumoutunut	\N	\N	Kaava on kumoutunut kaavamuutoksen myötä	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	12
13	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/13	13	\N	DRAFT	\N	Rauennut	\N	\N	Kaava on rauennut kaavoitusprosessin keskeyttämisen myötä	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	13
14	http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/14	14	\N	DRAFT	\N	Hylätty	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 11:13:51	2020-12-11 11:13:51	14
\.


--
-- Data for Name: kaavan_kasittelytapahtuman_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.kaavan_kasittelytapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/01	1	\N	DRAFT	\N	Kaavan ajanmukaisuuden arviointi	\N	\N	\N	\N	\N	Kaavan ajanmukaisuus arvioidaan	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	1
2	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/02	2	\N	DRAFT	\N	Kaavoitusaloitteen hyväksyminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	2
3	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/03	3	\N	DRAFT	\N	Kaavoituksen käynnistäminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	3
4	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/04	4	\N	DRAFT	\N	Kaavan vireilletulo	\N	\N	\N	\N	\N	Kaava-asia kuulutetaan vireille	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	4
5	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/05	5	\N	DRAFT	\N	Kaavan valmisteluaineiston nähtäville asettaminen	\N	\N	\N	\N	\N	Kaavan valmisteluaineisto asetetaan nähtäville	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	5
6	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/06	6	\N	DRAFT	\N	Kaavaehdotuksen nähtäville asettaminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	6
7	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/07	7	\N	DRAFT	\N	Tarkistetun kaavaehdotuksen nähtäville asettaminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:29:53	2021-01-13 19:44:13	7
8	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/08	8	\N	DRAFT	\N	Kaavaprosessin keskeyttäminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	8
9	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/09	9	\N	DRAFT	\N	Kaavan hyväksyminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	9
10	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/10	10	\N	DRAFT	\N	Kaavan hyväksyminen oikaisukehotuksen johdosta	\N	\N	\N	\N	\N	Kaavasta annettu oikaisukehotus käsitellään	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	10
11	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/11	11	\N	DRAFT	\N	Kaavan kumoaminen	\N	\N	\N	\N	\N	Kaavoitusprosessin myötä muutettava tai kumottava kaava kumoutuu	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	11
12	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/12	12	\N	DRAFT	\N	Valituksen vastineiden hyväksyminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	12
13	http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/13	13	\N	DRAFT	\N	Kaavan voimaantulo	\N	\N	\N	\N	\N	Kaava saa lainvoiman voimaantulokuulutuksella	\N	\N	\N	1	2020-12-11 18:29:53	2020-12-11 18:29:53	13
\.


--
-- Data for Name: kaavan_vuorovaikutustapahtuman_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.kaavan_vuorovaikutustapahtuman_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/01	1	\N	DRAFT	\N	Nähtävilläolo	\N	\N	\N	\N	\N	kaavan virallinen nähtävilläoloon valmistelu- ja ehdotusvaiheissa	\N	\N	\N	1	2020-12-11 18:48:01	2020-12-11 18:48:01	1
2	http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/02	2	\N	DRAFT	\N	Vuorovaikutustilaisuus	\N	\N	Kaavaan liittyvä tilaisuus tai tapahtuma, jossa toimijoiden on mahdollisuus tuoda esiin suunnitteluun liittyviä näkemyksiään	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:48:01	2020-12-11 18:48:01	2
3	http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/03	3	\N	DRAFT	\N	Tiedonkeruu	\N	\N	Kaavaan liittyvä kartoitus, jossa kerätään esimerkiksi kyselyn tai muun soveltuvan menetelmän avulla toimijoiden näkökulmia suunnitteluun	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:48:01	2020-12-11 18:48:01	3
4	http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/04	4	\N	DRAFT	\N	Neuvottelu	\N	\N	Kokous tai muu neuvottelutilaisuus, jossa keskustellaan kaavaan liittyvistä kysymyksistä	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:48:01	2020-12-11 18:48:01	4
5	http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/05	5	\N	DRAFT	\N	Sähköinen osallistuminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 18:48:01	2020-12-11 18:48:01	5
6	http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/06	6	\N	DRAFT	\N	Muutoksenhaku	\N	\N	toimenpide, jolla tuomioistuimelta tai muulta muutoksenhakuviranomaiselta pyritään saamaan muutos hallintoviranomaisen tai tuomioistuimen ratkaisuun	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/jhs/J180	1	2020-12-11 18:48:01	2021-01-13 19:52:12	6
7	http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/07	7	\N	DRAFT	\N	Muu vuorovaikutustapahtuma	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2021-01-13 19:52:41	2021-01-13 19:52:41	7
\.


--
-- Data for Name: kaavoitusteema_ak; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.kaavoitusteema_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/01	1	\N	DRAFT	permitted building volume	Rakennusoikeus	byggrätt	\N	Oikeus rakentaa määritellylle alueelle	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/mrl/concept-162	1	2020-12-11 19:21:16	2020-12-11 19:21:16	1
2	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/02	2	\N	DRAFT	\N	Asuminen	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	2
3	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/03	3	\N	DRAFT	\N	Palvelut	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	3
4	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/04	4	\N	DRAFT	\N	Elinkeinot	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	4
5	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/05	5	\N	DRAFT	\N	Viheralueet ja virkistys	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	5
6	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/06	6	\N	DRAFT	\N	Kadut	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	6
7	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/07	7	\N	DRAFT	\N	Kunnallistekniikka	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	7
8	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/08	8	\N	DRAFT	\N	Liikenneverkko	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	8
9	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/09	9	\N	DRAFT	\N	Kulttuuriympäristöt	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	9
10	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/10	10	\N	DRAFT	\N	Suojelu	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	10
11	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/11	11	\N	DRAFT	\N	Muu kaavoitusteema	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 19:21:16	2020-12-11 19:21:16	11
\.


--
-- Data for Name: kaavoitusteema_yk; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.kaavoitusteema_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_YK/code/01	1	\N	DRAFT	community structure	Yhdyskuntarakenne	samhällsstruktur	\N	kaupunkiseudun, kunnan tai kunnan osan keskeisten toimintojen sijoittuminen ja keskinäiset suhteet	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/mrl/concept-176	1	2020-12-11 19:11:55	2020-12-11 19:11:55	1
\.


--
-- Data for Name: koodilista_abstrakti; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.koodilista_abstrakti (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) FROM stdin;
\.


--
-- Data for Name: lahtoaineiston_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.lahtoaineiston_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/01	1	\N	DRAFT	\N	Aluerajat	\N	\N	\N	\N	\N	Hallinnolliset rajat - kunnat, maakunnat, AVI, valtio, Hallinnolliset rajat (kuntapohjaiset tilastointialueet) - kunnat, seutukunnat, maakunnat, vaalipiirit, suuralueet, AVI, ELY, Aluevesien rajat, Rajavyöhyke, kuvaukseen paliskunnat, saamelaisten kotiseutualue, koltta-alue	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 17:43:09	1
2	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/02	2	\N	DRAFT	\N	Energia	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	2
3	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/03	3	\N	DRAFT	\N	Ihmisten elinolot ja elinympäristö	\N	\N	\N	\N	\N	Työpaikat, alueen sosiaalista luonnetta ja ympäristöterveyttä kartoittavat selvitykset, kokemustieto	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	3
4	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/04	4	\N	DRAFT	\N	Ilma ja ilmasto	\N	\N	\N	\N	\N	Tuulisuutta ja pienilmastoa koskevat selvitykset, ilmastonmuutoksen resilienssi jne.	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	4
5	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/05	5	\N	DRAFT	\N	Kaupunkikuva ja maisema	\N	\N	\N	\N	\N	esim. kaupunkikuvallinen tai maisemarakenneselvitys	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	5
6	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/06	6	\N	DRAFT	\N	Kulttuuriympäristö	\N	\N	\N	\N	\N	Kulttuurimaisemaa, muinaismuistoja ja rakennettua kulttuuriympäristöä koskevat selvitykset, kuten Valtakunnallisesti merkittävät arkeologiset kohteet (VARK), kiinteät muinaisjäännökset ja niiden suoja-alueet, arkeologiset kohteet sekä muu kulttuuriympäristö Metsähallituksen hallinoimilla alueilla, valtakunnallisesti merkittävät rakennetut kulttuuriympäristöt, maailmanperintökohteet, museotiet ja -sillat, rakennussuojelu, erityislaeilla suojellut rakennukset, valtakunnallisesti arvokkaat maisema-alueet, kansalliset kaupunkipuistot, historiallisen ajan kylätontit, perinnemaisemat ja -biotoopit	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	6
7	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/07	7	\N	DRAFT	\N	Liikenne	\N	\N	\N	\N	\N	Liikennejärjestelmän ja katuverkon toimivuusselvitykset, eri kulkumuotoja ja näiden jakaumaa koskevat selvitykset	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	7
8	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/08	8	\N	DRAFT	\N	Luonto ja luonnonvarat	\N	\N	\N	\N	\N	Kasvi- ja eläinlajit, luonnon monimuotoisuus ja luonnonvarat. Luontoselvitykset: kasvillisuus, eläimistö, Natura 2000 -tarkastelut jne. Luonnontilaisten alueiden verkosto, koko, määrä, laatu ja yhtenäisyys, perinnebiotoopit. Luonnonvarat: käytön määrä ja kestävyys: kierrätys- ja uudelleen- käyttömahdollisuudet, jne	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	8
9	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/09	9	\N	DRAFT	\N	Palveluverkko	\N	\N	\N	\N	\N	Julkiset palvelut (etenkin kasvatus/sivistys, sote, kulttuuri- ja vapaa-aika), Kaupalliset palvelut (etenkin vähittäiskauppa)	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 17:44:45	9
10	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/10	10	\N	DRAFT	\N	Maa- ja kallioperä, maanpeite	\N	\N	\N	\N	\N	Maaperä- ja rakennettavuusselvitykset, maankamaran mekaaninen muuttaminen	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	10
11	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/11	11	\N	DRAFT	\N	Pohjakartta	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	11
12	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/12	12	\N	DRAFT	building	Rakennukset ja rakenteet	byggnad	\N	\N	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/rakymp/c6	1	2020-12-11 15:39:18	2020-12-11 15:39:18	12
13	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/13	13	\N	DRAFT	\N	Suunnitelmat	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	13
1301	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/1301	14	13	DRAFT	area use plan	Alueidenkäytön suunnitelmat	områdesanvändningsplan	\N	kunnan tai maakunnan liiton tekemä suunnitelma alueiden käytöstä	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/mrl/concept-204	2	2020-12-11 15:39:18	2020-12-11 15:39:18	14
1302	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/1302	15	13	DRAFT	\N	Muut suunnitelmat	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	2020-12-11 15:39:18	2020-12-11 15:39:18	15
14	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/14	16	\N	DRAFT	\N	Työpaikat ja elinkeinoelämä	\N	\N	\N	\N	\N	Elinkeinot ja elinkeinorakenne	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 17:45:40	16
15	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/15	17	\N	DRAFT	\N	Vesi- ja jätehuolto	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	17
16	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/16	18	\N	DRAFT	\N	Vesien hoito ja suojelu	\N	\N	\N	\N	\N	Hulevesi- ja tulvaselvitykset	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	18
17	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/17	19	\N	DRAFT	\N	Viestintäverkko	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	19
18	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/18	20	\N	DRAFT	\N	Virkistys ja viherrakenne	\N	\N	\N	\N	\N	Virkistyspalveluihin ja viherrakenteeseen liittyvät selvitykset	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 17:47:24	20
19	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/19	21	\N	DRAFT	\N	Väestö	\N	\N	\N	\N	\N	Väestörekisteri ja väestötilastot	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	21
20	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/20	22	\N	DRAFT	community structure	Yhdyskuntarakenne	samhällsstruktur	\N	\N	\N	\N	Rakennukset ja rakennelmat (MML, kunnat) Kiinteistötiedot (KTJ), Yhdyskuntarakenteen seurantajärjestelmä YKR, Taajama-alueet, Keskusta-alueet ja kaupan alueet	\N	\N	http://uri.suomi.fi/terminology/mrl/concept-176	1	2020-12-11 15:39:18	2020-12-11 17:44:27	22
21	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/21	23	\N	DRAFT	\N	Yhdyskuntatalous	\N	\N	\N	\N	\N	Yhdyskuntatalous, esimerkiksi rakennusten ja infrastruktuurin rakentamisesta, käytöstä ja kunnossapidosta, maan hankinnasta ja myynnistä sekä palvelujen toteuttamisesta ja ylläpidosta aiheutuvat kustannukset ja tulot	\N	\N	\N	1	2020-12-11 15:39:18	2020-12-11 15:39:18	23
22	http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/22	24	\N	DRAFT	\N	Muu lähtötietoaineisto	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 17:48:08	2020-12-11 17:48:08	24
\.


--
-- Data for Name: lisatiedon_laji_ak; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.lisatiedon_laji_ak (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/01	1	\N	DRAFT	\N	Käyttötarkoituksen osuus kerrosalasta	\N	\N	\N	\N	\N	Kuvaa yhden käyttötarkoituksen osuuden yhden tai usemman rakennuksen sallitusta kerrosalasta	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-11 15:10:24	1
2	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/02	2	\N	DRAFT	\N	Käyttötarkoituskohdistus	\N	\N	kohdistaa liittyvän kaavamääryksen koskemaan ainoastaan lisätiedon arvona annettuja käyttötarkoituksia	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-11 15:10:24	2
3	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/03	3	\N	DRAFT	\N	Kohteen geometrian osa	\N	\N	liitetty arvo ilmaisee sen osan liittyvän kohteen geometriasta, jota kaavamääräys koskee.	\N	\N	Esim. se osa korttelin tai tontin rajaviivaa, johon rakennukset on rakennettava kiinni, tai osa yhtenä paikkatietokohteena määritellyn liikenneväylän viivaa.	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-11 15:10:24	3
4	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/04	4	\N	DRAFT	\N	Poisluettava käyttötarkoitus	\N	\N	\N	\N	\N	Annetut käyttötarkoitukset suljetaan pois kaavamääräyksen kuvaamista sallituista käyttötarkoituksista. Käytetään, mikäli on luontevampaa sulkea tiettyjä yksityiskohtaisia käyttötarkoituksia pois sallittujen joukosta kuin kuvata kaikki sallitut käyttötarkoitukset.	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-11 15:10:24	4
5	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/05	5	\N	DRAFT	\N	Kulttuurihistoriallinen merkittävyys	kulturhistorisk betydelse	\N	kohteesta muodostettu käsitys, joka perustuu kohteen kulttuurihistoriallisten arvojen ja kulttuuristen merkitysten analysointiin sekä sen suhteuttamiseen muihin vastaaviin kohteisiin	\N	\N	Kulttuurihistoriallinen merkittävyys voi olla kansainvälinen, valtakunnallinen, maakunnallinen, paikallinen tai vähäinen.	\N	\N	http://uri.suomi.fi/terminology/rakkultymp/c15	1	2020-12-11 15:10:24	2020-12-11 15:10:24	5
6	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/06	6	\N	DRAFT	\N	Kulttuurihistoriallinen arvotyyppi	\N	\N	Kohteelle määritetyt kulttuurihistorialliset ominaisuudet	\N	\N	Kulttuurihistoriallisia ominaisuuksia ovat esimerkiksi rakennustaiteellinen, rakennustekninen, arkkitehtoninen ja maisemallinen.	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-11 15:10:24	6
7	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/07	7	\N	DRAFT	\N	Kulttuurihistoriallinen tyyppi	\N	\N	Kuvaa kohteen kulttuurihistoriallista käyttötarkoitusta	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-11 15:10:24	7
8	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/08	8	\N	DRAFT	\N	Kulttuurihistoriallisen merkittävyyden kriteerit	\N	\N	Kuvaa kulttuurihistoriallisen merkittävyyden kriteerejä, joita kohde edustaa.	\N	\N	Merkittävyys voi liittyä edustavuuteen, alkuperäisyyteen, harvinaisuuteen, tyypillisyyteen tai historialliseen merkittävyyteen.	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-11 15:10:24	8
9	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/09	9	\N	DRAFT	\N	Ympäristöarvon peruste	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-11 15:10:24	9
10	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/10	10	\N	DRAFT	\N	Ympäristö- tai luontoarvon merkittävyys	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:10:24	2020-12-17 09:20:33	10
11	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/11	11	\N	DRAFT	\N	Muu lisätiedon laji	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:20:54	2020-12-17 09:20:54	11
12	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/12	12	\N	DRAFT	\N	Lukumäärä per kerrosneliömetri	\N	\N	\N	\N	\N	Kuvaa suureen arvon kutakin rakennuksen kerrosneliömetriä kohden.	\N	\N	\N	1	2020-12-29 11:12:46	2020-12-29 11:12:46	12
13	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/13	13	\N	DRAFT	\N	Lukumäärä per asunto	\N	\N	\N	\N	\N	Kuvaa suureen arvon kutakin rakennuksen asuntoa kohden.	\N	\N	\N	1	2020-12-29 11:13:29	2020-12-29 11:13:29	13
\.


--
-- Data for Name: lisatiedon_laji_yk; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.lisatiedon_laji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/01	1	\N	DRAFT	\N	Käyttötarkoituksen osuus kerrosalasta	\N	\N	\N	\N	\N	Kuvaa yhden käyttötarkoituksen osuuden yhden tai usemman rakennuksen sallitusta kerrosalasta	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-11 15:13:35	1
2	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/02	2	\N	DRAFT	\N	Käyttötarkoituskohdistus	\N	\N	kohdistaa liittyvän kaavamääryksen koskemaan ainoastaan lisätiedon arvona annettuja käyttötarkoituksia	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-11 15:13:35	2
3	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/03	3	\N	DRAFT	\N	Kohteen geometrian osa	\N	\N	liitetty arvo ilmaisee sen osan liittyvän kohteen geometriasta, jota kaavamääräys koskee.	\N	\N	Esim. se osa korttelin tai tontin rajaviivaa, johon rakennukset on rakennettava kiinni, tai osa yhtenä paikkatietokohteena määritellyn liikenneväylän viivaa.	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-11 15:13:35	3
4	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/04	4	\N	DRAFT	\N	Poisluettava käyttötarkoitus	\N	\N	\N	\N	\N	Annetut käyttötarkoitukset suljetaan pois kaavamääräyksen kuvaamista sallituista käyttötarkoituksista. Käytetään, mikäli on luontevampaa sulkea tiettyjä yksityiskohtaisia käyttötarkoituksia pois sallittujen joukosta kuin kuvata kaikki sallitut käyttötarkoitukset.	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-11 15:13:35	4
5	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/05	5	\N	DRAFT	\N	Kulttuurihistoriallinen merkittävyys	kulturhistorisk betydelse	\N	kohteesta muodostettu käsitys, joka perustuu kohteen kulttuurihistoriallisten arvojen ja kulttuuristen merkitysten analysointiin sekä sen suhteuttamiseen muihin vastaaviin kohteisiin	\N	\N	Kulttuurihistoriallinen merkittävyys voi olla kansainvälinen, valtakunnallinen, maakunnallinen, paikallinen tai vähäinen.	\N	\N	http://uri.suomi.fi/terminology/rakkultymp/c15	1	2020-12-11 15:13:35	2020-12-11 15:13:35	5
6	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/06	6	\N	DRAFT	\N	Kulttuurihistoriallinen arvotyyppi	\N	\N	Kohteelle määritetyt kulttuurihistorialliset ominaisuudet	\N	\N	Kulttuurihistoriallisia ominaisuuksia ovat esimerkiksi rakennustaiteellinen, rakennustekninen, arkkitehtoninen ja maisemallinen.	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-11 15:13:35	6
7	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/07	7	\N	DRAFT	\N	Kulttuurihistoriallinen tyyppi	\N	\N	Kuvaa kohteen kulttuurihistoriallista käyttötarkoitusta	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-11 15:13:35	7
8	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/08	8	\N	DRAFT	\N	Kulttuurihistoriallisen merkittävyyden kriteerit	\N	\N	Kuvaa kulttuurihistoriallisen merkittävyyden kriteerejä, joita kohde edustaa.	\N	\N	Merkittävyys voi liittyä edustavuuteen, alkuperäisyyteen, harvinaisuuteen, tyypillisyyteen tai historialliseen merkittävyyteen.	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-11 15:13:35	8
9	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/09	9	\N	DRAFT	\N	Ympäristö- tai luontoarvon peruste	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-17 09:19:10	9
10	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/10	10	\N	DRAFT	\N	Ympäristö- tai luontoarvon merkittävyys	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-11 15:13:35	2020-12-17 09:19:37	10
11	http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/11	11	\N	DRAFT	\N	Muu lisätiedon laji	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2020-12-17 09:19:58	2020-12-17 09:19:58	11
\.


--
-- Data for Name: maanalaisuuden_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.maanalaisuuden_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_MaanalaisuudenLaji/code/01	1	\N	DRAFT	\N	Maanalainen	\N	\N	\N	\N	\N	koskee pääosin maanpinnan alapuolista maankäyttöä ja rakentamista	\N	\N	\N	1	2020-12-18 11:06:21	2020-12-18 11:06:21	1
2	http://uri.suomi.fi/codelist/rytj/RY_MaanalaisuudenLaji/code/02	2	\N	DRAFT	\N	Maanpäällinen	\N	\N	\N	\N	\N	koskee pääosin maanpinnan yläpuolista maankäyttöä ja rakentamista	\N	\N	\N	1	2020-12-18 11:07:10	2020-12-18 11:07:10	2
\.


--
-- Data for Name: oikeusvaikutteisuuden_laji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.oikeusvaikutteisuuden_laji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_OikeusvaikutteisuudenLaji/code/01	1	\N	DRAFT	legal consequence	Oikeusvaikutteinen	rättsverkan	\N	päätetyllä maankäyttöasialla vaikutus, joka luo, muuttaa tai kumoaa oikeuden tai velvollisuuden	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/mrl/concept-157	1	2020-12-11 06:44:19	2020-12-11 06:44:19	1
2	http://uri.suomi.fi/codelist/rytj/RY_OikeusvaikutteisuudenLaji/code/02	2	\N	DRAFT	legal consequence	Oikeusvaikutukseton	rättsverkan	\N	päätetyllä maankäyttöasialla ei ole vaikutusta, joka luo, muuttaa tai kumoaa oikeuden tai velvollisuuden	\N	\N	\N	\N	\N	http://uri.suomi.fi/terminology/mrl/concept-157	1	2020-12-11 06:44:19	2020-12-11 06:44:19	2
\.


--
-- Data for Name: sitovuuslaji; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.sitovuuslaji (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_Sitovuuslaji/code/01	1	\N	DRAFT	\N	Sitova	\N	\N	\N	\N	\N	Kaavamääräyskohteen sijainti on oikeudellisesti sitova.	\N	\N	\N	1	2020-12-11 05:59:48	2020-12-11 05:59:48	1
2	http://uri.suomi.fi/codelist/rytj/RY_Sitovuuslaji/code/02	2	\N	DRAFT	\N	Ohjeellinen	\N	\N	\N	\N	\N	Kaavamääräyskohteen sijainti ei ole oikeudellisesti sitova.	\N	\N	\N	1	2020-12-11 06:00:47	2020-12-11 06:00:47	2
\.


--
-- Data for Name: ymparistomuutoksenlaji_yk; Type: TABLE DATA; Schema: koodistot; Owner: postgres
--

COPY koodistot.ymparistomuutoksenlaji_yk (koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos, id) FROM stdin;
1	http://uri.suomi.fi/codelist/rytj/RY_ymparistomuutoksenLaji_YK/code/01	1	\N	DRAFT	\N	Olemassa oleva	\N	\N	\N	\N	\N	Kaavakohde kuvaa kaavan laatimisen hetkellä olemassa olevaa kohdetta. Tällaisia voivat esimerkiksi olla olemassa olevat (jo rakennetut) rakennuspaikat, väylät tai muut kohteet.	\N	\N	\N	1	2020-12-17 06:16:18	2020-12-17 06:16:18	1
2	http://uri.suomi.fi/codelist/rytj/RY_ymparistomuutoksenLaji_YK/code/02	2	\N	DRAFT	\N	Uusi	\N	\N	\N	\N	\N	Kaavakohde on uusi eli sitä ei vielä ole   toteutettu. Koodiarvolla voidaan ilmaista esimerkiksi uusi rakennuspaikka, uusi väylä tai muu kaavakohde.	\N	\N	\N	1	2020-12-17 06:17:41	2020-12-17 06:17:41	2
\.


--
-- Data for Name: qgis_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qgis_projects (name, metadata, content) FROM stdin;
tyotila_asemakaava	{"last_modified_time": "2022-01-26 20:10:01.781119", "last_modified_user": "postgres"}	\\x504b030414000200080040b13a548e78a3c41bae01006f0313002a0000007b37383630363664392d666435352d346132342d383534352d3534353735643637633365307d2e716773ecfddb76dc46b2200c5f8f9e02bbf69ab63d2e91381fdca4d6475194acdd3ca849aadd3d5a5e580920414255055403284af4ac791bdf7c77ffd57e80cf2ff64766e25c000aa82a164919eeb6590032224f91119191119107fff1e6e2f8fa5f1f4eb87fdf7811f7e1e3ebd3f7c7dc77b7713cff697f7f16daf69e1dccf6c9c73d2776bee3bebbfad7d5f5c9d977af5e1c508879187cc676eca3193e1c8db83b1c465ee01f8ea43d91df935e5e38d88ff0888bd01dfe18e1f070f45f084d26017bf306c5f8da2390222f8a2f79e1a5a85e8be24f02ff132fe4406f17d36906f8ea05c71ddc0633fc01c5b7dc1cfe03f5eed3b7b1174ff1ab837df697bc418b388843e447c88ea1591cf97307d5f10904be43d30534e20d76d1621aff039e70b4542a0e1751bcf436e9f971189147781141633c340db11bdd27efe0ed9749fceac3e5c57f1d5f5e7d1a9d5c5f5ee906b7cf5d9f49cadbf7e7df9f8ccf7f188d5f1f5d9dbc3bb9785728331a9f9c5f9d9cbd3e3d81378b309863e473d7380c711487500b77895d1c62dfc6dcd57d14e319271880998cf6cc9ae2d1f80c804f2e5702bf0d61e628ece8d7be3006bf068cb0068cb8068cb4068cbc068cba068cd61746e4797e0d18a53f8c40c6e0e4f4f4fd87ab8bf76f3e8dde5d5e11eae0476355d27441d2c6a2a1ef898a268aa2c00be3d393f377d73f7f3c7f7ffd6934c371089427fcfa6b46bc47c7c71f2f8f8efff589df23af3f5cbe87f600d61063ff8b67df8ec6fcf8e8fcdde909c3e0e01bf8022ff77841931549344485cc8b24013069cec987ab77a3b12c2a3abc38be38ffc7c9e5d5fb8bf34fa3644111babffef9024a5e93654fd811e6ce7068a33808470514d0258d34e8e8f20820c8009dc2ea8d170ee60297f351bc08617c82d0bbf1fcee8d2c54a0ebbc50a920f06f1a6b10b5b5aa10cb555cd9688a391758551072285eeec79e01143bbe3a3e4a6b5af85e7c4fe6ac8c5729e37d8ba6308e1845b1e7df8cc60a4ffea99ffb321eb50e8f1f84f12d45d40907cc13ccf5d5a76314c638f2903f167f1d1ffdf33df0caef4f807b92668d2f2edf400500da40904979c26d69f50980d808f0f1eae8ddc9a7abe38b0f8403c3ccf91887d0682e5a8477f87eccc5c13cb809d1fcd6b3b9199acfe1db1eac9da3cb9323e8a8e74f91ef702fb9c08f6e831073e429705dfa40cabd7e7df1cf4f8abea7cb63c1d8e3f5b106936d8c25614f314ac42ef12a8cc0c13e1124a95021b2477ef523f973b88867dc8fbf053e3e9414ee473c9dcea34358b53acffd18075f6e225d3ee4c785ff713f92398f0e01ca0f4c07a4d5c13ec397628f40863baf045ee20ff6d9effc0b3c9006910f85f720676fe19134f827f63979931670706487de9c08e157b542f060bf58a4d84f4c4537b2c3c0bf9fbd82deb2e6965fa700d07d6f1e059e937ea04dd278c138d85ffa9602dde07422dd29ba79e512223dd8afbc65327e7f49c867ad4914818329bac7e14ba023fcf2260c16f304d2061d2298cd09130e630fe70ac205edf27e5a417db925ac9c7d8bed09760e477f8f7ffae9983d8c38a6874d10ba8366622788471cfe3a07da232585515669536baaed696e51b94df4275106ef3c07877fc3f787a37910c5c0c5a211e739499326c1ad834d18d899390f3c3f369122b848e565d3302cd79435593275e4f2a6213932b2b18234053a55df559808fbd68cbcdfa0c32f85f14ba1d47b5ad55e5e55791cb829bec1be63c23ba2b546c122b401d2b12886ef1806e4c7c88c418a44de149e7d134dbee36ea15787d300f82cf9c5cd81971c2ab2247251349d050e3e74bc088102c64d600cbef34063260be5902c0a2ebe9fe3c333d033bd0fa449ac5f1f426f86c27b18b28fbe6703333efc4ef88e8b098ec3bffc7b11c47f2dcc267bb157784ffbc99eb9eff3eefe9075319a4fbdd8b4f02dbaf38290a8af85b96e26838c1058ab4767683e2a7ead7ea7434cb4694cc797cd0430bb2f6f319141f838584089fd5205fb17a5d5de4a6bfb5562db0a154e81ab9bb22c225d530ca03ad9326549564c43d354d3d2351b0851c2b2a36c4c84a4a6220df28f4e83a7d0a2ab988ab4872144d2e5810e3b72c3e9bd68625b4658b335e086926cca8a082489556c4a9aa8d9aa2189aa656c811b42554f8b123f40936e60061f8a1f4287073aec4c87a6a48ab2cc3bc8d40c57007ec85b26d2b06ecabae182468f784d75b742864f8b0aaf16216c9cf0ff7e40327c042a0412f432bd301dee53da8873189aa84c82df1015eb968244cbd14cd1d540c6db0a50b12b48a623a8b0e7510509a9d656a898b383f940ca03296f8f944d5d94548947b2e922c1000e8c441309ba6c2a828a65cc2ba268f0ebd1eed3da066d954e8b243a50e7835027f22688f4d3944029301c87372dde7240537581406545351da468ae6a8bbcaaf427d014fbe3d1e886649876803d3d75127c0cfaf98cfc5b1c4f3c531065e4008f33654d01e92c58a26939b26b62d992b0a46bba6ec9fd092845ff7c2928edc140424d24147968e2859f4148ba0ed604ac99aea5aa4cc1d391239aaeaec896ab399a20e1fe2494a27fbe2494f66020a1361d6b865088ee235387ed802822c314110f920cd9c834544b31455d111d07c996c84beba95a490d8fb733d886529574e279d0d2b3dfbdba583774c5b54d4933885d9ad7194bc3926523d750455b9336d8b33e5b9e56dd87fef9985acd99df47df2e9ffa918d0f267e1d260aef8232dfe9372cfb5d1ade93cccbad2b1cbf180eb6b068eba6860cd9942d4380fdaf2199b6e1222c3b868015bd37d1976bab3f82119ed011ccc65be07287d73c8759411dab97cd1638f8d2d25941838dcb670bf4c90ea975c5e1b1a5b8a0633a08f62a40aaba23daa626cb86a421cc2b086d85409fea41f54312678fd3ea27409d9d348ce00e87771efeb21670bb7af2e4d6073db833455946a0bbd8a6ed8a22ac10e2c621da0ef98f64cba2288b96bea515422bfc36ad98adab84f6fb4fc8c54b5f0afe547d95ec209ce045448d97aaa20bbca02aa6c25ba070b8326feaaea09bbc64c15bd57214cbeeaf65e7153c19eadc0ef32ef46c30b13ffc6e908df6dc8b626c2a86ad1a88d74c5e7641f390b16c5a48364ccb966dcc0b40ae18ad4ba9b4866f935469d7065add8de5c237278b59806630e61e8e03533754d9e175d5546d5003645e01ee6ad9d8946c5ed5354d57346dcd73f74a4ddff05166a5a7cf8a941f850e232f8ef1f43e4673741b2f66c8545cd980fd996d1aaea19932d615d3d245c9443642b2e6ca026fac21e397eaf95669b0dacf940223ef3302dee40d54b84c85778b003e226fb288a1a28c122dd9b26455504cac8a36689b645b24f38ee9c82eaf23d9751cdc9f12ebebfa36a9b1beaf0345aea6c89c089115c5219ac41e10a0ebf0b2659858d68973a740cebb046c8a8e21088e663948567b93634d458f438bf14313634d4f074a5c4d895318b480ea32304418d49ac0c42e6c610c5b078a041a9435e4c24889c4491329b28675c115fa87fe2cd7f36df2c4e57e0edb9d5d6d77a6086684f89f3848c3d8d64cd795818075cd36912e8840ca2ab27859761c01afbbd149ea78de07b65937064f94368a8af0145e2e22131b8ead4b8e64ba82e0929d33304343364c1529e4e41f6baab8a6d76f5ac5f3a6a7b4170339b592d32280dd1b90932cb88a6ae892a9f332687aa2e498166faba64184ab2d88bca0ad19c69356f1ccc929e9c5404e8da6e8c0f1e8619f6421a44a166f62db0501e7c89a6920573155153b12566443c26bf825a5e89f2f19a53d1848a849ef87116766614b50445d165d5357117023dd815f36564c11211d298624686b905086fed99250d68381841a48c85fcc68e215ec33c70351302c1188c5541c99376559134ccbe641ac09328f6c4b135dbd7fe440a592674b4e957e0c44d58da8a85b00764555b105ddd4782411cb986022d9b64d55e0155993b0a6b8f6a684f5acc39b6afa321058038105119a026f8f17332f323f538f1e8f1c717bd162e1fb5e8ca73364f28ac45b0e717545b663ca862a994843d894245972794936745dec4d715d6a7eb624d8a573034d361d07e049143385deb545ec6a9640e23731f03ad58611e291a958bcc18b585079dc9ff272fccf96bef22e0c112f0f488844e1bd9f44de641298b22aeaae083b4ad9200158022f9a0859b2a960245958b535cc6bfd49b150c3b30dc02a7662606a4db4047c7f1151a6e618c0bb34c3326d41534c99d774d3926c6c1a22125c43715d610d837c8efff932b5ac0b031535f96ed0b4d55ebc3003eb3326e7e4f989b98115dbd178cb147889c419eb202b91c09ba261cba2e08896abf467502d153ee2c9f9a69e1acd9dfaf3505e93c37adf683e6a5c84aae3fa40be47cae039459f6145c858442aaf9aaea389e464c18515212a26d6918048d244e4a0f54e1608faa7cf67d399593e5320ed1f986c97b87b4a4868628a826ab9aa8080822cd001459a7c53904c60ba34a64893b1b651fc7d5ad37326ab4a57060aeb4c61f71353439a81048da417964850bd0bb4e6b89aa9814a68489aa42359dc0285dd7f3b14763f50d80a1f203cf57cf8197a31cc9ba9ab926209926e225e23763c8c4da428baa9882e9278c4abaaccafeb0954aae9395358a52b0385ad08aa59f2c1f7d9e2d4755ee27549365d1511b733e4c02bd5322d0576b9d830745e17d68eaf69a8f479d35d53af06126c27c17ac7fb840c05d9711cc5b14d4916406f5340b41a3cc95c2369aee218862caf1344bbbae2e74d8a6d3d1bc8b1851c8955218a31268ef7a0d2a9b6ac3a3c3245c3b04d19c3f641b71051e96037a11b96bc6e9ea45235cf98d44afd1808ab1b61c15e41320cc7520c87c4c4f0a6ec8a82a96b8a603abc686baa204a8aba3161dd7f238435ec12da3d27c9397531f20a284b1691a89912cd994bee1a31544d34350b1bbc2a89ba84acf59c282b353d0303723d7dd5f46520b1b688aa34f827d1c9445bc51216c8d6c050402c1ab02b105dcb94345b97655911341daf175255aee899f2af9a9e0ce4d5eeb8eba4a4054a97ae8a3ab61dc1d4b06e99b2c383c66ff1bc29b982e2da82cbf3aab2ae076fa19ee74a5c4b1d1968ab236d81de85417bd754249a864cce5825db05d968b826420a722c4130947538d7523ddf086d0d9a57236dcd10f2d114117f4007a716334576798d774dc522b76968aa4c7431dd54784743aa6c3b3aeeef315e53d133a5ae9a9e0ce4d5e4d6ebb15468c48013e3129519126f3baacb9b5821710958524c2490ada38080ec54d1108cfe2cacb9be674a6ccd1d1a68ae81e6222f0eee168b885219cf6b9668390e495b48b2c900812172de4462ce65de5644acf777bd28d6f04ce9aad88581921a28e97e36472119bbd96211079308fba9fec54bba035b45c7b45c22222d45845fb6688a96a86b8a66e9aedbdfeed558dd33a5b1c6fe0c04b7eab29644463abc42ae96944c4d70807be93632912d5aa6ed0aaa84145576d00657b63c6bc158e9c540520d24e578375e8cd09485a14d270ba8069998d76551914553511ddd941ddb02ad1f5b268f044de1792c8b76ff04d4b5553d53f2aaedcbe094bbc229f7b8ec921b2372683b41618c2a69fa77e995fb65962c85bfa179e499a609e08b88b40ac8ecfaeccad425591730124d5d936513b442075ed9d8b434d1c2c8960d0555dd910adec78dcb8156c7bde40ad571505da7056187d1e1c987ab773f49baa2fd05cde67f7583708662fa9392c5d7fbdfe8c3229c1edec6f1fca7fdfdd89be2688f0d37fc81daf75c6fbf50fdfeffd45efff63fb537e4efd7e4ef3dfcddfb3cbfa1c87e9ba1af878291fcf6fc437e6bc4beffa03c2f9be38b39f6af48a9189695a922cdc1b2ea9ab09b744d595005532727e0d81035c146b6a62bfd73a695aa78a0d98c92e9dc8311f2235ad90ccdf782f0a6710ee7fe83cfe19f208ac0ffe3f7c9fdec8fdf9f4c140109de25d989608381549724f933258757c96557ae6908d8301d41525cc7327415e335d85456c1e3486a73e139666761fdfdd5c9e9c9f13517065f4c7f31b370f8fd0f1cb93f8483bf47571cc536fe5fdcdbcb8b332e2d3c99e497618cb9c99eefcd3cd3f558a1426cce5e7e6d16c040c95433d8ab732ae726dce9c9db6beee2e3f5c925f75f17efcf97712520dc64c65dc0e73dcfe10ee101fe9ab5287ff9f9e4f2a4d0c243eebbf7647a3030ef3bc4913855ec734184befbcb7f7e457f655d8e16d6bf4dc1646f867ba777a356a7ab06dbe4b2230d99aea038a6ac3906ac535d30616b66493cef58c8b1d65f94c3927c2a4bb2d05eee3f60599e7f3c3dfd8e3b3a7f33acd6e710408fa3d8a3032c82f4b45de4d8b2895d2c99b22210310a8fba01eaa0ea205dd5d648e89c57f0781bdee22d64f4faa3ae4b78beb0a69e5d49ec9075688948c5814a1f9c4a5543e591e10aa6e318b0737175cd34b048dce00ccd1078d7e075770db9f2c4e83449effc40743a90e9867b2786e8651002bd72d8273351de0d79319ebddae01e87837d8aa1846edd24fc75b8d64ca35e87aaef85682d38badf55558b64bdcb5bea51ad791f512332762d732e29403f9611d66ce05e860443a58806f03115b069a206fd9744d532ba623325959c8638c8d4086794251ea60da6cc9475c3d57915065375bb2123d7942210fd48e565689a45825dc9258cc8e54d437264604a0ad214a70b367a29af2c8b48d714e81df15396251a96ada9300f9a0d08252c3b4a233213264b9578249b2e22c78912124d24e8b2a90011c8985744d1e0eba037bd63b23bceaef7ba76c5d8f926e33a84fd8d7cb58ca6a7b85d85a38b62d999d4754b41a2e568a6e86a405d36c96dee0a92e908aa835d5590905abb0afbec4bdbe0bb999bea306c62652fe24be518133fe45dbd9c3a887c349f7bfecdcb08365ef0374aa4a960801e83a7eecbb4004d671581a282df60a02007fbf6fd19d150c87baaaa8c402b024ac761846d2255cba033f4f58a40d3873898e210f944491274f8e6f9f9b74c5482105ff85e9c9f781c78bee381feb740532681b3465734c6e475f5c2fb9eec6b940e056b47447f3576436cea069feb1c35cdeb6ba1dc6193ba596776d0a0ee6c7e27cd59ffa2a31d346ed38bc577319dfd2f1ddd1591ad23481eaf755d34ba9db46eed0b971e6d41f4b9497c078ddce836bf5d91df7a77afeea4756bdec8f948e4d7597ddf8d38eb6dde7d047ed7799bb84b09d6e37ef71dcf633703e823c9ad6e768d6d370f76476dbb8783fda59d107d1de229229b99648b913d73212c9110364150f294603b1c01fb4694242490c486e3f024df358cb9e282a62a2baae9204573555be455854f5c56fb80989e63969219f7ce6c6c12f32a7188f16fe2dbc3d1511405b647bb5397cad84c5b37ca3a8b9da4affd932a6744e27a78ea5c62b738826fc93bd879943b58ac372b91cf673a151d66e633f26f713cf14c41949103db08d0481460288205fb2e90a6a0b65b1296744dd72d39999a5e30bb9f9bb479cf7f72525f64e09b0ed604ac99aea5aa4cdbd691239aaeaec896ab399a20e18aab772718323939446fd815d35283b9664e7af6b2e384d4d6f89c66238d5f5ec375bfc7cc546b699b9f3ec1037d67298d19785673c5ac2fdd6d30abe785e1722735d3d0c3d4d371f029c6e738e4a92f4de9411754471491618a887073d8ce98866a29a6a82ba2e320d9128164bb4d408ab26d55f4aebbd7ac24889fe3e464d7a8f6bf54b5e3f4643857ce4fbf2b5dfb4c507e93eb339ca1f466d2fef794769da114e7ea19ea754b6aaf19ca2e477d6633b464b159d388d365ae9610b74fd87ac6a4ceb35645ffcca6aed35d635bbb906cf5f476aaaa6dc2b777795a4712e87667dab3228a06fbf50666edd513df80bc6daa3731b3779cdcfa2ab6369d1b9a9337b648efdcce516eedb337766c7a3cbbf911ef30830f31837dce13b7712a39cce266b3d8c7a5247741e16545113445a4d73fc30e1816992e4bbaa91a92ccbb9ae2b816d97d9bf56903eadff22aaf2986aa99204d1572dbbd4ace8f600f27199a64e986c2bb1db68cf5b8976c1f49ef37486bd071d21ab2193c8bd92b1abc3ac2743278fdad61369ebacd6b07a34d4daef92f8434cbd0804711a965ca1a6f9b4854112c1141031ea88332ded58c92636e1af9ee978cf519fdad1a7a773003d55b666a5f5a9263191809a66238d0025923971382ba2160dec202e8188aa8759c97dafa9aa668ad2b70faccd6d2cd37cf62e25af203b67cd2906cb8a24d5c4c89ab22b90d0d19509926b99682a1a196a876d8763757d034959ba633ecbabd6ec962f83ca6756b161697e70524ebc0c6040c3b3a4c3c785d5132156463cbc60a5644674b1696c649ffa6ad2beb11826058aea2838ea7cae4a238d7114cc3302cd8b5f1aae6b8402648af2a221d613a9ebcd1ccd77f1245a4e399652fa5bd8baa3c28edbb9cbde1947ab7435dd1d8bbe8cf83c6bed519e8a4b177d194078d7d6713b79ec6de453b1e34f6c79cd6e77826fa27d6d8d77448af38b4ab92e4b88aab982268e6208160376d09aa6b62846ccb5154d7d68c8754e3f3a63c5715e511e68181f487ee322355dc4dd3c2cab9583774855c62aa1924b685d7d9d93a962c1bb906f1d8eae74eb754e7739ba0baeb54eade614570155eb30131093cd34411f63c8a65aab66ae9aa62e850ddea29abc3dc3a776bdff6d271126b2f7979beb359ba49a2f4208886a34b9666620bf440101e3c8ca368990a02ba77554376346bf5fc9550b64e5cff3b2d3ace58f92a8b079aaa1ea16f1b45ce3de42efa9b12553b9f902599d51bcff6a557cf91783a72ec89cc5ef734240f377d3d52a10cf3b7b6007dc8f9eb2cc487f95b3781c6c34e5fb71c1e7fced9ebba1de8a2830fdb812733adcdfb822eaaf9b02f582791d96689d0869dc1d39d92616ff02dcedfb03b78fe3338ec0f9eff0c0e3b84273e7fc31e61874706bb9cd86197f0e8073dfde5d8b04b78a25332ec12bec5f91b7609cf7f06875dc2f39fc16197f0c4e76fd8253c07c7a2352676d8256c6fd63a5e27b0d16d04c31ee1a94ec8b043f8f6666fd81f3cf7f91b7607cf7dfe86bdc1939ebd6167b0d39dc1aea675d8176c3067bdf27de7739582899ac4f306af99a2ed80ae26083ce8dda0736324228c30bc75f043a6d96a4a2dfe9c7602bb9c82e58838cbd26547e24d9127f7b725a1bdba2988b66e89b6202996d85f62ad9891e71313b7cbb949815856b449fd4b0dc1fae0458504e50257316087a4bb8e4d943649d2794d9245a3e79d0075f5adba1e20851105d5724956290b599a298b74af264826566c9ad75293b1b6ce35016905cf77369f448eb515b3f9bc1337ec70360392763fc698a49c9ed4bc11758c114dc32b42ed32063163a832326d57175d9ec7a2e208dde671b9a615935806d0545b561d1e9922b9d71b1a02936a210d542858a8ba61c93d796a09fb939abe8e97a33cac05f2cfad79f49a829ddb1c3be920cfcbeaf8f8f3f59056c6ee13f67cec8c4f61c61eceaed867c69e8b65f169ccd8035912fb4dd8b3b025ee72be3aedd0ba6c89861dda1398cd2791536fd8a16d673657edd0ba6c8c861d5a79fa7c73b2980568e645f45a0e53873dadc3ebaa095d90c89583b063b66c10df36afea9aa62b9a6615a6711df007dfb1551af55c776ee4f8060a905bbb1c10c918742ad795114866cd36912e88e4ac0859bc2c3b8e804b93d2077048b65b37f8fdeee0ccc7beefcda10fbb12eaeefb7c56b3d0eb9ecdc22cf4bc1df48167a1e64ecf61169a6661e746a455d3f31cad484f61ca1ed28ed463ce9e8f21e9694cdac399927a4dda73b1253d95497b206b52cf397b16e6a4dd4ed9933041ac9ac6e76d83d8e9843eaa1562c53c3e4f33c47af7b327d3b8ee25f30fa8f2b75d08ff6cf4fe479c14bf660c8bceb52ddf759d97781d94055745c4e0811c78a55aa6a520c1c586a1f3bad0998fb6b4a2eb146fd8d49e2cb6a9aeed914510381ebde058b21052258b071dcd15c92db7a0a42157315515c30e48910d09a7e6de5e303bbf07396bdef3bf023908c9b52b730f78b4a918a02083f03679d905ea92b16c5a48364ccb966dcc0b16701894ce4f4f303245fe628671c8ee1523535b7d1605c31235984ec521febfb226000a5ea5eec0c8b634d1d53bb8d757b1169b5a335deb34a2eb8c55706f7bd2eed0d4335545177841554c8507ba925d68b4ee0abac94b30ee8a6a398a6597e6ac3354cd9451d8ba77d81555c506041a8f24104a826022d9b64d55e0155993b046dc79fb4e1dc55c68f5ead9ebdc963567b0da8a8d66710adc36a08b1a4105409e01341d168c41fcad5d815c798c5cd3c222ec865c044d07b5d21592bc4a6b020f76fb2732091434854a847bdd3bd156b1840522f00d0574200364bde85aa6a4d9ba2ccb8aa0e91d6efd6aacadd4f89ae95bb7495d27b306fff6a6d68b103b60b40445d465d1851d2a829d9aeec02f1b2ba688908e144312b454efe807b3e4ffb1ce29752f7f8fb479ab9c3c3a1dacafe1dcf1cc2627817052d285fd6dcd2b1d94346c3b8209ebd3021593c7a661f1bc29b902880ac1e579b5c30941735df52b6bbd76745e584be8b736756b694c7402d754f876abdbb7286dcf52c35f5b45aa9bb23ecadea34e5b83bef8bca62ec6932866db60d716b1ab59b040780bc398ab36e8153c32158b3778110b2a8f4536633d81763e5179fb9efffcf46e2d9ba1354678f7c7dc4d23f68c4fb99fc87c3dd01977cf097b1647dc4f66c61ee480bbf78c3d83f3ed273463db3fdd5e63c29efae1f6cee76b577be52e73f56cb6cb3b9fa5ec947bad33ef2ef394e1ec3251fd0eebfbcc54dde1f8b399aadc22d2db36d2cd9a1107aba6a7a721a79ff922dea2aebef0fd4544b7458e01bb1fcdb04c5bd01453e635ddb4241b9b868804d7505c57483de37b02ed7e2f95b5efd9efa5ee164108bb766fb220fe22990f80255b96ac0a8a895591244bb21d5307696a3ab2cbeb48761d0727968a0d103ce4a9487db39ee149c9939820bf613ccb9e1ead6504d9711cc5b14d491660392812ac619e241b92345781552ecb96ddd9dba3b5a6d247e88fe0e876b3cfc7c68deee9f7d1565f0fa2c99f22fa4874de5910ce6f3dfb32fd40010f66686e231f242e877c3f88d9a77f7891674d6140858cc1dde233343fa625932e1d2c7c2f8e5ecd708cc3e8609f3db12ff86b8cfd38ebf9d799e7bf92244350943d5e1775553154559145418187837dfa392d7b4f1e54cd304451df530443924405947111d698280a07fbf7c5c25f67e82b412cebf21ef052593278501a75e270a38804317cce11c30341ace8fc1e2ff300a6f31a0fa09261e804715af860bfd8fe83301995573c8c6afa9b7d7270147b3e1bb330caaa8ae6f00a4d61b6a2fbec2dbcff32895f7db8bcf8afe3cbab4fa393ebcb2bdde0f6b9eb334979fbfefcfb93f1f90fa3f1eba3ab93772717ef0a6546e393f3ab93b3d7a727f0661106738c7cee1a8721d41e423ddc654a16dcd57d14e31927188019fb119ec12c8ec667007c72b912f86d08534d6147bff68501fed71f465803465c03465a03465e03465d0346eb0b23f23cbf068cd21f46206370727afafec3d5c5fb379f46ef2eaf0875f0a3b12a69ba206963d1d0f74445232b9317c6a727e7efae7ffe78fefefad308b842089427fcfa6b46bc47c7c71f2f8f8efff589df23af3f5cbe87f600d61063ff8b67df8ec6fcf8e8fcdde909c3e0e01bf8022ff760f700bc55344485cc8b24013069cec987ab77a3b12c2a3abc38be38ffc7c9e5d5fb8bf34fa3644111babffef9024a5e87c88fee804b61ee0c87368a8370544041f80069d0d1e5114090013a85f51b2f1ccc052ef0bf7811c2f804a177e3f9dd1b59a840d779a15241e0df34d6206a6b552196abb8b2d114732eb2a1b71c8a97fbb16700c58eaf8e8fd29a0807bf277356c6ab94f1be455318478c08e7bb198d159efc533ff7653c6a1d1e3f08e35b8aa8130e982798ebab4fc7288c71e4217f2cfe3a3efae77be095df9f00f724cd1a5f5cbe810a00b4812093f284dbd2ea1300b111e0e3d5d1bb934f57c7171f08078699f3e9a1d60d172dc23b7c3fe6e2601edc848888570e04ea1cbeedc1da39ba3c39828e7afe14f90ef7920329711b8498234f81ebd20752eef5eb8b7f7e52f43d5d1e0b0648c8b106936d8c25614f314ac42ef12a8cc0c13e1124b9589987c167f9d58fe4cfe1229e713ffe16f8f85052b81ff1743a8f0e61ddea3cf7631c7cb98974f9901f17fec7fd48e5f62140f9b09d028975b0cff0e5f841b479ce2b81974000b2dfc56ff0489a453e95bea0054cacf38a34fc27562079931701f16987de9c0ad45a7178b05f2c52ee31b6c94b6487817f3f7b05fd660d2fbfce416028bc7914784efa89364ce30503c47df55b0e7683d38975a7e8e6954b88f660bff23695fbfb35829f766149490095de777008b4127b534c358bd28b548d9a037b8e00f038f063504aae6ce0db4c6fdbcf1437a6e0b1ae9f050e9e269add14df004e6e3177508cdf84e80b50e545e8d04d68b8489d8192623761b0987380dd4fbe72f62db6271874ccbfc73ffd74cc1e4a7a3675648873fd96219a12f5b984c82955fd5268420dcbe1cb5b4cb8143e0e167e5cd03e730beb5e7e4a322a4c930b83b6dc05a036873cd1592b142f3796c07277058dd78bdefb17202eee3cfce570c48f385a6cb37b1353359d9144d6dc9c740a0d6a1951d6938718527252d836a249cd0f3ea4dd4f2c9ffa88d283a1a730a43d4ea89ec3983e9521ed7686f41c469403b1f2748655b714245a8e668aae06acc026e9365c41321d4105fd441524a45a5b1ad6ed0aa8c71248ddcc934f63c4f874c4903741d41d6cf78396566d4ab0640dc7e1892796032cd185719315d57490a2b9aa2df2aaf2f4c6ed33f26f713c7994814beb360551460ed01c683b0aac51c1124dcb915d13cb9684255dd3754b7e722307fbc589177e7e8c759ad54dd2bf634dc09ae95aaacab81b4da3efea8a6cb99aa309127e9a42233d3d7f2c39d1cb2de089d15ec145e451772d9d2e71587fec6a68a134541f7dbbbc9124521f13fb23f3ea2e54fc809351aeb476fbb3c6e4b44d0fdf363de5e614764186832d2cdabaa921033476cb1040d21b92691b2e821d902160452f4e56ed74354cd8c3aa4375235cddb33ff4100b2b8698eddd75c5e1b1a5c0b69dde0720c068eb8e689b9a2c1b9286407942e8498d31df3ec6d3fb9bc07f42849cb4c8849d12495f6b9bb62b8a30cec44622924365d1966c591465d15a9b96d3976536f590da7e21faf511d879df38e3a7b6572a867e3fdaf0f588ad7f8aba443531ea2369156be59c7d72e3b99402e4314673bd2c2d4f6c2c1bfcaa763f9e9bf8453db131cd5b8fac280ed1247e0ca953d30a183fd7e1412f856dbf4e0ca002d98909d8144137151ccd82cd98fad4a44f4d80fdee0773ddfc064f53122529aa1f4f06f54aaefd14c7304beefc4843d82f45f6931cc13460e0b146b05728c4531bc12c71d663a8e3bdf2903db191cb23221e4188f48bf1786223574de8b0fbf15b2b63c6d31ec547b248ac9dcce2898d6610a129ac2ad072bdc8fc4ccd581eb112923bd87ddf83edd9a3ec65ba348b5c30cc5b0eb10e239ba4f95561a3a821d8794bb2e4f2926ce8baf8d474f142d28947d8d0f44ce3f144cee4f8ba90b3c73893eb1fc8f6d4f6d57998de23505fcfc0c7a766e7c161e49124d266607dc6c416f098b68996d69806566c47e32d53e02572deae933bbb05de140d5b160547b45c650dcaac397258f708942ac051fcb09eb4e5cd120d267b9069e2576e9468e09c216311a9a05bb98e26924d920b93222a26d69180888f27729ea6d9bd7a9be2230de25ab7463ef9f1bc7f1ae3793f3135a41988244d209a2a6c055c1859c725e9f615d790344947b2f8448d71e5bb191e693cd7ba83e2891eb33525627fb4a1dd2c0dfdd31ce5d6b0e7471be9cd83bf9fe06897affe789cb15de37293a73d92f74f6024416e4986e1588ae1906338de945d5130754d114c87176d4d15444951a527697c26e68d073fdfe457daa12bcd3061346511899a29510771128c64a8a0b16a163678551275093d397786bae4ddbb1fceb553943f4d037f3163f3230ce69a59a99ff858de3f85b104ae8941d8682a12615b4a4c0492edc22a375c13210539962018cad3a34bd8b1f8b097262660189fc75ae535ad30754576798d774dd0f80d72f42e13360aba3eef6848956d47c74fee1825f0984725d1f462fcc883dadc18d39078db515d1e36f6e4880a4b8a890422df050483ad8a86603c394a85cd4a70b758448f349ac5ea4d9ed72cd1721ce2294bdcbf60e810d98c12ff1099b71511eb4fceee743f9bc3361aa4e86cb188834984fdc7639e8d6d3179497740983ba6e592556f2922fcb24553b444d040354b775de9c906843dda52afb400f4748584144ba626c0c652d66d50466dd1326d575025a4a8b2839edcfa76bc1b2f4668ca8e7fa793c51c878f6178aa6d8789795d1615593415d5d1414fb22d1050d8327924680acf6359b4f58732ffafcea31123625798a030469b9bff0b270b2dd3f537348f3cee2507a3b38848cd31e2aecfae1e61c2684b4cd32cb4c4849698ba24eb0206754cd764d904b6ecc02b1b9b96265a18d9b2a1a027672cbc0074577188717c86e68f700256aadf5491e66059754d50085c531654c1d48969051ba226d8c8d6f47512926cf1cccbffe3f7c9fdec8fdf1f98e8334703e23c419cf3c44720f3ac6ed342aa4b6f1a931c5e25c197b0cf10b001da9ba4b88e65e82ade2977ef35768f3872d826417a1a32616f0baa9be6183094ba608238b4249e772cd8a53d3dd79628f656a78079a0912bd40ec466bbc8b16513bb583265452054078fba017c407590ae6aead3a3baa7337eaaa1f2882478711c0398a9ab6ba68145620d343443e05d83d7dd2d30d3f4459a94f51fd0a837813dc9d3b4666fa437bd52b70ee95a8774ad43bad6215deb90ae7548d73aa46b1dd2b50ee95a1f3f5deb0c79fecb5c6b7bc9b4e8f87e4ecc92d9eb1107731000a707b4b7d7de8ca9ad217bbef0cf83d873efcfa04a7443f4bc62e9131f812ee1d401143e250d87593eca354853532557c5bc628aaaa3c08e4176489220d554544bb5b026283221ad94340e1c14a3285884367e05a3973fb0af137cff25089d53d8cc65037f87a60b5298fd4dc67da9e0011d14a2c3165b077a72f6fa454aef9d54b9fa75d8b47e9a160fdfb472562c98ee6ba3e7c278e8f5505c046c66cf708cc83c67801eecbe80b23cd8dc10bac81ed2ef73149277c5524bafb25d25f26f1640cfafc844273fd36f647dc07bfa277be7c553fa92fe4ddf32170e9b4c7af633abc1f3935d15db52621c4131fa277d077a55e0805420839bfe4cbfd96191b01a08ae9ee49a89ae85ec1a09af8df4ba115f7ff2eb4b803d49b08108c9ebc2b027fbd5c2c527757479e0c1d62a9d67c64b2ee6c8069de995903091f4991501a6e83b24813619eafc21e1de35fcba98789bbe48170af0fa22430f41cbc1613d338fe2fb293e4631be01450f4787a3a3e9f4aafc6e043aca57aa1eaec7fe6f5144a15fa3083bd43ce04da1d76f61dc5788070e36ef49c502fe91d7479519284c1b350abc848d8ba429bcbe27c9a2a61b7487af6a12ec3fca6683d470b00c00b247e44595e81ff765006a1d68af20371fa4068476fc0573c37ec5064275af865e0a3adfd01d5dd9e3154110754d835d8aaaf292d2d011413388429fff036255afef4313d262eb6b9a4ba4fa26472cb9842fcb785888874c4bd415ed2f6836ffab1b802214d39f94e0bfdeff461f16e1f4f0368ee73fedef132d29da63075df0075ab5e77afb8566edff4fedf56fff537b43fe7e4dfedec3dfbdcff31b8aec37e8efa16024bf3dff905f5636ead58d7a85a356e5202c3586fdb5b5a0d76dddc2d220f6b373bae86133764ab60257c92ee2f8f8e5eb7fbd94f778eece435ca56fc092734405e196aa2e0dc7704bda4d59bf5929703273d52fefae385d06fdfc4384174ef032df48972c56ac58d162f54b104e1dee1d06d617c3f628b750c93516aa96c2dfd35dbc17ff503064b4157fa7497ce7b2ba26752e2b084a77c482aac9dd0b6baaf843d9e6928ee792c58578de76b6b8887bfc162d2e92a8562c2e1f82f9628a420e84c102318738a0f6254a49ed316dc56b2d34022fca4fc942c36fc3405331a43c051b4ad218eefb7ff6b3a5a42de0beffd77a46955fb0951a4ea875e4ae4819b92985ad1e0bc75f80823922c7d4ffefff7745219287f3cc9e4265a73a26c275cc7ec2afb23505e4cd9235a5624f990135723fa2c364fd713f5af9cf298acd383ae4e157e09b3cf9f195fdb9677f268742d1be829c1bd0b7a3c3ffc75f4ca7dc8f502d08d866bb4ba6c29376366af1e9c77a453e93ab2b35fa26fede47d32783d55bdb4fec30c402b00bb5bfb8b96fda7faede81f6db83b6ef42d37d28553e705cde8e366d48dbb7a44b9bd2fa6d69fbc6b4ba356dd3159ab6a76d1bd4d62d6acb26b57d9bda75a3bace56b5ff66b537dd36526e65cb5addb4366f5b5947ef802ac3575f668ccdb0a7f4b31fbc29133f7b41b458ce02de7a1ed0c3df4584af42fb9c7e239bb942cd650c64bbca36b42fe96ef4e50cf940ef21672f42b2400e4164ba68312d5db85481497d01938285ba1a90e7e61718cfe230bd4f9623d984928d7ae9392f768967c15d5a267fc80b5c6114dab76989c2535ee443e8ddc12e9b106dfa336b76a95907a0f4cd03a251cc4011a43b6317c7f6ed59fa84ab26d5c459e12b762e817de0f2aa8c41920321b2bf2566eb3b74613b656f822a16e02d497b72a3d48238e5cec93961187b25967141d752628a287ba755bffefd2a26e724238eee930e47ff207f323f203611f7fb6cbb577679b8282d5820fd86f61cccbd12b3ac1277cae761973725ca056cfa888746fa7c381247dc6f4130c3ce7bff322b062be836207988609671149f63efe6d682b59596bd58c45d0a67b3c8fc484a1d5c6ee80133ebb08380ccd613410d534c96a11d4c616f09eb0c0630207f8fc90b62a7215fe91245d3f92d7a4d9f889b4cc0cc51e453793c6845743f4545967d5f4e940dbbe1331827aaec5613797b33e2e6711ef8c0c492870a876446835f6e8329bea415556d2139d9c64736f00464dfbf3a01c51388003b948cf3f765107b315b90cb86eff0f1223e0dbec0f081d62d12f258fad002f9713ea790c4eda3e643b599ce1b7cf7969ea3be1249f30acf25be5d3f6cc0974bf35af86241d1dbd8c75164077e4c8a71f92bca07d2f7f4e106cd66884c6691906e174088647742971da511ef374cb7785054d4018c64222046b78cbbe40049250ce82abb095be00baf5fd3a54b51a5af2e09518b8a92bfb9f04b22a140cd74990039d7acbc52f16c3d5dc54439ca9fdf7a534a44d512196f28b28016a36b223c8a3e53835d75b0ab3e09bb6a7f77ebed5953a3c49cba473c2023da0858177b4178d368439dfbbbb5a1e636ccd2400dc6cdc1b839183707e3e660dc1c8c9b8371732de366499e72f454f569d83b6b1bd668022d97f622ce5ac0ae81b3ee39045b94d98cbab6126647d6216c42b8f816c56c77458e54994b26f1c988e15f8eb48c43b0878fb930404e34e6a0166f0a7f6de4fef1ffc25ff2f805dd7351e24436660816f62d370b420c8fb008823bb2b3b8c5dc17b2b2f79acdb4e500137893ec477ef9e5979f4edf9fff8de8f7337c4ddf8d38a6cf915f116cbcc85f664fb9a2d33de20a244d3e12356f94ea795fbe7ca951f3ca96894a931a0cc7749f1abd227b1532a8b4ff74dcdc309871e5f920dfca6fde060bdf6192f17b76ec7d75f4c31ef7fffdbf5c6b4b29a66cd6823082414d1a521c529be85e9426386297e48e81026092b8ec8d455a7dcaca71df5fbcb14e7f20fd6670cb988e434c2d0419a2a3fc28fee5d52dac82a3a937c185aed461dbaea97dd05d07dd75d05d07ddf54fa4bb3e25ed7595fedaaec176d46137d562d7d56337d0641ffec0b34e4a12c3ebd7c311d0d1882306304a473f117e08ea10a84e3e89a188e8610f94fc2d3599de1f8e6a2d81f46356ea2b394c21980114206a014a0a54c5bc379ccb0ee7b2c3b9ec702e3b9ccb0ee7b2c3b9ec3ae7b277984c6afdb9ec9789c50c23e7c13b765df87dc7c35ad8d43b17fef49ec9f9a77272cb25979edf931e650fa3e26121f226885e892549bc65380e4fae19724c59714513c98a6a3a48d15cd5167955698cba702ccaedbfa399c927c88f911903df89bc29cd548e26df71b70110f83480d6915f1c08a2f85001a58a8ba229958f0eec03a023dc04df1f7ee739dfb1bc2c20626728bcff1bbeffe87b94cf7d277cc7c5882611a1d5d174a9f1686f94f664f4d0c78669459b9e180ef1778323eee0883b38e26ee888cba5534c82c1e6c05c6f425cb7036482ef73e0f985f862cac1dee039d15b7c1b44d97e89bfd77fc95309c07a983a852f8fba29448baf2029415a9c9242fbcf74b348377827d9081345c14914b9b764b4c98b6c43997e01e108830be21fb40a3bd176535733409701c26466bfe916f14d51472c6c4849c952239ef30e95c8f12c21ec024d494a35581f98fccd3b198d2a6bbc7597fb977f2f82f8af9ec3fe8eca7babcaceb6d75e37d5d2184094696d1f426c7b513a5521a147fc6601aab20d537d0e0411550c092039c88687685151d209d6073a1cddf7f3e52d6d116b51a69017c78421dc24145558b8952e5572f425d5260bfe65aa9f93f47ba7c8c2d3535aaa6c8c0ad3fc52ce6921b43df93465dba4b40ce931297438eaa5eb8eb8948382f279384a19eb88a3a991fb60323dc72cdd47d9fb724ac0405672ba733b8aa2c0f692242c9423be5febcacb9abb3acd4c8be62a63bc5605b471e7cb3782d2d35d76c60c33ff28bb07b6700b5b08f6628ffd29b63659e2a51543051f6cde8a549670d6ca6c1707322b515e5329c916857e3d7db37a4bebacc498e1233127e45fc9ae3122bb3fbf60922b77053b5efc8be7dce0385989553ec810965f664c63bf52787fb934b0feac8ab20480e6f66e3e499efdac3b300de6f3e7dd832a853fc1be248fb52be500d81becc98a4283bee13c5075bf32437db650d334a5fb4da585ac34a5cc95e5c5ac3c2384950052a13915ce520505f15ceeda412255a352de27faaad8475c5237d17c3ebdbff03fce9d4489dc6f86667d5e1f3e1983f5112c8d495754640f591e1b429964c7edf9a5f1cadf728502745ea02e3317cb40370bdffbf70217de913cb7414c0e82cb2fdd5a49d05415dfa52abeae2abe4c9dbbaa8c4debae6aabd240618e6ba6b4d09482f25fdfd4f21aa17b311cd995d5ba5c3e5b159d21f275d019a48ef2eb808b8350d3e196dd7c9a2406233bae8c51b2768ee88774a7f07ff8e49f9735ff49fff9bf23aaa48d8e69bec112ef6aa82e6f07d5dc9844e022d001932cde3cd9f512102614a8711ed44ad85bbd09be808a4c8a366d66ed60ba98152d22fb75b5156907840fcdb7438d10a59d47f085bddbaf4ad4ca6b3a23f56860171d84d8c9e7a468760110728ccac5c114878865247fc5c42179bf54d0f3bd78bff6ad4df68bcc40cee7082a5fea0049f6f0398a6f5f95a1b2d74d95bd3af88f4fc76f8eae8f3efdfaebabe51a0bf9ee10fd102de6740448f396de152b0942d863048bf8156c12615062ecb0675647f6b50842a6b56801833de6857f1dcc8bdbcb45844f5114d3b3ecaa49ccf5fc4495ff906ddff3325f280d165e2c191a5e117e72b06c80285ad1aebdf92b6af1223f8673ad35ceb53e23ff16c713cf14441939aac49bb2a660d8a95aa26939b26b62d992b0a46bba6ec94ffb602bedcac39f6ca5350d475bc3d1d670b4351c6d0d475bc3d1d670b4351c6d0d475b4ffd68ab97badb7eb6d50bd5f33adcca34e9e1746b38dd7a92a75be15d309c0d7d836743645e7b9c0d3dc5a31eda85e1a4e6e14f6ac840ff79cf4e52321b0e42868390e120643808190e42363b08893c34f1c2cfc8d45d076b02d64cd7525553b6158bdc9c269aaeaec896ab399a20e1a77d109276e5e10f42d29a868390e120643808190e42868390e120e4d91d84dc79a0f7807ee19bb305a822d17030b28d8311df9b79a095848b45349c903ca313925e7a70fb09492f54e4842487e80dbbfa6ca46fcf124bf372936a4e45fae22e1c8914d03ef5f390aca9fd0f436a07afe349c8732058df9ca2cfded2b3c32ba22cf392a9098e6dcaba0d64648b9669bb822a2145951dd493787b205e22e16a23db08b9573d75e4cc103c21a20e40330479d240d2acb91b1076dadf6f89bce93c25ffd545499578249b2e120c539690682241974d4550b18c814c4483ef44caddd1a504cc20dc490dbdf64156a0520ab603da245bbb4389573526c0cf40787b578bd04536fedf9b7263fa9efde4be27eac30f7de83619816f8e5a6708911c4fe5075d501d5144862922e2a780808b19aaa598a2ae888e83644b040ed79976fb602d91700ad8c680d7a8a14ad709f4d3d7278aadedcf79cb7dfde60839c25340b3882a4fd8706c5d7224d315c83d353ce040866c982a0863d1d6b0a68a3dd8702fb4255ace20571273cf3aaad49c823f13724e9bbb263de7bdfdf6087a11445e4ed0e9932cb88a6ae892a9f3b260caa2e498166faba6a1615db005911734b70741f7415b26e814723541f7ab6389a013f0e742d04973d725e8acb7df164143a7623cbd8fd11cddc68b19aa7ba5b8b2a1c9b26d1aaea19932d615d3025515765008c99a2b0bbc617724edb570e7f4bd04de4ee46bd656a2f42a8e67af6d573b94aade91f799b8ca783dd5efe5f1f996164810a1e914b6db8b991799c47816de790119a568b1f07d0f7a0e54d5a910af48bce5189269231b74604305aad310362549965c5e920d5d173b2da2add5962eab4e08db16da165b54587a5db03e7dd9d3a517fd4552b7b1f99616e2dd220074c89b2c4008e70cbde1b5255b96ac0a8a894123376517284e9761ebe9c82eaf23d9751cdc4d626d803f5d5e0d28da16d446b51696503d9e672ec1ea3bb591146b1aa72716ec50388a7cd64103771ee80c08461a78d533ef0af3218a318ec9d545cfbe3b312ca2187d4693e096dc66877df31be8d4925fc4b39e2110fc984c09c9dcf8cc97cef30eddca0fccbe81354244cbf34eb348ef15c37140fc2927cfbb2f331cb3be4c1677e8d90bc8a5a3e567de9db239f09be84c6aac7fe69de9b42bfe16262c3d2dfc5618c373ef48c3fef1d993da926df75b583cdf6e8c7ad13ed02358bdb21def15b6beb4fbed91dfb871b3b912875c6c7bc5e77d15ac92d75fda4aad04547be502d0f2f8eea58dc24a60bd34a5abcb1b7926de8a1abc9a0c72f2a9aa9dab618bf1f2cb1e842bc14bf90f2aa7ac2b81a565e0cce76025b05c04ee664c5f8953596a50e6d4b31256ad1dc80e805a11b0c98cb9128b5e6efaf291de4a0cc652e7b793c3a2c4d2d64f465165719ba4b5586679eb636b66811bf5b5c21237685f99456e326c1be5225966a1eb23632c75831cf65516bb3eaa258ebb51ba952506bc11b60a3fde02ae8c3d6f84ab1bb7debcb919f3dece9c6c88a789b56fd8cf654ebff9c0ed30d3cf3632e21425ccaeb2f054c4d1ee92ff2cc9ae5d55dd28e87638e465a9b8b39e9744e8fe3798bf6a4938efef70e9eeee8e938ad8df55bd551da14bbdc2daf5b6eee87698a4acac7decbce25455d961c59df49a5d0f44aa04edb0de5c63da61a50dead54e877b4917dbf5646f3f196075f7de39c75fcd7ebd477ec0da1d7a67f8d63d799f1e2cefc2bbb76169dfdda3fb3d1330d6eead3b8367bbe9ee775fd5ec9f3b03d7ed98fb648eacdb23f7815fde15f7872eee83fb4077def9f66e5271afbbd668f6866cd9cff66b7ded0eb6f7000c49448724a24312d1e79144b4a8540cd94477944db4471a95a7965334cd9752cc289a48ff9de51565f50dd94587eca24376d121bbe8905d74c82e3a64177d1ad945f787349d0f93a6737f9b918f54897bf697252dc2e71dfcf019859f31b0d2e7ed787e3f8545144c9e79f41c30c9f81b883933b1fffcfbe07acfbf0fd1ddf30e9943284c128d3c738a2af4e499d355a127cf9cbad861d373a7aca417cf9caa925e3c738a223c777a7f8b7d78f5acd510d852c3aec97ceeaaedad8743144e3c6a0e1e12440c793bfe1cd92eb6137798efce7b441d128ed123d430df7bf68830ccb77a3d420a939d558f40c27423d3238430dd37f488234cd5f41ed18365adb84718615909ed15445852fafa8410e64a569fc8c15ca9e91332982b117d62058b42bb4f3c605148f689052c0ba53ec1803d435b0b0180fd036a4bb17fdb89fa2b3094f5e351e868af0f5e6038eb232930a0f591a40c69b39037bab03644e17a1ba3204b6e8380b93243db0aa2cd3a55e177eb232ab0bf8d916cd6a50273dc6cb2335eb901ed1759e7fa682a9cf40904c46e334ab74f70ed9388b9cbf9fbae7cdc09fdecaaae5c72ecaac65cccecaac64426ed32d28bb0c69dd6e77abbad0f18eece82ca4a72f4116adde1d89625f4ae6acdc5f98e6bdce1c8e68ac22ed749aa55ec8cd51554905dd559d6579e6ea8f2a345666f3b467a5b116fe59d6be7389454bded0c50de9d76062bef473b831576a0bd02c3d2dd4c3f20d75b0328d9ad740f245bda49ae03dab7a9cbbbc5cea0e5fd615fb0be0d2def017b4d4571d7d79dc22afbbcce80cb3bbb5d04596e16ddd912a239c49b0df16643bcd9538a371b42cc1e36c4ccf16e6096d19446daa3e9640193043299d76551914553511ddd941ddb3275055b268f044de1792c8bb6fe8403cd6a3bf5e0e166b5b50e416743d0d9c3059dbd49492e8201445c42747ffc3e9dfef13b2c8c7012784436239fa3abf12549a8411689cf51620d3cdff77c8e44efa3bd21806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b621806d08601b02d88600b63f69005b2292b618c7d61037560e6fcb42d9ce60e57aa7d00be603fcbf618578b3f9d473efdf84e80bbcf939bbb4ba2e24ae53f45b8af19484745154cd516f740aa286a8b5946fac8e824bab3c9a9246c4b7b3e5c8bb4a3faf03d6b43c268e8c4a5eec2c83152af17ccd117705be4aa2280aace02bf4ea952419bc66ece9bca229ba24f0f0afa008c6c13efd9a17be278faa6618a2aeedc9862a199228e982218bbaaa8b07fbf7e5e25fa19b04b7cc0b7b2a2ff0aaa0eb0a2f8892206922410e9f8bc8e1912057046dcf10245911045100108de729eebc34aca3523f0ebedc44ba5cdf3751da039486ac498626a806afeab2dcd031614f346459e5455513445d911451aeef9328ef419b0459140555d505995745b9a13f04a7aa2abaaa68b22af2864a86b5dc979ac69388c764fe3d7a836b60924793c4ec9986832d2cdabaa921433665cb104c5d3424d3365c8465c710b0b2dba04712b27428f1aac6d676752577098a24cd0196e5d0b0c872cf47dcf759df7f78e8d8c872d57b59c59b86477eb8bcf8afe3cbab4fa393ebcb2bdde0f6b9eb334979fbfefcfb93f1f90fa3f1eba3ab93772717ef0a6546e393f3ab93b3d7a727f06641983af2b96b1cc212270d9c729769240277751fc578c6090660c67e846730a8a3f119009f5cae047e1b42a728ece8d7be3006bf068cb0068cb8068cb4068cbc068cba068cd6174624d2a63f8cd21f46206370727afafec3d5c5fb379f46ef2eaf0875f0a3b12a693ab0eeb168e87ba2a289c0fe78617c7a72feeefae78fe7efaf3f917bb743a03ce1d75f33e23d3a3efe787974fcaf4ffc1e79fde1f23db407b08618fb5f3cfb7634e6c747e7ef4e4f180607dfc01778b9c70b9aac48a2212a645e24098049734e3e5cbd1b8d6551d1e1c5f1c5f93f4e2eafde5f9c7f1a250b8ad0fdf5cf1750f21ad4d1e80e8711e6ce706823a26f1450409734d2a0a3cb23802003748ac855f00ee60297f351bc20516720b46f3cbf7b230b15e83a2f542a08fc9bc61a446dad2ac472155435e05c44b42b0ec5cbfd006968a8e3abe3a3b4a605a8bbf764ceca789532deb7249093c3a07e9200adb142d59ffab92fe351ebf0f820546e29a24e38609e60aeaf3e1da330c69187fcb1f8ebf8e89fef81577e7f02dc93346b7c71f9062a00d006824cca136e4bab4f00c446808f5747ef4e3e5d1d5f7c201c1866cec79808342e5a8477f87e0c5b9e791ad60a1add7c0edff660ed1c5d9e1c41473d7f8a7c877bc9c17ee916f64f1c790a5c973e9072af5f5ffcf393a2efe9f25830f6787dacc1641b6349d8538c12b113d1faebaf4d11f63f923f878b78c6fdf85be0e34349e17ec4d3e93c3a8495abf3dc8f7140358c437e5cf81ff72399f7e810a0fcc0849d73d41ca92ff05273b03e695c73bc3ee9c04facc88ac0fd5ac1d8279a1f46a077403f6d9ec6139d6c88ec7fe6d7c90e2ad6a0620d2ad6a0620d2ad6a0626d4bc5da8592b54acd6a57b43aaa5a1b295b6baa5b1b285c4322992191cc734f24f33c12c78484fa4298f13b3139998980d0a7f8ea7e660553e843002b2304e69f9c69b21e04e48cd362a70e112d39c577785acd03c33e55d478fa2ea96b4a4f36681d6678cb6a60d4498e4fa7f35b444f396ce014661c986ce9d213c60a6f839544f82b390433ebb2e0d4659b3943f351b5c4ca8c34695c2bfc77b4df0ccd4ae52d692b5b5f934dc694b2d62ce211ca2de339d8bfa863d8fb9d868471276e8e22e6e4340dec49429ef694bebc22a74e989d4065d42b8cb63fb2d9cca3a977e39b0e8a6e4d60e840777effc18bfebd80ed708ad14673cacffae351fe2a664868d624d2acfe68a4af3f15b482658c26305e93a80a664474cbfe159c9dd5202508fba3ca9a579c0193285538de56cf6b506f7108eab06f3a1621fa62825807716fce83e9fd4db006515a84456639868896b01e510ab23036f8b1a0486351515284f468109806ecc0fa2f97609a87b451446b368ddf13d5129e2f9e13df6e329939964de770bb24bc75aadd0ea192b7a6eb4d81f637c002af6726c9528b7c10cca0216c6bd496106f710097716f3896658454e97a9871a0a81f6c2418f64dc7e20b4613b3cc597d6037a18fc36803bc8b0898161559e636452b6318ab46b45e75621bbf3977479b39e9a6906420a9e63169533bb2d254bf98b42b1759e16a5727bd54880c0da193490745a1320a9dd481b6b6ae23f4ab8dee2edaabadef22c0339844524f5ac57456ba2a8f27edc2382715267527ed2237ef0895ad9376c15a1db095e2b3324eeb4cec9a73d967fa5ac55aa56c07e1d5d69bfe22aadab1ae82a8b5dd0de2a67bcbbb0995f6b6b7898e6aebfb09880af44a31d0d6ef8eccbea38da0db5e76533b413f4bc1b66c052d22afa3bd60bfe0e99bd95da945a774fc5db5fb1c84418c2a097d0e22ef374c27ab648bcdcc51dd731b37cc54f92b4d3d9c6ee716684a7c9c977d9da3aa65a975dcfff2ef4510ff953a09264285bd298ffcf29857dfb4e464b6a6302267c41b9d3fd8cf1f8aaee98b10bf2e965a7a5732455fcc11f1be2406d5d2f390047a8324d0454ac7535a3f9796213d26850e471b79f48eb8f4bce16f2452253d8618719eb32166d3734ca0b938b89f44de6412941f6455d45d51d64cd9e01d531678d144c8924d0523c9c2aaad615e33891e93871e1e4551607b88f1234a64ef4918525fac192f2b02567d832b33b15635b489e74b758d38c213afe8d910d0c7a35c17c3f849c13d9abdd8637f8aad4d384f695dd1c3a34bec1669f16d1a9b6596fb9a0fe4dbe5b051c69aa7e5bc69fb4dab601b99d09f661eb9cecd2fca846fa1239e1f3ff3b4846572ff667314d6a5266b4e4e5822d31e590a0b54d1234de112cfd9460eb53e498196a1cb03b0311e3a209b2438aa0cd0ceb21d6d3bcfc003e752284ddb8e2b2573bcab2aab04b1f53c0e2d21dab5e597d64b5fc87485f408225f5e134344f910513e44943ff588f232b378dcc0f20f84f10c31e5794cf907c689b71254de10ac4c99bda92b0e8f2dc53565db41b005b775537744dbd464d99034847905a1478f5666e4b1a54065daef478954a6350fa1ca431ccd104733c4d10c7134431ccd10aa3c842a0fa1ca43a8f2a0620d2ad6a0620d2ad6a0620da1ca43a8f210aa3c842a0fa1ca43a872af50e5190a27381c82959f7eb0f25932533b0a572624b88508e575432e45591a0baa3a1634bd180eba6624a8905d140c2a22a80f319a9ac8b7e169d9f361b751afb617da53dc95a41b266dfca78806959431fb7f811e8245bcb508e114d7ba41c2553c6b0609374c4511e93667a48477bd89713c40456298d25bc549a34c78751bac11629ba526208114db1a3e826b8ba346d1ad3758192bba23c2c05ec988ba4673d6f3eb8600ce9551794bec77d2c87bf380415aaa33875d332c31659893266e990fccf88906ff9519d9642517ab09ad5cc1abaae18fed1ca975207af19da5f1e8c05d32989c8d4c56f1909c4e59e15a4ed1d6ad4efca0da9b96555f59045dd7f610bc3704ef0dc17b43f0ded30adeebeee1d63b7aaf3bea217c6f08df1bc2f786f0bde68ed02c8b43f4de10bd578463a93787e0bdf2780cb17bdf70ec1e9de221746fbdd0bd6c7d0c917b43e4de10b93744eeed2872ef6a11bac8c643ec5e31762f61e20f1bbd472b314559462ed66dd3764511f6e0b264eaa2ed90ff48b62c8ab2683dfe6da329916c2d828ff6fd9162f868dd4314dfe0623eb8980f2ee6838bf9e0623e44f10d517c4314df10c537a858838a35a858838a35a8584314df10c53744f10d517c4314df10c5d72b8acff5a6d32186efe9c7f0bda5f3f4a0117cf5f12f16a5b42d450f0902a8018a321604610bb179db8aa41ba2e09e44145ce1aacc0d03e1b61ba456ea6453d8ccaa58ab9a48925e2b2b0f13a92ea10ef155fde2a486e8a7c2dd725d03a0d6095bca9bd5d49c21ca6788f279c8281fcf8f87189f21c6a7678c4f773f9835a27cba231fe27c86389f21ce67b8dd6a88f2f95346f974ba6beb9b8df1d9f062ad21c2e711227c767951d610dfb3f6055b4374cf10dd3344f7fc09a37b08a718627bbee9d81e767e59e0075fa163af24c9e0157d4f55054dd6345937544991645d3ad8a79ff3d2f7e451d50c43d0f83d45370c51d23443d679413144fd60ffbe5cfc2b74952087edfc9e2a40299937745ed45505e00872f85c440e8f04b9caf37b9aa2f392acc832af2a0a20d008f2bc382ca7524f0ea8ef4b7def4469cf30145917454997655d864e36f54cd8130d4926152b92200b862e8bf59d12e53d9e9724e83baff1b2a1a83adfd4218253934555e14555553411c6acda979ac693282c2f8a17f1223245d342aa2bb882634a0eaf9a3028ae6908d8301d41525cc7327415e39dc55c990b10f51d6c20a3efaf4e4e4f8eaf391044a6bf985938fcfe072eb803d6007f8fae388a68fcbfb8b79717675c5a7832c9c39ec6dc64cff7669ee97aac50c1a0b2c7fa13dc3ad0ac09940c0268659c7e982114a2fbc89ca2cf1ef4919b70a7276fafb98b8fd72797dc7f5dbc3f5fc6958070931977019ff73c873b8407f86bd6a2fce5e793cb93420b0fb9efde9319c3710ca539c2aab1cf0511faee05eb6eb4b0fe6d0ae68b1f8a61650f1e539651d1104136b8370feecd837bf3e0de3cb8370f11644304d910413644900d2ad6a0620d2ad6a0620d2ad610413644900d11644304d910413644900d11644304d9138d201305692ce8fc58e58700b221806c0820eb1f40565d4143fcd8103f36c48f3db7f8b1fd2112eb1b89c4dadf66f809752979d6410f8937c9b71becc0a6a847bc433a225b093e486a5fdfe93f6bcdb372f667ddde952b7c3a465b7781cf67afb35b7a71be0677f4c11d7d70477feaeee8830bfae0823eb8a03f2d17746c938b473564ba82e298b2e618a68574c15465c79278deb190630d0ee88fe3805e682ff71f87dc77e71f4f4fbfe38ecedf3c1bdff4c1337d709b1adca606b7a9c16d6a709b1a3cd307cff4c1337df04c1f54ac41c51a54ac41c51a54acc1337df04c1f3cd307cff4c1337df04c1f3cd307cff4e16e93c1357d704d1fee36197cd307dff4c1377db8dba47ab74972e63f5c6c32b8d30feef4833bfde04e3fb8d30feef44fca9dbec42ad8bbcc64038352e6be1cd5370f472f81fc6e3dc7c17e6549b5e2c8e6ab2f9664586a0185b220acf46a88111862041e3c657d4ad743b0c09f355840de335449e5798d57144594745e690b1650d53d85976449d21541111541d764a3255840d9530543940d499579017ef186d1162c20ef695050d4145d966459907555de38588037a08db2262882caeb6dc10292aac07f055e9655596f8b1590255d97644310054d16c4d65801952225f105301c1d6305a88fbaa98b922af148365d2418a62c21d144822e9bd00d2c635e1101edce2205c85d7de44cf7909cdcb2955c5ab71d62080a5efaa33df694b8c83fb8773cad6cf08d1f1cb706c7adc1716b70dc1a1cb706dff8c1377ef08d6ff38db703501aed32b152d5e960bfa841d1f74178837cef3766773dd82f3d96263c88bca44cf6b3f8fd2ef06caadbd1bfa57b9c416b86cd7751cb26b43043de94ece0e9dfe29730a05da67f4af6954aa786108041931c34c941931c34c941931c4200861080a7180250a75a1053323bbc0688c35136a023cef16620f4c9610dbdb31ecafd969ab1efd31fd99bafa959fa7ef90cabea829d0e2f507de02c1de837fa7c37f97db3fe2e635bf6fdaeb1f90eb110432cc443c442dc79b07abcc8f3cdd9621107d1101b31c4467c2bb111a71ef1e57ad0d8886ce6d1d4bbf14d0745b726c82ba03bbfffe085c1c2cf9c2f6c345fd3615ef9abf8577eaff2df0c2df5d024eddc5630438e718b010d05a4eb39e767cd2b4e89b9dd308e1ad45b1c823aec9b8e4588be9820f7411fa039bac859fb6654ba41748d081b3e511d8b7a31ee646b41279b459ce825341b479b6c1c6af2a78843ca9a45de9a206481f237c002af6726c9aa877c90d3a0306c6bd496106f710097716f3896658454077b9871a0a81f6c2418f64dc7e20b4613b3cc577de036a18fc335741d21c5bb8880675181656e53b0760c005b1561c602b0bae8271948c2e2276d5a4856b841dd98b4eb1a6dc1623d348a6a9cd54abda1322c9db483b6b6aea303541bdd5dd2575bdf459ed7cc6a9768bf8a789eb4cbe69ad8b58ef1747a5eb8632c5df740ba271aafc8aa68957295b21d64595b6ffa4bac6ac7bacaa5d67637489fee2def2663dadbde2649aaadef272ff2505c0abd522ab4f5bb23ef1fe2408738d02dc7811e5f1c9d9e5c1d9f7ccfe511a1ecd798fbee2fd3f8af2445f4abefb81faa5331a01dd0362dc772459e1f2f2be7786661c7c1ce2f4900870dda4a854557b1008a7cc37f87426ab93f87a7680d381a6b129583939e6e78f315357727211ff76f3c7413a2d965c268b82c862a0dfa15c829192dc302507e26c9e6c963d1ee9d6049917211a9d3bf21670a4910465550cd3109644b020e29dbcb0e8aee0f474721464978c98729b2f10cfbf1198e6f0368d03f7fc6decd2d900151e6ae80692681316779c8c81bec0733cf276e0bd001fc23af679db8083dc0951c507c9cd3833d6fb6981144cc229c606d68b7e3854cb494c25d4a15b2de1d31633ed5802d644f6ea80e7d4c74e0c3d17fbaf49f5171a05817f2a24504514df84c5a518a328db6894a4312b0d9a7f39884d409b4456132fc0a8368e86ed23e5aec968e3b834f05d805d55aa1955ae5b087048f1f7df5a2aaedfcc00dfc388fbee20a47d387a32be447dc150e3d776c8c5f0a6365ac945bc3821e2b4b342359ceae0c05252096b48b9d5e5500a17d571569bd7c6433a547017547367d4e6c068d6b2b1ad7164f70b633ce3d4f71561aa2ffbd4021ee7290d3e128a7dbc1cd0e8e6eb67a78b3ede39b5d1ee03ccc11ceb60f71b697246d9dfc61ede7385b3cc9e9933dacfd3067abc7395b38d079e0239dad1dea6ceb5867bb073bbb3bda7988c39d6d1fefecf280e7618e781eee90a733e60ec73c0f79d0d3ac76ad75d853b4d927faca6485d749e1c467e5f9ced64e78d638e359ef9467fbe73c9b9cf4ac77d6d337b7635b12c515ae18fd0e7cea5228aef0ade87bead3f9dc672b273f3dcf7efa9dfeac73feb3ed13a0f5cf80d63b05dafe39d02627419b9e052dc177f111d8f83ca88f7da2ebce79731b455f2bc5f6ec14ad22b3b3ad62f97ca8ee8488e6aeaab1451dec57ecaab939b9d5889b154bde5367f62b1c93f8a38823444c49ebb7f75952bf796a64a5b6acc002fab693cc3bf3d0234979ee33e36866904dd21e0a7a62ed9b4ecb669683fa8159453bebd34c575ad99c46ea129ad6d8f6f7eb26e061f38ceeb7a604ed743448be263dfffb4df42e69d53b34a735b4ce96132c48fc6c8d716c1a7cc10ee0885e2f5c77597095d15801f1c44f90d008a11a4449dea67e935b83874eceeae95d1ecc5da6572d9e1de3299bcbb40c49284b0a2549833aa54222eb9a05f7fc8de4294c637e469ce7a468785951044d114d43907953460e609625dd54c93dd1aea638ae25999e0342f1c68b1122acc137d174b28055801adef22aaf2986aa999aa329a6ecc8aaa9bb8264ba92a149966e28bccb9b4427ccf3511e4551607b88ad47ca4edf4313ebd1635e974545164d457574406f5ba6ae60cbe4117484e7b12cda997b6e3d8624d15265f837ab8f36fabcb9d21147c4c9150dd182220f918c6a65be2976389bdd25cd1ef7d89fda4627699ecb473be494e512bb45ca4c62859ae8a438d459d1f2496a4aef4f7809b0d2bd605693789f9e309266107f6b20e13ef80a249bac880727d1cdf2a525f49b274d2b51307dcf7e2639d4fa10ee124f78e6844aef71cf7f21a45986c66ba62169c89435de3691a82260d182664bb6ae483cdf9d60294a43c6225279d5741d4d346551724d0b898a897524205db30d68608968f32635116e0fbc55e225a04f9dc7660dedcf570b7dfc6648d43731c9358310ec3c6052ea5f5a9263191809a66238d03059b3811a14d714306f6141362445d4ba136e15bbae4a8a25400311af39a66c606c2245d14d4574110c07afaa7299f1d6b6b9899cd7abad4ad9152ccf82c82b6d5e93de977afe2d907ee04df022ba43de6411c7d88b160b075425caf95a3e6948365cd1566105e88229ab023291019569926b2918da6f896aa765d0528721f1b6a3826e8e15d2032c2930108a603a02b20443150dc1c8b6682d689a96c4c63517164633aea7be3c9a5bde7f91b48dc237b15422d8c1c3102e665e647e068a0fefbcc0f363d253dff7623c9da16e855c9e1790ac8312216019080c4489e58a92a980e269d958c18ae8745b3e5d6ae3419bb21c43326d64133eaf4a26d210362549965c5e920d5dcfdc763a216c5c52db6b4d717175c0fa849659c376a04b2fd658729dc6e6292f3ec1b05c451724539535d7945d47300dc3b04cd9866d99e3c2d2447a75bbdb11e6e1b6bbee048868d8eefea9b6bb5dd0f4354d76b1e50da6c9c134f9cc96409157778479485e3d30ea8151375169c52ed9c5d837d82507bbe42e49b4935db28b2d6fb04b0e76c96743faebd925bb58ee06bbe460977c1676c9ce4b656b76c92eb6b9c12e39d8251fcb2e49ded4fba86de3067092300206295c2ca21577685fe3aff109bcec7597768fb4adcdbe88ef23ba19a4f1e1fbeba3f918e19fe3d9b47ba2db87bebbfccef3e2182d80627c7f18fe9d0f3fbbd128c6c45d78988247998218786c8c3ea349701b236a141c26e2b1585139c57cfb04bc413126b71def6402e27051764b37fdc574da73f88b4848608eefa0d09c07f3c5bc7f2ad07bf8e7e5d9d94bc7e17efef9a7d9eca728ca4f142272dbb4492ee346f15651d389ec8cb899f6181e2f0a1a713d1a3780d9c564f9c3ae050d143850e023a80483e4d9f190b33dda20f51f47ea87d8039e1b2fa6813930dd81e93e0a15dededfa149743ff322e2143050e140858f23fa1bbc53da89f132b1d6657794ee9c2a8f08551e39ce5b96ac34da647a282e9232761324d09bf49a369bd9c837407641ee037b7d4f33bf6e82e71223e7c29fdef75f153506ecd92298a0385e3c2937acaca32563f19bcc14bf46cf3776b0ab34e6bdb3a54634e03f5f71775a7d0df931542dd20ff991557fdc4f20c23bedd474e3b578751b7c790b6c7b03e947505cccb14fd0bc5ec471ed65188f27015a4e4d0731308881a72206563a0a6c5f166cc937640b02a1cdb3e19b940a0f1cad38c887eef22177b57c8ae26099870ff2e04f210faacec3db67ffebb9766f81db179c9bbf49e6be51a2908175f750edbb78670d4afec0d41f81a96feea6f8000affb6bd59b7a1fa77f2b0fc363701bbcfc3b09174a94a866f58b81017dae1e8fa913663d538a0615f3688f0a7b52fab8f777ba02dda26418cdbdaad2d85e67dbb1bb7eda6cf1bb6735d7dc61677687017dbbdbb58006c308a5040bcc5a693c5e0a733f8e93c2a114e83f97ca0c2810a774f85334caee5c5713088a247ddfe3de87e6f7f4bbd4a1eebefb440530f45c58b5bd81bcecbee8c49ee542e46eaa6f722ef378109195825c87425a49841d6c447ae849632e8c6d0be9538e462dbcb51692b6195bcfe5230d14a40b5d0edd5a5b5ac74317c6125985ee859d5f37e25b091012f3b4cafa607bed03fb3d5a7ae05895044b2da0fa3055391cacca533be1640a9d4841ef6e0169c72698d750050965adfb0e76dc191135c22425683e454b7a489af06d66b819906b51a3a27beaae45bcd50f8a5d15a063ad8aff0c183e4169f22634c5ed53244fc751ee2885de634e2d07c3ebdbff03fce1dd0fe4a17fe2ca3a932c8f531d531ccf5b13533d08dfa5a61a81bb4afcc603719b64da04b0c7893915962c8eb23ab61d09b0c4f13bfde08671bfbde0871819b6fd6c04ecc7dfd2a18afdfbcab4bac7f035a4e58ea0664bc2418b6832b9113eb235b121b9b0f7c771c07fb55694214ff280e81af96244cfe962b14a05a38d465e619a0e0c5c2f7febdc0e5777e10930d7ff9658db8dadf519d15d9b6ab6a6b04e1aeaa6e949a3b1cf2b288dd59cf4bf2b84bad52975a85ba5a8b1b819d75b028e977379b55b56057352feb10bb5bbd0d0ac70e1bd0a29decb015b92ad3a55271ede5c4f7ded4eeef5068ed7cc4ab1ad5ce180c534d76c65baabada6354cc14bb5dd55cd502774d594595b046032cb4e124532d1bf4c306230451441d1cd9158bc832608dd9a1336c83a1a1337cab69a14f0f968d09dddbb0643ee8d1fd7ee5ab26821e3dac330a7406af3703f4e866cbc6bf0f96155bfd3ea8ca9bfb5e8de8ba9def8c34dbc0f7ee40dd96bd3b35e51bd8ee8454b72d5f0b3adf887706afdb7af71eb246a82223ad619a07f91e9d628c724014c7a1672d628cecb8c26793edfa11fd909e48fe1f3ef9e765cd7fd27ffeef88faee8d8e917f87a29281b9a1babc1dd4a18f9df1715110c6d499918a1106c28ef9aee2fb29393e0f83f99be08b3fa2454f8a9688d2804e17b362d7b277c909251d94ba64bcdc17cf2142ec25688cb79e032bb6621669c554952e1b21ab13371b216c963f9b76ba2290366b6559426d38841b2228c9b00d476949a86d84af46ca6d38544d626f53b46d727053dc05c1b871333b49caad347849106e849509e4cdc83c11519b51f892b4dd1aba44fc6e846f491ef7c59608b05a40a1370dacae9f88f892182b08d382cc2ceea21c8f34114d23222c8b923d0cbeb077fb559f9fca6baa57d4a33988e220c44eae5914a0883b0e7116e3e2600a4cc38fc990bc626e3ae4fd52410f56d47eed5b3b005d873ae3bfe27304952f7580ae37c57314dfbe2a4365af9b2a7b75f01f9f8edf1c5d1f7dfa4feee5ff7a09db60c7f36f7ee216b1fb52276f5e8c46a3177f7ff7fe8a23601167239fbb45779843dc87fbf816542577e1339d29be4531e79122c0ea1deecb2d26ef300584f72f8239f6b1b3f7e2c5c708c307289983061c721cd0f740a9e3a6c18d679357f7d05f562d009df8310e293e424b5ce032dc29068fd5354a1af51efa977d1cbda0b3bdf7e2c8872ad06c3e258d22be92d14fb47f6e18ccb87fdf78d1de87fbbfc77b7f4fbcab22ce9b91780deeefecf9c50b5012b919f35f344977be773c04cd1db3fb2ac69ccb226c7ef8e9c5ff2057be7187e99b3df288e3f0fefb1f5efc0fa0b2380ca6f09581efb99eef1cdf7a53e7fba4a631373abb3f0559445df87e78f1ebafaf96c921bf9301eaa0c3b49853f224b4b3f4ae48014108ed0d16f12bb294e82f863d7bbfa4a79ed0af6f0bd4bcfcf518ba4554ab90636bf73858b0b590acfe6b1a6ecaa108cf106503510c9c20ba0dbe9c220b4f69c93bd0a52c6feac5f7b97a7be29305ef50adb8ee3bd922dc84c162fe3aa0de6b2566d4b38d57f77ffc77fcc7ef1c13551c2801a0d0d2766fbfa542d533b03adad42db1e0be5427f94b8ddaef8150ab55f3d646473c9a8a22797d446a5530af8f4a59a97cac8dfba5b08c7b8a40c87e6ec55a10631582dc846a3ffcf1bb77f7c7eff793083f3a9d6acd2ad1fa13a9b728466b63959b37716be3541a76726b23345af63c6b23d55b3666bba6dd532ffae3f7a7c162858e1bb7f5e9985fbde35c1fb9d1a8edef7a4effd62852763da7629b4169fda16eb279ad8d91afb5c7ad8d4e5a6df6da8c263a9559876a667ffcfec7ef21c8b268d7aa611ab801ba3cadb2a41fcd406540f791a90baa238ac83045c43ba68c6c641aaaa598a2ae888e83644be4a5b5afe6067dddc65789c24e74ed0f24028b76ae3c14e97d6dbb6c9c3f4b07885c3c98b7816d58ae61b34fdea76f4db69da82e55f6d62c85dab4041db547831d4da72c4a38f308b792c7a5289aba7a5b49fe72f93aca87a2f8681144c0929e16bda78d3265c1555443974c9d9705927bcd312dde564d43c3ba600b222f68eece097e37ad1b287efb147f513034bfe43e23aeded2bcdb955096ed526fbb7893287d389681a741f4e45846d228131b8ead4b8e64ba82e09a32af58263264c35491a28ab6863555e477cf3276d2ba81653c10c5fbdc64310b102c43bab1795284ef9ba5b699baa1ca0eafaba66acb12a130ded42d1b9b92cdabbaa6e98aa6593ba7ff9d36725806ab96c15289b7d5832242bc4b31ea8da6a014a22a818a60d487ad53b94627b06ed0a9f74e8fd2897f570f886587aa5ec099adb62358ab435b4714dddcd13a21ab71c6ec0057f64aec0290ba6f7528bbecf3d5012871a8eb5832f77aed0050f5f6ec02d2eca4da01bac639b51b54d929b713ccb2936817b06597c09e50a92b601d18e39c45b67540a5e5857f1dcc9770e79f0ac6aff6009416c04a48506bc90e9126edf015b7ee6ee597423a3ac0b4052574024f995c77c08e41302b90f40d276945d71ad7d702d914bbd506b21c22d052ba2db2a0056c29be6545d9ba00ce1690e698bc36a02e218c2df0ad1188ed704dc1a2ad506d11726d806de12f1de12ad12b07fbcb4cee208435844f5114d3a4a44b75943ff7e47f8dc0b53cb0a574673ed886a38917ae846960292be156f3c40e289af9621b702fded88a683dfed882b2038f6c846ee793cd604d4caf116235bf6c046de099ade59bf96623d82aded90cd89d7f36e2e8c043db60dbf9680be46a5eda0cbc9a9f76825de2a9f50cf4c041317a835d186087da6c3f8401f02ca0a98237e617e6ba97bf9887f8cec35f72c3cfabe38ba3d393abe393ef39465863eebbbf4ce3bf92acd6afbee37e38d85f064991cdd0fcda9bbf3ad84f7ebc60ed8527ea01983ca78f8931e20edbc4bec12198d64bec02ce5b921e920ec69789754d0b9d07ef1217c111477d4f8f518c6f82103a47cd1757e577c4a8c2f255533433f4f58a246ea40f21abe3c23f0f62cfbd3f833ea01b4cf355e42d289ac76e5144a15fa3083bffc86c6524095e1dc222e8ccf3938a05fc23af8fb8d4d191f4287bc8ac35079ef38aa5c90e6e1d6cba583774c5b54d4933b029cbbc6eeac8114d2c5936720d6290950ef63da74401891b6c4dd6ed18f9305d53cae3d1e441726f8f0a37678cf646795f4607fb85c6a5ed05c45f82d039056e5f581ad42805447457a2eefd9ac207948e48470bc346748ef46de69f1c165d9ea33934114d61dea2fb7224d097490c1593ff16dfcec3e0b3fc8a103ef95bfc027861f8f9837df6a3fc29fd52f90054760baf0ef6931fc56f24962bf45802479223257faab60753df5d6487817f3f4bda567e57cac30812751e059e93032cbd2a9607cabc09d1fcd6b35da0f25734f5e4c17ee56dc1a0573ba274540a5a1f9bfc33907384140ae05e92ed1e380421e7ec212f314721795b2cb7f42a2f3d45fecd02d6f42b420ac9cffc2be13aaf2831e2f8609f3e153e7af194c0b1bf05abbc4522eaec98d119f2b98838664de3fbbb3f7ee7089d8620df16112c038fa35438e63e07a088d16f30d4087810f2277ffc7e1fc77ffc37c09082219a40eba9d5190197992e628239b8fd0c8d7bf1e26f0945c70c3ef0290aa2229017448c42233e93283f8f1c15ce40c8067bdc3ff014640788bb3b4431a52a19b48d2816b486299187f7c0c37de6c99b7b95c4f00a7061efe55d014fb57c7ac04c4aa3bb05b46e0fa8391da1c23c802a5a0e2bc0387a45bcaf4b1108d8677ef58428d39f8580bdb0bc441b176fd3f26d5bc0ad4bb86511b72fe3ae0b799da5dc7f31f75ece8d0b9ac680943829fe0a3410975493fa554e3a4a2f02e0d229266199e9e501b4cff473569e69059f41f12f282b94b1bfc173ecc3b2b74b8a0d537eeabe34c7bb8222f292a27c49558a9733e403ab08397b1112de72384aa25e8bf1a3159834757352b030120dc8f3e081c55750234090d27b1272403217c5214eaf02a1a643e160bff49c17bbc4b3e02e2d933fe405ae300aeddbb444e1292f02921d38040dae497fe609738bcd3a883109fd4053d0c55025d69673d224c12c5e199420a24b106d28fd027a030c2ee846248ed75ecc16d3243f18439701c264be6dca6ce07a5fb1f32641c8725214f42e806c0a00a6809720167099ad909a6125b1bf25d9e93b943339e574c2552c20339241c9c3ae804506b379a6861710b466942e7f250a4f96227c81a644f75ed6c1a3ea0161eb819fe7549d1aab59a3ab6f60e537f4e6205563194094a9b51f426c7b513a3d21a149fc66319f925b6df03989d82a1f2c1f9030ba3b7c4c94cc2869386b371d82e611aaf6aee26552c05a942be44529037461f156ba9433207c038490549b2cfa97e906263b613ea5a5ca09efc2f2bd28052ed49c8abad78557e986be3dfff6a3a4dbee7e954079a3fe9cbb5263757acedd6934e13c73722b4b95673d4325ebdcf35e3acfbaf9c96e891ad26fe380d974e936ee9b58349e63c2e62fb80359d3e1def527df17b2a74653543aaf78ce5d229a8b390fa6f7cf7d62badc26f23c3ac10ca0cf9ea8e89535dfc0d2f0fcf8db58e1e253ecc670b5ceb77bb54e07cda6c78d3b5545a2c77d3b0d72bbcfa53bb99cec79cb4ec37d291d2ed46172a0cf8d3a39dfed73674e81cff5b939a7c05786db6086db60b6741b4c179eb1d1cd13651eb211aa5a9eb23ec6028bd9e5dd1acd381206b4618f183fda7858287bdac2e08ac3ad23c3ad23c3ad237f9e5b473a48941d66b12f899f1dd65b27ab76557d2ed8bad428ac5da3d0725dc08eee27602273a7035bbd1a7817534984f1cea9471c2e7ff8335efed07147d02721fed21ea00f7093d6df194759cfdf5e22ff56a85c97efd7ce4c7befdbbd545fef3f2ce27055c17055c17055c1e35d55d085e36e9abdbecc8237c556cb9337425a60d25b49d4bf2534091bdfbc6b8caf6f638828a3dfce588b0f984a7fc881bfeb1cf80f9566fd06fb302831765a93ada7e913f66bf227ec37c416ef6f3b36ce73b618fed6106e568e8acb22e0ce40a7f148d2fbd4d935f266f3a9e7debf09d11778f173b6dbae0ba4eb143397623c253161499aa4a658393af85143ac5baa50ad8e9d4bab3c9a9246c4b7b3e578bd4a3faf03d6b43c92ee94b2beb4d859062b54a2009be3f40a0a278967283081afd0ab579264f09ab1a71b8a22ab9a22f2a22ea89aa81cecd3cf79e97bf2a86a8621f2fa9e008524491604835755c5500ff6efcba5bf4237096e59e0f73459d27455d6354156459dd704821b3e1771c323c1ada8e29eac43718de7a161b2a20bbc4690e7c56109953a72f0e526d2e5face89d21ee034045e87c66a82a1ebaad0d031614f34244d364449524441d40d59a9ef9428eff1bc28e9bc6ce8866ae822af8a0d1d223835f8ccf38aa21a3066bc52ed4b4de32b8192990434655944baa618a621c996294bb2621a9aa69a96aed986e4485876949d864c92c8a143895735b6ae2bab7893884aeefbacdb3fec2eba722fab74d338cb0f9717ff757c79f56974727d79a51bdc3e777d26296fdf9f7f7f323eff61347e7d7475f2eee4e25da1cc687c727e7572f6faf404de2c080b473e778d4358d6309c68ca5da65ef6dc1509669b7140cf0687fd08cf603047e333003eb95c09fc362497a810d8d1af7d610c7e0d18610d18710d18690d18790d18750d18ad2f8c48244c7f18a53f8c40c6e0e4f4f4fd87ab8bf76f3e8dde5d5e11eae0476315f8b0206963d1d0f74445134551e085f1e9c9f9bbeb9f3f9ebfbffe44f23a844079c2afbf66c47b747cfcf1f2e8f85f9ff83df2fac3e57b680f600d6143f6c5b36f47637e7c74feeef4846170f00d7c81977bbca0c98a241aa242e64592009834e7e4c3d5bbd15816151d5e1c5f9cffe3e4f2eafdc5f9a751b2a008dd5fff7c0125af41f98cee701861ee0c8736222a4601057449230d3aba3c02083240a7886cdb1d7aa3904feeea81f101417de3f9dd1b59a840d779a15241e0df34d6206a6b552196aba0ea00e722a25071285eee070840431d5f1d1fa5352d40b9bd277356c6ab94f1be2561941c066593e8636385aa3cf5735fc6a3d6e1f14196dc52449d70c03cc15c5f7d3a46618c230ff963f1d7f1d13fdf03affcfe04b82769d6f8e2f20d5400a00d04999427dc96569f00888d001faf8ede9d7cba3abef8403830cc9c8f319563d122bcc3f763d8e0ccd3a052d0e2e673f8b6076be7e8f2e4083aeaf953e43bdc4b0e7647b7b05be2c853e0baf481947bfdfae29f9f147d4f97c782b1c7eb630d26db184bc29e6294889d48d45f7f6d0ad5ff91fc395cc433eec7df021f1f4a0af7239e4ee7d121ac5c9de77e8c03aa541cf2e3c2ffb81fc9bc478700e507a60352ab39e45fe0a5e6a87fd2b8e6c07fd2819f58911519006a05639fb4003002bd3303d0e669bc600c29028614010f9e22805cf6567a03efa84679b05f542ce9fb20bc41bef71b4a82ea4b8fa57540aa6665b29fc5efd0689b6ac0f46ff18b0bdb8e837db7b84d214b6486bc29317dd0bfc52f61402981fe2919a62a9d7a9c4c0883823d28d883823d28d883823d28d8db52b077a162af52b2dbd5ec8e8af646aaf69acaf606eaf6c327f1a9532d88219ec56501c4e1281bd011e7783310fae4948b465141b9dfd24380fbf447f6e66b6ad4bf5f3efcab264d498717a83e709662d51ab3b434656a61fd5dc6b69cada5c66a3e64331ab2190dd98cf2dd39506308147027266794d0839b29beba9f59c134b97b2504a998f83db11e04c40fca623c21a225a718368ed5d43fec53657f43df257531ff065a8719de868554a9c4c56a3abf45f4c0cf06166ac681c95672cd7598646511c1434e82cdbad44c5d1234754a4294fa65c17fabd7a814a159a9bc256d65eb6bb2c998b2abdc53ef2328b78c6739c9531214d3654818b7e2e628626ec0d3c09e24e4694fe9cb2b72008bd9616c46bdc268fb239bcd3c9a7a37bee9a0e8d604790574e7f71fbc3058f899e38a8de694bdf547a3fc358b9a6479b248abfaa391befe54d09696319ac0874da2429911d1b9fb57707656839420ec8f2a6b5e71024ca26ce2785b3daf41bdc521a8c3bee95884e88b09521ea43ff580ba0936a549aa34ac47946c304545c91d017d6c02bb804d696f645130f59c12a2755bb52795d05047af4da631c7b2e9ec6d9778b74eafdb2151f2d674bd2950fd0658e0f5cc748859da07890caac1b6466d09f116077019f78663594648b5ad8719078afac1468261df742cbe603431cb3cd5076e13fa388c36c0bb8880675161656e53a83286b16a44eb7526b6039c7377b499936e9a480692b0f7499bbe9115a68ac5a45dabc80a577b3ae9a53b646808994c3a68089541e8a407b4b5751d695f6d7477995e6d7d17c95d33872df239af2117c49376299c8124e276d22e6bf31a88509db44bd4ea50ad949b95115a674ad79cc53e13d72acf2a653b48adb6def4974dd58e759540aded6e9033dd5bde4d9ab4b7bd4d66545bdf4f3254a057f2ffb67e77e4f21dad02dd76af9b5a06fad906b6651d6891751d2d04fb052ff7cc044d6d38253f90aaa5e7200c62544941761079bf613a59a5dcf29901aa1c0340ce47528b14b141940c4b24f0ccbf893840360d16f1757d396a05fc1a27665037f0e35fb077731b830006424a5cfe5f4f6e42e79830eec31130f371e1df1185b98256d3bc5c64a09d24d8ef12df2ca6286425fe06c44fcdc5c288b3a6d0a1b3d49c48aa4f702bfc98fd3f43fc3e060dc36686179a5c9a4df2e1e808b102bf04a1733547367d9960bb083de23bc24c8ab741e8fd46fc12a6795399e5128898fc187133e29b4c84c2cf49d785bc685228f1acaf2e34d0633cd2c2df72fb256d0069507c9f217a8b661ef1c53fbbe2ae6ef174cabd99de70a0de7851d1bcc927b5420f2718662c7b738a09ef28f6924ce9979fe3d99405a247f86a6145e43c3566271309e0474237a4637918fa795da659ea01024df44a81403971580bd7c521c7fea4031831fec85e167bccdebc2e4d720eda3ea0acdc79f0d69b4e0bc8fe0b748d84aa04512fa22b14ca0894d04ffaaf927e2551144ba730690767289a70e43f0c253db4610fedcd25a5aa6d23ef600dd0d5ce529e53eb39bc654b30012b8e585a596158c9ab42a046b5d516b227375417e3a25b34c717546ff86772e137bcb8fac73b1843ca74d9f3cabed06297419c93327df39a1ab293b1850e8ed37fe9d8d222e9d0b22732754dbc8216280c982aa7f522c7f3fe59adf51722c4d862fdc0c2f3e8c76c1c73d0e5426c443a74b93811d95035e15b7e4f4a171a9e0e60b98d85ee74685179e9e49decd219daca7fd5d65cc1562844fa50794cdbbf7c12593c9c98a17082c3fae309f62d3d24e97e52d14f2fe9aa996cae9bf4d54eb6a79f346b289d75943e271967c9a4b69c656c6fdcf3330d72a4b6de4846ff5ea01017ce329a2db4ab9189823416747eac960cc88db6e3d50885ec1ad74c13316123014fcbf967ba63b5c86162275379074af4427b8afbac8046b3fb6a83f2831b95b76858eed05665ccfe5fa01550dddacf1b7a9e39a4f8369861be8aabf1ec61ede92922def62c9570af3f598e07e888b524c14b1b67c2abdbc059935964a840646e733809be2d8f2245b9fee0656cec8ec817bb13136b165bcb86e466f69f9b06133e3f59c9e433902a379fb4b2f20c4ca0257b31ec0c36e1cc93956c398348f9efa4d53452b0a9b65a25b76499ec6d9d2cd75be28b934e4cb1c604dc81f5556db5ab195cebe0f466634b63d49159657039579a7461493969338046c6d3d6cdceeca5dabb154ca4b280fab08a1e1a7f77dd731b5a7f7fbd7f9b9aff0a26da43fb5fb652d65b2aebf6792eece9eb7779e4cbb0c77b767bbcb7744277b2c3ab57702c6a97d8a2bab8646bda78e3b6cd2dd69f706bb4642bdcdaeec80f9ee8d6e843f1ee896ded5a4a7bc13645a88bb25da30bf45e89b906525d721db5ebfe1af2b3d0799708bea7da4bc8fac175de8444d7515473b5bcad69831ef784f4b883fdfca0a81a49768b9ce00bc7feb06383375e14a7c720d9cbe4acf42c7d5b3cecc90a1d91dd3bb9c14729bf5f79620125c961c4223a22ba6396b18c7d299c83a865bcefa68195646a63afe9496701344fc896be498ea40a1e49c5eaabbd646f01c15ea560971e65274afc9e6a94ff51974ef29c211a2359012d1e1651f1787bbf1acf96ba2f2c7b35901c8c28e64272acffc60b59f3d876e570f48aee68e0fbf96266d1635a98c12f219a1fdfa2905ea8b288835fe0f9344fe59eb90a1c11c7477616ef384ba8a9bb82bb5ce55fa6f15f493e3e1a285d07359f22bbe1c3228ad22a17113e435f49c4096bdadb203c4ada4ad784836d6f86a6f48a8bf26851fc33d8934123e618d1254fbc9ad240c563126deb9001a04bfabd4fa43c711d88dffb1f987360b6481dca2ed24613a4c9a57d422dae0be2d1f09260bb678b98c2063014e1c24fdbd1bebcfebd404e0a2bc3109379a09685ecb4d586568481e7bca7fe8c6c22b252c7b02b9da72e14c4ef024303f3136f9236317948f8199fa47becc2ccd2b48cef5852cfb44d54debe4bbed5942a2692fc5a1c978cf9260e0194eb339c64e273949511cc3959362dd456549eef22e26c7c3ee0d0a6c579c2f5580bb291ad54938e6122b23e24f94692ecdfd797e3ebd3f1ebcbf1ebd3f1e5f8747c7d053faf2e098447d25dde5367a174b27eb90d92d12624d53ecc8987ea870ac9890cb6d0ad727f7bce5d39c77b160348fcada6decc231c835e78cf7806f1a04d1f858464602c3fa030994b605ec84e32732ee68432414af8050cc459e7ccf33f785ff194b9a048204c4863f3d4a1e9122dd44df35470331cded0f0b31cd7296964015b5a05fa5a7829b04ca569ebded234064ca6929aa13de99c90bcad4753c6887e7b9fdd599942321a1168c8f35b4c7220e0ac5a860a7d4d6ecca034e9943b551ee93631b0521a6e220bbb4bc26dc8c13a29d822030f122fbe2677bf6d0c0f2c2d6c06aee9f9c8b689531a9ba2fc809ef2887a136e1933dd6254f7d799d7df2a68d2f234aaac90aff89b557daad8ad80185313d434db4131c8ee3a809548584b6fc2cc662231fbf585a7d67be2c04cacba848f677168841d1d75278f2a62a21515cdcd7ff9f72288ff4ae412fb55303cb3177cf29e56cf7e33f8e43d3344b3072179573149973ebe222d68da81916fc5e6331020d202ecf2f7a48f49e5aca3ec61b9ede427fbb55fc456289137a7a65ca75a73125dae9f2028e24da994fe6e1b9682b1b93c3189d9b9fc9219a0d9431e339d7c4c4dd1cbf3b2cdb1af219ce508a67587981d4f2fd790063bad8b57f9ab5883348b515a176d59096aaba162375bb7c2b3b3d64a4805eba2ae697e4d3cd4438dd4eaf0ad6d0e5953a0d736c76e39246c5decd4d6bb5c4366f85d17af4a7d3a985bc732fadce6baf66226c6ce06c41b359cdf931ad05243ec3629a562dedd22813cec7a7af025f430aba6108fb745ac4b81730f35eaab62fcb63901f5d1800f366a34646f37e3561761f8702397c7226e73ecdaa216b7584f25bef1a1e6a7ee60b349db4d8ebaca4d9e74d2144ba0255570d2a20796a072456fd2aae595806abb3fe9a3c395d065343759ada1b58ed60afdab7b1ffa6957ed9de9a23bb5f7aa5d332ac116559f499bde5382aa516c26ad5a4d99f00a6acba45567297733534a26ad1a49fbe8b6e81bad83ba09756c4810ebd040839c6f856995e2dd7bdb4746b7777cb504eed19f25f9ba6e8f5649cf3e7daa978dedbdea2af95ab1b4c8b5eee3b24a6a0dd6aaded6aac47182fe4c9c258a99b4122fd615b64b2758907cef4b36d599e7b3b3d8bec6cf7a97be0c5df1e0aa2feadc992f43f7b13e6d45a72e325ef9360c66ccd6bb9d9e56b16ea7c355acdbe9373d77db76b729d26df79a22adeb74fdb95372ba544a5791e48fc8d350a42927f29b452993ab3bb06a3f8a2a7f2537af65071c0b3425092796ef9a8c5a0fbb964e14287f4835a1ca0963dd08ac3ebec2330b3b0e767e492ecbb48345f5a4a38a0550e49e9b7728a4c97e490286680d387aaf6754be08b6dc1198c6860939c8cede4852e0fca17885e922cce3ced32b4c4bef4ad99b1317279283b8f49c16baa21972933b36efdf78e82644b3cb248f0997dd577b4a737a309f1556869d25ff0c3441d27bcf8a194d122c29522e620931da9c05b05f887c2765b2dcd2f787a3a310a3f4b43e752738a3913787a37fb25420cc3b228f87679919d83d9b6fb01f005f65ee0202fe91d7b34e9412907c9cd383716fb69865a7e229d686763ba90350e97ed15285ac77472ce282a5b9c83cfd1257b7ff74e93fa3e24025393bb2a2450451cd7da5694529caf47ad3a8342441218542727db1405b94261e50184493d75c9ad9048adda6295894dc1b27758b11b54a7ee8e836f872f4d58baa010c07c4d9213f39e60ad9ec0f4757c88fb82b1c7aeed818bf14c60a4938536c0d4b4d5159a219c972766528280191d3663749785d0184f65dd5b96676ccf2dc2fac6648e8b485844e5b4cfabc9d71ee99f8b977be84367feeed647fde41fee7ad6680de760ee85d66817e983cd0dbce04bdcde8abfe391a5606656c2b25f4eaa4d0a2da2d2bf456f3426f2133f483c7aa6d2d526d3bf9a1b79b217a7739a21f224bf4b6f344ef3253f4c3e48a7eb86cd1dbcc17fd9019a35b2398fb678d6eccfbd19c7dbf4feae8ad258f5e237df47a09a4b79f427a9324d2eba591ee1f04da9c5164c59d0efdf24997324a13893c59794943dfa4d29dd34a6f2994b567206b9fe4d2eba497de7682e9f5534caf97647afb69a6374934bd69aae9fec9a6b7916e7a48faf100493f6a0382ebc2810ff6eb6c5107fb15bb6a6e4e6e35e266c592f734d5ed559a743a8b0d2c840b95e3d1f2a028be1816961847abf15d829e58fb585ae0e2f5e7f5f1322b68677d9ae94a2b9bd3c8326dd00b16abb6fdfdba09c8bea6a16d0c559485ba7d08b1ed6579a74372d3207eb3984f3d1ba6fb3c7070f5a23a04adbdc3c7b7d82e5fe86d9337c7e456c69be41abf4ea73e85209fbfdf446934e33b127c0bf85a67abe99c8e26c5c60ee0885ed394cfed53d21c66534074521f2ad38d7c0a78e8e4ac9edee5c1cca7b93293f9790c3d4349c786dd60f992ddbbc9d60c3d0b4c4f5a0ae17607617a1db5c3f2541753d3e3299bcbb40cf48f163a1cd16bee27c12de879a44926557c645944baa618a621c996294bb2621a9aa69a96aed986e448587614b2ccd9f5a07fc3f7249c88dd1a3ae23c6703aca6e7981438f9af2e4aaac423d9749160000c124d24e8b2a9082a9631af88a2c19b44238ce23089eb3e8aa2c0f6105b8d9499be4f5bd4095d3adf8566d09e8cb8ca08f7434a5b729e631e7144225cd18b5961a62d5ae977ac3ae483ac00b5218abc293cfb269a7cc7ddc2081f4e0390c5e417370fc2f8509125918ba229bdcd13b834216f6e02f3f19de77cc7913b850fc945b78c9cce48b4fbd522748119ff6f8e12e707505150780f33f8d1f7e8a1cf77c2775c4cd024fe19b441c0a19c2071bcd92bbc4fdc39be2773fc43e5cc861c9f5c62b74872c9bda1e914170734fb543e124d09f779d33203de044f47fa5eafef0572afb6b489e6d7aba8ba042896bd0ccb23ad0872eac358fe56d604ed547161d0bef55f1d4be3ff275c222c461529828b545e360dc3724d59932553472e0f781d1958998234c5596b8d7447bfe922e95353cb2a6119371f6799d058e0075a21b45fc312596f894cef4513db32c29aad016549b2292b22a0c42a36254dd46cd59044d532d65c225dd16fbe44bad7d4ba4400cda32d116a287db045023d1b16c9ba8bc4945451967907999ae10a8087b74ca461dd9475c3d57915f19aeaaebd463a61dfc612e958d18a15f22d6c3eea57c8b0401a17c80c211f4d91172d160ef6cd29faecd5bed315d9e535de35158bec6735151416c7d24d857734a4cab6a363b9d3425917797ee7d0327ceb8259bfc2c27aa941b283e5d27545040131c656d6434d93135fe91e8ba1b6dfdffeaa88bc38b85b2c224a2ca5079ed72cd1721c5376651bfea30826323036351559326f2b22d651a775d01b6b7ec94701b095f2d7a8a240f245e8a74eebc5b6f627f2724f7b533779536f6565f5d61a7bd38f9c5dfc9a1c859c077e7e579337f3605843685fb94fd8f16216a9901886aff1d7f8045e562debac86cdf38e365bd3df476769d2ccd599b59ad17c8c30b9f0b27b3ed1e59e1dece7c3529c333ad6bdc7fecef3e2182da278e1fbc3f0ef7cf881b3fbb1176372e0354cc1a34c410cbc34469f8988891174ce378789782c5634c35ee4f9e66cb188835513f006c5f81a2076320171b8281fac9afe623aed39fc4524c4b5c47710b94d68be98f74fd6780fffbc3c3b7be938dccf3fff349bfd144599eb3a4b756ab2b4d05b454d27b233e266da6378bc2868c4f568dc00661793e58fbc091a2870a0c047500906c9b3e3219f1225f89e6ceca6e816365e1e8e03a20ee0411978bc5550deb3b68fff65b25fbd4c77a9bb9f8823c2938f1c27491d1e6dc09929aaf38fa7a79bcc28f4e63ddd5cb8c419ce6bf063efd6209a0ffff53d0ddedfa44d971839e4e285d5382ae903d2f9dda4f2abdbe0cb5be0f59be2b898639fe079bd88e3ba163de28aa933650e0b675838c3c2695b38f9e9e00308f9fd476003cccbf0292efca5c5fab8ebbe886358f67f3e7959385a1a56cb202587e5b25a4a1247cc6f414c169ce69e707792c7fa581aa0601495f2d5d1379c97c5aa25b99c8ae7ab693ea6fd26302103ab1c0dae841433c89a53ad95d05206dd7820b312875c6c7bf92c6125ac92d75f3201af04540bdd5e5d5acb4a77303aadc4a617eaae9cf1af02358aa0b53e302b2925a7b08283dd4a28a158711210b312485c024a3c4256424ad546162eb76e019397fb262e831dec5716e14112ba565c95c9abdad588b3d4903447da7c3ebdbff03fce1d14e3caa5725534d5d5b93ea6bad5ba3eb6e6d5bb515f2bab7983f69557f726c3b6097497d5bf49db2adc602354b5dc617d8c0566b151b312deb1398e84956cdc23ca59b6302e62772c07fb5586431493280e61e9959850fe962b14a05a02d465e6ae7cf4824befdf0b5c7ee70731396f2cbface168fb3baab3c2fe76556d0dafdc55d58d8c7587435ee6c23beb79896577a955ea52ab50576b513bd959073b0883dd11785972ecb0de3a31b3abea7399d4a54661ed1a6b94df1d8e7041daed78602bf7a9ee662ec5a29cac118b85561452b4d7b7b2417927d299e465aeec2596016bd4f5ceb00d0a7a67f85695bc4f0f9695f0ee6d5852bb7b74bf5ff98eaa758ffa9795e93ec04dea73671c6585b94fd5b98adc1b2a578afbb6335583fbf74f6c842baedf9ab57a90ebcb14679edb274f798eecb8b2bc13d5f9887e480db2ff874ffe7959f39ff49fff3ba2511da363e4dfa1a8640f68a82e6f070df560f6402e0ac2985abf29ff6220cc2478c5f2b73b61307f137cf147b4e8496157905c6393f3a3a5a01018e9e962e6576e60a7ef12db261dabba288c34fffd4b9057b79e0364bb7cc57d33a62aafdb08591df3db086133374cd08a82ba66af2bfc71b3669619e68663b821822e2c75c3165678eca6d86a99eea6481376ba1534097fed8b2b612bb58042e7461424ca469d2972fc6d20a222601522220b4a8cadc0750bccb5a8e5391e193534a579534b19c2822fecdd7ef504a9f29a0aa07a3407511c84d8c94550018a9cf11007632e0ea63844c97517ecec87bc5f2ae8f95ebc5ffbd626e9ec687822b9d8a6e14b1da0eb4df11cc5b7afca50d9eba6ca5e1dfcc7a7e33747d7479ffe937bf9bf5e82a2ee78fecd4fdc22765feae4cd8bd168f4e2efefde5f912b3f661167239fbb45779843dc87fbf81664aabbf099708d6f51cc79a408703587fb728bc93b4c01e1fd8b608e7dececbd78f131c2f0014ae6a001871c07140390fedc34b8f16cf2ea1efacbaa05a0133fc621c547a8890b5c863bc5e0b1ba4649a3de43ffb28fa31774b6f75e1cf9500522d761005a72421efd44fbe786c18cfbf78d17ed7db8ff7bbcf7f7e4c82ee2bc1909f9e4fece9e5fbc006d829b319f779374e77bc743d0dc310b381d73c955443ffcf4e27f106ae70ed3377b694ebcef7f78f13f80cae23098c25706bee77abe737ceb4d9def939ac6dce8ec9e246fa2a7923fbcf8f5d757cbe450ba14890ed3624ec933bd14a9f4ae48014108ed25b76891a5447f31ecd9fb2585e6847e7d5ba0e6e5afc7d02d226c438eaddd6372ef143d3264ebff9a263be052ce0882258a5121f11fdd39df6517fae48ad049e1229dbaef4499249704cd5f075fcbb9203b3752c88ee7effff8eff88fdfb9390e41b9a12dde7e13abb7af2c8d333dde2e1ca655a553a941fb3d90e98dc2786d94c62a89dc8cb9c0d42bb3b3c9147ef8e377efee8fdfef272467f5e3ce9dd2a0e9ad3dd872b326baeb613e65fae21fbfc392a6abf9d1178ad8a07ff519edd44d28bf2c6b29af8d2a498eabb88a29ba8a6ecaa22e9896a0ba2646c8b61c45756dcd684edad3113ab962eb2a61df84f37e20315cd96d62f930a781fc8fd1487f960e18490691b785893172ef1a799fbe35999059be0b8cbd37ed0ec979bbc4961d4da7ccb52a73afb092c71a57abbabaabae3d0d44d28338b53edbac5d2fe5bfe5221986b4ae11bb5ecb7cadc5626db62934992dd6c628b6d92ed6c62aad36606c461b9dcaac433db33f7effe3f710a46eb46b8dae9563834212a2fbc8143589e70d5e3345dbb14c5910785317910c0c4d441861780b5caf991d5a962e3b126f8abc0dec104b8a8904608c8268eb96680b9262891bf1ec1d37731b5cbb2fcfde12c75ecdaf3b70eb075b05d12200ad7af1b4d640da28a02757510d5d32755e1640aa4b8e69f1b66a1a1ad6055b10794173b79ad879dde5f0782d1e56c6f657c63551716037e64d267ffcf753591971dea8c09455517745593365837780e878d144c8924d0523c9c2aaad6160c98fbc301eb7c1c3ba58b52e964abcad9a7e09512fc530144ce32c4f7c5ab2a2de2d174f0f61bb97a787cb7d8a8bddcad3c3fb4ee5b2c3ea1ea5d343ea6e20f507f1dd602b1e009d806abc363ac075725fe880a7ecaad201a0eaa2d105a4d9b3a403748d474937a8b2274d1d0c5bd8c555754099fc857f1dcc9710e79f0abbcb7cddedf7005876755a0d51f13aeb02207685a87831b696ac7148eb507ed99fac1d68959b5f3b74a373622b58abd36e0b644fc7cc164c4d3ed22d20cd6eaf6d405dbc845be05b9d7cdbe16afdb1c9bd6ed5757710e245844f5114d390cfa50aca9f3b2ec976a0a665b90aaa7669ae0612fb40d52ed16a69a1c3326da9a17da9b655d66db9b66158b1645b5add61d93642afb5741bb1b52fdf46b0554bb819b0fb326ec4d16129b7c1362ce7fab54b6fc47cc36e79a456cb0fd9157f39ec1776729ebf802dce9d87bfe4bbb757643190fb01abef5388199a5f7bf35707fbc98f17ac51f054b83ef2207de410f4fb12bb80e5b6b87164bb86f476b92f13eb9a6d34b2fb5e60abe5cde653cfbd7f13a22fb0b5f839734f2ea024b9ffd8be8cf88324374c7ae4ce41d8805c95dfe5184f49cae8640347d15cf8e7409eeefd19f415ddd09bf728cf8c8a4d9e79fe15c9d847c22e937f46dc2d8ae8cbd728c2ce3fb2dd30097766ed4aaa3c9a9246c4b733860a7d4d50f14bfdbc0e58d3529784c351653cce3260da0116709fdcbe58ea4da1f1052fcd189674810abf42b75e499221caf29eaa0baa2a0ba2266ab22ca89271b04f3fe7a5efc9a3aa19505cddd324d930249dd70d5ed46134f483fdfb72f1afd051825ce6f93d4997054de415411424a84823b8e16b11373c12dc8ac2efa992aa8a92a60812c018ba2112dc7971502e4b1d39f87213e9727de74469cf000c8628aaba282a8624497243c7843dd1808e8bba2448b2aaa99aacd6f74994f7785e14145996041ddaa9035c4387084ed55004455455553060c4846a5f6a1a7fe039afd6bfcae960df734a7c21f14d7a6a57368d0ad76c8cf646c50d65f17a2676856dc5bf0aeaff1284cea91715679c9a1f8039dd9558e37e4de103ca9fc878bcaabdec2ab90e9716c8dccc4a775b4673683a9ac2aa8beecb2ebe5f26f1ab0f9717ff757c79f56974727d79a51bdc3e777d26296fdf9f7f7f323eff61347e7d7475f2eee4e25da1cc687c727e7572f6faf404de2c08fb463e778d4358d47108357159f213eeea3e8af18c1380b039ec4778466e321d9f01f0c9e54ae0b721f1d122b0a35ffbc218fc1a30c21a30e21a30d21a30f21a30ea1a305a5f18910898fe304a7f18818cc1c9e9e9fb0f5717efdf7c1abdbbbc22d4c18fc62ab03660c163d1d0f74445134551e085f1e9c9f9bbeb9f3f9ebfbffe3422320a284ff8f5d78c788f8e8f3f5e1e1dffeb13bf475e7fb87c0fed01ac21287e5f3cfb7634e6c747e7ef4e4f180607dfc01778b9c70b9aac48a2212a645e24098049734e3e5cbd1b8d6551d1e1c5f1c5f93f4e2eafde5f9c7f1a250b8ad0fdf5cf1750f23a046e7687c308736738b411512e0a28a04b1a69d0d1e5114090013a4544b175a8c3a24f5c01617c404edf787ef746162ad0755ea85410f8378d3588da5a5588e52aa832c0b988a8521c8a97fb01e2cf50c757c747694de46af57b326765bc4a19ef5b921787c3a06712c3ee58a11a4ffddc97f1a875787c1024b71451271c304f30d7579f8e5118e3c843fe58fc757cf4cff7c02bbf3f01ee499a35beb87c03150068034126e509b7a5d527006223c0c7aba377279fae8e2f3e100e0c33e7634cafe78c16e11dbe1f7371300f6e4234bff56c50e2e673f8b6076be7e8f2e4083aeaf953e43bdc4b2ef0a3db20c41c790a5c973e9072af5f5ffcf393a2efe9f25830f6787dacc1641b6349d8538c12b11371faebafa0194ce292609987c167f9d58fe4cfe1229e713ffe16f8f85052b81ff1743a8f0e61e5ea3cf7631c5095e2901f17fec7fd48e63d3a04283f20f7c147f41a70c057ac01441ce80e022ff107fbec77f92bbc208d231f2bdf402dbf8557a4033fb122c99b62211255147a2c7d52ad6024e1f479916adfd955e7c80e03ff7ef60a468075a1fcba944c683af5e651e039e947da3c8d1740b75dfa560404452099681774f957344914bd3bbbf8b6700051ab0cd0212cd85c980a73866344149a02b89724f282fd13d1ddb287c2f5f428246f8be5965ee5a5810e6f16b0937945b498e467fe95e869afa84a8541cda14f858f5e3c2570ec6fe158d122c15f76ccb42590299117fdf1fb94fa187244db0a61b3bc8840b3f338aa4b8db9cf813f41f41b0c35e2881d63f2c7eff771fcc77f030c2918a209b41ecd402f43b0979a2e628239b8fd0c8d7bf1a2e0f844e0039fa2207604f282ecc9a1119f49409ac77d06fcb0630ff6b87fe0e95d40f6ce7788625a4477b0f75fc4d0b6c902b44d5243629af000c3a4ec1f034a38c185bd9777053cd5f2e91138298dee16d0ba3d20f774844a917671e90dbca31ae5c17e51b1a4ef83f006f9de6fec68eb60bff4585a07a46a5626fb59fc0e8db6a90a4cff962e28824dc7c1be5bdca490253243de9438b0d3bfc52f61402981fe29c57e543a7500733129c76f601c91aa7029d403940e1ac0402a4b7f16c62a2c2bd18deaf5a0600f0af6a0600f0af6a0600f0af69615ec5da8d8ab94ec7635bba3a2bd91aabda6b2bd81badd5be16e54b9a9825232d355adc2b96a41ecf0cc9b1d200e47d9808e38c79b81d02781a4d4971ccafd969e01dca73fb2375f539bfefd72bc2de810f3009845757881ea0367c9a50ab4e03006ed88fd5d0ac3f01daa3955277a7f191ba8ef4b152fd9ccf79b362407e98da75caaa61d8e46afd29b4f2915d0cf5979768ef339f08a81b7d47cfa06cfa1c1e42ecce231143baaaafbd29c4502b8c14b8af2253deb7939433eec6a42ce5e84641b74384a724914d32f5460d2bb9192828523b506e479a4e5e2ab37f550784fafdecc01095116692d4dc84cdd5e8483fdd2735eec12cf82bbb44cfe9017b8c228b46fd31285a7bcc887d083cd0c8d444e7fe6296b8bcdca6890a3645576d474d2fcbc2c0f089031b1f1137a4ebf7c048e7638023227d931ecc56c314d32e0317419204ce6dba63435aef7153b6f12842cc550e1600d204b8d2a9d9102e025ec60cb1b99c67552b7464806df2a96e5f501bb73a0c61028e04e4c4e27a10737537c753fb348b668ea141a82544c5285b01e04247588c57842444b4e316c1ca3b2e3eb01fb54d9dfd077495d33144e7098d46286b761e124981c794ee7b7881ef8d9c044cd3830d95aae89db216b8b881e720e6cceb333e0cd13a3575d3cb38379f86f5bca6d562a6f49ffcbc86c32aa2c563c3d9c8772dd1373771a12c6afb8398ad829f334b0270981da53faf28a1cc0e2b364a6320a1646db1fdb6cee1121c1fe2316fd7b81c2c23d73249fd7fd3a8804491a0bba381604612c2a59c02ccc0868fefdb1a5f0a0af79bf1133c2d444be0d4fcbee41dd305a64b5a558a9005aaf9fb617da53dc95a41b266d9c4d1bd149f11add91befe545027cbd84c105226d12fcd886c48fa233f3bab2024c8d668a33266ff2fd043b088a9c7fa9a74110585ab00525c6bce245fc54393996c6d2a8a48b7392325bceb4d8ce301aa98f0a6e40e77d228135edd064e7f6c627e15fc6f785bc347706d71d428baf5062b8f3925c2c05ec988ea650bd395e7dc1da5bb4923bfce4aa58c79d2ca95b3e24bec77d2c87b73185aaa3387cde012563a69e5a359e994614e9ab8653e306336344d3c312b5825994967ce97a120a43159c1dff2fa4a8c6cb2928be593c8d8d56425afaa10c70a8ed43a10bdf8ced27874e02e194cce4626ab78480623b2c2b59ca2ad5b9df841b5372dabbeb208baaeed8e3a7337cd6e53bdb99fe6bc2dddb985c375d49ff70bfe9f998986ee714ae7a4d59dd04118c4a87263cb0199624a0d25b7d76c83568e2821f6c374c74634f4d2c68bb82efb372ced152c83ebfa727497fc354ecc042ef0cd5fb077730bfb2b05083571867d3db9099d63c21b80e015ca36d27f4714e60a5a0da49768454e9240f212dfc09e396445fe86439fda5380402d72fbf359badf26f527c8157eccfe9f617e0f7cdcb3d9be04df00189be5c3d11162057e818de8d51cd9f46582ed22f4c8e12adb73e7f2206f2bdbda0315931fb0f54fafb1fd39e9bb90174d0a258ea7d5950ca2cc232dfc2ddfe0d3069006c5f719a2b768e61157d5b32beeea164fa7dc9be90d07acc38b8afbffb456e8e104c394b1c4c2f0e614e61287c55ed25bb8c9adb92c4b7184af1656440e1c6266ba4b003f12c2211dcb73149fd3a5f09da87c57dd3fbba4915e291d5d4e1fd6c2756193c8fea4431831cec45e16fbccdebc2e4d730eda3ea4acdc79f0d69b4e0bc8fe0b3858425782a817d1150a65344a2828fd5749bf123fe3254365dac1198a261cf90f4349ed9aeca1bdb9a454b56de41dac02bae0a9dd2ca2062678cb566102561cb1b4b2c2b09257054fe66aab2d644f48b4b1ef70d12d9ae30b2afaff9904ebc28bab7fbc8331a47c973dafec0b2d7619c43931d337afa9ad27195be8e038fd978e2d2d920e2d7b2253d7c42e6881c280a9725a2f723cef9fd55a7f21829b2dd7d41b9c7cccc631075d2ec446a443978b13910d5513bee5f7a474a1e1e90096db58e84e871695974edec92e9da1adfc576dcd156c8542a40f95c7b4fdcbc6faaef63bf62db5237637e5f5534dba2a279bab277d1594eda928cd4a4a673565cba6beed8dfb6a93df56cd7e1d0c0002d97bf26395ef64f97b18ebdf362d80dbb2026ec912f8e0d6c02d5a041fc82ab86dcbe036ad83bbb2106edf4ab87d4be116ac850f6c31dc9ad570fb96c376b1d5d582b88615b16ca1a970f3492b2b5fd798d8dfa0d8cfa8d8cbb0b825e3626f03e34646c6f50c8dfd8d8ddb3538ae6b745cd7f0d8d9f8b81503644f23e4fa86c8be1a7f77dd731b5a7f7fbd7f9b9aff0a26da43fb5f3654d61b2bebf6792eece9eb7779e4cbb0c77b767bbcb7744277b2c3ab57702c6a97d8a2bab8646bda78e3b6cd2dd69f706bb4642bdcdaeec80f9ee8d6e843f18eef6ded5a4a7bc13645a88bb25da30bf45e89b906525d721db5ebfe1af2b3d0799708bea7da4bc8fac175de8444d7515473b5bcad69831ef784f4b883fdfca0a81a6c718b9ce00bc7feb06383375e14a7c720d9cbe4b4f42c7d5b3cecc90a1d91dd3bf1db51caef579e5840497218b1888e88ee98a5f4615f0ae7206a19efbb696025b98cd86b7ad65900cd5316a56f92232956797a1895555fed257b0b08f62a05bbf4283b51e2f754a3fc8fba7492e70ceecac90a6871b2888a07dcfbd5908fd48361d9b1815c3685622e2407fb6fbc90358f6d570e47afe88e06be9f2f66163da68519fc12a2f9f12d0ac9c8918c5bbfc0f3697ed36fe62c7034f56e7c7a3702729c25d4d461c15daef22fd3f8af2461158d25ac839a4f91ddf0611145b44a76e47f86be92abb858d3de06e151d256ba261c6c7b3334a5f79197478be29fc19e0c1a31c7882e79d89ca7c7d25f8f49409a4306802ee9f73e91f2c479207eef7f08a6f737819f2d5287b28bb4d10429c9ff45164d2dae0be2d3f09260bb678b98c2063014e1c24fdbd1bebcfebd404e0a2bc3109379a09685ecb4d5c6e41633cf79ef475e727e9a973a865de93c75a2209e17181a989f7893bc62c943c2cff824215a176696262e7b877d1c920851d6262a6fdf25df6a4a1553ad7d2d8e4bc67c138700caf56b715686306765d9bc2469d28a135ec49c0dd0071cdaac38617bac09d9d056aa49073191591f9298fce452d9ebcbf1f5e9f8f5e5f8f5e9f8727c3abebe829f579704c22319e1eee93554e96cfd721b24c34d68aa7d9ce78c0a3f54684e64b0856e95fbdb73f2ca5707677132c4e76aeacd3cc232683e74c6341c9089e9a390d00c8ce50714269309dc0bd949eebac59c90268809bf8081f8eb9c79fe07ef2b9e321f14e02c544bcdb3eba56bb450378de5e66638bcc1841be4b84e49230bd8d22ad0d7c24b8125f34b5bf79686fa32a14a6a86f6a47342b21a1e4d1927faed7d761b4e0ac96844a061816fd9dd8259b50c15fa9adca84e69d22977aa3cd26d7260a538dc4418761785db10847562b045081e249e7c4d2e7fdb181e585ad80c5cd3f3916d13bf343645f9093de5110dcea425cc748f51dd60678e7faba049cbd3a0c5423ecf6f56f7a962b702624d4d50d388e06c3880d15c07b012096be94d98d94c2476bfbef02c1323b949e16b4c626fb38354caf08eba93471531518b8af66676a338914bec57c1f2cc5ef0c97b5a3dfbcde093f7cc12cd1e84e45dc5265dfaf88ab4a0690b46be159bcf4080480bb0cbdf933e2695b38eb287e5b6939fecd77e115ba144de9c9a729d6acd4974b97e82a08837a552fabb6d580ad6e6f2c42476e7f24b6681660fcc0c7d9a4f716a8b5e9e976d8e7d0de120a2c99b0e8a6ecd3922aeb6feba43cccea7976bb0d19cee4fd6c5abfc55ac41ba88e260469abd2edab212d45643c570b66e856767ad95900ad6455dd3fce28c9a4c977da891aaa9ea0187acaeb66d8f1dc819500388a26a260af7bad8a9b177b986ccf2bb2e5e953a7530bf8e65f4b9d175edc54cac9d0d88376a38bf2735a0a596d86d524ac5bebb450279d8f5f4e04be861560d2969bade1416e616b142d199e924db581354e8871af5a58a1e700296ebdaf25c942ba0193376336eb4aa9d8d1cab6ddb63f705a3895916333e70d3d0c761b4c57a1611f0682affcd87d463ea4e369bb4dde4acabdce449274db1045a5205272d7a60092a57f426ad5a5e09a8b6fb933e3a5c095d467393d51a5aeb68add0bfbaf7a19f76d5de992eba537bafda35a3126c51f599b4e93d25a81ac566d2aad59409afa0b64c5a7596723733a564d2aa91b48f6e8bbed13aa89b50c78604b10e0d34c8f956985629debdb77d64747bc7574be01efd5992afebf66895f4ecd3a77ad9d8deabae92af154b8b5ceb3e2eaba4d660adea6dad4a3c27e8cfc45b22bfb4cb4f539eadb05d3ac182e4445eb2a9ce3c9f1dc6f6357ed6fbf465e88a07577d51e7de7c19ba8ff509243a7591f1cab7613063b6deedf4b48a753b1dae62dd4ebfe9b9dbb6bb4d916ebbd714695da7ebcf9d92d3a552ca8a248744e542c542f6f203c6e4ea0eacda8fa2ca5fc9f544d901c7024d49d289e59bd8a2d6c3aea51305ca1f524da872c2583702ab8faff0ccc28e839d5f92cbe46c72a3780573050ba0c85d37ef50481362921c0cd11a70f4dabbf25d7a958ec034364cc84176f6461267e60f59424f7668fbba586ae95d29c369e2e344f274969ed34257348b64720dddfd1b0fdd84687699e432e1b25ba94f695a0fe6b4c2cab0b3e49f8126480adc5931ab49822545ca452c27469bb300f60ba1efa44c967ff5fe70741462949ed6a7ee046734f4e670f44f960d847947e401f12c3503bb89ee0df603e0abcc5d40c03ff27ad689520e928f737a30eecd16b3ec543cc5dad06e27f5002a5dc157aa90f5ee88855cb03c1799ab5fe2ebf69f2efd67541ca824694756b48820aab9d22fad284599de001895862428e450f8c2065ca02d4a330f280ca2c96d2e4d6e02c56ed32c2c4aee8e93fac5885a25872ab997fee8ab175523180e88b3437e72cc15323e1f8eae901f715738f4dcb1317e298c159273a6d81a969ba2b2443392e5ecca50500222a7cd6e9214b60208edbbaaf3cd2c45d8b07bd6eb226cfac5d50c499db690d4a97b1ccd299db6d6389a6d8c739e2561c904b5ce402e254c6873e86ec5a4fc350b81ceed44eb20aa57921acd57eb5491ab491593d63ac8b226d65894b6d7ffd5a6afcd06a2c91cb6d9882c9bc8d6c1d727fcaa7f9286955119dd637256466bb40fdb9ea89630b54571749cd66e711d1dc3a2b64cd20f40c5db22dc825d6f233c4ba6b5ed8dde2afbdf6603596f13dce2585093dc438d469ded709be391db13371b91361be346982b76c7ed8d73e7b4cfcd21cc956c1f9dd49886c41fcd19b2d3f2542b99ac5249da02067b291ed590c10eea45653c3a2a116d2d5e4f55a836bd8f4250ed4337b1df370ab439a5c88ad4ebcb618b2bf2ab67dda11279b24a1c5787ae4b22f34adce65a13bdf6dcf69bce15c2b052ba93c86bebd53a82addac1eee2abb5f58d42aa7bfbbb8aa2f61eb40b9c6a1ffa8a950a7c07e1d1d6ffce2262c8fab1edac1fb511c175f1c007fb75b6a883fd8a5d353727b71a71b362c97b9aebf62a4d3c9d050716c2850af1684231288a2f868525c6d16a7c97a027d63e9617b87845707dbccc0ada599f66bad2cae634b24c1bf412b2aa6d7fbf6e02b2af69681b431565a16e1f426c7b516a620ec96d5cf8cd623ef56c98eef3c0c1d5cb9c10b4f60e1fdf62bb7ce9ad4dde1c939bcb6e92abae3a9dfa14827cfe7e13a5d18cef48f42de06b9dada6733a9a171b3b80237a4d733eb74f4973984d01d1497da84c37f229e0a193b37a7a9707339fe6ca4ce6e731f40c251d1b76cbdb4b76371d5b33f42c303d692984db1d84e995ad0e4b545d4c4f8fa76c2ed332d03f5ae8703449eea7063d8f348965f5329122b848e565d3302cd79435593275e4f2a62139322c6505698a43d639bb43ef6ff89ec413b1abf5469ce76c82d6f41c934227ffd545499578249b2e120c539690682241974d4550b18c7945140dde243a6114874968f7511405b687d87aa4ecf47ddaa44ee8d2192f34837665c455c6b81f52da92f31cf3882332e18a5e5f08736dd14abf63d5211fa405280e51e44de1d937d1e43bee1686f8701a803426bfb87910c6878a2c895c144de99d77c0a7098173139890ef3ce73b8edcbc7948ae836404754602deaf16a10b83fdbf394a9e1f404941e13d4ce147dfa3c73edf09df713141937868d006018f7282c4f566aff03e71e8f89e4cf20f95531b72807289dd22d125b7eba5535c1cd0ec53f9503425dde74ecd0cba8a886e33645944baa61800285b403db2621a9aa69a96aed9804bc2b2a374a7f075b09708bedad226aa5fafa2ea22a058f6322c8fb426c8c90f63fb5b5915b453c5a541fbd67f7d2c8dff9f7291f442d47f95f4e9fe66cba44f4d2deb8425de7c9c854223821f688dd07e0d8b64dd4532bd174d6ccb086bb6068824d9941511b83156b12969a266ab8624aa96b1e622e98a7ef345d2bda6d64502681e6d915083e9832d13e8d9b04cd65f26a6a48ab2cc3bc8d40c57004d85b74ca461dd9475c3d57915f19aeaaebd4a3a61dfc622e958d18a35f22d6c42ead7c8b0445a96c80c211f4d91172d160ef6cd29faecd5bed315d9e535de35158bec6c3515303b966e2abca32155b61d1dcb9d96cabac8f30b8896e15b97ccfa1516564c0d921d2c98ae6b22088861b6b2226a9a9cf84df7580eb5fdfe33ac8bc88b83bbc522a2e4527ae079cd122dc7316557b6e13f8a6022036353539125f3b622621d755a09bdb1e6777e14005b697f8d2a0a445f847eead45e6c6b7f322ff7b4377d9337f53657566fade937fdc8d9c5afc9c1c879e0e7573779330f863584f695fb841d2f66710b8999f81a7f8d4fe065d5cece6ad83c0d69b36dfd7d7496e6d05c9d67ab19cdc708931b30bba7175deed9c17e3e2cc539a363dd7becef3c2f8ed1228a17be3f0cffce871f58bb1f7b3126c75fc3143cca14c4c04b63f49988981841e77c739888c7624533ec459e6fce168b385835016f508caf0162271310878bf231abe92fa6d39ec35f44421c4d7c0791cb85e68b79ffd48df7f0cfcbb3b3978ec3fdfcf34fb3d94f519439b2b3c4a726cb12bd55d474223b236ea63d86c78b82465c8fc60d60763159fec89ba08102070a7c049560903c3b1ef2295182efc9c66e8a6e61e3e5e13820ea001e9481c75b05e53d6bfbf85f26fbd5cb7497bafb8938223cf9c8719244e2d1069c99a23aff787abac98c426fded3cd854b5ce3bc06aff66e0da2d9f15fdfd350fe4dda74899143ee61588da3924c209ddf4d2abfba0dbebc055ebf298e8b39f6099ed78b38ae6bd123ae983a63e6b0708685332c9cb685939f103e8090df7f0436c03c0e9fe2c25f5aac8fbbee8b388665ffe7939785a3a561b50c5272582eaba424dd667e0b52b2e039f784bb933cd607d60001a3a894bc8ebee1bc2c702d49ec543c5e4d9333ed3781091958e5647025a49841d61c6aad849632e8c6f3989538e462dbcb47092b6195bcfe92057825a05ae8f6ead25a56ba83cd692536bd5077e5887f15a85104ad75825949293985157cec564209c58a93d8989540e21250e210b212522a3792455eac849297bb262e831dec57d6e04112c6565c94c9abdac588b33491345fda7c3ebdbff03fce1d14e3ca05735534d5c5b93ea6bac5ba3eb6e6c5bb515f2b8b7983f69517f726c3b6097497c5bf49db2acc602354b5cc617d8c055eb151b312d6b1398e84936cd823c658b6302c62772c07fb557e43d492280e61e5957850fe962b14a03a02d465e67e7cf4ae4befdf0b5c7ee70731396c2cbfac6168fb3baab3c2fd76556d0dabdc55d58d7c7587435e66c23beb79896377a955ea52ab50576b5137d959073bc882dd11785970ecb0de3a29b3abea7391d4a54661ed1a6b54df1d8e7041d8ed7460ab47d3bb994ab128266ba462a1158564edf5ad6c50dd897026199a2b3b8965c01a65bd336c837ade19be5521efd3836515bc7b1b9694ee1eddef57bea362dda3fe6555ba0f7093f2dc1947595dee5375ae20f786ca55e27eedcc94e0fedd131be18acbb766a91ee4da32c59927f9c9739f233baeacee44713ea21f525becffe1937f5ed6fc27fde7ff8e6840c7e818f977282a19031aaacbdb41a33c982d908b8230a6866fcabe180833075eb144ee4e18ccdf045ffc112d7a52d81324f7d9e4ec68291e04467aba98f995abd8e9bbc4ae49c7aa2e00234d84ff12a4d5ade700d52edf75df8ca9caea364256c7fb3642d8cc0c13b4a2a0aed9eb0a7bdcac99657eb9e1186e88a00b47ddb0851516bb29b65a9ebb29d2849b6e054dc25efbe24ad84a2da0d0b9110581b251670a0c7f733c89045885888882125f2b30dd026f2dea788e47060d4d69fed452a6b0e00b7bb75f3d3caabca6f2a71ecd41140721767209548022c73bc4b5988b83290e5172ed053bf621ef970a7abe17efd7beb5495a3b1a98482eb869f85207e87a533c47f1edab3254f6baa9b25707fff1e9f8cdd1f5d1a7ffe45efeaf97a0a63b9e7ff313b788dd973a79f362341abdf8fbbbf757e4ea8f59c4d9c8e76ed11de610f7e13ebe0591ea2e7c265be35b14731e29024ccde1bedc62f20e534078ff2298631f3b7b2f5e7c8c307c80923968c021c701bd00843f370d6e3c9bbcba87feb26a01e8c48f7148f1116ae20297e14e3178acae51d2a8f7d0bfece3e8059dedbd17473e5481c8b51880969c8d473fd1feb96130e3fe7de3457b1feeff1eeffd3d39ad8b386f46823db9bfb3e7172f4099e066ccdbdd24ddf9def1103477cc424dc75c7225d10f3fbdf81f84dab9c3f4cd5e9a1beffb1f5efc0fa0b2380ca6f09581efb99eef1cdf7a53e7fba4a631373abb27099ce881e40f2f7efdf5d53239942e47a2c3b49853f24c2f472abd2b524010427bc96d5a6429d15f0c7bf67e499f39a15fdf16a879f9eb31748bc8da90636bf798dc3f454f0bd9fabfa6a90eb89431825c896254480048b7cd77d9c53eb91e7452b850a7ee3bd125c96541f3d7c1d7724ec8ce8d14b283f9fb3ffe3bfee3776e8e43d06d688bb7dfc4ea2d2c4be34c4fb60be76855e1546ad07e0f647aa32c5e1ba5b14a2037632e30f5caec6c32851ffef8ddbbfbe3f7fb09c95dfdb873a734287a6b0fb6dcac88ee7a984f99baf8c7efb0a4e96a7ef4852236a85f7d463b7510ca2fcd5aca6aa34a92e32aae628aaea29bb2a80ba625a8ae8911b22d47515d5b339a53f674844eaedaba4ad837e1bc1f48f45676ab583ecc6908ff6334d29fa50346d240e46d61628cdcbf46dea76f4d266496ef0463ef4dbb4392de2e516547d32973aaca3c2bace4b1c6c9aaaeeeaa574f0391f4204eadcf2e6bd74bf96fb9488621ad6bc4aed7325f6bb0589b6d0a4d568bb5318a6da68bb5b14aabed179bd146a732eb50cfec8fdffff83d04a91bed5aa36be5d8a09084e83e32454de27983d74cd1762c531604ded44524034313114618de02d76b668796a5cb8ec49b226f033bc49262220118a320daba25da82a458e2463c7bc7cddc06d7eecbb3b7c4b157f3eb0edcfac15641b40840ab5e3cad3590360ae8c9555443974c9d970590ea92635abcad9a868675c116445ed0dcede6ad5d773d3c629387b5b1fdb5714d941cd88f7993c91ffffd54d6469c372a306555d45d51d64cd9e01da03a5e3411b26453c148b2b06a6b1898f2632f8d476ef1b03256ad8ca5126fabe65f42d64b210c4b66f6b46445c55b2e9ea4cdee519e1e2ff7292e762b4f8fef3b95cb8eab7b944e8fa9bb81d41fc57783adf8007402aaf1dbe800d7c981a1039eb2b34a0780aa9346179066df920ed0353e25dda0cabe3475306c611757d50165f317fe75305f429c7f2aec30eb5d975601b095d70fa2e276d60540ec0a5171636c2d59e391d6a1fcb243593bd02a3fbf76e846efc456b056afdd16c89e9e992d989a9ca45b409afd5edb80bab809b7c0b77af9b6c3d53a64933bdeaaebee20c48b089fa228a6019f4b15943f775c92ed404dcb721554edd25c0d24f681aa5da2d5d2428765da5243fb526dabacdb726dc3b062c9b6b4bac3b26d845e6be936626b5fbe8d60ab96703360f765dc88a3c3526e836d58cef56b97de8ef986ddf8482d971fb2ebfe72d82fecf43c7f017b9c3b0f7fc9f76fafc86220770556dfa7103334bff6e6af0ef6931f2f58a3e0a97095e441fac821e8f7257601cb6d71ebc8760de94d735f26d635db68142eb480dd96379b4f3df7fe4d88bec0e6e2e7ccf7bb8094e4fe635b33e21592dc37e9911b08610b72557e97633c2529a3933d1c4573e19f0381baf767d05b7443efe1a35c332a367ae6f95724631f89bb4cfe1971b728a22f5fa3083bffc876c424de99b52ba9f2684a1a11dfce182af43541c52ff5f33a604d4b1d130e474b23729681d32eb090fbe436c6527f0acd2f386bc6b0ac0b94f8153af64a920c5e93f764d9d005f24b3164595034f1609f7ece4bdf934755330c91d7f7045d5025491600445515433dd8bf2f97fe0a3d25b86519701b82a1cb8aa468aa22a9ba6c10dcf0b9881b1e096e4557f7648957750208c565595734823c2f0e0a66a923075f6e225daeef9c28ed014e4dd73503a64e1045e86343c7843dd1903459357455d67855e205a9be53a2bcc7f3c4282cc3c889a20423d1d01f8252130d5e31041d70eb322f57bb52d3f603cf79b5fe753507fb9e53620d898bd2d3bb966654b86d63b4372aee2a8b57d0b03b6d2b8e56d0822f41e89c7a5171caa90d0238d45d893feed7143ea04c8a8cc8abda2b7d92fb716981ccdfac74d9653487a6a3292cbbe8beeceafb6512bffa7079f15fc797579f4627d79757bac1ed73d76792f2f6fdf9f727e3f31f46e3d7475727ef4e2ede15ca8cc627e7572767af4f4fe0cd82f070e473d73884551d87501397e53fe1aeeea318cf3858540687fd08cfc8d5a6e333003eb95c09fc3624ce5a0476f46b5f18835f03465803465c03465a03465e03465d0346eb0b231219d31f46e90f23903138393d7dffe1eae2fd9b4fa3779757843af8d15805962548da5834f43d112482280abc303e3d397f77fdf3c7f3f7d79f46444c01e509bffe9a11efd1f1f1c7cba3e37f7de2f7c8eb0f97efa13d803504edef8b67df8ec6fcf8e8fcdde909c3e0e01bf8022ff77801648f241aa242e64592009834e7e4c3d5bbd15816151d5e1c5f9cffe3e4f2eafdc5f9a751b2a008dd5fff7c0125af43e06777388c307786431b110da38002baa491061d5d1e010419a05344b45b877a2efac42710c60744f58de7776f64a1025de7854a05817fd35883a8ad558558ae826a039c8b883ec5a178b91f20ff0c757c757c94d644ee5abf277356c6ab94f1be25a971380cca26b1ee8e15aaf4d4cf7d198f5a87c70751724b1175c201f304737df5e91885318e3ce48fc55fc747ff7c0fbcf2fb13e09ea459e38bcb37500180361064529e705b5a7d022036027cbc3a7a77f2e9eaf8e203e1c030733ec6f4aece6811dee1fb311707f3e02644f35bcf063d6e3e876f7bb0768e2e4f8ea0a39e3f45bec3bde4023fba0d42cc91a7c075e90329f7faf5c53f3f29fa9e2e8f05638fd7c71a4cb63196843dc528113b11a8bffe0abac1242e099679187c965ffd48fe1c2ee219f7e36f818f0f2585fb114fa7f3e81056aece733fc601552a0ef971e17fdc8f64dea34380f20372417c44ef05077cc51a40c481f620807673b0cf7e97bfc20bd238f2b1f20d34f35b78453af0132b92bc291622d145a1c73228d50a4612549f17a9f69ddd7d8eec30f0ef67af60045817caaf4b0985a6536f1e059e937ea4cdd378a2032e7d2b028222904cb40beafc2b9a278a5ea65d7c5b3885a85506e810160c2f4c8539c331220a4d01dc4b7279c1268a686fd943e1be7a1492b7c5724baff2d24087370bd8ccbc225a4cf233ff4a34b55754a5c2f1c13e7d2a7cf4e22981637f0ba78b160902b363a62d814c89bce88fdfa7d4d99023da56083be645049a9dc7515d6acc7d0efc09a2df60a811478c19933f7ebf8fe33ffe1b6048c1104da0f568067a1982edd4741113ccc1ed6768dc8b17050f28020f1a2541418c09e405d99843233e93c0348ffb0cf861db1eec71ffc0d3bb806ca0ef10c5b488ee903759c4d0b6c902b44d5243629ff000c3a4ec28036a38c185bd9777053cd5f2e95138298dee16d0ba3d20f774844a117771e90dbca31ae5c17e51b1a4ef83f006f9de6fec7ceb60bff4585a07a46a5626fb59fc0e8db6a90a4cff96ee28826dc7c1be5bdca690253243de9478b2d3bfc52f61402981fe290581543a75007331290772601c91aa7029e603940e1ac9402a4b7f16c62a2c2bd18deaf5a0600f0af6a0600f0af6a0600f0af69615ec5da8d8ab94ec7635bba3a2bd91aabda6b2bd81badd5be16e54b9a9825232d355cdc2b96a414cf1ccad1d200e47d9808e38c79b81d02711a5d4a91ccafd961e03dca73fb2375f53b3fefd72e02de810f3009845757881ea0367c9af0ab4e03006ed88fd5d8ac7f01daa3955277a7f191ba8ef4b152f19cdf79b362407e9ada75caaa61d8e46afd2db4f2915d0cf59797698f339f08a11b8d47cfa06cfa1c1e43acce259143bafaafbd29c4d02b8c14b8af2253dee7939433eec6a42ce5e84641b74384a724a14d3305460d2eb9192828573b506e479c8e5e2ab37f550784f6fdfcc01095116692dcdc94c7d5f8483fdd2735eec12cf82bbb44cfe9017b8c228b46fd31285a7bcc887d083cd0c0d494e7fe6696b8bcdca6890a36455f6d774d21cbd2c1f089031b1f2137a4ebf7c048e76380232275932ecc56c314df2e0317419204ce6dba66c35aef7153b6f12842cd350e16c0d204b8d2a1d9402e025ec60cb1b99c67552b7464816df2a96e5f501bb73a0c61028e04e4c8e28a10737537c753fb348c268ea1a1a82544c5286b01e04248588c57842444b4e316c1ca3b2ffeb01fb54d9dfd077594cfe34adc30c6fc3c26130c94e329ddf227ade67030b35e3c0642bb9267c87ac2c2278c851b039cf8e8137cf8c5ef5f2cccee6e1bf6d39b759a9bc25fd6f23b3c998b290f1f47c1eca75cfccdd694818b7e2e6286299b0a6813d49c8d39ed29757e4fc159f3257d0947a85d1f64796cfaf99f36e7cd341d1ad09f20ae8ceef3f78d1bf17282cdc3937a7fcad3f1ee5af596c95bd88e260469ad51f8df4f5a782bab48cd104466c121dca8c88d2ddbf82b3b31aa404617f5459f38a3360126d13c7dbea790dea2d0e411df64dc722445f4c10f320fee931e94db006515a8445a618a9d6b01e51b2c1141525773bf2b109fc0276a5fd574a50b89180225ab7557b72090dcdaab2c934e658369dbded12efd6e9753b244ade9a204f81ea37c002af6726b9071ef920924137d8d6a82d21dee2002ee3de702ccb08a9baf530e340513fd84830ec9b8ec5178c266699a7fac06d421f87d106781711f02c2aaccc6d0a55c630568d68bdd2c4b68073ee8e3673d24d15c940529d63d2a67064a5a9663169572bb2c2d5ae4e7a290f191a4227930e2a4265143a29026d6d5d47dc571bdd5da8575bdf45746730898c9eb40ae8bc865c124fdac5704e254cde4eda856d5e0391aa9376915a1daa9582b33242eb4ce99ab3d867e25a055aa56c07b1d5d69bfec2a9dab1ae22a8b5dd0d82a67bcbbb8993f6b6b7098d6aebfb89860af44a01d0d6ef8e6cbea35da0dbfe7553db403febc0b6ec032dc2aea38d60bfe0e69e19a1a915a7e40952b5f51c84418c2af7521d44de6f984e56c9bb3f33419503e7c809496a932256889269894468f8372cc35fb088afebcb513be0d7383184ba811fff82bd9bdb1804301052e2f3ff7a72133ac784711f8e80998f0bff8e28cc15b43a4ba0e52499722ff1cd628a4256e26f40fcd4602c8c388bdc707f961a1449f5096e851fb3ff6788dfc7a062d8ccf4826f008c4df2e1e808b102bf04a1733547367d9960bb083de23dc28c8ab741e8fd463c13a6795399ed128898fc1871b3f4aaee9f93ae0b79d1a450e25a5f5d68a0c778a485bfe5164cda00d2a0f83e43f416cd3ce28c7f76c55ddde2e9947b33bde140bdf1a2a28133ad157a38c130632c813abc39c58477147b49a6f40bb9199c65638ff0d5c28ac8896accce2612c08f846e48c7f25cece7ecb2a40a05bba4815e29e9664e1ad6c27571c8b13fe9f0458c3bb297c5feb237af4b539c83b60f272b771ebcf5a6d302b2ff024d23a12941d48be80a8532f224d493feaba45f491cc5d2294cdac1198a261cf90f43490f6dd8437b7349a96adbc83b580174add34381885acfe12d5b80095871c4d2ca0ac34a5e15e234aaadb6903d2119157c878b6ed11c5f50ade19f493e027871f58f77308694e5b2e7957da1c52e83382764fae635356427630b1d1ca7ffd2b1a545d2a1654f64ea9a38052d501830554eeb458ee7fdb35aeb2f4484b1a5fa8185ced38fd938e6a0cb85d88874e8727122b2a16ac2b7fc9e942e343c1dc0721b0bdde9d0a2f2d2c93bd9a533b495ffaaadb982ad5088f4a1f298b67ff924b278383143e10487f5c713ec5b7a48d2fda4a29f56d2552fd95c33e9ab9b6c4f3b69d64f3a6b287d4e32ce92496d39cbd8deb8e7671ae4486dbd915c3aca6836d0ae46260ad258d0f9b15ab21f379a8e5723cc626e733dc4846d043c2d873f3f84a5bc03257aa13dc57d5640a3d57db53df9c16dca5bb42b7768ab3266ff2fd00a286eedc70d3d8f1c527c1bcc305fc5d578f4b0f6f414116f7b964ab8d79f2cc70374c45692e0a58d33e1d56de0acc92c32542032b7399c04df964791a25c7ff0f29c9c44bed89d9858b3d85ab62337b3ff06f371db7ac840aadc7cd2caca33308196ecc5b0fbd9474b1029ff9db41a460a16d5569be496ec92bd6d93e57a4b7c71d28929d618803bb0beaaa57635836b1d9cde6c6c698c3a32ab0c2ee74a932e2c29276d06d0c878dabad999bd547bb782895416501f56d143e3efae7b6e43ebefaff76f53f35fc1447b68ffcb36ca7a3b653f2734f265d8e33dbb3dde5b3aa13bd9e1d52b3816b54b6c515d5cb2356dbc71dbe616eb4fb8355ab2156e6d77e4074f746b94d805b7bb6b29ed05db14a12eca768d2ed07b25e61a4875c975d4aefb6bc8cf42e75d22f89e6a2f21eb07d77913125d4751cdd5f2b6a60d7adc13d2e30ef6f383a26a24d92d72822f1cfbc38e0dde78519c1e83642f9393d2b3f46df1b0272b744476ef002a29e5f72b4f2ca024398c5844474477cc1296b12f857310b58cf7dd34b0925c6dec353de72c80e629d9d237c99154c11fa9587db597ec2d20d8ab14ecd2a3ec4489df538df23fead2499e334463242ba0c5bf222a1e6eef57e3d952e785659f0672a51e8ab9901ceabff142d63cb65d391cbda23b1af87ebe9859f4981666f04b88e6c7b728242347320afe02cfa7f96de699a3c011f17ba437c020c759424d9d15dce52aff328dff4ad2f1d140e93aa8f914d90d1f165144ab64c7fd67e82b8938614d7b1b8447495be99a70b0edcd108935922a518714ff0cf664d088394674c9139fa63450f19844db3a6400e8927eef13294f1c07e2f77e92bc2d5ba40e651769a3095292df902c9a5a5c17c49fe125c176cf1631850d6028c2859fb6a37d79fd7b819c1456862126f3402d0bd969ab8dc95d8d9ef39e7a33b289c84a1dc3ae749e3a5010af0b0c0dcc4fbc49d6c4e421e1677c92f0b10b334b1333bec33e0e49f83b6b1395b7ef926f35a58aa924bf16c72563be894300e5fa294e3a1139d6ca20e6cc2c9b99240d6471ca8bb8b321fa80439b15278c8f35221bdc4a35e9302652eb43927224b93bfbfa727c7d3a7e7d397e7d3abe1c9f8eafafe0e7d52581f048cecb7bea2d94ced72fb74132e084aada473a7151fd50a13a91c116ba55ee6fcfe92bdf909e85011287aba937f308d3a0973e30b6415c68d34721a11a18cb0f284ca613f817b293dc9c8b39214e10147e0103f1d639f3fc0fde573c655e28c05ba89e9ae70f4d5769a16e9aaa829be1f08646a0e5b84e49230bd8d22ad0d7c24b81a52b4d5bf7966632606295d40ced49e784646e3d9a325ef4dbfbecd6af1492d18840a39edfb23b54b36a192ac400163ea549a7dca9f248b749829502711371d85d186e4314d609c216317890b8f135f9fb6d637860696133704dcf47b64dbcd2d814e567f49447d45b71cb98e92ea3bac5cedcfe56419396a77165859cc5dfacf653c56e05c49e9aa0a6090f8a6176d701ac44c25a7a1366361389e5af2f3cbb8286dc16f33526a905b2a354caf08eba93471531518c8a16e7bffc7b11c47f257289fd2ad89ed90b3e794fab67bf197cf29ed9a2d98390bcab58a54b1f5f9116346dc2c8b762f3190810690176f97bd2c7a472d651f6b0dc76f293fdda2f622b94c89b5353ae53ad39892ed74f1014f1a6544a7fb70d4bc1de5c9e98c4f25c7ec96cd0ec210f9b4e3ea6d6e8e579d9e6d8d710ce720cd3ba43cc4ea8976b48a39dd6c5abfc55ac419a0529ad8bb6ac04b5d550319dad5be1d9596b25a4827551d734bf2620eaa1466a75fcd63687ac29d26b9b63b71c13b62e766aee5dae21b3fdae8b57a56e1dccb363197d6e765d7b31137b6703e28d1aceef490d68a92d769b9452b1f06e91401e763d3df8127a98555308c8db22d6a5c8b9871af555417edb9c80fa70c0071b351ab3b79b71ab0b317cb891cb8311b739766d618b5baca712e0f850f35377b6d9a4ed26a75de5264f3a698a25d0922a3869d1034b50b9a23769d5f24a40b5dd9ff4d1e14ae8329a9bacd6d05a476b85fed5bd0ffdb4abf6ce74d19dda7bd5ae1995608baacfa44def2941d528369356ada64c7805b565d2aab394bb99292593568da47d745bf48dd641dd843a3624887568a041ceb7c2b44af1eebded23a3db3bbe5a02f7e8cf927c5db747aba4679f3ed5cbc6f65e75957cad585ae45af7715925b5066b556f6b55e23b417f26fe12c55c5a8923eb0adba5132c48caf7259beaccf3d9716c5fe367bd575f86ae7870d51775eecf97a1fb589fb7a2531719af7c1b063366ebdd4e4fab58b7d3e12ad6edf49b9ebb6dbbdb14e9b67b4d91d675bafedc29395d2ae5ab481248542e8d2d5cce70c0985cdd8155fb5154f92bb97d2d3be058a029c938b17cdb64d47ad8b574a240f943aa09554e18eb4660f5f1159e59d871b0f34b7261a61d2caa271d552c802277debc4321cdf74b3230446bc0d1ab3dcbf785563a02d3d8302107d9d91bc90b9c3f64f98ad9a1edeb62a9a577a504ce89971349435c7a4e0b5dd124b9c9459bf76f3c7413a2d96592c88403d91a7ad622c6a734a907735b6165d859f2cf401324c3f7ac98d224c19222e5229611a3cd5900fb85e07752264b2f7d7f383a0a314a4feb537782331a7c7338fa27cb05c2bc23f29078969c81ddb4f906fb01f055e62e20e01f793deb442903c9c7393d18f7668b59762a9e626d68b793fa00952e192d55c87a77c4822e58a68bccd92ff176fb4f97fe332a0e5492b6232b5a4410d55c5a9a5694a24cef388d4a431214b2287c61032ed016a5b9071406d1e43897a6368162b7690e162577c8493d6344ad92223aba0dbe1c7df5a26a0cc3017176c84f8eb94242fbc3d115f223ee0a879e3b36c62f85b14232ce145bc3b25354966846b29c5d190a4a40e4b4d94d725e5700a17d5775de99a5181b7a81766d8c4dbfc89a21a3d316323a6d31eff376c6b967eee7ed657fde5afee71d6480de6a0ee86d6781de651ee887c904bded5cd0db0cc0ea9fa661655cc6b69242af4e0b2daaddf2426f3533f41672433f78b8dad682d5b693217abb39a2779725fa21f2446f3b53f42e73453f4cb6e887cb17bdcd8cd10f9933ba3588b97fdee8be99a37be68ede5af6e835f247af97417afb39a437c922bd5e1ee9fe71a0cd494556dcead02fa17429a53491c89395d734f4cd2add39aff496a2597bc6b2f6c92ebd4e7ee96d67985e3fc7f47a59a6b79f677a934cd39be69aee9f6d7a1bf9a687bc1f0f90f7a33626b82e22f860bfce1675b05fb1abe6e6e456236e562c794fb3dd5ea559a7b3f0c042b850211e4d280645f1c5b0b0c4385a8def12f4c4dac73203176f40af8f9759413bebd34c575ad99c46966983deb158b5edefd74d40f6350d6d63a8a22cd4ed43886d2f4a4dcc21b96c10bf59cca79e0dd37d1e38b87a571d82d6dee1e35b6c97eff4b6c99b637231e34d72935fa7539f4290cfdf6fa2349af11d89bf057cadb3d5744e47b36263077044af69d6e7f629690eb329203aa90f95e9463e053c7472564feff260e6d35c99c9fc3c869ea1a463c32eb17cc9aede646b869e05a6272d8570bb8330bd91da61a9aa8bb9e9f194cd655a06fa470b1d8ee84df793e016f43cd224aaec8926b66584355b330d43924d59110dd3c02a36254dd46cd59044d532c83a675784fe0ddf9378227673e888f39c125a55921c577115537415dd94455d302d41754d8c906d398aeada9a617a8e494192ff0a86058505c95465cd3565d711a0258665ca36af6a8e2b2b0ad24da20846719844741f4551607b882d42ca43dfa7ed30755152251ec9a68b04c39425249a48d0655311542c635e114523a3bb423368fb475c6560fb21a52d39cf318f382208aee895ac30c116adf43b561df2414480b61045de149e7d134dbee36e615c0fa7018860f28b9b07617ca8c892c845d194dee309cc995035378159f8ce73bee3feffecbdf972db489238fcf7f829f0e346ec746fd312000224d8233b429665b77674b528cff4aec381281245092609700050367bbf7d9b7e867d01bfd89755b80a27715094e82ecfb44d00955957665656551e249bf02b92e2d6a7a20be2e73e5a395390c1ff2d509abc06cd04396b98b70f9649ef7afe2afd55f0089ac02c83360804936107f63607ccfbc08ae30742303fa6ae6ac8adc90d9eb29416640c0da7981dd0e853f22634a4d7bd24611fa43e744562f6714eb136d4d4e904ba33c4baa2889aae21037add1b4fd074d89727835e82a2d3ad2a22eb3ae8d3b41d207e7402df060dd3b60606057529383380df19192f10b2d01c99ee6a65604b9fa3cf66ee3bac4a53551c4c00b1d2d395812ceb9aaa8ef5fea43fd6faea5083ea2a11761e724d55a6e2409ceaea9888d7415fd187c658d355d118a0be323134acc4f1e9b3f0a5a4debc4286e673903c23e2b76da2b5a7483fa7c9f57920b7dfdf2d33b8a6673fac562ea591c483240f0dad371ee8788c41480efb22d0903cd655042272da1f2ac6605c89fc135845713096c786015a8f3281bf54494743c03fe8a3b1224e54196b288e03cd0096127c832a184a67a19f3b89b36dad4fdbc99eee1d51d7449b56bbaba8b45cede66af733a7e68c064e11d1237d459191365001baa7c076b2a7a8fa7030e8eb636d3019f68c1e560cb5ae2e5e0f7b0badbc6e45b9faf94184e58978825859f9472cdb56e47dd6a07dfbf14fa3d46f9749fca83008147bd41741011e8ea7a00a8376afa1a908d4662820ce5434508d465c521d7d5b36a95353099ff861ee9f865168f49d47e211da2fce244d99a406a2264c52bdfb6d99a47a4da54c02689e8c49a871c2a3b109f48cb3497336d17b7d59514403e983e154024d451ceb688061c3ad0da79ad847e2a03f6dcc2595b06f83492a56b48147be874d483e8f7016296191aac7a9550e20f9712a3f4efd5ef8a2f864b5ca01253f59fd539dac9237f9f60d7ebdb96616e14761c27e0d8c902e6d2b4e946a2e4c185607da97ec13364ccff7110e4c326ef157ef145ea66d5afc1ada07fd2fb66339732fc288f59b63da16a3f9e062926bbe7a30ff6ccf8e0ee36161e78c8e75edb17f304dcf432bd75b59161ffe9d0f3f8876cb333d4c4ccdf8143cc91478204b3df4992c311e82ce593a9f88a712450b6cbaa6a52f562bcfde34016f91876f01622713e039aba449a36eade6f39ac3cf222146dd9681482acfe56a593f4cfa1afebcbcb8786918c22fbffcbc58fcecba91d3a89f6440f773b26c15359dc8ca888b69cfc763ba7621ae27930630bb98b03f3267885320a7c0275009f8cab3e3219f1325784d367673740f1b2f137b3651073057069e8e0b927bd6f2f1bf09f6ab37e12e75f713714c64f2b16104497bdc169299a2bafc707ede6646a13767747331256e2866810769b506d14c546fd6346c569b36dd606490ac67f557849cf398c5ca9e21cf5b3d879398a87f894392b7d18152fd0e373e3b4bb5e1cc68577701dacb0d79808ab2de84e797b948afe3b3cefab89fc6b834ecc7bc098b257863746f7f7907aa485b1c574b6c113c6f569e97d7a22714e87967ed5cae73b9fe4ce47af17dd2f6c57bdb4bc22d48f9dc9bafef57d86fddad868bfeaaa23f36c178845dd4e1132c64be49f7735cba32cbcdd3ae5c2c0ebe703d1ff785ed2f68f57d4eb6b08405ae15dfefa2d5c82b9f2f4c7545b96f5dc2e5f99f6927920a0dcfd9a5a21e474f9abf073d8ef13079c6dd091ef3e3d800012337912b82be11cc284e5410479db5b00a63a11f1681491158ca386823a41c41e6d8b56c84ee45d08526191b71286cdb93d6041b61d5b8fec425f046c03ed3edcda50751e90ad74e1bb1694cdd7adec16d31e890052d390d28a19498c21833fb8d50125b7142872b01923340814de846c85eb291bef3e5462825dd35ea8a96063b3a4cf1e05110358a65cae0552e33e2282b0b4d4fb05cced757d687a5813c9c083095459366cee698f298b539b662e66dd5d71433b7685f92b9db0c5b1be82accdfa66d2961d00a55ae70688e919115ad9a15888ef6380249d2b247be60693d2c54ce54c57274989637442d713d07382f2183e2b7025380ea0850971e9bf2c38b9565fe6b8593ef2cdb23f646c9973902ed704775a6a4dfaeaacd1195bbaaba50aeee70c8934278673d4f48ec2ab5f6aad42ae5d5caea263beb6085b56077049e5c3876586fde2ab3abeae325a94a8d52e31a7354df1d8e30b3d8ed7460d3d669bb984a93cd2848b7dfe955916905931b31bf9505aa3b599c4942b4d44e220b98a3ac57862d50cf2bc3972ae4757a9055c1abb721a374d7e87ebdf21515eb1af56755e93ac045ca73651c4975b94ed5b1825c1b2a5689ebb5335282eb762f547bf3e058f6cd61d5a3585ba638e398da71aa4134f152dc1d28cec7f4437816fb3f62f0e765ce5fe19fffedd08bbbce09b21e909b380c28a82e6e07bdb0f3cf0205d7763c7af04dd7051fc43f0e1cf979130dc75ebeb5bf581d5af494d913a492b2260678be5a58c900eefebbe038930e519eeb65986ef22534e6de348058531b96524c6909d70a599ec86b85b05806066865a9dfb0d729a9d8ae994931d9720c5b22a822485bb6302559db62cb15b56d910642742b6802a95a1757204d7201a5ca8d60d691569d61e47c7b3c81e0df8488ac0009b9c6c85a46a4b2aa9d61924143739aa528118fdffee2bf3b4cdf19a55ed365271fcd91ebd90e36e285878122b73ac4a948f0ec397650905cd6bfed21ef33054dcbf40e73df4e48f2086a9141d248177cc9039c9a73bc44defdeb2454f4baa8b2d747ffefe3c9dbe3dbe38fff26bcfc8f97a09d1ba675f7b3b0f2a62f35f2e645a7d379f1ebfbb31149b0bb708509b2847bf48005245cafbd7b5849a72bcb5f52bd7be40926290242cd10bedc63f20e534078ffc25e620b1b072f5e7c70317c809231a82d20c3007500d67c616edf9913f26a0dfdf5ab05a053cbc30ec547a849b0a73eee1083e9d7d5091a7506fd8b3e765ed0d93e78716c411588249f05b4e44adcfd99f66fead80be15f77a67b70bdfed53bf835b8a4730573416c79845ffde7172f40871016be9f9b4ebaf3836122686ed70f32d11582c4df3ffefce22f84da8557e19b833003c50f3fbef80b5099e7d873f8ea831f4c4dcb38b937e7c60f414d5da173b126a11be93de48f2f3e7d7a9d2587440a723a4cab2525cf300579e21d4b01b603ed2539eb092bd15f3ef6e87d468d39a55fdf31d49cfd7a02dd226bad23f8bc7b42b2bcd34b429fff6fa9a992100a4658575c0f316936a856f410a5cf8ed59f53266d75de77a2429294dccb37f6d764e695ca8d94a2fbf8f5b7fff3befd212cb103ba0d6df1f69b98ce759c19677aa1cd5c9fa517a744830e6b20d30ad7e2c628879b16e462cc8c504fcd4e9b29bcfef687f9f0ed8ff58c64887bdab9530b14bdc683ad142ba2bb1ee6735f5dfcf607b034e5e6276714b940fdaa33daa15d509c9a3e13cf6e47f9496842fb5120be89e4bd267edb74e092c31c06ef798a465a8b70c04800a8b82dfe32760b4a20791fbed5fd45266312172c4afaa4422aac2a9697c7f3b96f4b1519548c83c71cdbaabcbad3c63c054452833807757659bb66e5bfc74b320c695e2376cdcb62ee814563b129159d5a34c628971d5d34c6dadb7c7ed18e362a9569423d8b6f7f7cfbc38155d7ddb546572ab1412171d0dad5e5414f1487e2409727c658572449d435192920d064841186b720f58ac5e178ac29464fd4657102e210f7541d4920182579a28de589d453c7722b99bde3666e436ad795d95b92d89be5750569fd685ce0ae6cd0aa57cf8b07c246013d4dd5fe50ebe99aa848b0aaf70c7d2c4efafa7080356922c9a234986e371877537e78c22673ded83e6fdc122507f663e66cf6edff9e0b6f7871a36c5de9cbda545606ba32140da03a51d6111a2bba8a516f8cfb930106a1fcd4acf1c42de69cb189333225dea58f7f0959673c1732c7ec61c9948a972d1e5ea3562f4f6f952b14a7b7f095ca45b7ce354a87b7cdd540f26fd4abc1a6aef22b01e5985f5480ab648750014fd2e6a40240dad6a20a48b1894805e81cd3906a504993983c189f51592e39a262fbcabab59719c4f12766c7986f81b409206540540922653d560290b22d2c2d99632656a17cd6caab1c6893f15d3974a1c9602958a9296d09644d73c9124c4596cb2520c5c6a86540556c774be04b4d6fcbe172ada48f0eb35c74e4e0958bcf91eb512fcc4c05c9cf1519ac1ca888c93641e5325a21502eb3a54b4b1518aea48672a62babac1ae39561d8c07c25adaec08085d08d98b0105b392316826d62c662c0ea0c5988a3025396c11630663e171e91e4046ff1149aeac7ecbf76ec257660d419c3832ffe2d75fc02f6120f26fe12ef935e1366383accbe0f211668796b2e5f1f1d063f5ef88d82277aa31d3c878f02827edfe02960b967b768be76fe802744e117beccc6b7be42cf46b5806d8db958cecde9faad83be8016ff4b645bcd6025e175fd3d1031bf38411ebeb31de834d5f547c97731c673127a23d82c513457d62550e8747d01dd4577c483cf97972edbea85698d48505ce2d718fce908f7c8a52fdf20171bff88b69ec49fd86f5750e5f19c34c2bb5ff8a8d0d7009598e9e7aded372db40078d509b268c5252f2270da05dfa59de24af587693e630ce9015f33a4f8153af6bad71b8aaa76d0ef4b03653050b461bfa7f614ad7774483fc7a5d7e4b13f180ea58178a06ac3a1dc1b0c868a264aea50d68e0ed7c9e25fa1ab04396c3f0ffa129452c4a126ca5a5f0538821c3eb3c8e19120ef8be2c140d5c49ea22a8ad85755403020c8e3e2a0fa257a72f4e5ced594fcdec9bd83e150553459ee698aa229d0c9a29e490732ec6b49c56a4f52a4a1a6c8f99d92950351ecf5a0efe24054866a5f138b3a44700e14b9af8a72bfaf0e6418b3745f721a7f641aaf1ba7bb3a3a348d8470088c819e615eab0e1398a673d061377c4c0eaba343a61761c7a0055f6cc738375d76cae96e1f64d44342421ee6143ea2628a8cc8ebbc9460440d0abf47865d0e6b2be62ea1e1680e6ce7ae9336b55f66deebeb9babff3cb9197dec9cdede8cb4a17028dc5ef4d47767973f9c762f7fec74df1c8f4edf9f5ebd67ca74baa797a3d38b37e7a7f066458438b2845bec00577b0ed42444f14584d1daf5f04200121d0ad872f10206b3d3bd00e0d39b8dc0ef1c621545603b9feac20cc50630520318b9014caf018cd200a6df0066501746266b4c7d18b53e8c44c6e0f4fcfcec7a7475f6f663e7fdcd885087d8e9f67b034dea0dbaf2503b904178c9b2244addf3d3cbf7b7bf7cb83cbbfdd821cb14509ef4e95344bcc727271f6e8e4ffeeba378405e5fdf9c417b00ab03eadf177372dfe98adde3cbf7e7a73e0603dfc1177879208268567b202155322fbd1e0093e69c5e8fde77ba8aac6af0e2e4eaf21fa737a3b3abcb8f9d80a108dddffe7205256f1d10670fd871b170819d09222a068302ba34200d3abe3906083240e788a8b7063511b488f11d8c0f2cd577a655bd914c051aac71a90a6cebaeb00679d0a80a395905d5060490b7d05b0179d97ec0f237ec774727c7614d2b0b843099b3245e3589f71d093d2360d036c9316a57a54a4ffedc27f1f4f3f058b092dc53449570c03cc15c8f3e9e20c7c3ae89acaefca97bfcdb19c8ca1f4e417a926675af6ede4205005a40904179226d69f501805c08f06174fcfef4e3e8e4ea9a486098390b639a0edb5d390f78dd153c7b69df3968796f4e408f5b2ee1db01f0cef1cde93174d4b4e6c8328497826db9f7b68305f2644fa7f481947bf3e6eab78fa069694a571a1e885a17d42871d8ed4907ea3041ec643dfdf409348399975858968efd5979fd13f9e7d5ca5b083ffd6e5bf8554f157ec2f3f9d27d059cab89c24f9e4d558a576297f99ff0139977f7154059b66ec0aa45947d828fad019638501e24b1271e1dfabf935fe105691cf998fa069af93dbc221df8d92f12bc610b11ef1dc7f42314e52e8cc4693d2e92ee3ba636ba68e2d8d67af11a46c0ef42f2752260cf7c6e2e5ddb34c28fb47903511a820a99fec602821e104cf414d4f9d7340ed3d161ea2d73dc9fab0cd02164ce507c0de6027b88e8330cb819c4ca825d1451dea287b8c41239e42d5b2ef32a2e0d7478b782cdcc6ba2c5043fe3af44517b4d352aec1d1dd227e6a3e9cd099cff2f738d37264e5613cf5796604d714df7db1f736ad5271065cb812df3ca05bdce14a82ad5153edbd60cd16f30d44820a719b36f7fac3defdbff010c29e8a019b41e2d402d43b09d9aaf3c82d9beff0c8d7bf182313522f0b6455190d304f282eccca1119f89e397297c06fcb06fb70f847fe0f9834d76d00f88625ab90fc89cad3c68db6c05ba26a92138a03001c32c6991024a38c185cd970f0c9e74f9f0ce9994460f2b68dd01907b3842098f362ff106de518df2e890552ce97bdbb94396f9bb7f91747498784cf001a9da2f13fd64bf43a3275403a6ff26d200c2a6e3e870ca6e52088b2c90392726e3f45ff68b63534aa0ff24bc2d529d3a82b998253d263076495538e15c014a0775192095853f99b172924a74a17acd156cae6073059b2bd85cc1e60af69615ec5da8d89b94ec7235bba2a2dd4ad56ea86cb750b76b2bdc852a37555012c774e953e158b52047f1befd3840bcea4403da110c73018b3e71dda4d6db50eef7f01a601dfe88de7c0d8ff5d7590f57d0219636088bf4f002d5db46c68009b460c703edc8ff37e3f8601954734a4ff461161ba8ef998a3367e687451b92a330b1b810aa69af3a9dd761f86b4a05f47354debfcdf96c9bacab2b3d3e7d8b97d06092719abd8cf22facf2be14476b0069f092a27c49af7b5e2e9005bb1a4798ac1cb20d7ad5096236b0f10e52306106c2a02073b156803cf66d5c7d35e72672d634d2770c488892a5b530e631354a918e0e13cf71b11bbcb01fc232f1435c60849133b90f4b304f71916bc784cd0cf5fd0d7fc66161d96645342850b24a1a461a610c5c3fde06903139e427f41c7ef90012ed5507c89c44a198ac16ab791067ce471701c264be2b8a063335bf62e36d80d08fe4c3dcad0164a251899b5200bc811d6c722353c827793c42a2e4a6b164f90376e7408d0e50c0831cdc51420feee678b45e8c4940666a83e9c0aa484272443db049888eb12f135c5a728e61e3e8260d4d8ffc4fa9fd0d7d1739bfcfc33a74e7de616e83e1079a2fef11bdef9b8008d53d5bf73939c74f8670165978c85db0be8cee81db471e4f9b534697f31b42e9fba5e296d40f8d3f2163eafb668717f450ae7ae4eb4a43e24b2b61895c3fd2d4dc9ecc02f29ccce9cb11b97fc5efe83c45d42b75b63fb2bdaf3f332a4564ac4a294da7b1107410573ad1347497a8a6f58754eb75255091e49ed695d5c8ef14061ad4f9dac8c684e0431c740d2022b43e1ea6b344a5c30d72c3e60f9d8fadf5a0c15c125998c24a303668a8daf5ffcf0cbfbdf2c89996de701a5c9b89581fe26a3a1507723f8d8a525efb5163b1351cbc444f0b7a982f0c7cd566293c6449655693c52244695e9a153252041270ccac945da2d261f38a98a2ac4b15493f4211cdd66c0381c795262879b6918c23c06016671b89351e084a95b38d2499df9b0a8497d3b6a236555c67abad076dd7da7aabedb6d6db1226abb8e61e327663d1a68e6a45899b95b4ee74e4d81e4ae5513872cddf31a5ee84b95ca4d2252dc4c98983df796705dafe98d86fb1ea1a79ebfa71dcfe479920491e4ea497036d3879a960597a8964cd78391c0c86c6441c0fb038fcdfa45311010fa045d11888bdc1f4a5d25394978a248d5f6a8aacbdec4bd381866479a2e1f1ff1205794ef5ca64e836e195a028690dcf252699d69d1f3a07a8fa36d055897692d5463cd01483cdcfd4b6bc7f62f3ee1ef44615c44360e8f76676e71827845961abab523e0effeb5098118c6c149dc208a2cfdde03bd808387e89bf63c7a29b44d050c72471fc45b88920d507b855b1ebff3f427ce6a1b939f1d52d7c07603e21beea1c23bfc03f41208f9668425f06d8ae1c93dc18f91b897bdb317f27b711f3b8a9fe7e2562fd459801fb97a0eb525c34281498d3a5c5e7042d4dd2c2dfe35d0b6d006990b78e10bd430b9318e05d8c84d13d9ecf85b7f33b41ee08a6cb6e6ac4a056e8e10cc3ac456fce613ab1c3f6924ceb179270db8f70eae2d16aec925354cf3f8f08003f10da261d8be39b5ee6e5888fee7ea0996622ae559248c6abe9143460ff9f7020a1ba8b8b4ef092edb9ffe64d62b263d0f281f5cb5dda44976690fd27ac85017549b2c6a2630a45844ae828fc4f0dbf122bcacc190cdbc905726702f9cb474b8f6dfc87f2269352e9f69177c00f543ad1630197ee9fe1adcf9201183b6a6165ccd092578ca5665ecbc76832230e8c9621b8f76889afe8c2fc5be0fe072f46ff780f6349170aff79637f68b11bdb8b499bbe794335a0608ca193ddf03f3ac6b44838c4fe1399c222d9410b3083d657c27a91619abfa56bfd2759987de6bdf63dd5e8c7682c63d06c217f442a74999d8c68a88af065df93d24cc3c3014cb691e94e8516255928ee6495ced056fe576ecd296c4c21d287d463d8fe5c5d21714cb140ce0c3bf90715feb7f0b8a4fa99457d9daa8e66b51dfdaa8996b55d5dab5ce3aaa577d53df3b80826bde4d463fb73129115228770cd47d8fdd70a39514e1f58d38bf7c4d510ca12d9f089ddbe58e9eca41ad2c86527d66874644de029eb07f558a7331529d67426735c97635a9cf8ece4e4a7e259c645c5c39f473c047a8cc3a09a1cb9f144a8d59425f6e98f3073950ea02ae6f93501a54744637016451aa9c3ab7bdb6821602274b0346f7b7809ce4718558ab6dd60c661b7c89a35a92c00cb9744f6f8881ee86c584ee223a060dd98555a3422b0f4ea30dbb83444a0122d5d7b01a877aa98810ae5f96c9330af7c1eb9c573c9ec89dec5e6a3c9d64794cd8f2a0b68aea2c02c1db0466231336e35845f041b4bb959551117b3830f542ac8caba5d4b5ca57b5b4128a598afaee8a9b963a9a71f6f6bd7d26cdfb2ed9d4b05415d73f7923d3d2e3e45ae7fed4ebef0bdec77b797dd787fbffd19d9ca7d7e45d5317d06b795cde9b6b7907ff26d5fe65c75ab3b3fcb7ee6dbbe6b3659f236776355cc026a6f1ada9a096435a2348bd6d82134d3f0f74e5fcf304803959db0c1cef4f580a49b2ad81bad0db8beb9affae6d1617c7997f3d5bd4786fd45f0fff1af73de9aae175e4f452f833bed8bf02d7b0917153a26271b24a5bd9a7cbff126094a924ba2957b4cf4dc289c8cff85b99fea27f1be9fdbe320928eff9ade4833a071c09cf04d7055e8571e5e1246d5a77be9bf050407a982557a14ddf48907fd61f24f3ff796d5d844025579a93d17d5e59fed714e31cf00b76c3074725933851c83bcd81425df4a856420429ee010338db7a6e337d9df82bdeabca6bb34f87eb95a8ce9553bccf417072d4fee9143d3a0af3cfb9ff07c1ee77c8d4c3f8ee7e69d4503e623c3c8a0a6e627d36c95ff3ef7fe46822a5177b73ca8e51c4d0a3eac5c9756e91b705ca0af243f93dfb477b6731cb495f28e8127e602cd6962ea1c8b3452c702f69ad0902546543c206b129a177c3d217e53061904cafe6716d130883988776605a1a3228636a868091b4e9092485584c172715d112b959704dbda67780a6bc370382b2b6c47392bfe6b858c105681612673414f56a21bf30926e9ad4ce3cc72cde00e3c2e7502bbed656816436c69303430b65a20f1af828740f68941e8ae2a822f0cb1f51e5bd8218e8c7e9be85afe3ef896538a0d0af6951d97485007861d74b50871d28988b1a60631167cd1cc0401bdd82967714743748d9d895f9c0849bf11d1e0a6aa09873158f1ae03e7f120cbe8ed4df7f6bcfbe6a6fbe6bc7bd33defde8ee0e7e8864098247ad99ada8085f3f5cf7b3b18704255e523bdf4bb7f9da23ad98765ba95ec6fcde94be6924d38751073bfb9b93089f0a0b1b27df161c02a1a3e4a01e5c0785e2327985290676812445a5b2d0981c2c2623118881dd685695d9b5ff1dcb72802194375e3381a5cc8a94cddd4f1585860e70e13b910e33a278d64b08555a0afcc4bc90f3e17b6ee1df54bf597615233b4279c171288ef78eecba4dfcfa2642921a44f2712f5617be7a79e8baaf551a1af41966d4a9746b2533946b1dc1436c714b6d40f2730e28c3c8e72ad38b73374c08658b7a7ba69a1c984d825fa5319db595079527ce29dc44e773ce92382c8f8b30a06d28bd0238f0959f9a7d2aad2b58c6d72de1c54415d60a3210261756b033713f1d48898a3590a4e3f9be0a017223a09d8ffd5234ea7d1d537159ec7f548288d9c285cece9bc6f044dd6bac01c3a3ea7f75f88c17bda04ffb70f1fbcf7cfedfd072978973ac14f7c7c4d5a50b42924dfd8e6fb2040c40c6cf67bd0c7a072bfa3fe43b6ede4a7ffeb90c5c694889b9353ae52ad31d966eb270858bc21d5d2df65c3c29cbd27272638854fbef4cfe3fd07ff50fe3c9ee2f0643e3b2fdb1cfb1cc241648fa01bc8bdd7978898645b4d87d8b71cc8d630414bbafb698a57fd9b9c8374e57af68234bb29daa462555643eaf8af69851717a595900a9aa2ce693e3ba3baaf1f3fd648e554f588439657dbb6c70ed61c501788e2ab074a7c53ecf4e83a5b43748edd146f9f9adaf8d63659f4f1917163662667b305885b355c3ce815a0a567c7dba494d489f41609e471f9e9d159e871b88694d47d87ae2d6285a20bdd08b6c63aa8d98f35ea998a1e7102b2756d792e9215d07011bb19375ad5ce46ceaf6ddb63f705a3999e5c662c90a68e851d778bf5ac5c90d174fdd71f538fc9bbaf2dd276839bb96493679534c5046842159c95e88109a858d19b956a7909a0dceecfeae870097411cdcd366b68a5a3b541ffaade877ada557967aae84ee5bd2ad78c12b0acea332bd37b1250398acdac54ab49121ea3b6cc4a7596643723a56456aa91948f6e89be513aa86da8a3254134a1818275be14a67415afdedb3a6b7479c737afc035fa93595f9bf668d3ea59a74ff96b6379afaaae7ca5584ad6b5eae3b269d5e2a755b54fab023b0efa33b0db88f3565961bcaf0ae79786bd22418133e7ab0bd3f2af7a9b1c82e65b344628d94bb126e8635bc608e587422ba56addf565e73bc75ef8e7bfdbeb751af3f63a9fc6bcbd31a0777c8f310414f1638c00455c3400c5f75ac1cd553aa44b189e2419d58544446163bad0002ba984834c34f0235f6ee6dd9b95df8425bf926c3fd1fdc90acd49b8936c7eb3f48dd3864b8a44849654b4cf9cc12ac7e69178ca348eff24ba88c38b31360c6cfc33c8d8261e9aa9bb9ae29b38a908c98464d92ec7022862fbd907e4d0a09524a488db008e26a84b66bd4b0d0e5050c1241f45d78824b865fc1005ddf4efaadfb0a532ef1251480363b0d7e2c140ee07867ce1bbb0e088467b0c32c6addf9ae8ce418b9b20829010e56a3ea7916a7ccb1dbf8c7f8dfe0bd01a0955bb60e308055842a482eb877929b395c01613bf819489e2a4ae5f758e1d8c424385d09ae282fa62bdeafce607b8f18d43e2a80e7e8c113f65dc5b6cd920f67d6b0909ff246a51271261753e2ca94d80b9582d228380106b41bb8dd00c2a912d2f51a1dfbb63df97c60fda12d946068681ff36a57f3aec40051168a2a22c023727fb5e585188324cd6e72686c46602817cf1075ca22d0ac367a83e44918d6118af078add878185d4d81e29340c9207a958a7245dfbf157d34dbb9e1c113b8ff8125c602233bfea8c40480823ec98d3eeb0fb52eaaa248c12db1a3fc04a8a4d23921526a9a18892db4f83e0ad294068df28c7a035e93ae5671fcf739daae730c543a96d21945a7507a8733f697c9903d436c6390edf91392d6b329099281e2596f2e598d4bf45fef5f191d6f6f4b5c293b676da5aeaf4ad95f947cee1d7f6fabff994aedd40149ddcb51b91ec695e137c75fce4ea4706d9e4fe52c3396a934b4cf5e0b09bdc64aa4e6b25a799aa7e6a5b26e947a0e26d112e7304d90a4fe614707ba3b7e9a8b2dd40e61f5f6e712ce8e9e1638d46de31e736c7233efa6c372265c7a1ad30a78e48b737ce95c3a417fbbba4c2c65452630aa2c71447e10ecb53ad64b6492529f3d0aca578a4fd332ba817a9f1a8a84494b5b899aa906e7a1d8520dd876acb7e5df7dbe2b8331bc2bb67fd4137c470cf04c6de10a83d35745502b1a71c631b4d74e3b9ad379d1b16c354e94a4b5e59af9a2c6ce90e565fbe4a5b5fb848556f7fd5a5a8bc07e50b4eba0f759795147c85c5a3acff9597881a5ec27f7a17d18a671579aed4794ed447877967514787a973d5f848b9f410372a16bca7419b476138f5c83b92f19462dcf124d61f4c64bde282c3d1b47b9ba405a77d7e906b36956feec06ca29de634539556dad348963668b2b0f4f9fe61de04445f43cf3e1f951b79fa5d3b786246d1d41d92350bbf5d2de7e604a6fbd236703ae91282d63ee0937b3c4926a79d90372724c3d85d9092aad26d12e3aff4eb9d1b3a73be272ec880af74b68aae0d69a8776c000ef70d0d605e3e25c5de410ca2d37cef9e6ae4c3e0a193b3797ab383194f736a26e33b197a87128e8d9f8deda59f43cee7197a2519deb4309e86474e985ad5f023aeb3391bf0dc9fcbb00cf48f167ad5990579a441cf234da2ca9edeebcb8a221a481f0ca792aef4c4b18e0658d3156d38d5c43e1207fd2961733fd5dddf49368730035e47308d165875d3d02970f0b726f7fa3d1129fa1449438041b28e244dd155a98f152caab23c1475a211ba9e1378b71fbbae3d3191cf8d54989e852daa842e9c6fa619b4271d2135c2f590d2965cc6983b0259114634c920ccf49856fa57bf3a64c15a016a83eb9a7378b67434fbab700f23fc6a6ec35a4c7e094bdbf15ea94a4f165c774e33d3819426e44db36bfcd534fe2a90fc98af48d2469f9c2e88cfff68e54c4118ffb74089f31a5414e4ac61063f5826bdf4f9abf457c12368025312da209050861dd8081d30ef03cb931fc81cff98bab321d7273778ca925c90032f9c627640a34fc96bd19070f79b967de0341ebac5501419690375a80f7bca18f028aa3e1c0cfafa581b4c863da3871543ad4edf4db027c83dddd2229a6f56519a0528968308cb137104b9f5f145fe567882768a650cdab7fadc9119ff3f218bf82eb54895a6a82f2afa70389eeaca40e9e91a9a8a406b8602a24c4503d568c423d5d1b765923a359570891f73f569d884ba2e3f1287d07e711669c622f3b5ace38982f0603200caea29baa2ca2089711febbd813c98f4873db93f1e366491aae8dbb348f59a4a5904d03c198bd083d2476312e8196792a64c52154f331ea9d8f7f62c52b1a20d1cf23d6c3ef23984334821832c10b2d01c99ee6a65604b9fa3cf66ee3b4d55a6e2409ceaea98ec67077d50588cb1a6aba231407d65626858a9c4284d91c759b3b2f0a50cd3bc42865f7290ec805daa72846d93c3d8143fe43439b0c1aec10cb9fdfefeb9c2353dfb61b57229b1241e44713096c786a12b5365027fa9928e8618eb833e1a2be24495b1862af1416dac71ea1806b094f21b54c1903c0bfddc699d6d6b7d224ff6b436759337f9a7ac7ebdb987bde14761c27e0dae422e6d2bce18662e4c185607da97ec13364ccff756080e866ff157ef145ea64fd6fd1a32774a15aedeaa9ea69fb91761e8d0cdd9c98bd17c703149e35a3539f9d161b6674787f1b0b07346c7baf6d83f98a6e7a195ebad2c8b0fffce871f24bbe5991e26175e7c0a9e640a3c90a51efa4c96180f41e72c9d4fc45389a205365dd3d217ab95676f9a80b7c8c3b700b19309f09c55f26255b756f379cde1679110d312cb40249fd472b5dc8c287d3bbb863f2f2f2e5e1a86f0cb2f3f2f163fbb6e64baee4779d5fde0d85b454d27b232e262daf3f198ae5d88ebc9a401cc2e26ec8fcc19e214c829f0095402bef2ec78c8e744095e938ddd1cddc3c6cbc49e4dd401cc9581a7e382e49eb57cfc6f82fdea4db84bddfd441c13997c6c1841d474b78564a6a82e3f9c9fb79951e8cd19dd5c4c89319c5960c75ead41341dc09b3575e06fd3a61b8c0c927aa2fe8a90731eb358d933e479abe7701213f52f7148f2363a50aadfe1c66767a9369c19edea2e407b596087bc295478787c998bf43a3eeaac8f9b390cedf77ac6549daaba3c55355d9135491f4bfda98e119a8c0db53f9d0c86e547a0923c34b4de78a0e3310cb332ec8bbaa6ca635d45683a9cf6878a3118ebb1f364287edaf0c6e8defef20e5491b638ae96d82278deac3c2faf454f28d0f34edab95ce772fd99c8f5e2dba4ed8bf7b657845b90f2b9f75edfafb0af7a0b8c5569aa8a830920567a300bb20c13a38ef5fea43fd6faea5083eab8e8af2bfa7dc3e7e728ec3302fa69653d8b63bf457d2a0a186794ea8ce2df76736ee1dcc2b9a5985b62078a47389c3b7c92def886eedf51778851f233ee4ef098efab08fc88dc449c51fa4630235fe020561e6bbf12c6bb3b2c029322b094e9c546483982ccb11ad808dd8ba00b2fbc37e250d8b627ef6a37c2aa71fd892bb68d807da6db9b4b0fa2d2150ef53762d398baf5bc63b162d0210b5ab2d72aa114914511b80e6e0492324081eddc46c898be18d7b48d50bd2454e0aab3114c498351f78534d8d1618a098f02d760962b8357b9dc88a390be3406e572395f5f591f9606f2702a5f691a4d9a3b9b63cae3d6e6d88ab9b7555f53dcdca27d49ee6e336c6da0ab707f9bb6a5a4412b54b9d2a115c64058b4c711c88ee6881851d2124920595a63a182a62a96a3c3b4c0218a89eb39c07a092114bf159802544b80baf4d8549ae64e36ffb5c2c97796ed117b8ee4cb1c8976b8a33a53e26f57d5e6c8ca5d555d28587738e44929bcb39e274476955a7b556a95f26a65d5939d75b0c262b03b024fae1c3bac376f99a952bdd4b8faac2ebacbfe320bd8ae6a8d57bb9dd6b84ca7d7de4595641d65d6c99c65916905935a23bf9505ca3b599d49dcfbd45e220b98a3ae57862d50d02bc397aae4757a9055c2abb721a376d7e87ebdf21555eb1af56795e93ac045ea731d1cb1c25c1b2a56912b832695e27a60b11a5c172e547cf3e058fecde1d5a3585fa638e3d869714a0934f152ec1da8cec7f44378bcfc3f62f0e765ce5fe19fffedd03bfdce09b21e909b380f28a82e6e07bde8f7cf0305d7763c7a964fe5970fe21f098efcfc1886632fdfda5fac0e2d7acaec0a52497d12033c5f2dac64a03eff5d70a4498728cfb92d4c2bf21216c67bd3006a4d6d594a31a5455c2b647932af15c2622118a095a57ec35ea7c462bb6626e564cb316c89a08a246dd9c294686d8b2d57d6b6451a08dfada009a4715d5c8134c905942a378291ebad3ac30afa00912ab7404425ffa61691252021d81861cbc85456b9334c326a684ec35127022fda5ffc7787e98ba3d46bbaeee4a339723ddbc146bcf23050e46a87f86d089e3dc70e0ab208f9573ee47da6a06999de61eedb0989124aadb848ceb0822f798053738e97c8bb7f9d848a5e1755f6fae8ff7d3c797b7c7bfcf1df8497fff112f473c3b4ee7e1656def4a546debce8743a2f7e7d7f3622999416ae304196708f1eb08084ebb5770f4be97465f96baa778f3cc1244540aa19c2977b4cde610a08ef5fd84b6c61e3e0c58b0f2e860f503206b5056418a00fc0a22fcced3b73425eada1bf7eb500746a79d8a1f8083509f6d4c71d6230fdba3a41a3cea07fd1c7ce0b3adb072f8e2da802912c438096dcf2bb3fd3fe4d1d7b21fcebce740faed7bf7a07bf063775ae602e889d9ff0abfffce2052811c2c27725d249777e304c04cdedfa7efc5d21c8f2f6e3cf2ffe42a85d7815be3908438dfef0e38bbf0095798e3d87af3ef8c1d4b48c937b736efc10d4d4153a176b12138f5e46fef8e2d3a7d7597248e49ba3c3b45a52f20cf3cd25deb114603bd05e921b91b012fde5638fde67f49853faf51d43cdd9af27d02db2d83a82cfbb2724a51fbd29f4f9ff96c6901142c9080b8beb21269e2adda23f4479d262fde794c94f96f79de89024f7daf28dfd351962b77223a3bc84a3f5b7fff3befd212cb103ca0d6df1f69b984e6a9519677aabcddcbca557a744830e6b20d30a17e3c628879b56e462cc8c504fcd4e9b29bcfef687f9f0ed8ff58ca40278dab9530b34bdc683ad146ba2bb1ee6735f5ffcf607b034e5e6276714a940ffaa33daa1ad539c8330132eacaa916f7e2cb48ad041e6c25120be89e4bd26aeb15192c67898c3f8284fd1486b110e1889b113b7c55fc6483a4bf23e7cabfb8b4c36c5a2ff5e9f5488795ec522fb783ef7edc322ab8a71f098632f965777daa2a780486a10e7a0ce366bd7acfcf778498621cd6bc4ae7959cc3db1682c36a5a2638bc618e5b2b38bc6587b9b0f30dad146a5324da867f1ed8f6f7f38b0eababbd6e84a253628240e5abbba26f50d5946435d46a2a12b6882f4617f0cf24d5365c340ca58167b5b8d5fd9547a3f5983b721c9ebcaf12d49f1cd32bc82047f34ce70573668daabe7c51761a374459aaafda1d6d3355101fa907b863e16277d7d0844224d24599406d367c1184fd762ce19dbe78c5ba2f6c00ecd9ccdbefddf73e10c2f6e94ad2b7d599bcaca40578644004ba2ac2334567415a3de18f727032c0e9e9a319eb6c19c2f36f145a6c4bbf4713021ea8c3b43e6fc3e2c9952f9b2c5c3fbd8eae5fd7bd80ae5e9c57ca572d1fd758dd2e1bd753590fc4bf66ab0a9dbfd4a4039161915e02a992654c0933443a9009036bfa802526c3552013ac75aa41a54d24a260fc6e754964d8ea8d4beb26eed650671fc89d942e6db416d02c89a316d864858219543a40c0e4b4be658ab55289f35362b07da6491570e5d6847580a566a5f5b0259d386b204539139730948b1856a19501583de12f8527bdc72b85cd36992e232cd46470e5eb9f81cb91ef535cd5490fc5c91c3ca818ab86c13543ea71542e5725b49e9428edb0853c4756580d538af0cc306ee2b01adc08185d08db8b0105b392716826de2c662c0ea1c5988a3025796c11670663e1bd23cbf6ffddcb5f4d0f03a4a5c1ac37ef12faee317b09b7830f19778a3f49a3003c97a9a7e1f422cd0f2d65cbe3e3a0c7ebcf01b054f4c52dca3f05140d0ef1b3c052cf7ec1ecd57d0c39c995f66e35b5fa7673390c0c6c65c2ce7e674fdd6415f4091ff25b2f166b092a0a6fe2e88586404a9734d924c15d4fd51f25d8cf19c44ea09b64b14cd957509143a5d5f4077d11d4d294a25a01bb51aca2e4c6b444291925bd7e04f47b8472e7df906b9d8f847b4f7247ec67ebb822a8fe7a411defd82be5da0af012a31d3cf5bdb6f5a6814f0aa13642d8a4b5e44e0b40bbee77e905836d11f66d01903490ff89a21c5afd0b1d7bdde5054b5837e5f1a2883016ce7fa3db5a768bda343fa392ebd268ffdc170280dc403551b0ee5de60305434515287b27674b84e16ff0a5d25c861037ad097a094220e3551d6fa2ac011e4f099450e8f04795f140f06aa26f61415f69b7d55050403823c2e0eca5fa227475fee5c4dc9ef9ddc3b180e554593e59ea6289a029d2cea9974200f7b0aa958ed498a34d41439bf53b272208abd1ef45d1c88ca50ed6b62518708ce8122f75551eef7d5810c6396ee4b4ee38f4ce375ee265c1bab481e1b035d9e0eb0ae4c54d8844fa59e6e487d034ffb520ff5c74787a691100e817dd033cc24d4619208750e3aec968fc91ae4e7e74e5939410bbed88e716ebaec94d30d3fc8a88784843ccc297c44c5141991d77949988489bd5c07f9be69a1c8e02b91bcd75d42ebd11c78cf5d278d6dbfccbcd7d73757ff797233fad839bdbd196943e150b8bde8a9efce2e7f38ed5efed8e9be391e9dbe3fbd7acf94e9744f2f47a7176fce4fe1cd8a48726409b7d801d6f61ca8498842a908a3b5ebe18500743a14b0e5e20549d5dcbd00e0d39b8dc0ef1c622d45603b9feac20cc50630520318b9014caf018cd200a6df0066501746260b4d7d18b53e8c44c6e0f4fcfcec7a7475f6f663e7fdcd885087d8e9f67b034dea0dbaf2503b904182c9b2244addf3d3cbf7b7bf7cb83cbbfdd8216b15509ef4e95344bcc727271f6e8e4ffeeba378405e5fdf9c417b00ab033ae0177372dfe98adde3cbf7e7a73e0603dfc117787920827c567b202655322fbd1e0093e69c5e8fde77ba8aac6af0e2e4eaf21fa737a3b3abcb8f9d80a108dddffe7205256f1d90690fd871b170819d09227a068302ba34200d3abe3906083240e788e8b806351db488511e8c0facd777a655bd914c051a2c74a90a6cebaeb00679d0a80a39590555090410bad05b0179d97ec01a38ec774727c7614d2b0b243199b3245e3589f71d09b323605039c9716a57a59a4ffedc27f1f4f3f058b09cdc53449570c03cc15c8f3e9e20c7c3ae89acaefca97bfcdb19c8ca1f4e417a926675af6ede4205005a40904179226d69f501805c08f06174fcfef4e3e8e4ea9a486098390b639a7fd85d390f78dd153c7b69df3968796f4e40995b2ee1db01f0cef1cde93174d4b4e6c8328497826db9f7b68305f2644fa7f481947bf3e6eab78fa06e694a571a1e885a17742971d8ed4907ea3041ec6451fdf409d48399975858968efd5979fd13f9e7d5ca5b083ffd6e5bf8554f157ec2f3f9d27d059cab89c24f9e4df58a576297f99ff0139977f7154059b60e1a834b347e828fad019638d02024b1271e1dfabf935fe105691cf998fa06eaf93dbc221df8d92f12bc610b11b71ec7f4a331e52e8cc49f3d2e92ee3ba6b6bb68e2d8d67af11a46c0ef42f275229acf7c6e2e5ddb34c28fb47903511a821e99fec6028232104cf41474fad734e6d4d161ea2d73ec9fab0cd021644e527c35e6027b8828350cb819c40583ad14d1e0a287b8c41239e42d5b2ef32a2e0d7478b7821dcd6ba2c5043fe3af445b7b4dd52aec1d1dd227e6a3e9cd099cff2f73993726de5713cfd798604d714df7db1f736aed27108dcb817df3ca05e5ce14a83ed5153edbd60cd16f30d44820471ab36f7fac3defdbff010c29e8a019b41e2d403743b0a79aaf3c82d9beff0c8d7bf182314122f0b64551902305f2826ccfa1119f894798297c06fcb079b70f847fe0f9834db6d10f88625ab90fc89cad3c68db6c050a27a92138a53001c32c69a9029a38c185cd970f0c9e74f9f0e29994460f2b68dd01907b38420957372ff106de518df2e890552ce97bdbb94396f9bb7fa1747498784cf001a9da2f13fd64bf43a327540da6ff2632b0c1cee3e870caee54088b2c903927a6e4f45ff68b63534aa0ff24bc30529d3a82b998253d293076495538e174014a0775252095853f99b172924a74a17acd156cae6073059b2bd85cc1e60af69615ec5da8d89b94ec7235bba2a2dd4ad56ea86cb750b76b2bdc852a37555012c774e9a3e158b520e7f1be5d3940bcea4403da110c73018b3e71e9a456dd50ee77ff00dfb4d6e18fe8cdd7f06c7f9df57c051d626983b0480f2f50bd6d640c99400b763cd08efc7f330e11964135a7f4441f66b181fa9ea93873707e58b421390a533a0ba19af6aad3791d86cba754403f47e5fd2b9dcfb6c9bac0d2e3d3b778090d26c97ed91b29ffd62aef4b71180790062f29ca97f4cee7e50259b0ab7184c9ca21dba0579d2098031b08210513267f0b0a32b76b05c8639fc7d557736e22674d3303c4808428595a0be33b53db14e9e830f11c17bbc10bfb212c133fc40546183993fbb004f31417b9764cd8cc509fe0f0671c33966d5644830225aba479a41106c8f50371001993937e42cfe1970f20d15e7580cc49788ac96ab19a0721e87c7411204ce6bba2383153f32b36de0608fd183fccb52040261a95b82e05c01bd8c1263732857c92c72324846e1a4b963f60770ed4e800053cc8c145e524b842fc1d1ba3f5624c2250537b4c0796c6306087e7398c3923ba0306b903b01ffe9a30dc97073d511c8a035d9e18635d912451d764a4e818c908230c6f0d5ce278351e6b8ad11375599c68ba827baa8e2455d32579a28de589d453c73240ffb52bfc1539501f69063c84f141f44453680a0934f33ffe184e844d42908c7dd1e6d2bece31ec7fdda4d5ecd124ba544dbaf7fbafd7a1c9652736a2f591057794168d7342c3981fe623c8c049319c1ff63b25fba0c6b0d641daf325c45ab12ab97155c98f52e9d77250d8f8b4eb446f279d90b4c7ed8552bd179ad8b22eb5795d5b6e49bf7a4ba45edb211eb4a86cdb6dd16ab4456d3bcac3ea95c9fd5ebdca8ae59f54220023ac09b97ae483a6cec4e8bb2890ca3c5c9274e7de61cc88c8ca345fde232a3f27a076eb9eadfbda5f8ecf25d1c6c866851811e9cbc880a87d628eb4297e64d5b5215d935f2a6e49fdf44b13b280f9713e42cb2e28573d3344a521f1355c61895c3f6ee1dc9ecc02956632a72f47c47007bfa3f3846393a2ed8f6cefebcfcc36347274a0cbba4ee3eae8a0e2ea6477aabbe438a3fe906abdae04db6ab9a77565358a6100036d3bf5918d897611e2a0fb06a276d7c7c374961c03e006a99cf387cec7d67ad0602e89fe9cc24a303668a8daf5ffcf0cbfbdf2c83d88de701a5c9bc9e812e26a3a1507723f8d8a525efb5163b1351cbc444f0b7a982f0cfcedf05278c892caac268b4588d2bc342b64a40824e0985929bb44a5c3e615314559972a927e84229aadd906028f2b4d50f26c23194780c12cce36126b3c10942a671b4932bf3715082fa76d456daab8ce565b0fdaaeb5f556db6dadb7254c5671cd3d640c8ea38340aa1535519424ae28714569cb8a92d413bbb20cff8932d794b8a6c435a5369a528699b8aac45525ae2a3d85aac40f95b8aeb46d5d49ee0dba92a876a5fe80eb4a5c57e2ba521b5d29c34c5c57e2ba12d7959e405792b9aac455a56d1f2b0d7ab00b86ff14ae29714d896b4aad4e9552bcc41525ae287145e90914a51e5794b8a2b4654569d8a7b25ded713d89eb495c4f6aa327a55889ab495c4de26ad213a8490a5793b89ab4edab3749ed4aa2d895257ef5c61525ae28b5bb7a4b33135795b8aac455a527509554ae2a715569db274ac4fe74d895646ed0cd3525ae29b53b524af1125794b8a2c415a5275094fa5c51e28ad2b6cf9464b12ba952b7c71525ae287145a9dd91528a97b8a2c41525ae283d81a234e08a125794b6eef7267707836e9fdb28713d89eb492dbdde12acc4d524ae267135e909d4248dab495c4d7a049f371a0186fcc71525ae287145a99dd35b8299b8aac45525ae2a3d81aa34e4aa125795b6ac2af5d5ae267565b9cf1525ae287145a98da2946225ae26713589ab495b5393c237895427340dddcbe61a158f4dc935aaad1f3e494a5752d5ae24495ca7e23a15d7a95a1d3ea599896b555cabe25ad536b5aa7c1deac8b13d9a9c944d38e79abf634ae3876c32e028ff2993c2778ce7243db73f042e5dddd984a040f92479b92b00b239d0ce6d7e399a84f6ab1764e19dda96f74f6cdedd836ea602032e1dfc60e22f6f66778e7142d8e15507b8a4cbfcd7a13023683575f023c36d8c08ae579d1b7cb79a23c72ff177ec58345b316881a07b58c64598cd96541fe056c5aeffff08f19987e6e6c45769f01d80f953fdaa738cfc02ff0499375aa2097d1960bb724cd02e838cb6f7244d2c1444f3b8a97ee2dc88b916abb96712defa25e8ba14170d0ad144f3590135414b93b4f0f7387d2e6d006990b78e10bd430b730e8f172361748fe773e1edfc4e903b82e9b2d975c5a056e8e10cc38c456fce612ab1c3f6924ce9975fbc859fbe75e5e2d16aec7aa6b7f2fcc4d801e0074237a463fe1b9203f892f203c88614254f4913d97ccf2c718c57d3296897fe3fe100423517179de025db63ffcd9bc424c7a0e503ea97bbb4899eca20fb4f586502aa92648d45c7148a0894d04ff89f1a7e7deba02f9924e0610717c89d09e42f1f25cd19ee3f943797944ab78dbc0bd312d39cd42e4dde0c6f7d160cc0d8110b2b638695bc3a8d3331a75b3d4613e0497b6519827b8f96f88a2e75bff95982c98bd13fdec31852d1eb3f6fec0b2d76637b3129d3376fa852118c2d74b01bfe47c796160987d67f225357242b680166c0fa4a582f324cf3b774adff244b9dcfacd700e4051fa3718c41b385fc11a9d0657622a2a12ac2977d4f4a330d0f0730d946a63b155a94649db893553a435bf95fb935a7b03185481f528f61fb332b6362dbbf40ce0c3bf91b7fff5b989ebbfa19403deda4aa7ed25e43a9aba36c4f4b29d6532a6b2a75ce082e82492d3925d8deb847e482acbb396e3692eebf56c8c1d129006c150ab78d5582ef900c9062b75fcdaea5c261458823d64474644de0495f5239d2086bf5438b0a94683a9339aec3012d0e401efd10a4c296fea2e219c8239d836cfb2ca406976d3c0c693c3d89dde99667a9d299cb668c8609e83c22da82a317d2381d5edddb46436111a18225739bc349f06d791429cae6831789b107b2be4c2a09b1e2658b3d14a1c71425e23f3ed408e4fc6ca39067a23f25a5f9ac5494c76762b4642d815def6c2c0111cadf59e90149d5d3b42d9da825cfa12e361fa8b53a546b76b096434715045ce9e0d416639931aa28ac22b8582acdaa88a498b47d8042c153d6cdcae225ddbb0d4224c5407544450d8dbfbaeeb90dadbfbedebf4dcd7f8310ada1fd67cf2a8b8ce5ea5cef922f7c8fb7777bbc8df7c0db1bf5addc075750c5d2674dad376edbdc62fd09b74699b3c2aded8e2cfb996e8d8273c1edee5aaadc165756b6dbde1a27359034cb55d4aeeb6bc87ba1f36608bea6da4bc8fad175de80449b28aa1bef94b91ef7dcf4b8a3c3f8a228f5c5bd4786fd45f0fff1af0dde9aae175e83442f83bbd28bf02d7bd913153a26bb7792125e4dbedf78630125c965c4ca3d26bae395456e49a32fcc3d483f89f7fddc1ea339d3567ad3c98006354a62f426b892f22b0f2fa3a2ead3bdf4df02828354c12a3d8a6e94c483fe30f9a79fb9c933b89d63c0012576162e7bbd7d98b4b788cd17b2560db06359204f70c8b5fe5bd3f19be76f575e755ed31d0d7cbf5c2dc6f49a1666f08b839627f7c8212387569efd4f783ec7d65d707d16990a1ccfcd3bcbcf92651819d4d45c619aadf2dfe7dedf3a8203eb9fe3e23ca8e51c4d0a3eac5c9756e95ff85fa0afe7d00cbf69ef6ce738682be509034fcc059abba47dc9d1a2f817b02783462c31a22c0f9bf3f05afaebc9ca79c0061900cad2671659e589e98077665ddbf3f59d6d454c6a507111369a207d374777ae9f8f3e8beb8a5834bc24d8d63e1353581b86c25959613bcad9eb5f2b6484b00a0c3199077ab210ddb64ea0158e6d1a67966b06f7a771a913d8952e43130a627781a181f18d370c5c689113c833024dec6caa08b33b6c2fb0e7acdf630b3bc80bdb44d7dbf7c1b79c52cc1dbff0951d9748f806060154ea8738e944c4585383180bb3686628cee494b3b8a321bac6cec42f4e049fdf88687053d584c318ac5ad7b66b92b1bb72a828bebde9de9e77dfdc74df9c776fbae7dddb11fc1cdd1008d376a87854e3f9fae7bd1d0c38a1aaf2915efaddbf4e519decc332dd4af6b7e6f4810048b28e6f85454caee6e6c22442e39cd0862f360c5815c34729a01a18cb6be404d309f20b4de6fe39fa6a498813160a8bc140ec752e4cebdafc8ae7be150ac816aaa7fec374cd31081d6f1d722953b72c92256e819d3b4ce4418ceb9c3492c1165681be322f617d1499d6bd4313da7329a819da13ce0950d2fa78eecba2dfcf6024be26fae5d308316531ad7730e82b0747d5faa8900fb0b2284d1ac94e2547ba6c25d8b820b6590eab2f86db580af316c29265f02830e42bb2f8dbc6f0006b61dd9eeaa68526136297e64f517c474f6544fe296e1233dd65a4b7d891e1df2668d2f200c630aee379f85eb59f34f6b14dce5303d45358c9a3db7922686e6de044225a6a13663413c1c95f5d787a80afdb163dd825723cc44705de7175f24823268a117be2fcefff5ad9dedfc8bae4ff62ce9efd1762f09e56effff6e183f7fe59b4ff2005ef52a7d2898faf490b8a3661e41bdb7c1f04889481cd7e0ffa1854ee77d47fc8b69dfcf47f1db2d89812717372ca55aa3526d16cfd04018b37a452fabb6c5898f3e6e4c40427cfc997fe19b4ffe01f449fc7531c9e4667e7659b639f433888e8f2ba81dc7b7d8988a9add57488fd1bea6c0d13b4a43b94a678d5bfc9394857ae672f48b39ba24d2a416535a48ece9a567871515a09a9a029ea9ce6b333aafbbaec638d544e558f386479b56d7bec609d01358028aa7aa07037c54e8f7bb3354467bf4df1f6a959876fd991451f1fbb36666672de5980b855c3c5835e015a7a16bb4d4a499df06e91401e979f1e9d851e876b48497d6ace8131b788158a2e7423d8c6eaa0423fd6a8672a7ac409c8d6b5e5b9485600ff38de6ec68d56b5b391f36bdbf6d87dc168a62797190ba4a96361c7dd623d2b1764345dfff5c7d463f2ee368bb4dde0b62bd9e459254d31019a500567257a60022a56f466a55a5e0228b7fbb33a3a5c025d4473b3cd1a5ae9686dd0bfaaf7a19e7655de992aba5379afca35a3042cabfacccaf49e04548e62332bd56a9284c7a82db3529d25d9cd482999956a24e5a35ba26f940e6a1bea6849104d68a0609d2f85295dc5abf7b6ce1a5ddef1cd2b708dfe64d6d7a63ddab47ad6e953feda58deabaa2b5f29969275adfab86c5ab5f86955edd3aac07682fe0cec25a2134c281f18b26e38bb34ecd59898eba7cf5417a6e55fc7d63dfcccb7ea8bd0b117577551c7f67c11ba0ff991232a75d19795ef1c7be19ff56ea7a769acdbe9701aeb76fa4defddb6dd6d8a74dbbda648f33a9d7fef14dc2e25e256042124e2481461d489e88d2fe4f22eaccaafa2925fcf416047171c2b342731270e83d813718404b7f4b22b73a340e543a809a56e18f34660f3f5155e8cb16160e39fa671873df77062afd2371d692c802236de7c408e498eb8490c06b701dc3f487b1280e98ec034164cc85174f7f65a3c3a8c1fc2cf53ffd2f60d5b2af3ee056b641e5839bd96028bb4f0392c34328911c509f2f09dedacdf9ae8ce418b9b209489006bab638e571e3ea7613d7cb315bf8c7f97fc0bd0844d1ed9a026019610a9e0fa3131ca8c05b0c538bf93326ff19234c29aac5f758e1d8cc2dbfad09ce0823adfbceafce64703f1ad236297783f38c3d7918fcab241aefae60212fe49d4a24e2462907c58d28b7173b15a44b7e221d682761ba10d907fe76f5ad90afdde1dfb4e177ea48bc8d82fb076fbb729fdd361072a08db11156511d0017a83dcf4fd3ca92844298abed1809b18129b89a2f0c51f7089b6288c3da0fa1045867361701328761f46615163839cd032461e888cdb02b5b8b3bf1c7f35ddb40fc3113176886f8e0503bb13c75cfa233a42962b8cb0634ebbc3ee4ba9ab9298336c6bfce81429168d485698a486821210b96da62156b280d0be519e7566c2c7861044be8f4d3dcf1a1ed9690b919daa7bd29cd3692bf5a4d9c638c771123247504d06321332a1cca4bb1493fab7c8093a3e276a82285f492a3cbe6a5245ac26a58eb49a208b9a9873a2b4bdfe6f3efa6a371045c761ed46247b44d6045f1d07acfa611a36fa6554f7cad9e8af513958e5463f8e8ad35acdb3a3a263d49649fa11a8785b84cb9cebb5c293395adbdee86d3aff6b3790f967825b1c0b7a24f758a3917776b8cdf188cf13db8d48d919632bcca973c7ed8d73e5b8cdc54ecca9781f95d49882d01fc55181c3f2542b996d5249ca5c066b291e69a7c10aea456a3c2a2a11652d6ea62aa49b5e472148f7a1dab25fd70fb438a8c88670d359c7c50d31a533717a37048e4e0d5d95c0d029cfcd4613dd786eeb4de786c53055bad29257d6ab260b5bba83d597afd2d6172e52d5db5f75292aef41f98293ee43dd6525055f61f128eb7fe52582c7fdd876dc8f5c9fe0dc3468877967514787a973d5f838b9f410372a16bca7d16e4761dce9c83d90711762fcd124d6294a64ddc282c3d1b47f97a405a77d7e6460a6f905fe321b68a739cd54a595f63492a58da3c39cb3fdc3bc0988be86ae6d3e2a377275bb76f0c48c424f3b78613fe0b7abe5dc9cc0745fda86ef4cc6548da0b50ff8e41e4f66ac13eed184bc39b1ada979b77250e55b1fc6c9e7d73b37f4667c4ffc6f015fe96c15ddd3d1b8d8d8001cee1b1af5b97c4a8add6c1844a7f9ae32d5c887c1432767f3f46607339ee6d44cc6f731f40e251c1b3c45abb9f7f20113673e9f67e85d6078d3c2b8db1d39180609c35263f8a1aae32ff4283bb71de14761c27e0db8f4d2b6e248a2e6c2440fc859ad92577747d8303dff122d68f32dfeea9dc2cbf4a4fb35b4f78a2f9ee833f72274e9deecf4558ce6838b4938f6eadeeed99e1d1dc6c3c212041debda63ff609a9e8760355f59161ffe9d0f3f6c812ccff43091c57c0a9e640abc950d1cf019cdec7b0f41e72c9d4fc45389a2050645c3d217ab95676f9a80b7a07ddc02c44e26c07356c9355fb756f379cde16791905d8f652012eb72b95ad6f7235ec39f9717172f0d43f8e5979f178b9f5d37ba55f1bdf0753f68c95651d389ac8cb898f67c3ca66b17e27a326900b38b09fb2373863805720a7c029580af3c3b1ef2395182d70fc8d2e7e8deb361cfecd9441dc05c19783a2ed05dd3b31f604f38479fcd0de37f83e714d14db84dddfd441c13997c6c1841541bb78564a6a82e3f9c9fb79951e8cd19dd5c4cc9398d5970c552ad413454d39b35b52b6dd3a61b8c0c1216acfe8a608c2986bfce107a403364790894447b863c6ff557e1de76bd57731b1634f24b58da8ef74a557ab2e0baf305090b08eb11399b116678fdeaafa6f157811e9e5c3be60239ebbfe3f507cba446897f95fe2a78a464e03f30b36d723a69076e210781e314439781d570d4bfc42909e807684473fa35c8fdc954a28be2602c8f0d4357a6ca04fe52251d0d31d6077d3456c4892a630d15b4e1cc68577701dacb0d81728ac2c2b8de1de18d7ca4d78efd001b620766a43e6e9f32ec7b03ebfd5ecf98aa535597a7aaa62bb226e963a93fd5314293b1a1f6a793c1504f0998e483240f0dad371ee8780cc3ac0cfba2aea9f25857119a0ea7fda1620cc67a6cd7138a9f36bc31bab7bfbc0355a42d8eab25b6089e372bcfcb6bd1130af40542169a23d35dad4032e95cae73b9fe9ce47a0e793e9a78cfa90b248c321507e25457c7d25057067d451f1a634d57456380facac4d0b0b245299fc78ddfb1b0cf1bf1bc775895a6aa38980062a507b320cb3031ea58ef4ffa63adaf0e35a88e8bfebaa29f4ed8b314f61901fdb4b29ec5b1dfa23ee59cc619a53aa350c9c6b985730be796126e21560e3a3df87a84c3b9c327e98d9ff8ec3beace7c2d3fe7ee048ff96634c08fc84db8aad337821999a9056e9cacfd4ae88a79580426456029d38b8d907204996335b011ba1741175e786fc4a1b06d4fded56e8455e3fa13576c1b01fb4cb737971e44a52b1cea6fc4a63175eb79c762c5a04316b464af554229228bc2d7a037034919205f9bd80c19d3572c593743f592504b36b555099892062392220376749862c2a3c06a8de5cae0552e37e2282a04758f5e2ee7eb2bebc3d2401e4ec5934fa3497367734c79dcda1c5b31f7b6ea6b8a9b5bb42fc9dd6d86ad0d7415ee6fd3b6943468852a573ab4c218088bf63802d9d11c11234a5a2209244b6b2c54d054c572749816384431713d07582f2184e2b70253806a0950970e2fe2e4402bcbfcd70a27df59b647ec39922f7324dae18eea4c89bf5d559b232b775575a160dde19027a5f0ce7a9e10d9556aed55a955caab95554f76d6c10a8bc1ee083cb972ecb0debc65a64af552e3eab3bae82efbcb2c60bbaa355eed765a63265ffa2eaa24eb28b34ee62c8b4c2b98e86cf9ad2c50dec9ea4c4232a5f61259c01c75bd326c81825e19be5425afd383ac125ebd0d19b5bb46f7eb95afa85ad7a83fab4cd7012e529febe08815e6da50b18a5c1934a914d7038bd5e0ba70a1e29b07c7f26f0eaf1ec5fa32c5c9f87f45d1ced0c44bb177a03a1fd30fe1f1f2ff88c19f97397f857ffeb743eff43b27c87a406ee23ca0a0bab81df4a2df3f0f145cdbf1823c8320bf7c10ff4870e4876e331c7bf9d6fe627568d1536657e05ffd473315580224c679be5a58a9d46bf45d70b249472acfc72d0c7cf712d6c77bd300a2cde6b62bc6949674ad90e589be56088b6561805696fa0d7b9d928eed9a9914972dc7b025822a02b5650b5312b62db65c91db16692083b7822610ca75710542251750aadc0846bcb7ea0c2bef0344aadc02115d0036b588ac0409c1c6c85c46b4b23a9e41f3b9a2390d98c22e008efdc57f7798be3f4abda6cb4f3e9a23d7b349eed878518aa1c80d0f71df103c7b8e1d14c4b9f46f7ec8fb4c41d332bdc3dcb713e2c74e8db94844db822f798053738e97c8bb7f9d848a5e1755f6fae8ff7d3c797b7c7bfcf1df8497fff112d474c3b4ee7e1656def4a546debce8743a2f7e7d7f36a2d9a75d61822ce11e3d600109d76bef1e56d4e9caf29756ef1e7982498a805433842ff798bcc31410debfb097d8c2c6c18b171f5c0c1fa0640c6a93c4d4a016c0da2fcced3b73425eada1bf7eb500746a79d8a1f8083509f6d4c71d6230fdba3a41a3cea07fd1c7ce0b3adb072f8e2da80291389880965cf6bb3fd3fe4d1d7b21fcebce740faed7bf7a07bf061776ae602e88b99ff0abfffce205e812c2c2f728d249777e304c04cdedfaf98ebb421083f8c79f5ffc8550bbf02a7c73103ac3fff0e38bbf0095798e3d87af3ef8c1d4b48c937b736efc10d4d4153a176b12ab93de49fef8e2d3a7d75972484443a6c3b45a52f20ca32127deb114603bd05e123e9bb012fde5638fde67d49953faf51d43cdd9af27d02db2d83a82cfbb2724e034bd30f4f9ffd6c486ed09a1648485c5f510e3f14f77ea0f5124df580d62b34ee77d27aa24890ebc7c637f4d0681a8dc48293235587ffb3fefdb1fc2123ba0dcd0166fbf89e9b0ab9971a697dbcc055c7a754a34e8b00632ad70316e8c72b869452ec6cc08f5d4ecb499c2eb6f7f980fdffe58cf48b0aaa79d3bb540d36b3cd84ab126baeb613ef7f5c56f7f004b536e7e7246910af4af3aa31d9a3cc551b27d940d6c7d1990fad0416ced5120be89e4bd261eb25118f178989da0c94fd1486b110ed81989241eb5c55fc648c075f23e7cabfb8b4c3608b8ff5e9f5488ca53c530fb783ef7cdc422e38a71f0986336965777dab0a780486a10e7a0ce366bd7acfcf778498621cd6bc4ae7959cc3db1682c36a5a2638bc618e5b2b38bc6587b9b0f30dad146a5324da867f1ed8f6f7f38b0eababbd6e84a253628240e5abbba26f50d5946435d46a2a12b6882f4617f0cf24d5365c340ca58167bc5e230dab9eabdbeac28a281f4c1702ae94a4f1ceb688041446ac3a926f69138e84f5b49ef276bf03624795d39be2529be59865790e08fc619eeca064d7bf5bcf8226c94ae4853b53fd47aba262a401f72cfd0c7e2a4af0f8148a489248bd260fa2c18e3e95acc3963fb9c714bd41ed8a199b3d9b7ff7b2e9ce1c58db275a52f6b535919e8ca90086049947584c68aae62d41be3fe6480c5c15333c6d33698f3c526bec89478973e0e26449df16ac89cdf8725532a5fb678782d5bbdbc7f1d5ba13cbd9faf542ebac6ae513abcbeae06927fd75e0d3675c95f0928c730a3025c250b850a7892d6281500d2561855408a8d472a40e7188d54834a1acbe4c1f89ccab2c91195da57d6adbdcc208e3f315bc87c73a84d00596ba6cd100963a4728894dd6169c91ca3b50ae5b33667e5409b0cf3caa10bcd094bc14acd6c4b206b9a5296602ab26a2e012936542d03aa62d75b025f6a965b0e976b411d64474db0d19183572e3e47ae475d4e3315243f57e4b072a0222edb0495cf698550b9dc5652ba90e336c214715d196035ce2bc3b081fb4a402b70602174232e2cc456ce8985609bb8b118b03a4716e2a8c09565b0059c99cf863413c55b3fbb023d348cf385c6b05f8264bfd18b4c5ee2d784198eb2f98a2388055ade9acbd74787c18f177ea3e08949db70143e069a7818be1dc128dce029e0bc2731496977bfccc67ee6d54b3b0c9b1f242d0d32359824763fe8eea3e43bb2a3f01dd7fdacb2411adb20fe3fade3caba04b29bae2fa00fe8ce4f3e1ab780dd33de237794932e96f80ce7216441c374b651d2dcf02e9ff4287a88b62a47a6f19a8a021ac865a86019f5c5be3e35063239ad98ea6324ab3ad69084b4c164880c7474681a89590e0c3d72c21279c882d99a23c27468f628c1893a515ca2ce4127ea48c74fef91324101ac5f6cc72019b119c2a7bb3120a08704f91ee614f6d396925ec64316a407a12f23eb1b8735e87197b01343739832779db47cfc32f3a05ef2f78b641a98cfca6b9a8b02fe65bf005e187af1e8d0ff91fc147e497d0002bb8757b0b7f37fb0df98bcbdaf89d356fc946e8f9f4b034d1cdb5a2f82b625df25fcd5e77373e9daa61103645eb1e58128ef1cb4bc37275320f0d73498024dc8c0be6573a7e78d281d154637f0e7fe027b885002036e06012f403810528e1e989c27c8216fd972995771e939b2ee56c0ceaf0929043fe3af44e0bca6b488bda343fac47c34bd3981f3ff658ea7c6c4ac78e2bdfe7b48669ef003acbbb31570d5cbae0082c7745f0a9f910068178812e38f30c52118d338d34ae6139962ecbe26063709a3336cf9a65464a6c29f8cd5ae93a4db428a2ea2e932aa2ea5eb12ca2ea7edaad4dd84beeb53786d1a2fa4726af697102f7eb2eac47a9c4ffaa4a3347a98104e312c40afc38863b4cff47354de5f2569fab8c3a4088cd2bc2756737fc5cffb526c090f0bf34b8af2255d625f2e40b7bc23e7b02bc7a1a98c027b78d6883c0513c6cf0e0a322351803cb6175b7d85651556161a5c8d49cf4242733015862172e8be5e3a3a4c3cc7c56e48969fb04cfc10171861e44ceec312cc535c0496ba07502908c1873fe3b01b6cb38e3c4cacfdd05ca079cc9247cb4618632448992ed0c5956807e1173f593de80ac4c27fb25aace68117af8f2e0284c97c57e46a3335bf62e36d80d0779362f410804c342aa16a02e00dc84a9c142ba466e024ffdfc4826219543219c9a024692c20488341892d6d69ceb5bc2456e9a828c05705651f27c953a08afa67c244cb28c9e694c98094b03d66b196668e3adcdb6c4754c943ce83bd2130cef38eefb372ccbd6eff67e47cc6204addbdeec57a0e4c64cf3666aa78debd0021e9adf67b22c8118a8eadfdefc3d4dcff3eb80f7bdd076288647a78be40fb4e514c4ff69cae989eec3975cd560f68e5ee3b6505bdd873aa0a7ab1e7144564ee7c7d8fad8d91389fb91a025b6ad835e9fbaedade9bd841cecca487c67bdd933ac9d89e774f6ae6367cde9dd998a16c8f63b9c6bbf31a915c89c4a811be35de7bd688da1a6ff56a84690d76563582b3861b991a6159c37d438dd8aca19a5e23006b522bae117e35a984d689ba9a54faea845e8d95ac3a615763a5a64ed8d55889a81375955db437c3c5f4c12e929be16222492e4a9b21074dc3054b5a8b20c5d2b034d8709370b48c40691eba928e76737046e03447c208a0e6484281d41c4324a05aa2989aad5110966b8e2225d0b682a85da752f2ae392246fcb546d2ae4b8c706c37d991ac6c41fbace86c8e2625499f41a4e66d868fae13f5f95904e78de5fbaee22f12fad9555df1cab1ab1ae365665735066bd2e10ea33913d1b8d3faa6e66eeb0381bbabfa92ebe813d4bac3b14daed0bbaa355ece775ce30e4736561476c927a156b13351c7a820bbaa33a9af3cdf98e64f16c27ddbc1d4b7158b39b973ad1c6d36546f2b032477a795c192fbd1ca60cc0eb4320cbbe7ac0734351b0005bb95ca40d99d6413d0ba4dcdee162b8326f78775c1ea3634b907ac3515ecaeaf3a85a5f6799501b33bbb5d84ff6e1777bc2478388f299d8e299d133efa908759dd5198d5c78ae479872d18140f1ba5f13c435feac31c67eac30237d0c36d3ba0054b12f741db810f5a9d7052cfcd0d8d541744603d4804c7da8d2f5a50197747e3ee688fe78e46290d59826bbadffe98d370aac2039e3fd8c437f801097158bdaef0d99ecf9160df7f86ca0084103469afe0ae56162c24a004af10f16073d00c7a811640dbe8e0057178b34d104dc20cd0c0b2ee7dfbc30fda9a0cdbe761120f89f8c58146b3bef7401983ed9009dac303e05e1d0817515101109298afc44b945469cf6c81442122a8010a10b1319e694c494400a058d0df0321193470464b11b4e140c038b8418b4c2b88c60c1ab4dfff95fb001ae60a76501e02dc0eedef838904b24ffc4c07614ef0508ff4cfe820d7918f44e14ebc817794cb8f0e5966a7ef6de70e59e6ef28e0a4c4638295488c32bf4cf493fd0e3d9c506944ff65bf4cd157e244087f27186d81cc39e12efa2ffbc5b12961d17f1251f3539de2fe8a7f127fc5bcf921fa8a6f570410747304fa9045f56a6a09049f7f0fd58b75f8237af3355479d6d92c0f69b7b07024b163da46c6c4aad00fadc817cdef66165bd61f8d9a65250680fb6b727fcd47f1d7fc4efc330ba2eb25bf52f7c990ae56684ef669d9fd9a9b36b12cf5b1fc2b59ccff2afc7fff1f94f41359854173c25d0a8d988166fe4728458afe956a1ad8874b82d10f41e17428e4abac9e9b681c8d93f7900ac98217636c18d808d27fc06aba4a4627ca620114b18dd60372284b5cc293db008eeeb793c7f5a98eecdaa7f6f0f9b8bfb2474d6100cfb00c71f825851a0451ee08a1d8ff3b39970b57838e601a296cf2a0278a4371a0cb1363ac2b9224ea9a8c141d23196184e1ad81a3009bc1dfa2a2aad24095f5a1a488d00203e99ad2d3f4feb0a788d3816a4cc73d1a4c33be4e39765d7b62d2fe75fcbc3267614ba0be5ebf27429d53240d75a587641d499aa2ab521f2b585465792826e2fc26f8ab23a4c6b41e5ada96cb1837c85258ef4674a985b97d8c5302a2f2bdea89fd814f4017403ce668e54cd104fff7e623045f3430e708fe8b03e67d203d7e20e4fb63521ed285fa064f59227b974ed5180fe8bbdc7cc2874e366ce81e506f3621c478ac29464fd46571a2e90aeea94021aaa64bf2441bcb13a9a78ee5ea74ece39c626da8a9d389de1b0cb1ae28a2a66bc89075dc1b4fd074d89727835e4efa8d2a145da782345907a1481f9db6b741becc0a589b78837e7ea7149c5229f25f0e10086051567551ed4d7465a88c756d6a4c743c517a3d4d1cf41479589daad3d865a93f9ef625a48fd178a02bb2a2eac381d4d3b13a5110d0e640c183dc6405796d2ea2f46695a6693e85e519517f188b2c4bfbb94a636d2ec8f4fc3be5074bc7e42488de96c3c4e5bf1cf78cf1102349578706e801ca600264a44e75098b632c29c39e2a0faaf3431abbd687554202e5078903e8fd10631da9b086a8f21481f621f6fb4a5279c96df3067e6856699a1f5258f6821f526d6ec80f999e7f9ffc609354121ec60b140adae41b59c3184d405b5764689482412d1ef615a44fa69a3c15452cab8654991392a807fd89d23744a4cbc3e184a006221da3813e1882e8d6866325a5f6649bba81079a54976280048a7da0fe44839b917eaacffb43f7b55205e9d5777c7c5fcaf7a5cf8c7af3d39690c8e3a0adc8481ba820a77ba0c62b3daaf80efafa9804d9ed193dac186add1d6a3decadf6aa75abcaddb51e3039439e840748ca62ffd477dbdb5b9f1568df7efcfeb7ba5bc9fe665a1ee8bad214f545451f0ec7535d19283d5d43531168cb00ac584503d568c415d5d1b7678b3a7595f045901ce74918e3daa606f78fc213b45f9c29aaa64494c9f10ec283c90028a9a7e88a2a83acc57dacf706f260d21ff6e4fe78d89029aaa2df065354afab94296806a827628af9fa0ea8e8b1d8027ac6d962fb99429b704525ecdb618a8a556de089ef611391cf139c25922c51e9a6a0cab13abf29e03705df013f54ba29a872acce6f0af84dc1fef3c3a69b822ae7ebfca680df14248cf88a6cdbb691d961635ccc5bfcd523e9886bc5c72cc9c99c2e33b6ed79645b49cddcc3a69db954c94d678aac8be6838b7ff116f32c8a3cb3cfdd8422cd5711cae721cc287d1312c3ee27e4783eb7bf1c1bc63b8cbc9583dd36b342715d7e383faf89c47356118e937b645aefccb9073cb1194d26894b80c547109b296fc6c4e48c49e0a00cede60cf0a6a614861ba98a20370055399dd7992c209bd0867fe22f442d669efaa1bf5953ebe536786e0257dbfa339fb3d42c60f490e7ad9ed39623ea6742fabf8dd6ccfa1d6fbd9d4cb5e5ccd84e1b0ad013bda17e05b126978bf43ad6fa5a36fe092d0cc39ecd5b73e3e8defef2ce76162dc4304171b5c41641f366e579790d7aeab536bdfde06b2d5f039ed71a90bfcd7ea435a0cd11cab6d680cc89c077bf066cd7aa96af01f5d680e43e9c2f007c0178560b40de49d3e348ffe6c7865b12fda913b1ef5dee6fcd7a9c4bfcaa998b6ce043d745f6dcd6d17cb6da20ed81a13089fdb51321cf8e212272592701525b4c0409f46519c8d197f672b5ac4fd76bf8f3f2e2e2a56108bffcf2f362f1b31bb10f882a12334d2701e590b755d474222b232ea6641f8fe9da85b89e0311ceede5925321a7c2a73b00f1ad72b8d6cbb5dea7d07aab7aa53fd27147fd0802db3ae4088ce1befba38de62120b8525b53927321ce85f85685f88edd131f49c6d7f22add9678ff1348f6baa1a9feecf27c3b297df3327916e7f22d343aae9edfb7d04eb37ab6df7c7bb7ea897f33a7363552006737db359201a73c17aaa7048e3da8b79175b54e1ac13ce8021a688f324313ad51a668a4451ac70ccd6c07574043edc72ea0a9f68876986272dbc99d4aaa921a27b0da2cfd769540ab884d765c7f92a776963d2ccd804f51b1cfadbb9e6f9fb5775debf673a695a4432a285fbcd2d44692b7b6d445925d4daa2792ca5b3f1a41c72b46ed3188d788daa03c9155e54456158248e7e4ba4ae8fffebb60d341c78d71a310be98065d9834d0aaef4dd84359d948f865180ab82a402b0fb43668337c16a07d29b5c09a62bcb0a54a239c59566cd5c41cdedc469743660d70a93db50db2fa6d0ab82417504a3a12a52898276b7be4646dff26bcfc8f97829f2ae26761e54d5f6ae4cd8b4ea7f3e2d7f7672381e6651326c812eed103169070bdf6ee41904e57962f51bd7be4092629329f6343f8724f92e1dc630a08ef5fd84b6c61e3e0c58b0f2e860f503206b5056418b01a80c817e6f69d3921afd6d05fbf5a003ab53c92fdecdecf0021d8531f7788c1f4ebea048d3a83fe451f3b2fe86c1fbc38b6a00ab458ce49a3c8d1acfb33eddfd4b117c2bfee4cf7e07afdab77f06b704a027b669270c0137ef59f5fbc80254458f877b93ae9ce0f8689a0b95ddf53b02b4cfd33e31f7f7ef117725c28bc0adf1c8431e37ff8f1c55f48e21ac79ec3571ffc600a7bf3937b736efc10d4d4153a176b12608afaaefdf8e2b132e911562acba117f1dc29fdfa8ea1e6ecd713928f07daec083eef9e908c02fe568b8a8d4c1a2498323fe5591c1c9f167f88d2c5c52b209b202eef3bd122ee1c7bb57c637f4dc6f8afdfd06b9a81e9919a26a56f34d2634caf53e243b20deb6ba279873550cb1bd7d8c6a87be50b6d63bc2fd9e1989b2ea239afea210c8f7685b90f10628cd0e963499535459eea5a1f49baa219f06b82555d464843eab0270d7036a0461397eb0e916d133c0a389430d735313ff113b324c82ef4aa7da2765a8b70d8ce686e98b039beb022c926c9fbf0adee8b924e36f9117daf27ae0a6b5cd9a56f058ee773ff543cba7318078f39a7e47975a7cfcc0b48a51941d1492299e266335b57fab236959581ae0cc9484ba2ac2334567415a3de18f727032c0e9e8ea69eaaa99cac0a0b454b549b75ec1ff126e289d731a5789bd47835504bf64ac5481f67a4cf4dd3f3d66be18987b95fb0dd6b3cc683ec96afddd06e2e9329f12ebd854a2551f3ed4fe2838cb0487a47992c171d40d5281d9e74d500c99e32d600ce9e2e56074e9f2a56836494aa2a1039e78f35a1c273c73c305fbab2b3cd64f0cee08e3f3149ce52f738a525d307d4d5ca678fd12b0095ddf554002fbbaad90c5e7cd3520e1bd3464598d2cb958a70a9bb119295384d01a914ee993a929f371147bab45481404a6a2827928d956d26948d283613cb26149b08a6acfb654453085781702ac16688279f528254a6535885fca846d751c2c118f68b7f22c434c47f137a21b8269a99ce67a41ba2244e6405eb935e1feb8a319deae39e8af4896aa8d2549c0ee4092ed79f2b1a387552c7acf486a148edadec0a40760f2fc343a397b9ee10e5ea73fd9188216ac386cdb6162f619b905647d2365047875fd2d64f89498cf7d6bd9e087ba0c9401fa803a42b2a864d903a9ec0af3e6cad2563da53c7dfd324a672746e673813db4a4d9c4c156dd0d32599f80a12c7f0614f16f5319235d443437108aff9882647347c7699accea9b4b4afd94cb3c56a674e7ed9b45a7b94cd79cb266ebe3597af699265f2e3459472991e7c07cfe163300461e653b4f2ec1b3c059cf7c4438c0aeb2fb3f12d2d7469bf0f4ec649d4c0f51c9f200fdfd98e4952b5c2567c947c470e097cc3e33061f788f86e05e95e691d57d6a5ed99d3f505f401ddd150594c0bd8ddd73d7229f41be462e31fd1568c58afe721644117a615542ce19f44ad1365a0253d8a1e226a3b328dd78dc3171d1dc6d9dee95a15dc033d4dccc14ee404de39c80f877474c834326c3754f0c5760c12768ca177ca6b40560f89f5f830a7b09f8a9c743877208962187e8faeec1279740b12cc13a1352379a9c9dfecdba5637f565ed344e9f06f2293b5e3c284884787fe8fe4a7f04bea0350e0bd49d25c073fd86fc4f8c1317d2b5e62fd163fa5db83e975169a38b6b55e046d4bbe4b3857cce7e6d2b54d2306c8bc62cb03d5de3968796f4e48eef1d75400d264c7ec5b4656e58e281d154635cfcf4e4f39c2776900e941083c7a884b2c11490a9f28977915979e23eb6e05fcfe9a9042f033fe4a24d26b4a96d83b3aa44fcc47d39b1338ff5fe67e6b4c4c5026843aa29f4c85a05527af9431765f939bb7c4ed33b6fc3b559ae23cf8c9d86938495a2ca4d2223a2da3d4525a2da1d6727aad4ab14d68b63ed5d6a6db42caa50b724264e0af1e105a62ff904fce4761305e219c6258755e871e11b4cff47354de5f1a3fdb266b474025d85bbcc4964122b1b2bb0f7f8792f7a5d8120a56e39714e54bbaaebe5c200b78c211262b87305194a19c351b4ac1842ecc414166240a90c717c7abafb096c21a429d3f62403217ec10878e4df494473a3a4c3cc7c56e4826f7b04cfc10171861e44ceec312cc535c0416b507d02308c1873f63a707b659471e26d7fe680e0a094a5a617504237471f32dd9401320cb285109c22fb064c2e08282402cbc26abc56a1e9838fbe8224098cce0f783096a11a81f96be5881a6e212abc9afd8781b20f42d3019e50320138d4aec8e01f006e41f4e8a1552337092ff6f6291b00c2a998ca44b481a0b08c7605062939b1528018b65b4576610947ae325bfb271488d159a130534ab88ba9d3a5b50cb5c98fad44c6bdb694799f41b60ff822e1d850a9d0fe0460adeb58327a61bce91430813bf5d2de7c4510f5f12939da42dc21131807ac02744c972b3f1588b872913fe35612bc562651717f222e1cac37070aa4bb114c277400d41b501e7bf0c55f9e8f0ff9c964a1aeea7033d1f6e33d233d53a91f3606f7020ade52f7ab86b2fd89563ee75fb3f23e7330689efee752fe278c3fbdc0b90e5de6abf27820a6a6ced7f1fa6e6fef7c17dd8eb3e2ce80d079e2fd0be5314d3933da72ba6277b4e5db3d5035ab9fb4e59412ff69caa825eec394511993b5fdf63cbc2fbad86c0ce1f764dfabeabb6c92c16fbdc138ff85f58d6ca45e69eabb89983917deeccc65c454fd2fced04fc8877e735e27e10895123c647bcf7ac11d523deead508e511ecac6a04f008373235c27684fb861a013b42357d2388168124b5e28d80c33cc02a8d94c43cc82a6d9562828895accd50721aaa522b7b69a84a2d541233102eda9be162fa6017c9cd7031912417a5cd9031ad241781cd9031c9644fa337020f4b23ff348926c30894e6c147e868370767044e73248c006a8e241448cd314402aa258aa9d91a0561b9e62852026d2b88da752a25ef9a2362c45f6b24edbac408c776931dc9ca16b4cf8acee6685292b439a294606d11b0292367db8459da6180a56dc48389e5fbae22d010fad9555df1cab1ab1a7353283e6a8dc19ab4abeac2056ca7f54dcdddd607027757f525d7d127a87587639b5ca177556bbc9cefb8c61d8e6cac28ec924f42ad6267a28e51417655676152dd47ad35a9dcec2c185e5a133a7c82308fdb8a4797dcb9560e8916aab7950192bbd3ca60c9fd68653066075a1986dd73d6039a9a0d8082dd4a65a0ec4eb20968dda666778b954193fbc3ba60751b9adc03d69a0a76d7579dc252fbbcca80d99d5d65d0ec5eae7af0c4bcdd5b8d00883cf461edd0876da31c3292b9552c3d4aa1ad3030b2bb151e4698b7c2134af756482271df1ecbd4dc061622ba5a6149ad10dbc2d5ba77a935a4152e6651d9069ed67d63969dd61410ad43ed98835d985a614aad54ad70a596ae76c146336b59cb58a33c30e8771418f4b1624fde610b06c5c3466904ca3004cc614e0c98c3821020874d223b1c96f858078b12f790deb587f47aa60fd06088a4c15457063d92f76e8af4b13125199ed5e9b037e8694891f7ca437afd141ed26bee21cd3da4b98734f790e61ed2dc439a7b483f130fe943ee7acc5d8fb9eb31773de6aec7dcf598bb1e73d763ee7acc5d8fb9eb31773de6aec7dcf598bb1e73d763ee7acc5d8fb9eb31773de6aec7dcf598bb1e73d763ee7acc5d8fb9eb31773de6aec7dcf598bb1e73d763ee7acc5d8fb9eb31773de6aec7dcf598bb1e73d7e3e7e27a7cf868cec039eebf87dc158cbb82edca158cfb80edc0072c95b35ad7fa3d752cf5341d890343578618eb4855355d95a7a82722b1df57c4e7ee0396cec3bd131fb054a5dc078cfb80711f30ee03c67dc0b80f18f701e33e60dc078cfb80711f30ee03c67dc0b80f18f701e33e60dc078cfb80711f30ee03c67dc0b80f18f701e33e60dc078cfb80711f30ee03c67dc0b80f18f701e33e60dc078cfb80711f30ee03c67dc0b80f18f701e33e60dc078cfb80711f30ee03c67dc0b80f18f701e33e60dc078cfb80f17460dc156cabae6033e49a1e2c596b0f2dd1bdb75ac03b9ad34ad3c49ea8f5147dda4748573464c0abfe581fab489ae2e1501335e9f97b8515756f570e6245f5735f31ee2bc67dc5b8af18f715e3be62dc578cfb8a715f31ee2bc67dc5b8af18f715e3be62dc578cfb8a715f31ee2bc67dc5b8af18f715e3be62dc578cfb8a715f31ee2bc67dc5b8af18f715e3be62dc578cfb8a715f31ee2bc67dc5b8af18f715e3be62dc578cfb8a715f31ee2bc67dc5b8af18f715e3be62dc578cfb8a715f31ee2bc6f385d571122b70ca4afa8e457e6217abb9678e56ce144df07f035f988be5dc9caedf3ae88b69ddfde26b2652beb35925bfb210e3397191a2a88afdc9e8c0bb05fe6062f067b37f5958e5f19c34c2bb5f647dda52fdbcb5fda6c5de66d7f67c7d675b71c98b085c4a39cb15bbb3e5b9a9ad16365a982e50082c0ddab0af18a2d6d7fb13a5a72ba22aeada7882f5de44ec6b8381a60e06e39dfaa6118f94573db13ff0e925411d551cd7485ba06b46c2758ded7247f8810cf28fbb725b63eb6eebab767d73f59f2737a38f9dd3db9b9136140e85db8b9efaeeecf287d3eee58f9dee9be3d1e9fbd3abf74c994ef7f472747af1e6fc14deac886c4096708b1d20185852d05cb8094dcc85d1daf5f042908680195b2e5ec08876ba17007c7ab311f89d039da2b09d4f756186620318a9018cdc00a6d700466900d36f0033a80b2313f1551f46ad0f239131383d3f3fbb1e5d9dbdfdd8797f3322d42176bafdde40937a83ae3cd40e647520cbb2244addf3d3cbf7b7bf7cb83cbbfdd8211210284ffaf42922dee393930f37c727fff5513c20afaf6fcea03d80d5c1d8fa624eee3b5db17b7cf9fefcd4c760e03bf8022f0f4469a0a83d7928ab645e7a3d0026cd39bd1ebdef741559d5e0c5c9d5e53f4e6f466757971f3b014311babffde50a4ade8256e33e60c7c5c205762688ac5e0c0ae8d28034e8f8e61820c8009d03077b2b030bf654b0608b47dc896015b833adea8d642ad034514a55605b778535c8834655c8c92ae8422380d085de0ac8cbf6e3600814db1d9d1c8735ad406b5a93394be2559378df110f3d018316433c6fba2a5d4ff3e73e89a79f87c782e5e49e22aa8403e609e67af4f104391e764d6475e54fdde3dfce4056fe700ad29334ab7b75f3162a00d002820cca13694bab0f00e442800fa3e3f7a71f472757d74402c3cc591813bf23c15d390f78dd05cd7919fa2b828ab05cc2b703e09de39bd363e8a869cd9165082f0550bbef410d17c8933d9dd20752eecd9babdf3eaada81a674a5e181a8750730d9c36e4f3a50870962278beaa74f45eece3f917f5eadbc85f0d3efb6855ff554e1273c9f2fdd57c0b99a28fce4d95fee5c4d79257699ff093f9179775f019465eb06ac5ac56ed392d82bf69c268d2b769e261df8d92fb2c18b3a7761ace35a0d2350dbbb9a366f204a43ee66ddd0cd9a6a4782af3209f7eb876f7fccdc35684dd8123edbf706e88e4898d933980fd35d81e403851d0a12dd6ae5ad1e10fd4c80c90f0f99212652c0f382f7b68b5e12050ed62cd415d633124ee0db1fa0bcbbf08f0f31b3ef3d6c26902cbefdf1ed0fe7db1fa43c2978f022a1d109e44c07c12ec183a606b53ed8a0a0823abc9adbc20332672b680260b401242804d4051d4382659291060ddffdf6c71c902f4c788a6aa4c54943dc950d8d5df9e07e9fc9d860ebe0f9b8a773d594aba65c35e5aa29574db96aba2dd57417cae926f5b45c41ada8a2b652521baaa92d14551e59854756d9f7c82afb1149c521d4e7c08c3fc8c1fd880b843ec7a3f5626ccfa10f36708603c23fb852f47b60932bc6b17ff6efd29273fc80e7e9c028fea7941a4fdf05754dcd795887eedcfb35f8d4496e2fe7cb7b44ef1a26202974cfd67dd6a5177c29d9069c44e42bb983d2f3c2c2e4855fb940cb4ebac4c6102da1a327fcdd392c86f64bc52d292b9b5fd3848c2915ad910b2094cbe2393abcca13d8879586c4974ec212b9bed5cfdc9ecc02f29ccce9cb11b9fbc1efe83c45d42b75b63fb2bdaf3f332b67d8e731a534fd8b6978f73a88279d2ca8ba4b34b0fa432a0dc5ae34d0ba922a7565550deb809106b5b536b631a1f828860a11fa4466d6c7c3f496a82ed8ab8f227fec7c6cad47ede2228590206bd046b5ebff9f19797be5cd813ef58633e0daf3d83529c4d574160ee47e1a15a5ba5603c6226a386e894e16742e5f06f81acc5278c812c8ac26674588322c342be49f0826609459299744a5c3f615f142599f2a527c8482ccd46c035dc7f5250878b6917a23c06006671b69341e034a8cb38d9498e948057acb695651732aaeaad5a47fdb95b5dedabaadd5b584b72aaeb0878c854ab453a13a50e2a03dad291d39b687523ee147aef93ba6349dd8bd440a5cf5f078053395fc4aa3d7859b85159a13db9cac8d8e9bd6c54ac7fddfffb5b2bdbf45a7e224a82efdc75b118b3dff6b7216b2e39f7e5312e20fd415cbb820a654b03f881f58bbaa9583dfb0a532ef121bb9ab2522061f643b9278e631055bc41464a91ecf69fd425886f498147ad5696c3dd411c29dfadf316c59c20d7c47308d165875d3f08937f85b937bfd9e88147d8aa4a1aef490ac2349537455ea63058baa2c0f459d08dcd866fdd875ed89897c2944c9e92c6c51257451ec9cb8191953a3d458d7434fdb7419d701db619079237a5a0273fefcacaf02f1129b60f92f0e98f7fecfc0042bc948f4ace5064f59e27b17daf6eac108c403fa2eeb6fe00be47932e0c66111bd6f2384e6f30c405223ec53fe4ab0f79d423143d25b63647d2ff3449c1dd07ae6e2ef66ae828e0597dcdf4bcf2291f5dd0628ca8b4b521c99a850d4d4085754c0d93562179532528d7046e5745b23ca51bcb26d23c44b9d980579212a8aa6a81dcebc29db4a2b73a6702b78f3a6b44d2089708a77164e62db8e9c8feef25c4078bb6c400e953e41ffb324fd048dc8a1ff5db5226296ad3b1197f80716386b9648c35a580ae45f9396e44bbc26980a645c0d774b46aa3daed36556b41ed30fe121cbff848e592f73fe0afffc6f87ee723b27c87a406e27cfb732551d77f1e42e9edf958b67b148e31902779221708e60abf519e99a8106184f06fa74aa90848083898e3449d695411f8d4545310c093fb78480797e95417f76950130a88e27fce309ff78c23f9ef08f9ba572b3549ef0ef7924fc7b628b06122109540467f508460cdca6e0b16d0aeaa8c555ac09eae07b767604d319b71af8dead061871b5efb9643c0f81e0fc1eae6b8932e261ec110fc9bdef8eb722073d9fa9433b32adefe34afdbb4a5df4fd6494da731b28228cf7be03b3fd4e78e7d8f6dce4e63ecfdadc87555a6ad8fda474841ad63e394b720d4b9fc215b086954ffdb44d6ad36451fd5a6655c9fc6575929705c2a246d6329f37eb642bdbae4d5382ee5aa58649d0611b7b9e2c5db6c87d5348a7cf230dced672f3b4b34df3e9bc1dfcac55d2a4800ff6ca0e6c5bd92142fedb61f602965977677c94e1ec9d6589281203cf3a61c4d3e4c7d833eb462aba7659d96c77695c7ca1b8ffc6816925a34ece82b45a51c3842e5791a89e6aa14c75d851d68516e91eea1a64462a402d8859cd9c19f132cf4d21b929243785fc4e4d215981cfad1f7762fdf8b0b21ddb8f870beb255aa27b6fb5a0d7b59f4d5d520cc3508d89de53a481aea83dac0fc5293cf60653d5180e15653c796e2691242b19080bc620b2ac8bbbb2922c6b03379de4a693dc74929b4e72d3496e3ac94d279f87e9e421b7417c1c1bc4c36d9a6cc52968f7f9969a2402dde7f6c7097af7b91771bee07dee4590be78df2d6748eedfbdefc374ff2d984856e47dee4332f5f577d2933da7ab6462f0fd8e9315e629ff0e7ab1e754156771df77991b2695df6b3584c971bfcffdb837b1839c99498f88b9653b7738f87398e96fc73639de9dd7b04c2612a3863972bcf7ac61851c6ff56a981d073bab1ac6c6e146a6869971b86fa8696b4c96bd1ae6c649adb886d5715209ad637d9c54fa3643b2212a43256b33949c86aad4ca5e1aaa520b95c40c848bf666b8983ed84572335c4c24c9456933e4a0a9f9bba4b530ba9786a5c6f34d8cce1981d2dce0978e76737046e03447c208a0e6484281d4cefc9a32564b14d3d646e094e59aa34809b4ad206ad7a994bc6b130035127fad91b4eb12231cdb4d76242b5bd03e2b3a9ba34949d267e08fb14d27913abe1dcfc2a92196efbbb25d26f4b3abbae295635735c6cbccae6a0cd6a45ddad513d1b8d3faa6bbf51b20027757f525d7d127a87587639b5ca17717cf395cce775ce30e4736561476c927a156b13351c7a820bbaa33a9af3c5f5fb027737ddbb613dab63c99923bd7ca3e2ca17a5b1920b93bad0c96dc8f56066376a0b5bc7fc2dd4c3da069033fa370b7521928bb936c025ab7a9d9dd628de0f1ecfeb02e58dd8626f780b5a682ddf555a7b0d43eaf32607667b70be7b9765e7b25ae77dbf3553be4de63dc7becbbf41ee30e633b701873f1dc763db2e00c8d89d6337afa5492a6241de858474365a8f791da9727033ce8cbe2f38f961f7667376e60616ddce18b3b7c71872feef0c51dbeb8c31777f8e2b1f279acfcbd8e955f4b27de1c2abf16ba6717293fa956f3a0f93c683e0f9acf83e6f3a0f93c683eb7c6e7e1ce79b8f3ef31dc390f2dce438b6f3bb4388fcbcde372f3b8dcfb15975b6e5c158f26cda349f3a0cddcec869bddf0a0cddc0667930dceca764d7241a04853b53fd47aba262a92aec83d431f8b93be3e1c604d9a48b2280da67b6083137467473638416ddc0687dbe03c9e0d0e25356409aee97efb63eead1fbefd2160f3e5039e3fd844997c40827dff197785cff60c09e67c01edfbf60729e482747366e6cc356165f4f0ca5bcd5c6c09246438123e23f84130803a890e5e8c025a16e095001a22097cbe4204a72dac018307384d1703b8cfe5a043624c9f41970400281634f440f83bc31c335a86200ddb0f2d23ad8036831e1c8731073cce0c9a8e1e4c2410f786cfe8809b1f71f3236e7ec4cd8f1ec9fc889b1b6dc3dcc834b895d1be5919d5d1fa2b5819d541f74cad8cc28d03b7327a722ba37d2160a22563f62719211dd453ac2b8a8cb4813ad4873d650cd4a2a88062d0d7c7da6032ec193dac186a75a26e823d41e34c4b37117ab3bad2744fb11c44589e880dcea16a5f906f851168a7586ea07dabcf1214cf9f8e2f96a0747b3a52a529ea8b8a3e1c8ea7ba325000259a8a405d8602124b4503d568c418d5d16f8133ea5456c21a14cd13f1c6b54dafdc1e852d68bf385f54e58bf95ad6f14441783019002df5145d516510b8b88ff5de401e4cfac39edc1f0f1bf24555f45be18bea9595f205a07932be98afef80901e8b33a0679c33aa7386deebcb8a221a481f0ca780a7278e75042874451b4e35b18fc4417fda98312a61df125f54ac6b035b7c0f1b8a7cb6e05c91e60a4bc7e4ac9bc6738119cd7fa9f57bea58ea693ad08fa12b438c412f51355d95a708f6ab62bfafd4d83e37c19ee08fdc366fe29466b5a639258565079c529519c234b2595648b5393848abcb08999e7faf2c6113080fe3058219cb7933e84f94be21225d1e0e27ba8225a0a5311a80c495fa636d385626835e6566a88f9ae5846c5337b14193fa523c9040b10f0c90687033ea4ff5f999f9b47d275e206909f31df42949377bed00660303ba2eb2e7b68ee6b3d577d399b9bd5caeb817d573e984af6f7fb7fe6055fc94a48c6d7946f7aae30f96b78055f708cbf07d1d4fb00c9bd570052bf6d12af3024b6cdab6e1dcb51da7a0cc04b646999ad016ae589909de0eae60c277e950558c2320889d7966edd087653b9e51f964bae3fa9334bd33d7a834033c45c53eb7ec7abe775ea1cf875bf7946aeab5932796eb22c90ae2ea5e4e79a2b711742c6cb7e7b9540a150b54eef4c49d9eb8d3d3b3777a0211c97d9d1edfd7a9fef9ea73f3770a8f51036fa7e4f2b60b8fa7448ddceb897b3df1c8c3dcf587bbfe70d71f1e79f879b8021d72e79ac771ae39dce6a5709cc16b9faf85481ea57d6e7f9cdf6c9f7b11a75bdbe75e04d9dff6b90b6132babdefc3d4dcff3eb80f7bdd8764e6c0efa4277b4e57c9bc8afbdc9338cde377d08b3da7aa3809e6becbdc3027e75eab214c8ad07dee473263298f07cfc3f4ff2982db6fc70e90c9af5ddd1c902615ae6efac7e4d6ae6eefc764d6ae6ee817e6d5ae6edd1765d5ae6edc17e5d4ae1ee73dcaa8bd0944eb14e4d3de0438ec1464d3de38ab62a72099f646c89820985cda1ba1e44e4e2aed8d50bd4e4e26ed8d504a273791f646b8983e1279b437c2c544924aa3bd1172d034f580a4b54878200d4b0d829bd8a93202a5b9b96498b5bc213823709a236104507324a1406a8e2112502d514ccdd62882e4f50d51a404da5610b5eb544ade3547c488bfd648da7589118eed263b92952d689f159dcdd1a424e933c8cfb1cda42175ccfa9f459e8e58beefca6697d0cfaeea8a578e5dd5182f33bbaa3158930e7798d88588c69dd63735775b1f08dc5dd5975c479fa0d61d8e6d7285de55adf172bee31a7738b2b1a2b04b3e09b58a9d893a4605d9559d497de5f9a6377ab26c4edbf649db96f34e72e75ad91325546f2b032477a795c192fbd1ca60cc0eb4320cbbe7ac0734351b0005bb95ca40d99d6413d0ba4dcdee162b8326f78775c1ea3634b907ac3515ecaeaf3a85a5f6799501b33bbb5d64d66a97d2abc4c36f7bce6687dcfd8bbb7f7d97ee5fc122c13dc076ea01b69ee9bde1d018ab43431ff6255157a6b2a46b0355d20d519e0cfa92dc53fb7be401b6deb907d89a7b80710f30ee01c63dc0b80718f700e31e60dc038c7b80710f30ee01c63dc0b80718f700e31e60dc038c7b80710f30ee01c63dc0b80718f700e31e60dc038c7b80710f30ee01c63dc0b80718f700e31e60dc038c7b80710f30ee01c63dc0b80718f700e31e60dc038c7b80710f30ee01c63dc0b80718f700e31e60dc038c7b80710fb03f8307d8165dbf0a5cad921e6191f7d7c56aee99a395334513fcdfc017e6623937a7ebb70efa625a77bff89a8994ef4256c95b2cc4784edca028aa622f313af06e819757982e70b3d75858e5f19c34c2bb5f643dd552fdbcb5fda6c53e64d7f67c7d675b71c98b085c4ab9c0153ba9259dcf5cd3836572eda125baf756b05caa5365385094893e9c0e07ba8235551f6b724f47138494c15491c4e164a7de67c41fe5554fec0f7c6a49d04615d734d216207d23704e4b77b823fce09a9fc93260fef8f88e6ae9dadb7aaa5ddf5cfde7c9cde863e7f4f666a40d8543e1f6a2a7be3bbbfce1b47bf963a7fbe67874fafef4ea3d53a6d33dbd1c9d5ebc393f85372b22199025dc6207c805161434176e42037361b4763dbc10a42160c6968b1730a29dee05009fde6c047ee740a7286ce7535d98a1d800466a00233780e93580511ac0f41bc00ceac2c84478d58751ebc348640c4ecfcfcfae4757676f3f76dedf8c0875889d6ebf37d0a4dea02b0fb503591dc8b22c8952f7fcf4f2fded2f1f2ecf6e3f7688fc03ca933e7d8a88f7f8e4e4c3cdf1c97f7d140fc8ebeb9b33680f607530b6be9893fb4e57ec1e5fbe3f3ff53118f80ebec0cb03511a286a4f1eca2a99975e0f8049734eaf47ef3b5d45563578717275f98fd39bd1d9d5e5c74ec05084ee6f7fb98292b7a0d3b80fd871b170819d09226b178302ba34200d3abe3906083240e7c0c1decac0823d152cd8e01167225803ee4cab7a23990a344d945215d8d65d610df2a0511572b20abacc082074a1b702f2b2fd381802c5764727c7614d2bd099d664ce9278d524de77c43f4fc0a0c310bf9bae4a57d3fcb94fe2e9e7e1b16039b9a7882ae1807982b91e7d3c418e875d13595df953f7f8b73390953f9c82f424cdea5eddbc850a00b4802083f244dad2ea0300b910e0c3e8f8fde9c7d1c9d53591c0307316c6c4eb487057ce035e77416f5e86de8aa0202c97f0ed0078e7f8e6f4183a6a5a736419c24b0194ee7b50c205f2644fa7f481947bf3e6eab78faa76a0295d6978206add014cf6b0db930ed46182d8c9a2fae95391b3f34fe49f572b6f21fcf4bb6de1573d55f809cfe74bf71570ae260a3f79f6973b57535e895de67fc24f64dedd570065d9ba01ab56b1d3b424f68afda649e38a5da749077ef68b6cf0a1ce5d18eb3856c308d4f6ada6cd1b88d2903b59efbd933557b1b88ac5552cae6271158bab58db52b176a1646d52b3ca15ad8aaa562b65aba1bad542e1e2f141787c101e1fe429e28338841a1da080073938f5871edccdf168bd18db73e8830d9ce2c062105c94f93db0c9c5d9d83fd17669c9397ec0f374b80fff534aada7ef82baa6e63cac4377eefd1a7c6a257772f3e53da227e813901cba67eb3e2bd36bab94ac03ce22f296dcace879c14ef2828a5ca065275d6263e091d07d11feee1c1643fba5e2969495cdaf6942c6948adac8b10dca65f11c1d5ee509f0c34a43e24b2b61895cdf96656e4f6601794ee6f4e588dc68e077749e22ea953adb1fd9ded79f999534ecf398529afec534bc7b1dc4954e1658dd251a59fd2195404beb8b5d15d46d550d6b80710625b636ae31a1f7282e0859028804ad8f87e92b5164b0571f45fec8f9d85a8fd9c5450a2141d6a08d6ad7ff3f33f2f6ca9b0375ea0d67c0b5e7b1bb4d88abe92c1cc8fd342a4a73ad068c45d470dc129d2ce85cbe04f0f599a5f0902590594dbe8a10a5186856c83d1144c026b3521e894a87ad2be284b21e55a4f7080599a7d906aa8eeb4b90ef6c23ed4680c1fccd3652683c069414671be930d3910ad496d3aca2e6545c51ab49feb6ab6abd75755b2b6b0967555c5d0f199b8b68d742f59fc4e1715a4b3a726c0fa5bc9c8f5cf3774c693ab1938994b7ea01df0a662af995c6630b370e2b3427d62659ab1337ad87958efbbfff6b657b7f231672e80139ab95ebbf480e7c76c8d36f4ae2d48176621917c41e08b607f1036b1cb472f01bb654e65d621f77b544c46e81ec4612cf3c305e8bc0782ca1e339ad5f08cb901e9342af3a0d4d603a42b84dff3b86fd49b87bef08a6d118a76e1a3a355709fe86effd9e88147d8aa4a1aef490ac2349537455ea63058baa2c0f459dc8d7d8e8fad875ed89897ca14349e9cc086c602aa18b82bf04cdc85acba446b91e72daa2cbb806d80783801bd1631298ede7673ee48b0ec686c87f71c0bcf77f0a3f1082fe31c942f490e5064f59b27b179aa6eac108c403fa2e6b2eef4bdf793a98e39ed1b3954349963e479fcd8ddf354dec895a0fe8aa8f90ae68c88057fdb13e569134c5c3a1266a52751e685951823b4a3b55956f5a3728cd51c50877c06b55d9298c169f65a6e2e6078b785dfe2a1b8fda9c47dee4af31db88bdca682cfb1e4ec8f310e84e2b62f3bfe7c184c801b387b147ae17f7be3b1eb090873ea3997def21d85258fa77d0a9ef2a7ad5f713548c48b33d9f8a50d7d9fbb9f09dccf6ba0b73d0354003f76c620336db6fca5a6267e5792b1e66ef299bbf513dfc1ebaf7fd86426495e51ac11053ba698db88839aa608d0089859a578d7889f523c6a94de3d425e327d6099e985a356bc4500c16a91ac113d36b429df089a10cae1338312fea5e49c4c42a5bd01aa114e313a36d44fe4bf04fabe85a097e6a135b2bcb5f2dc28715f2dbf38824b6b5f0663e7fb66948925fdb46b36b8321c3cfcd5145ecbd9b606f79d09b99bf3df63d0b47c70a9d1d46bd6125d4aeaacd11673b8b2e5424fb9e75a0a1fd8dab4445f0eeba9890d7bb8d40b6b3ead22bc1aeea0d978da7888cf5e80269e382b4eba66c3f2a585aabad136728adc7d6883294abb9560f8f54a6abee2852528b104d91065aa3b28cce59335e563d983cbdb23230ab496e23f05441f94ada626d7c3b087f9555528fe987d052e87fc210392f73fe0afffc6f875e22774e90f580dc4e5e94ab54753cd8160fb6f55d05db4aac5d5b8cbc950cb19517312b0abb7569bf0f8cf22a86d14a449c4a84b22a0ea75510096c53f8ace278566c382efc93a8b101b32eede82119f72a8c1eaaf7c608f57b6351c793a9ac2b8632d08768aaeafd3e367a5855863ddcdb69b8abda11ada240a88f1ebd2aaca96dd0aaa28823c591428ac38488c53142368606a91305a47608101ef963ef237f14bb6d97b95b97f95a8b658ed615fcabebb95237f0a3e6eed3dc7dfafb769fde0f77e9e7ee5d1399f0d2938aad3bd8707f97c7f377a9a5fa96bb05d44245bc01e829cc7ae69ab3999d7c50fab23695014e198a86ae48a2ac2334567415a3de18f727032c0e2ad9f9d7c61ad9fbb1804c7a818ce17e831a182b7d16fa1999e41778b8b0adad6f819feceb3333b7df730bb6a404deebaed89e4f217b6e7197a0f6efd6f0ae92115432015d4ca535eced42a2a86164979138db30946a670692ee7f734cd178b4b21a498ecfce8c47f6ecae34356bbbaa369ce21ddec326e861ebd7b175afc172b8a5322ccb1f75eec9321cc1afcbf87519bf2e7bf6d7652959c16fcc76706336870147ba7f3c3ff34c7d688c1519c903bd278e61f3db53c6fab03f90f5c1180fc57e4fd67a68bcb3cb33afe2ed594837e1dd59aa53bbb9464b55ca6fd4f88d1abf51e3376afc468ddfa8f180c4cfe386ed90df533dce3dd5e1364ff1e38b9a7d3e3d26d978f7b9fd7196ec7dee459cb47b9f7b11e410dff7d8312401f7def7616aee7f1fdc87bdee4332fffc77d2933da72ba6277b4e5dbe3bd2be5356d08b3da7aaa0177b4e5144e6ced7f7d882577bad86c0961a764dfabeabb6f72676903333e999308f2dc8433eeed4da86b143ac6e744358ae86a54dbc79ab616b13ef956a44b00ab62635e256853b819a11abc85256236855a8e7d6885695542b6b04ad4a6a7175425625b5a63a81ab622da54efcaa582ba813a62a5e8537432989190857bdcd70317db0abcc66b8984892527d33e4a069243549ab11bfad897d1a23219a5b86d1e16b0ece4890e6481889d21c492861da05d4a29cd212c5d46c8d82f05073142909b51544ed3a9512606d438db5ec1623de5a2369d79d84f06b41fbac2c6c8e26251a9f418cbbe681f79e45d4b35842efcab09350c0aeea8a65ffae6a8c178a5dd518ac2abb0c284684db4eeb9b9abbad0f44e6aeea4bae844f50eb0ec736b9c6ee363cdc2e47375ebd775ce30e4795d50b7626ea182562577526358eef3b5864716ccc6d395d243784955d2142adb1324072d357192cb9cdab0cc66cec6a45a60b3709f580a66603a06013501928bb416b025ab7a9d94d58cdd87bb51b9bdc68d505abdbc8f466aa3a85a5b64f9501b31ba65d845dac1cef717bbe4b87dc9b887b137d97de445bf41e2af0d6493a15450e44d73670e57f0343988be5dc9caedf3ae88b69ddfd12291c79ee47953c8d428ce7c47f86de0e157b18d11177a3e64a090fa1d0e970b3c75158e5f19c34c2bb5f64bd9c52fdbcb5fda6c5fe477440e2721711b094729e2a766f62241b31806758ff2b74eb75af3794fbfd839edad73455d15469d057fa725f3b3aa49fe3d26bf2d81f0c87b2d23f18f494e1b0a789da509435180d28be4e16ff0a1d25c87b8a7220f506b2d453654d52fb505c950972f8cc22874782bc274907b2d817b581d81f0ce49e3c50e41e411e1707ce49f4e4e8cb9dab29f9bd937b07c3e1b02f4a8a38d0e49e066d1f14f40cea1d2ad200faaff6fa624fd30afa242b07a22849625fd286bd3efc9135b5a03f14e540933449d214110a0ed33dc969baef5ee6cc80c597a6eb615d1d4efa43240e745199225d51b0a28f9132d4c713658245692cf531da694cc6540e619f691b446a8cfbd809f2053fbeb3595c675b27b3eb9babff3cb9197dec9cdede8cb4a17028dc5ef4d47767973f9c762f7fec74df1c8f4edf9f5ebd67ca74baa797a3d38b37e7a7f066456433b2845bec00e7c2928ee6c24d681b2e8cd6d0c485200d0133b65cbc8011ec742f00f8f46623f03b073a45613b9feac20cc50630520318b9014caf018cd200a6df006650174626ab487d18b53e8c44c6e0f4fcfcec7a7475f6f663e7fdcd885087d8e9f67b209e7a83ae3cd40e647520cbb2244addf3d3cbf7b7bf7cb83cbbfdd8210b11509ef4e95344bcc727271f6e8e4ffeeba378405e5fdf9c417b00ab83b1f5c59cdc77ba62f7f8f2fdf9a98fc1c077f0055e1e88d240517bf25056c9bcf47a004c9a737a3d7adfe92ab2aac18b93abcb7f9cde8cceae2e3f76028622747ffbcb1594bc05add27dc08e8b850bec4c10d11e1814d0a50169d0f1cd314090013a472408bd81057b2a58b065267e40b018df9956f5463215689a28a52ab0adbbc21ae441a32ae4641574c517a688e84a02f2b2fda04b5c7774721cd6b402ad754de62c89574de27d475ceb040c5a247199e9aa54adc99ffb249e7e1e1e0bd68d7b8aa8120e982798ebd1c713e478d83591d5953f758f7f3b0359f9c329484fd2aceed5cd5ba800400b0832284fa42dad3e00900b013e8c8edf9f7e1c9d5c5d13090c3367614c1c860477e53ce07517762ecbd0d11034b5e512be1d00ef1cdf9c1e43474d6b8e2c437829c0b6e71eb6410279b2a753fa40cabd7973f5db47553bd094ae343c10b5ee00267bd8ed4907ea3041ec64f5fcf4a9c84ff927f2cfab95b7107efaddb6f0ab9e2afc84e7f3a5fb0a385713859f3c9b2a0eafc42ef33fe12732efee2b80b26cdd8055abd8df59127bc52ecfa471c55ecfa4033ffb4536b83fe72e8c757ca261046abb45d3e60d4469c8fda3b7e91f3db141779c248995aa4e4787ac0645dfdbce1db2ccdf51e0519c784c4cb8ed9a4199e827fbfdc1362754c5a3ff26e2ec810e0dfb6e56e526b4b040e69c6cdee9bfec17c7a65da6ffbc48d8327acfc00d9c6b925c93e49a24d724b926c935c96d6992bbd025376993e5fa64458db2954ed950ab6ca1573e7e04933cd5829c2afb8e1200f1aa130d684730cc052cfae49e86fa3840b9dfc39857ebf047f4e66b7842bd4e9920326134d2c30b546f1b19e791c2101545612afcfe66b1654355e41c00f3502e3c94cb9f37398243a8cf81197f90837b35626e335a2fc6f6bc93ba47242b945fc65901758cc9d515db6cf2d6f5a369fecf5893257538edbd1caba2f25219e3c1cbe164a2be9487c389a20d067da927fd2f4b7b610d7b93b6c134aaa56a4863a377720126316c1a6cacb06160e39fc1fdeac45e595e0a730a0ba088e3473f20877217898bef3680a357c149abdcea192600de322ec845377061fcc0de7aaf1cfc862d9579971097574b44ae7f08d3279ec34223988de88676fdd644b0382e6e024a1622138730808e4456325ac6bf28fe85c42c248f2cf1065842a4824beab4ee08df07b7a6bdaf3f334a4e4700c10dd31598a4b9a44c24cc81038e1d8c82dbe0eb399a6058493d5861ee6d68d06fbf60f3ee1ec800081e8fccdfb1dfae8b8bf886f72db66c9036646b1145960c3a71e598802b102a1f9674f13517ab054144db12622d68b7613abef292885f99a8d0efddf17c798f60e557d58e304693d99d0354699cd87352e4dfa6f44f871d28bf0b715116819b73db1d5614a20c2fc7ddc490d8feecd379fce20fb8445be404c3affa1005dd0dda478bddd371f7e11ddb1fc32b509c31bc930729014d02311d7f355d6a88923840b22d2f368e1018f5111a3c1246f7a0e3096fe77782dcd5ba2fa5ae0a9b9a448b7c139e149b46642b4c52c34189c85f50fc952505086df405765a7fa62f03c6274401186c507474e7de61640fac68fe3cc1f84e4039d53d5bf775a474cf23ad8528f5c44e44cf13cfd5c474c5185ca1273ffcdd392c83f7cbc5ed292f9d5f1b0cfcdc678dc8cf1bcae561ca13f381934cb5e1f1059db044ae6f9b32b727b380ee2673fa7244cc36f0399d361c9b933cce3847c4008bc39da51bc8bdd76177e061c76a3290eebf56c889bc4f27684949be0926f56f728486ae3fa4694d10a5c5421aa70ecaaf4ef6ad3a95544daa20c22a8396a06c822c6a223b17ba4d85d5f6fa9f837cab039187bffd8838e88b0e9b2cd87ce94b7bbebeb31b11e9183fe07914758decda9a12694fedfaffa72b9d8f90c85b9d4af2460c64334a1a45d5b871e281dc4f60a26b68bb698df1b49fcd6d93f42350f1b60897bcd5a7e61cb8a1151e78bdd049e46d64c16a0e2ae7f6462f837aab0399c5de7a4c9328e9d6f8b14683227fc4f1f0f1b71f912f18cdf4a4e4b54014391676dc5698572e8834bab4e9db5d867d51b279648bd42effb06e293cd0c6ceaaaa311150a8afccca9595a83cd54a669b5492a878bad3b39a8a47848850ceac927a911a8f8a4a44598b9ba90ae9a6d75108d27da8b6ec4750c1fa3edbb0b8c77d4eace2b34d4b784c3cfe5a3ddbb450c7dda12bf26cd3729c1eba0a8b6e6ac49a4d74e3b9ad379d1b16c354e94a4b5e59af9a2c6ce90e565fbe4a5b5fb848556f7fd5a5a8bc07e50b4eba0f759795147c85c5a3acff959788cae7135577ceedcf28ea9e526cef9ca274c9ac7c5671c878e730178f9933a7a3c3bcb3a8a3c3d4d96a7ca45c7a901b150bded34ba711f6889d802b1022a6a4f5fb5914e86d191eb4d2277b0cf43d099c65968e49fc68d6d1016974281bc4c423c1a5e889df7c9e3c6639ca1f984db4d39c66aad24a7b1ac9cb2b9d73be7f9837018f1bb7ff70ff5241d774bad9900dba26369210da5a2da81909b6749a483afd2c4bc3b13cc03d5d351411f00c244021f6f5a1a48868321ec8534da99416ba09e288e053b049479e4c7ee866553129a253089e7f96e85483eb278acef478df7245dfe2afde29bc7cf6498ad3235ddead9b609423bbc83f4de2e23ca27cfa74c279ade2497c0bb3dba6c7eac913dc16cc1f4f39db3048444294f8ef02c945078511dfe12dfc4ba0c57bd330b095b5f82b43909db700a12256c5188c4f6e53a4ca4d89ecd974129802dd613db442d2439f92af8f5fc57a731584801393c403793c72208f7f135efec74bc137fbfc595879d3971a79f3a2d3e9bcf8f5fdd948a0313b8409b2847bf48005245cafbd7b1004d395e54b04ef1e7982498ac046cc10bedc63f20e534078ff02b659b0ed3e78f1e2838be103948c416d01190648331059c2dcbe3327e4d51afaeb570b40a79647d2ebdefbd69cc4ea9fe20e31987e5d9da05167d0bfe863e7059ded8317c7165481889501a09dcf812e7ea6fd9b3af642f8d79de91e5caf7ff50e7e0d740a58d989f1a027fcea3fbf7801225058ac75d2269d74e707c344d0dcaeaf807785c0caebc79f5ffc85ecd38457e19b8370dbf6c38f2ffe421ca91c7b0e5f7df08329681027f7e6dcf821a8a92b742ed6c41282aa853fbe781e5156322a631da11222492b293531adab61a26b6b544e2a2997b3a6e6c1f943c38e02136a26833cfec45a9a5419a7c3ade15a57c59552ab4a4b966945d9f14845dec95492fcdc7ea8dae05bd7c1973b6425a5cb862d7f8cb696ea1c9afa4c0314493c40519b004571e01b62e0acf7554d12a5beaaabe258d195a922eada54d274b13786b7fdb1a18e27fb1bf7867471c7616f48953cea0df755e6becadc5799fb2a735f651ef58647bde1516f825037c7b089e90a9fed191248a865f81bdd431b84e59a04f55ead4085345d185bf86083a6655a084606f65e16fb6c090fdffe98c3eb6f7f089f11bc3ac80da6c3a3cc70cd8d6b6e5c73e39a1bd7dc7894191e65e619469939e4c1557870151e5c2527b88a4b0d9e83f02abe37be03c23f30e1f07b6013938eb17ff0eddb58cf89274bda5cd6ff9452e3598fff057266d8c9f7f917eb38fd5735a9af624edfce94be8e19fd764ce8f3cde72b9ace5775f2bf0866aac4cdbffdd8c6b77f8404eb8f58c6a7bfc4d3a914912cab5d6dd8a59a78ec2f5dec67558a4c0ae1412b317f272159e73ab226f0a42fe9ed526d8cd5ddc2375098e94ce6b82a4517cc59b7829bf4a33a496fc945babeffbcbdf236f8df5577a00f71359c49318da7d865afc954b048b7392309bccd26c630011571d00b70d246e90b1ac6a801e34768ccdff1b6868fe0dae2a85174cd062b12450f642d986c144485316452aeccf9e2bac077b988c6a3e269e93b2b14bd1188444b5516b0f51c70a3d2a1bc9c1509cb785cbae5eead5b706eade5da5aec41bc4188e5b8106f10556907df7281543a10b5c44e663c2a089708269622b34d22242653bf70aea028eb56257190ee4d09d3a798a02a6bf32059ed8364e5b89d669d4ec337490b670fa57c668ec814536a489c4d44dbb3a24097d4340927b65da1032ab1eb0536b8cd2f47f7c45fbde05080448cfb67107b4ea5dea8d400edcdecce09e3e981c8e832ff75288c1fd24f0a163b2330ebbfc177b04376fc227fc78e454f4f8040a3d88bbe151ad41f2057c5aeffff08f319c87173e2ef4aa813a43fcbaf3ac7c82ff04fd8868ec2d07901b644e4c1783d88dbea6fe403b32ed8c67b269112bf8451f7e28240e8259115611d3349fb7e8f37f7b47a26102041f40e91f4a424c6e718fbe700c20811a700d36537ff62502d74708661c6a237e798b8b1b39d2453fae5176f31f7bd645c3c5a8d5d72a8eef9419003c00f846e48cf621f99cb3cdf369a6c02da98b757a61fd601075d2d71d0f6c3f282e9ae6e28fe0b9e3f6022b036153c2697299b0a911a851176cc69c615f930bf9f3e0f8c57d3296c83fd7f423271836091f4253bb3fe9b3709528e41cb09c72f7769bf337d2feee0c57f024106bc23c91a8b8e2914f121e192f03f35fc4a6c18333e29610717c89d09e4af280467f850de5c522add36f20e389d0a35dff9921e99c15b5fd20460ec88859531c34a5e315692e956c7213a05f71e2db11f03f3b720ec25bc18fde33d8c215d5bfce78d7da1c56e6c2f6659fae60d3dcd0ac6163ad80dfff383829222e1d0fa4f64ea8a44222dc00c585f09eb458669fe96ae9586074d8824fa311ac718345bc81f910a5d6627221aaa227cd9f7a434d3f07000936d64ba53a14549d6893b59a533b495ff955b730a1b5388f421f518b63f1bdb9d3da19cc25ce79f4f922fe129699de8a43cfec723c4ffa87e90f98e4e6869b4d26d8d7afe69c098d26be5b3940a67166919b4e1b472bb6127b7723eb883408a5b0ca5b8f19425bd86543c2edc8cd9b22b9f176ef3cc7033ae60bda873ac57f380b42cb868a1fc28df88d7e6c478eb9f66b95929bfd58df756e320696b91d26ac74a630f1ed2043fab44ed113c21eb59259aae77b89480084874569d3e73cebeca9a566355afbec26c6365afbfb66f7375dfc09f3556f8bc185ff951bec8db780391b6a6b94786fd45f0fff1d5c9b7345297af1e472fe37401fe5b761310153a2647df00da5393ef376ab2509228a92b97662088dcc8fc2f8c7edc4fe27d3fb7c781ff9cff9a6ef419d0d84d2e7c136c55fccac34d4a547dba97fe5b4070902a58a547d14e433ce80f937ffa991d9ec12fea030e28396074d9d39dc374e6a8f0f42e7ba8473cc9912738e458eb6d984dc3dfaebceabca63b1af87eb95a8ce9f61d66f08b839627f7c8a16165569efd4f783e8fc3ac444765c7246e2d0d0f830c23839a1ed64db355fefbdcfb1b7192a4c6a2795034305efe8795ebd22afdf3ae0bf495f8d9fb4d7b673bc7415bfd242a78622ed09c86af498e5614780f1ab1c488b23c893019fa849e108b43830c0065e9338bacf2e4e4cc3bb3aefd50ae11934681fd96e9087db9b8aec881de4b826d1d66f220b1ff60289c9515b6a39cbdfeb5424608abf8d1018fe9f17eb40b9f6012a2c034ce68f4d92886a05fea0476a5cbf004911c3b6268607c1222c5a946027916a6f4a822cc4267d9f77e6882b04d74bd7d1f7ccb29c57a237f65c72512bec1411195fa3ece0fd6ccb2bf5831d6d420c6c28c89b3d8efa4a69cc51d0dd13576267e584622f8fc46f8954a996ac2610c56adebc0213d0874737bd3bd3defbeb9e9be39efde74cfbbb723f839ba61033caaf17cfdf3de0e069c5055f948072185d37121651f96e956b2bf35a72f93bdc5bf8420370e73736112a1412313fa6283843c0e1fa5309b1076ae91930e71095f574b429cb050580c06725c7d615ad7e6573c8f4e27a99e9a4ac3039cc5d44dcdf5850576ee68069218d7396964121bad027d655e4abe0b79d8ba77d49adb5f5649cdd09e704e881f3d8db8990ce419424634b230ad777ee8906427a0de20a015a5c9546ea1e44897ad041b17c436cb61f5c5701b4b616e06b2e265f028b8c72abaf0dac6f0006b61dd9eeaa6852613722de34f516c90466544c155eae6e469d1b5d72668d2f2d040978920f1dd6a3f69ec639b9ca706a8a9d1379b52e5d6064e24a2a53661c669ecfc65a72e3cbd4527d1a4c9c12e91e3519e11228e8eab934726531f2846ec89b31f4d93ac4bfe2fe6ecd97f2106ef69f5fe6f1f3e78ef9f45fb0f52f02e752a9df8f89ab4a0681346beb1cdf741804819d8ecf7a08f41e57e47fd876cdbc94fffd7218b8d29113727a75ca55a6312cdd64f10b078432aa5bfcb8685396f4e4e4c70f29c7ce99f41fb0f71daace063781a9d9d976d8e7d0ee1647350341d62dfc42b5b4398aba2295ef56f720ed228b94453b44925a8ac86d4d159d30a2f2e4a2b211534459dd3fc9c14168f35529b736e6c73c88a72736c73ecb2393c9a62a7c7bdd91aa2b3dfa678fb62d7ffbfacaa59f4f1b16b636626e79d05885b355c3ce815a0a567b1dba494d409ef1609e471f9e9d159e871b8864995b245ac996c268f35ea9b52af6c7302f253b43cdaa8516fb1dd8c5b5eca97c71bb93835cc36c7ae2c85cc16eb49a59a79acf9c9bbdb2cd27683dbae6493679534c5046842159c95e88109a858d19b956a7909a0dceecfeae870097411cdcd366b68a5a3b541ffaade877ada557967aae84ee5bd2ad78c12b0acea332bd37b1250398acdac54ab49121ea3b6cc4a7596643723a56456aa91948f6e89be513aa86da8a3254134a1818275be14a67415afdedb3a6b7479c737afc035fa93595f9bf668d3ea59a74ff96b6379afaaae7ca5584ad6b5eae3b269d5e2a755b54fab02db09fa33b0976033250786ac1bce2e0d7b45c25e65ce5417a6e55fc7d63dfcccb7ea8bd0b117577551c7f67c11ba0ff9ee5395bae8cbca778ebdf0cf7ab7d3d334d6ed74388d753bfda6f76edbee3645baed5e53a4799dcebf770a6e97120e5be90c7287a1d3559cbf820ab9bc0babf2aba8e45712d038bae058a13971b9cac6fe766b25eef3e543a8096d4ea7977c03e351d0b3a3e8128b445b891fd8a4062b27b6ed0f931a24de25c2e204e64224b84be2f951f3f605a3e60f1a1dffe2e9c9dcaa25129eb058f7341960e540e4557201564696930a90c2e6bdc353b9af4e00c140443d5de949928e94c944ef4ba2aa0c7a78a04e274d520256465e901690c227629d6fca0c58a3c6e2ec807e557b96219034ba7596c0f420ef47a6c07dcb104847f91976e9792405f469f0392606f45bc69303564d0e48c7eb1926088ce69127096c9824f09027a0db5102bae791e3ec3027bdd761413eabc3679eac299995292fd75294a9e9d28eada02b25604a642b4a24412a4ec454903c6a53e2a5e25c486c2227fc93a8b1a9962eede8219133698eee3d1b441ea6e1e8f539fa6ceaf2a48f7b5852f4697fa8ea0a1e8ef5b13c1debbdc14453144595061ade69eea40a59926c9b1ccfd21c49395dea3c7692a49c3adb264b2aca74519ca1a2383d85589c9b62634a8a3ad9276aa79ee019271a669c783ea9218ae37a97c5e32e0bc62d9645e2ae1080bb5eaced0681b6797c6d1e5ffbfb8eaffd60824e04ba87a52f56a0a6b8fb116f7be3b5c1618583787e2edee05cfc709be77e5499a37961f7f9f86fe5987bddfecfc8f98c49faaabdeec57a0e4c64cf6668af7b0142d25bedf74458e6c2d4b1b5ff7d989afbdf07f761affbb040c8313d3c5fa07da728a6277b4e574c4ff69cba4806c795bbef9415f462cfa92ae8c59e531491b9f3f53db62cbcdf6a086ca961d7a4efbb6a7b6f62073933931e09ef754f3c349f0359ad5c64eeb98a9b3971d86fd38fefd7cc23de9dd7b0f62012636371392a1eef3d3702f522a078abb711488980829dd5460835820837321b41fa499069851118244160d9db08a2452049ad7823e0300fb04a2325310fb24a5ba5982062256b33949c86aad4ca5e1aaa520b95c40c848bf666b8983ed84572335c4c24c9456933644c2bc9456033644c32d963de8dc0c3527baf26d65a8c40696eb44547bb393823709a236104507324a1406a8e2112502d514ccdd62808cb35479112685b41d4ae532979d71c1123fe5a2369d7254638b69bec4856b6a07d567436479392a4cd11a5046b73445939dbc63c7587a6a8dbb00f8de5fbae2c5209fdecaaae78e5d8558df132b3ab1a83356957d5850bd84eeb9b9abbad0f04eeaeea4baea34f50eb0ec736b942efaad67839df718d3b1cd95851d8259f845ac5ce441da382ecaacea4beb2ab5a93cacdae6acd6842874fe010b32d8f94e4ceb5b2634aa8de560648ee4e2b8325f7a395c1981d68651876cf590f686a36000a762b9581b23bc926a0759b9add2d56064dee0feb82d56d68720f586b2ad85d5f750a4bedf32a036677769541b37bb9caa0b9bbb71a6e683b70393be44e60dc09ecbb7402dba2035881c355d22f2cf201bb203959462b678a26f8bf812f485c6973ba26898a4cebee175f3391f21dc92af98c8518cf892b949f27a4d0578c0ebc5be0eb15ba8c6ef61d0bab3c9e934678f78bacbf5aaa9fb7b6dfb4d8932cc8d71297bc88c0a594235cb1ab5ac6050de82276a0d2f17482c5e144d395a984746580a6fa18cb631d4d91aa0cb0264d2563a71e68c41fe5554fec0f7c6a49d04615f7b4389443e8a096e87047f8810cf08f3b71534bd4dcd64bedfae6ea3f4f6e461f3ba7b737236d281c0ab7173df5ddd9e50fa7ddcb1f3bdd37c7a3d3f7a757ef99329deee9e5e8f4e2cdf929bc5911a9802ce1163b402a1e49432ddc84c6e5c268ed7a78214843c08c2d172f4818a5ee05009fde6c047ee740a7286ce7535d98a1d800466a00233780e93580511ac0f41bc00ceac2d04c33f561d4fa30121983d3f3f3b3ebd1d5d9db8f9df73723421d62a7dbef0d34a937e8ca43ed405607b22c4ba2d43d3fbd7c7ffbcb87cbb3db8f1d22fb80f2a44f9f22e23d3e39f970737cf25f1fc503f2fafae60cda03581d8cad2fe6e4bed315bbc797efcf4f7d0c06be832ff0f24094068ada9387b24ae6a5d70360d29cd3ebd1fb4e5791550d5e9c5c5dfee3f466747675f9b1133014a1fbdb5faea0e42de8332ecdf5255c606742d20a751814d0a50169d0f1cd314090013a4724cb9981057b2a582466148c0fc8ff3bd3aade48a6024d13a55405b6755758833c6854859cac822e31c294a612129097edc701c983d71d9d1c873591f0866b326749bc6a12ef3be29b2760d05f88cf4d57a52b69fedc27f1f4f3f058b094dc53449570c03cc15c8f3e9e20c7c3ae89acaefca97bfcdb19c8ca1f4e417a926675af6ede4205005a40904179226d69f501805c08f06174fcfef4e3e8e4ea9a486098390bfb19a85c925a6ddd059d79197a2a827240939b1d00ef1cdf9c1e43474d6b8e2c43782980c27d0f0ab8409e488038f240cabd7973f5db47553bd094ae343c10b5ee00267bd8ed4907ea3041ec6441fdf4a9c8d1f927f2cfab95b7107efaddb6f0ab9e2afc84e7f3a5fb0a385713859f3cfbcb9dab29af9820785d78bda2a9ba00cab249c046b7d8615a127bc53ed3a471c56ed3a4033ffb4536f84fe72e8c759caa61046afb55d3e60d4469c81dacf7dec19aab585cc5e22a1657b1b88ac555ac6da958bb50b236a959e58a564555ab95b2d550dd6aa170f1d8203c36c8bec706d98f58207e5e6598f107394a6d4bd26f07c1f8fdcc9f0e08ffe052ccef814d2ec9c6fee9b51fc97f4e72ada4437bf89f526a3c9367b43335e7611d34bb681cf39ddcbfd124a2e4b43c953a945c51a5645b41d6818d696ebfd794b647879586e48849204af3adfb6943692e779a2cb4e3e7097d47e729a25ea9b3fd91cd8fd23fa694a6e725e3a83fa4d250eccae2a0abd1dc3e6115349f4f7d6434b950140424cc2a541f4f2625417d1465090e5a0f5a3ab90145d6a08d6ad7ff3f33f2f6ca8b332ad54749532da571359d8503b99f464589aed580b1881a8e5ba293059d2bcc6a1d64bbc910c8ac26634588d21c342b649f0824e09359299344a5c3e615b14259972a127c84824cd46c0359c7f525e877b6917823c06002671b49341e034a8bb38d8498e9480572cb695651732aaea9d5647fdb75b5decabaadb5b584b52aaeaf878c8545b44ff1531fbd48bf49dafd7828e5d37ce49abf634ad389bd4ba4beed4d5698f04edd5b113b339e2186678829cc10d3d0e6a534514c439c245f0cb54f09fed6e45ebf2722459f2269a82b3d24eb48d2145d95fa58c1a22acb43b1524e98eae8a2682f14623acb49f752071993e08582ed20a54b3bfba0f27c2ff47d90adce3713aa93e8251881daa95df68a7ef3a298378d6c5e89b69b228fd202163538651696e183e615335c911721fdf9a43d0a43b9279820a7c9f5931ee5f69b273dda66e49ba40eb4f751bbf63d01551ec5ef7397e62054a888249618b33d8f98883dbf2fbefbcdbe939aaf68f0ec66b4744a0cd6087d45a54e8da85745cb5af51058699eaa110b2b4dc2356262c5aae9d3677c4bcf56bb40282d73cfe5ce66738c99d96d11fd263ddbadfa19cc3ecfaa97ef289da2c95dfadc57aa4c6a5c99b44976edaaaf69d6d8598c8a141fed3051a3cf744f9e9a3147e0d6f23aae9d08b248a856c6912746ab3b82e708ce3aad8f45254f5cc97d96b9cff2b34f5c99926f3c89e52327b1f485b3111e88a299aef5650d4f0c491f606dac2b8688f5e15814f5de5452a713692a8a7df539e7b0ccf4e8f1535866aae4192c79064b9ec19267b0e456eadc4a9d67b0e4192c79064b9ec19267b0e4192c7906cbfdee03cf60f99cb225f20c963c8325cf60c93358f20c963c8325cf60c933583e17833e9ec19267b0e4192c79064b9ec19267b0e4192c79064b9ec19267b0e4192c79064b9ec19267b0e4192c79064b9ec19267b0e4192c79064b9ec19267b0e4192c79064b9ec1927b83716fb0c7cd60c9bdbf2a787fad673a1ea3c1a08f647da8f4fabad29b4cf5617f38d51152913196a4a1aae13df2fe5aefdefb6bcdbdbfb8f717f7fee2de5fdcfb8b7b7f71ef2feefdc5bdbfb8f717f7fee2de5fdcfb8b7b7f71ef2feefdc5bdbfb8f717f7fee2de5fdcfb8b7b7f71ef2feefdc5bdbfb8f717f7fee2de5fdcfb8b7b7f71ef2feefdc5bdbfb8f717f7fee2de5fdcfb8b7b7f71ef2feefdc5bdbfb8f717f7fee2de5fdcfb8b7b7f71ef2feefdc5bdbfb8f717f7fee2de5f5bf2fe02693c96545953e4a9aef591a42b9a01bf2658d5658434a40e7bd200f79e9bd317a98eba5d316e5f9ebd2b6f2fcfe64e5edcc98b3b7971272feee4c59dbcf6cec9eb3b71ea0af4ba0bb42c71aaa23e57215dadd09c689459cdd24ddb65953a66fdfbbf56b6f737b20bf67f750e93ec7e95924de937dc096dbb4e68ecf612cf69fd425886f498146232915752783b422844ff4e927287b2b52398465d547a98899c9c0ba1b59b7cd0a4be21cb680820a2a12b6882f4617f0c183455360ca48c65916020dc1c1e6e1ebbae3d31693f3b02958a6746a013d7c11ad95ab380b12e2da486b9510db47597996a407ac10a33a28b1b4cfe936c227cde657612fe8b03e67dd0da80cb134c43573fd8c4b184f62e99783eea6b3c90efb267d2fe3a3f4f7b4c3e5742ce4919dd308b7425a26e883b24ede2d6e61278e3da1832cfc940fd7c883d8c959220f56c8beb137c5eaf6b933d79932fd9b7e15dfc3c6db36bf992ecb96d7c522cee795f7228febb35fdcfb3f82db6f9a7945ac3e83fb35e5637fd2f903cdbb04eae636e976f18d9ced82f3526ad50e58dd1ce4c09b77d89bf03e3939d55969ee61dd69b43135bb79328b9022dbc58ae7bc99ae5933ac0059cf1b897b6595e3da61fc23df7ff88c19f97397f857ffeb743d5bfce09b21e90dbc9bb9b4d55b78b2be2c402e5bf0b963f3a288c2e267c310d42942f81cbef4dc3c0564a8e9522f029a5158a0ce9b4c596474b75710653960b2825b5e7d488f33b797e27ffd877f23edbf19bf9c7bd99078104ec854c77b502bef76589a62a5371204e75752c0d7565d057f4a131d674553406a8af4c0c0d2bcf38306b4e971efdae3ea74e7e6bcf6fed1fefd6fe2241700221384b400fa08323c19c2fe083072584993db385bf135e84451f99820b655dd3fdf6c7dcfbf6c7c284a7f5cc353d78000078a24517dffef8f687f3ed8fb53bb3ef3d4cfa06409f892e6a0a84d297a66501c2f5fcdb1f142b3464b982e5162a3fe0e604dc9c809b137073021e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce5316379cc581e3396c78ce53163b97fdab3f14f0b1609eea0f6b80e6ad66a81b1039365e944a1d165693896497c20d550445d5106923e9e887d7d2829229a8c07f254539e7500d954871edd352d551f774be36e693c982cf7fee2de5fdcfb8b0793fd5306935d989e8788dfef6c66f3a0b2fb1354b6892a5c1a91b3094212979386b40c0828f9a0f4656d2a2b035d199240ad9228eb088d155dc5a837c6fdc9008b834ab1386b638d0c4f59c0b4ae9d8dc2d9a01e26fe260bfdfcc3ccb2adad1f7533d9571e6f739b66b97bef53ca2e29fb1e6c3341e83ccc262d5dcdac3ab6874dd043bd189b4939f3f4d135db1a802687a25568cde4d0f0a09af937b93bb5e84accee0e236a2648e1c96369d6bf6ace70459d409a193ee021349f79084d9f405aa148524cdbf8994912e29133f9cde477143933c12afc8272a71794b026983a9eca7d752269fa40443d5de949928e94c944ef4ba2aa0c7a78a04e27fb7449493ab5eb8b4a5227bface49795fcb2925f56f2cb4a7e59c92f2bf96525bfacdcd7cbcaca6a719d0bcbca48f7f9d292eadefce2925f5c3ecf7b3f6206bdffd79708c8e37be807bf86fdaeaf611976ab7319cb50778dbbd87a77b8ca73bec365c7ad4d9015661cf985f0de5c0833b3bf3b6fff9854f855f42eafa253ac5ec32736c9dcfc269bdf64e75f43c7f4d50e114b70fc669cdf8cf39b717e33fe5ddd8cdbe60ca6f30199b395e7e1448ac9614f9c18fda9a86395781ae09eaa2349957443426369d89787d2103fe31493c53d7bf45bf2e2aaf96539bf2ce797e5fcb29c5f96f3cb729ed791e775e4791d795e479ed791e775e4791df7bb0f3cafe333b00fe0791d795ec7c7ea09cfebc8f33af2bc8e3caf23cfebb8cb9ef0bc8e3caf23cfebc8f33ae640f1bc8e79903caf23cfeb988b81e775e4791d795e479ed751e0791d775017cfebc8f33af2bc8e3caf23cfebc8f33af2bc8e3caf23cfebc8f33af2bc8e3caf23cfebc87dc4b88f18cfebb82fce612ec847d3f5560bd3d53f2312eac8b4412c118f26cb0a563151ed896363d8d3276862e8cab0dfd3d10061bdd7537a53b1a70c354d7ed67154abf4f2f15dc62a34823b8f71e731ee3cc69dc7b8f318771ee3ce63dc798c3b8fd5b1b50595cf59edb9bf0c3091e721a0b31539b4d8736b4822043d8c3df87bffbbe3ad6c9899cf6866df7b88c685fd0e3af55d99df7e3f56d1dfb321312ba96b9812a704630dabe21c3954c3bcb890ed6b581bd7b7b7549b5a79f6b76ea79998af56b65089f96b6309959dcf16c65e85f3fb3cecbeb6668cb67706642ce1edf09e9aa5d2ddc5efcc90f4ceec018ae8ff599b063c8d25c4733548488be83a579c69a15ce38233570c57bf992d13bc3bbaa46d713bbc93fbddef38522cbf4de6b7c93bbd4d0e0424bf517edc1b651768e001c699061815c5c1581e1b86ae4c9509fca54a3a1a62ac0ffa68ac881355c61a7ac60146d9be3cfafd305b19bf07e6f7c08f770f3c323f836a62999610d01c3440400fa0b122c19c2f10d027429640198f9471bffd31f7befdb130a1d8dfc9cbc5b73fbefde17cfb63ed12e50d930e40b114521738ca14ecfbcf984c930b2f0e8463172f10c50b420b2a30673353a038b027d80fc88bd0cc69133edb33dbc767a2243a131d08ff3507cd2fc2c6f485b0901574052f886e29509d698910bef76cd2bf037e19ce2fc3f96538bf0ce797e1fc329c4752e591547924551e49954752e591547924551e49954752e591547924551e49954752e59154b929273780e491547924551e49954752e591547924551e49954752e591547924551e49954752e591547924551e49954752e591547924551e49954752e591547924551e49752f23a9724f3bee69c73ded9e63dcd602afb6a4f35de46877019c6b8e56ce144df07f037b988be5dc9caedf3ae88b69ddfde2ab4352beb75e25c7bc10e339713ba3a88a1df2e8f8bb050e75a1d0d8eca01756793c278df0ee1759a7c0543f6f6dbf69b1bbdeb53d5fdfd9565cf222029752de86c5fe80ac9f9f8796e8de5bc1d2ecfbd1cc3c5357a6534354c6431d2b9aa42b3d09e9c3be8475d9184a9231181b48e9efccddcf23fe7ec40de6554fec0f7c7a495047ed30b2395dee083ff81e4b9ef9e3633b08e654dfd64ff0fae6ea3f4f6e461f3ba7b737236d281c0ab7173df5ddd9e50fa7ddcb1f3bdd37c7a3d3f7a757ef99329deee9e5e8f4e2cdf929bc591121812ce1163b4032b0b6a0b970135ab60ba3b5ebe185200d0133b65cbc8031ed742f00f8f46623f03b073a45613b9feac20cc50630520318b9014caf018cd200a6df00665017462602ac3e8c5a1f462263707a7e7e763dba3a7bfbb1f3fe6644a843ec74fbbd8126f5065d79a81dc8ea4096654994bae7a797ef6f7ff9707976fbb1436420509ef4e95344bcc727271f6e8e4ffeeba378405e5fdf9c417b00ab83b1f5c59cdc77ba62f7f8f2fdf9a98fc1c077f0055e1e88d240517bf25056c9bcf47a004c9a737a3d7adfe92ab2aac18b93abcb7f9cde8cceae2e3f76028622747ffbcb1594bc05f5c67dc08e8b850bec4c1059bf1814d0a50169d0f1cd314090013a4724c08681057b2a58b0b3245e4cb00edc9956f5463215689a28a52ab0adbbc21ae441a32ae4641574a91140ec426f05e465fb7130048aed8e4e8ec39a56a03eadc99c25f1aa49bcef8863a080419d210e3f5d95aea8f9739fc4d3cfc363c18a724f1155c201f304733dfa78821c0fbb26b2baf2a7eef16f67202b7f3805e9499ad5bdba790b150068014106e589b4a5d507007221c087d1f1fbd38fa393ab6b228161e62c8c89bb93e0ae9c07bcee820abd0cdd244149582ee1db01f0cef1cde93174d4b4e6c832849702e8dff7a08f0be4c99e4ee90329f7e6cdd56f1f55ed4053bad2f040d4ba0398ec61b7271da8c304b19365f5d3a72257f39fc83faf56de42f8e977dbc2af7aaaf0139ecf97ee2be05c4d147ef2ec2f77aea6bc12bbccff849fc8bcbbaf00cab275d889b9c52eeb92d82bf65a278d2b765c271df8d92fb2c1833d7761ace3d60e2350dbb39d366f204a43eee2bef7a1ceb98ac5552cae6271158bab585cc5da968ab50b256b939a55ae685554b55a295b0dd5ad160a170f4cc20393f0c0244f1198c421d4e800053cc8c1c93ff4e06e8e47ebc5d89e431f6ce014071683e0ceccef814deed0c6fea9b64b4bcef1039ea7e38cf89f526a3d7d17d43535e7611dba73efd7e0532bb99e9b2fef113d459f80e4d03d5bf75999de60a5641d701691b7e49245cf8bb29217cde4022d3be9121b239e847e93f077e7b018da2f15b7a4ac6c7e4d1332a654d4461e75502e8be7e8f02a4f801f561a125f5a094be4fa4634737b320bc87332a72f47e45603bfa3f31451afd4d9fec8f6befeccaca4619fc794d2f42fa6e1ddeb20ae74b2c0ea2ed1c8ea0fa9a4ca5d4956bb92d6ebcaaa1ad601230d6a6c6d6c6342f1514812b20810195a1f0fd35ba2ca60af3e8afcb1f3b1b51eb58b8b144282ac411bd5aeff7f66e4ed953707fad41bce806bcf634f9f1057d3593890fb695494ea5a0d188ba8e1b8253a59d0b97c19e06b344be1214b20b39a9c1521cab0d0ac907f2298805166a55c12950edb57c40b657daa48f1110a3253b30d741dd79720e0d946ea8d0083199c6da4d1780c2831ce365262a62315e82da75945cda9b8aa5693fe6d57d67a6bebb656d712deaab8c21e32b617d1ce85ea408903e4b4a674e4d81e4ab9581fb9e6ef98d2746237132970db8d36074bbd655c103b1bd0b5e307d6e866e5e0376ca9ccbbc4a6e86a8988190051ed13cf3cbc1dcff5c673bdf15c6f3c40088fdbb2edd8467b3e15915ddabecf856fc7bfd75d989b2eb158f46c72db3ddb6fca025d6fe5792b9e0b91e7426c970b91cad81ac1835222ad460ca14082d4081e9466d83ae1834206e1891e79a2472f49ec6d1a9224feb6a151da60c83047735411aff024983c09264f82f9a44eec5444edae8b0979b6db700f3bab2e2d2977556f28567952d3ef20a969a43ad4a82ca32cd4f49aaf0793a7105406665500ee4eceddc9b93bf9737727e7d95a1f375bab8767ae4723f0e8d3898ca783b1a48fc531d6955e7fa28fb18874752c0e45194b7d11cbcf2d576bd23d3beacba3e76a8dabe2995a79a6d61dbbb1c18ae825dec03b4a7f47872c19d2f7b673872cf37714cc71e23131c9b66b0665a29fecf707db9c502ea1ffb25fa6e82b71a183bf1324b040e69ccc3bfd97fde2d8b4cbf49f178963788fe762adc398df4b2ed6bcf9216ba87f51021054538735daa24a1ebdcd80cfbf874bde3afc11bdf91a2ec3ebd49120636e9f1e49ec98b691b9332a34652f3267f7bb99c5963569a7f74c8901e02e1fdce5e3515c3ebe93dcb305769bc9afd4762ea4ab159a93bd43760fe1a6ef8c4b0decfefd5f2bdbfb1bd1f6fc5f299192637999c4675a5e6cc01d360e2fc6d830b0f1cf601334b15756ca0e368d0550c436d60fc8a1547c094f6e0338ba5f4b1e4fa63ab2eb14bf87cfc75c913daac0735abf109621069aa4d0ab4ecdcd534708e5f4dfc9a94e28be3b8269d4c6a59b864e8fc1d633d79ccdece483d297b5a9ac0c7465281aba2289b28ed058d1558c7a63dc9f0cb038d00949c407bac7ae6b4f4ce49b1a53c97b465a55176b641394685bbc31135223dda80adabccb4c3d202261191bd11514e6ff49b6a4be8060f6a5fe8b03ff1fb6b5812849ead2445edfe0294b6befc283693dd9d77820df65e3f3facac43c6995725844e5dbb0c9dd98b0eb16949d5378f9bc2d8e2a24cdde8f8eb86ba078a095efa23369e22fefd34d40f851808b5a9dabe11b38b689eb69b0b0d36d51d8e0e3f9dcfe726c18ef7c4f830a7e951b705d7e383f6f8304ba13aabe135fc8b74046ef12deaca906d106cf4d706a5adfdb2c47b82f56f60c79deea7988f5a8870989fb365a9fea77b9f1529c6ac399d1aeee02b4971b3c8df311c73a502ed2eb585f6ad0e827d1a8c27ecc5b73d90814d677b6b3a889c37356091457b0ab2768deac3c2faf41458ed94f6a179b9719afd81cb65a2ecdd808365a1b6b98be66f4af6d585cd6c94495856e9bf12f1e8636269aa961d99971ddb6535a3cb299cc4ed3774533bb3bd3bd24196cdd18a82407406ef9fa394512dc50c35e284bffdcb2a4a1654962b1f1df450158605098ada6405dc75f755e022fdf9b0668b6d993fe62043e71b44211534b8046eef79be0c9d04f804e2139662ba10be629b73f52f2442035ccdc7ee791ed77fe4d78f91f2f05ffc2e66761e54d5f6ae4cd8b4ea7f3e2d7f76723819aea08136409f7e8010b48b85e7bf7c0cad395e5f3b4778f3cc12445e6736c085fee3179872920bc7f618372878d83172f3eb8183e40c918d4169061803c02a123cced3b73425eada1bf7eb500746a79c42ee6debf8721910929ee1083e9d7d5091a7506fd8b3e765ed0d93e78716c41158804df01b464a7eafe4cfb3775ec85f0af3bd33db85effea1dfc1ae88da05991637f4ff8d57f7ef1028498b058eba44d3ae9ce0f8689a0b95dff94af2b04cefa3ffefce22fe4dc577815be39088f817ff8f1c55fc8f5b163cfe1ab0f7e30050deee4de9c1b3f04357585cec5fadcb4303deef8f1c5f330aeca1c85b0122a2c946664b6245d182b954b2f541580983531afb4df37b61b8c89580665fc89b905c9a845256553da5a69c90275a41c2cab3611938e748752266f19d4c9cf9bfb5a583eb7bf25a537f5b91034afdff99ddc96595f27b0d27aca2431998c283c47cc5673c4a4ad3b8ebe42c75ef77a4371a01c28ca5093c82f75a828923a908f0ee9e7b8f49a3cf607c3a12c6a079226f57b3d4502907e5f1df68f0ed7c9d25fa1a704b7a200eea134d414b5a70efa6aafaf2943829bb54f02dcf04870ab5aff40e9897d8d00427145d1d401411e17cf5869d080aaf99d937b078073a06983214c9d24cb9a342ce89874200f7b03a53fd4faca40ecf744a997df29593910c59e280e15183959eec14814f487a01cc843511d4a1ae0d61451497725a7edbe15a8eb99fa12a65fd67bc6648a8c89a2e329eee98a2a4df5a1048fda7032d0fa06d2fa83fe4ecd40e3c43d017d56300c5daec67373426d42a39e75841f08a9fb0f8f9fac27ae9827e9e111e47904791e419e4790e711e479921e9ea4877b37f0243d5cc5e22a1657b1b88ac5552c9ea48727e9e1497ab8c716f7d8e2497a78921e9ea4675f92f48096d617bbea80a7e8e1297a788a9e06297a920cc413f4f0043d3c41cfbe25e87962977c26446435cffc1a2eee3caf10cf2bc4f30af1bc423caf10cf2bb4a7acb3e7796c4088ad89d9e01cdd7b36b56d266c83bf0fa6310ddd353dfb01d69a39fa6cee7b5f160859688e4c77b50289adef7d97224bd17d9f186a8afb5d740298dfc0fb4f546463fd3db006096ac6f372f1bc5cadf2725589f33060525c6c54096a64ea4aafc0355276152c78753277c50bcc662836604120d03703c919205f806e86ec251b4905d6662825dd351af590e725e379c9b613eda40af3b78a63921406ad50e50a87e6181959d1aa5981e8688f2390242d7be40b96d6c342e50ccfe9c673baf19c6e8d73baed5930a50a6bc10e231f25168e1dd69bb7caecaafa7849da6187fdf56bd715fa8bdd4e0796ae8c3b9e4ad3f2780ebfef21875fdd50691515eb3a21d132aa741de022e5b9328ea4ba5ca7ea5841ae0d15abc4f5da1929c175bb17aabd3cdadce3469b4b88b05631e3d232ad15b23c21d70a61b1d46bdbe994186cd7caa45c6c39842d1154919c2d5b9812a56db1e5cad656481961dbb67181f4dd0a9a401cb7ef9a2f9fb731445460d745c4a33bf2ecaccf373b6b62717cda686ea395334513cca3b93d5234b75494b0feb02fa2e154d20d6338d595a936d087583674a53724b1cfa643519b3e5194b08012b610258c0709e3112c78040b1ec18247b0e0112c7890301e248c0709e341c2b88ac5552cae6271158bab585cc5e241c27890301e248c0709e341c27890301e248c0709cb5421cbc3aea4c95d55e151c27894301e25ac7e94b03407f130613c4c180f13b66f61c20e79bc2d1e6f8bc7dbe2f1b678bc2d1e6f8bc7dbe2f1b678bc2d1e6f8b47aae291aafecc91aaeac7a29379c02d1e708b07dc6a1670ab46e82ca971e82cb951e8ac5ea5d0599b236e51f7051e718b47dce211b7da63e4c1b2ca2291c93ce4160fb9c5436ef1905b3ce4160f80f51d06c0da55f83499c7dce231b7be83985bdf51f0acf29862320fbad526e8d6210f4fc3c3d3ec2a3ccd1623d22443cfe4859289c2d15cdaef03339c8af16512a15812315e8ae3cc1444c8d91457a638d00b1ba706ff246a6c24994b3b7a48068421cbd67ae69ab399ad2b7d599bcaca405786a2a12b9228eb088d155dc5a837c6fdc9008b839d4684d91cff8556079d306c8f0481617ad379f4c82f4c656d43bf14f9ed17fbdb173bdb8bc59ef61b1decebf8d2d776a4e7fef37bef3f5fecfc58e6b458e6b12896b92b56f052ace790d8c01b913b21722744ee84f8fc9c109f6f62eb93abe3f3d3d1c9e90f429ce2daffd515fefaef73ef6f971fcecf5fff55f831ed3cc0d172b4f90e2435929e739f88063e11ecd1049ed3fa85b00ce93129f4aa537bb3d411c2a5f7efe41c275c913b826934c0a627cedad89fd1499aae2832d206ea501ff694b1aef414551f0e067d7dac0d26c39ed1c38aa1eae4a8333ed23e765d7b6222dfb3892eaa6746b0b16a823d94a60c82c4b64c488d7dabaa68732f53f51d30078b44731951a50928e431b6a844797d45226a30e14bcfa16a9f0936ef607d71c06c63fd1707cc7bda29ff39886c4afaf6639205a9fa7583a72cd9becb3da28dc7ff5dee15e461c801df0353d073621da9d214f545451f0ec7535d19283d5d43531168cb50d004ab68a01a8db8a23afaf66c51a7ae12be084ece9f8431ae6d7a15f7283c41fbc599a21a5390f8cf78a2203c980c80927a8aaea832c85adcc77a6f200f26fd614fee8f870d99a22afa6d3045f5ba4a99825e0b3d1153d020df8fc616d033ce1655d942eff56545110da40f486874a5278e7534c09aae68c3a926f69138e84f1b734525ecdb618a8a556de08927628920fefb7f3f224f709648b2c4022107addde48326f50d5946435d4604039a207dd81fabbaaca9b26120652c8bbdeacc50076b820942c02a6c50af9234f907d03b20fb6d5076d05aff4d6d7a8efafa9d52b4bbb25dd35bb9a927459aaafda1066ab3a8805c947b863e16277dd85d624d9a48b2280d6a08f85a6813441d4156a1ea9ad5a4c93a04df13ba0e9bdb90b0e3de7e7f943d87f1a680ccafb1a4ca9a224f75ad8f802634037ec14e10241fd2903aec49035c4d4ad743197b9d87501b28b92e7a868a23d0e74fc15153eb532fd3cbda944bdee49f69f2302f3ccc0b0ff3c2c3bcf0302fdf499817228c79908de7d29378d1fe1ea624dc147e0f7d89f6013ce4060fb9b1c3901b543ed70baa5127424522a406b365681048233a026a104f23de65f370153c5cc576c255f89cf30ce2352439ab7d8322466b8f2ae63b1ebd81476fe0d11bfe2cd11ba86cfcbee30624a4eeaebb1a8ae85dd71bc9731e45e04f184520d27876e1709fd16a6a57caea31b581139a0b77bf6fe87e9f386af0df4589b16050f26e6c049adde355e7252c5cf7a6011c9ad2354b31a5a5412b6479e2a115c26279d1b6d32901d2ae954989d272085b22f0654e80421a0c9a352221855a7688154b6d5125e5d456b0c582ab2eba403ee4024ac90bdd147bf3e01a3cb8c66307d788ddd37c9990724ae3b1371e39f6065da890f360ebc67028ca83e1589f48035557c481a68f7b13ac0f65244d87ea742a49f87947de88faf2f87137a2aa78d40d1e758347dde0513778d40d1e7563efa26ef0281beda26ca4232af0100a7b1142a19ece5b6e405f0f17319f4fd8dc3731c0df6c44dfc0492038234ab42dd6a7b386f40daa606ce99356facfdd9c9e6d6d7d8bfa228f84676154cfcd509fb6030e9e8118c68ef99d24474c10fb776bf358c5164faa698b171b386668a286796346de6cc330ee690daab2c3d1ca8029393c3bb35fe2961ec59565667887f60f0972d8baf9c3e35fc5e772479d6bf10c3ff05b711e949edf9b3df77b335f54f0ebb1c7bd1e7b80ed96699bde4ab7c79ff1cc3375ff3c9efc1a6275620cc4b12e89bdbeae4cb4893e4692a8cbc389224b863c9eaabb8b54ef35b9302be9dda3dfa095d4cdafd4f8951abf52e3576afc4a8d5fa9f140f6cfe38aed905f593dce95d5210f91c343e4f010393c44ce9f26440e0f3bf1fcc24ef070097f967009dc119f3be2ff591df1b953f35e3835f3cb467ed9c82f1b9fd365e316af190baef592b78fd14d63221303f085b958cecde9faad83be98d6dd2ffe8a21e55f5756ba990c319e938b368aaaf846920ebc5b70a3184a8bcd37946195c773d208ef7e91bd154df5f3d6f69b16df5706f95ae2921711b894ba6e2dbe104d5c74ae6cc77e00b1bcf26079424b74efad16481f2be3b1d297541df7e589ae4c2786ae29a2a11bca54d49032350c3cd9a94f60bb4c1de9fbcfdc4e77841f5cf333597ccc1f1ffd1634b7056d2f40af6faefef3e466f4b1737a7b33d286c2a1707bd153df9d5dfe70dabdfcb1d37d733c3a7d7f7af59e29d3e99e5e8e4e2fde9c9fc29b159112c8126eb103a4038b0b9a0b37e1b9a5305abb1e5e08d2103063cbc50b18d94ef702804f6f3602bf73a05314b6f3a92ecc506c00233580911bc0f41ac0280d60fa0d600675616422c8eac3a8f561243206a7e7e767d7a3abb3b71f3bef6f46843ac44eb7df1b68526fd09587da81ac0e64599644a97b7e7af9fef6970f9767b71f3b441602e5499f3e45c47b7c72f2e1e6f8e4bf3e8a07e4f5f5cd19b407b03a185b5fccc97da72b768f2fdf9f9ffa180c7c075fe0e581280d14b5270f6595cc4baf07c0a439a7d7a3f79dae22ab1abc38b9bafcc7e9cde8eceaf26327602842f7b7bf5c41c95bd06f5c62d480850bec4c1059c71814d0a50169d0f1cd314090013a47448f37b0604f050b792b724705ebc19d69556f245381a68952aa02dbba2bac411e34aa424e5641971c01842ff456405eb61f0743a0d8eee8e438ac097672de9acc5912af9ac4fb8e5cfb0a18f419729dd355e9ca9a3ff7493cfd3c3c162c2bf71451251c304f30d7a38f27c8f1b06b22ab2b7fea1eff7606b2f28753909ea459ddab9bb7500180161064509e485b5a7d002017027c181dbf3ffd383ab9ba26121866cec29866ef7457ce035e7741875e8697e0a02c2c97f0ed0078e7f8e6f4183a6a5a736419c24b0114f07b50c805f2644fa7f481947bf3e6eab78faa76a0295d6978206add014cf6b0db930ed46182d8c9e2fae953910dcd4fe49f572b6f21fcf4bb6de1573d55f809cfe74bf71570ae260a3f79f6973b57535e895de67fc24f64dedd570065d93a6cc5dc625b1c49ec159be390c6155be4900efcec17d9609a93bb30d6b1d78111a86db2439b3710a521b7ddd97bdb1dae6271158bab585cc5e22a1657b1b6a562ed42c9daa466952b5a1555ad56ca564375ab85c2c5cd4eb9d929373b7d0ab3538750a30314f020073700d083bb391ead17637b0e7db081531c44fc1b991ed8e4126dec9f6ebbb4e41c3fe079da8ad4ff9452ebe9bb28cee63cac4377eefd1a7c6a25f773ff7f7b4fdbdcb68df4f7e75768fca937756c100448a2a374c6719c5cda38f16339bd7b26d3c1802468337aa14e949cb8bffe59f09d1425f14571ab9eae3749446217bbc062b10b627727f307119da63ba039f832e0f1528e3e6155741dac2ca56fd557165e7787b649b29a46f759d36b9ef0e7c9f966e8b8554ec9b6b6f53d396a4c9d38ab4872ad0cdaade3594f7193dc31693224b1b61acc45187ff69f04ce38114f67123d1ca9af1bf24d344f99f46a27fb1f59fddb4f859d34e5d98e248d47795339a82bae36581e2a8bacfd90625d3bd534fdd4c4a798d2b40b1868b0625b23b395c0a738a23d40a9d0f6780acc2a4b462edba3a81fba185bef41bbbeae2054c83ad0484fe3ff17463e582d27209ebce30c84c124cf0291e2ea3a0b67d8a8a28a84aed7801511751cb712931b98ab5701b141331f3cae0bc8b8e5c2ca105557d078e3f2c940927532deba48b2d629799b96c236961a0a7c86424dd4788758e7fd95e477bc537833c06402c73b45341f834816c73b05718d9106e25643d626721aeea9cd747fdf7db5ddcebaafbd75cbd26ab8bf9e176e60647e4b6401958e8fab76d270112c45e5c6f730f4ff90914c977c99cc7c3ba8647dc9ddbdbde7ec03fb64e65eabdb41e020e43f8a5785560bf9aad86aed59c993fb3817ea0683f2474abf8f1157df3d49608f0b315b1306f6c0cbd35a00c99f16d60d1d09c23da1314e7481b9d02cc2a966482211c598a146e9029ba34bd7640cb1e9fecc5ab2c0361d14b2044660cf901eb0dfa5a2edb903a3e7f13f073f28e1fe479bdc81c908b44e1a78b8b23ddb2055333e115ffc466d34e2ba2e751dae13cde484ea9233e4c14fddf4a8cb1821b6d37c5deca1b3d2aad981aff4128648732d67d38ada0b69d5f5b61de95f2859671000e8b26eb96d67a17d06cf46e3f2174bec790c053e86021f43818fa1c07fe950e0ff9e3cbfb93574f073315e3d8a035fe559a93775776c7cd89235978bd572b93af09df1d0f35e373111ff0e2c1e134a1c134a3449285105345a6643370b1d9576ce9d905606996c543b21580651dd1776cb412e3fa91ede0da3b5cb238fd7ca75ef724577a2d4d7501e5382fcf7a604d97fcafeea9aed8e295dc3dd31acade9eea8b225de47207b962f68a400faf7704c28734c28734c28b32ba1ccdfa9084745673f57b789827faeeeaabbc173f59b6e1de77fbf52310d37a5e726e798f6e9c0d23eeda9204e8dedd918b6606d3686a9b32f1b03172dca1622d1bac84f53abb135ce6312af6312af6312afc3a91894ee5fc7c241dfb770d0d3742e16ea7a4ab45f8e43398baee43c8d39d22dd7c69ecb6d4fdd82b329867f3998631b5b26356dcbf3f4674da9d5206b567ad5e6e4ec642363dfbd62d0c69e8ff5828ef5828ef5828ef5828e81dbc7c0ed63e0f6b15ed0b15e50e3ab5ccab0138bc7e0a0efa6ac16877db7e68b587c91a04a0ffb4eddd3041651303ef0cb8da02497077eb951b9f95cce0e9f07cf3f7c1ec2c783e6612ac0e55ecac9541cba4415383970b92a7072e0d2157f6e3974c94ab83870a94ab8387089523a77f2f42067f0e8a0cd1070a9c16be2876eda3ef8722116633f3a183ec6521d43dcfe3b2247f61391907be72de21194c668118490fb9e2d620f7257af45b041e259b50831481d9996c1056a276e115f909ae92d020bca56718bf882b211da26baa06cf4b58931c88dac36a106b951d3269a203722764391d20ca49bf66eb85c3e8a9be46eb85c48ca9bd26e48b36bd08b66f508b5d1d8d630912ee1190585d2fd867834daddc10b0aa73b928202ea8e245548fdc224a285d51385e7f746a1965c77141585b61744fd98aae8bbbe01243dd92a68c3de48fab153d2953d64bfa83abba3a968d2bf40e4d23ec3a9dac4eafc25a26072fdfe5c97ad95fc3c575ff9cef15c3de6dbcc73f598ec49cf1960a254e3b3f6e7f9cfdb1f28dce7eaafbc8ffe09bd3ee3d89677e8e70d177aced1cdf7fe67eef11947b568553c9baa2b9820cfd567d95ef97b070f768a95dc77e8d9be42afca9e6be32895d4bc6d0c50f64e1b8395fdd1c660050fb4554054eacdb403f2fc0e4089b7d21868dd93ec02da96d4756fb165c8576b62cb1e615bb0b64456bdbee61256f1f31a03ae7b76cf11edd72fcc704b5cdcfea2d1ce8ff161c7f8b0bf657c58cf90b0ec76ff24cb651bdf6a8f6a7d241071c458cf5cd1e9b22e602b04fd46c11ae3a50fc09e8b88cdb82496c689ae09ce0c4d72ec324d734ddb15c4a8413501444114d0abc2a555bc11979e2311732c40094888293c6e4b6c73e1094a4c69699ee6d6601a078b314cd9a398f8dca096863483728a6c027808e296a7591ce9363c356c97dace661473204372ca1c83096472443c208348c26d4118b71d02f46980488a3a1c22f497b0393ee583443dc24c421cce3c6672222dca6d0beb5c384210d3231a705b8b290a331bafa6819802496a90b8c50ce222cbe08643744e1005ce6c4772dd4186659a16354d7b13ae71f0e04aae2e4df3793079c25c3a4448d33139633a0c13c58c33690032139bc0bc8e0d9b3544c6750313101dc14de6a9f947306130599c58ccb390010369788d70c19ec105d53c61200284d91e8800b06a090f71a6bb4438920a93ba0d9045255208c1c23229b0a6131b08239433d334600a4c07f0e992b87413ae6649f4d781938be93e2c10b0a2f351ba0f661c864978d272b8e361cc89a678c36ae161477708c604db5663946ab02cea226953182707869f68b0722c179633881cd34d01540ad110613460cc95b0de008b29184885cd34a08de9dc619e80c1629aa475047e9ccbd9081c14b9bc16736e08d395c4f038661a50a619808431874b864dcd110e486add0c2ec11df013e9349881841226d76580c2b3404e2576611698c934e43164793b50e8aee309d721a05324ac16902ace34f8693120c070856598465301b76c2ab0ed9a1c7b264895439546d274ee6a862b3d43d38551b7f260e146b9e5a5a3a6c9046b5ba3c083e9822611a0296139db3a42ae2ddc6de0185a1b9e527dc0143240aa91e24532e85fa79e6b33cb90b206c1af621efa9c7395fb201c8bc57229f8ddf5885b3ae86909f26c819c80225112a88322b14d6c83f5451815896427019fd9c632ac06970c5fc787f1a3b21573a9aa25dd8ae9bc12ff01fb5af62a6bacaaceadb7534fb326ef4138d79ba8a759936b30a2b318e942a3f879d62c29ec920688042b55f05b4533552bbedc8a991b4c236ad350173b0826273f2f172b393c2fbe4e37e99ab118bef6efc1d0fba3108f38bc780c7cf7dd6ca9ea2bc7a6aeaa4793f401abfa44193df58d321c60ae40d7f7be232657ca929cdd57e0d71b645456281abe5df9f9c445591b22b65e81e973034253448c2985195c6f53071fd5a9de85206b5487e156babbe0932619f44826159fa2b717aab4642d8a0ded36e0a91b0a5445b23616e5d79b876343bb0d78360d4a6dab74ceb3291ec6914f85d0a60988d8ab27d0db25214fc23b0baf53544504b0e89c45902ffbf9d3f24111e0d62cd6fc5d8aa9083cbc96225c2d7201bf4aa351ab980aa586b33619c6229214e554cef2b1bc5848a14207c32ada29863597becc9abf061d2c668eac07916a75aa055568542125ef7c7873f1be28e4aeaf3e6d864a87ddc8c5e5754523c5625e6d5483e026b62dea70e0b3129662cb9cc385f87a0b82a3723fd44940f17d09e8d30c3c1247ba9b80d2f719d08dfaa9c6232e08fe1b8c5d1e2018c93168e1fa4685a5a0424eaf258892bbb618f35779fb87e02bccd5c5641285fd8575c456db5481f301dc029d37aa82ab65e843db1a02e29da4b65daee8e5b7e51b707e4555f9e42fb2b6e990471aa02aada024a2228a91b228b54c453613d0e10db8f239091776184c564b59437bfa2a4391030e6f82303ae2c8824c7384ab650074fb4e1dc6f45d2e6c003e15934832c292da533b6ee15d01e21e946869d4b261b8fea4a0f2f719e5f5d40e6fa3ca7bd7ca199fc83a01283548804671e4fbadf446859c0d37594c7e98e43ca90aff5a8394ba1a84c37f5d8ee240d5328b5124ee79dee6d3a2c6b88a9fa78dde3440f4667457299df31a369ca5dc0ca3e2ce67a15c2cb736896f786ce9f9bcdab5a2a59ea93745a6ae47170e08059809d967912a88bade0c60352d0b485cf75fe3659a4ca74e00d61ae5c08071291c708afc3a724befd7803e2eeec5ccff43d4445197808bedd69080ae0fb783c72dd60161af965be1548375b064156d854cdae4c089dd0c6b28da4281a4ebe9ba81bea1618ee64d5ce1f1ddcc0b3e85f2223dc655eb7ca492facdeec30df3d700b2d88d5c93a4ec3c371cac66e359f07596e09505c07753712fff772526b9ff11ad7c86a2c6c5d739d0af79a69e9a4592a7ba58cff31321fdb59ae847e1bc16df2e961311266c87153554d32287053b00f6e5dbe48cb8769ecb4d72d04cb556a1ac08acaa79e1d16d102c55c1b4da6ed29779f391bc57a683ff872c4ce88ea5bb15a6887af1e83bf2224950534b50a5cd1af0a5988b2815962fc38dd4acb55c4373a7f2e76c23e02e4fb0a3c0d4bef46ae57999739c5a10a57779fb7add7a5dd6ad9fd4f9b82adef77a132b851619d8dde8edc2770bc704b7a3ad9b431cd6b1757328e38cfaf8652eef2b7bd5db45b09a6fedea7d21c35a7d8b6477ae6337795524aa4a4444d99f4ed51a45d749c2b5a268508450dc3c7d5b00b899fdf9635ba121a26b83d4dea5621b7d34291c5d15bfe5a875231737d5a3ad8d5594bbd4b8de5dd7ba4f2deb62e9e4383bdc16d6868f594ebe17eafb93ccec9db5172a97df0bf96d0ede8d745ff8a01aa3fb27ea69949d051edeabe9cf5fc5b4dd3d801337c027e5ac4b83087f9256b0ff39f420252cea384cbefaae6551cac88f53c3bc98a92f9cfb3b065f674e8b99135fc4ec412ec73ed73011aea1234e4c2a39d16ccc6d97785c125b97ba655a964dfa73d3b2bf5de4bbea9850884994c9584cc62b9020c125b208a604736ab81627ae63738b4a9b23a199a037248151ebcf4a8fbe77b1157d4a7b1a87fe781c706260cbc3c4e4842117060a612e844d389542b7a5e1981299456e50276eda77b98b89ec9216d76d210cdd465c3a1e863101c44c78941b86747549098309ef3f1f2dfbdb49fede4aeaf6666c5f94ec62792ac44c4c841fae56ae4c105b9478c8441ea7b6fac0681a04148f6d718a5c5318c4712db907b5d0b9e746b3d8b0d4f85ee6a9d517d98d7b4eab8f72bd09eff20970fb8877fac6bd9f09e8f3797d2353a1bf0c1e57ab30124c844c1bdbaeabee6da84b2954e38249c94d03742472289696e8cf4cfb2e7731f1189d53fbcb150fec2f52dd89c96fc730491dd74436d7906e70e2580e4cbd8638660ec19a8b6d8f9afd79ea4dc14e73c61f8be8828dae239bb92ee236b261d428ec03825083bb829a9ee16064d03dacf876ddb55d39cdafadec7de5b4be31b36b1bed7049685ffb66f7fb499bedb3a86646646bc0de8ab0c96cee807d07f84c8bdbea9a02c342f318f53c4d93fd5969dbe14e06ba5e90ebcf49cfab795b04addbbdb63d8859af0b751b190afcf8baa032f896b2641a311d39aee181814b09385052a76063c09ee06a026c2503338ded41e8fa12b08bc1ae572b7b33d6f34ee7765da7820fc453c8d304ffa63019f87eea96a0aeac114f809feb99a054a9c77453b704c17bd2759dbadeb9a586be18fb8b2f60d97aae34356972cf368cf88299255ccc3db0d46dcf744d4ddf83d4b5ecafc99c288b235c4a092b13464567e04650e62a1d03b2eb618d837d08b28bb0631a1ad6a9a1ef67423af4bb8b9d7e8524fab3d5b3ffa6d6c29a4a4d7d420be9c8d2c1b932042c5310077864d8dca6b0f949c62c6469fb331c7a51b153fbc585a2dc20412ac6dc32b0251d57e3a070c055015f8c331b21ae833fe6399a87c08cdc83f6ebd8f1798773d2161780bfcb4169fb0bc8bb44732260f0947272c116960e28278f2819301d0eae3256e714c24684b8ee3eecbe2e9d7671331a5eb5ff2e7e46bb6bfecd365f4b335c8c05e358a8034cb0bb40ebda94638b6217cc491b23bdff9969fb2e77ada1d6d7cbfbdbe31d2fb4efb61712f5e222aadc489d9b9aeb80ccc2b808072c2bc7d30c5d50f0c6c43ead8636bdee6265b69a4ab988cff741a5449ebef4b0411dcde22612baf25534f0f41d87c39e4e95996582c2eccf4ee79e9b1e2c36bcaebfb7a3c576e1018dd647a3d889bdae8f36d11a8df77d309da42d4cd0e09833a28ebe7407f01ab00285a0c2b5358d514bee7fdf6fda7123c51baed485299868a279d46096ce2d44c097c73a1884c83138534e94a36104fec89ef691767d36fa5c3551b7a48b8792ae4db0c026d7a3733d7582cc0c1373d3960c193ab67461efe9cb55a7ae5becf59eb49845d527219329671059b1372575db111ef8ec8ea9ef75836fd4612306e2230722b1304075782e8c024c3278e802532e2da10975962f5cb127fa9bf7b75ba8da066cee41983ac6886e3e880ac54449e76aea87fc4b645efbcaae562742b3599268015125a7eafa8170405c99a17301a635d775a27b4827ccb2f670ccb13f52767e2ce91190dcff3b49ff68e85d7e8c5435eba23c19fe041c0b43a7b6a65b1c64450d99945c506a718a3da123810c83a0bd79331dbaeef4e9a451406443a6d28b44cdbe9c34eab95a44aa8c3d425ece47b8a995564a3c584769d72f406d424a9b9ec08931370d87182e121cab885b22359002b044383819866d319bec6d2bead06f3373474e8230fa64ce5cc7d25d9d7b9a0a23466a84182858037c0cd8e0a469e07d2d9c767d363a7c4f8fbf138b103b86d4a5a6ceb51885f16136b7b167c306ee588480bd6beec50eedda73b703a81641eddfe908aa7d58fde6ef76720cee4884dc73b0f44c5b539f9c616dea86c36d09b24d6dc410969a8124de87fbd3aec3f69f48605d62587ea04d608313b609a656744503d48ca44e34662691e6f7f844d2b4eb86565ef3cc1efb32f25ae712697ad401e3c26c6c82974b5df5818f9830ed0e18c34c234838b6893d8becfd98a359af0d1dec65c06d8d628b600f6c0c017ea1e5c2bf1c493916c21294e99ab98f7b872dfb5bb729e2cbc9a58dbaf66df2fd5c59842a4f8258d65a0795f679b1ee268dd51289ce08967526450da1f9b8d47351f37a3b1b9b00eaf9d8d8ba9e91cdc40ecfd7ae95c7d7d4ebafa10fc1499f852adf938a1793dfe20c566991e3724de0ede5ad9b97b6de5cd63a2e695dac655d57c77a730d6b95306c59a8683d8c6aa70fcf4b25d4836208dff03c588be853bca45173c04329804e5ddb0f7c270afe8afece42fbc53755271bfecc046aaa020d61aea659c06194b62c6227faeb7fb2f46439d1a512dc51c9ea60f1f32f428cc7415cb83a8b20761632261a238c5f20ed85a6dd61ed278a7f2244557d96228f51a899cfe1c56c162c459efc4d058e04ab2497d6f055108ca762919092868cfce6cbaf5974dfa750268fa3b09542f5da61fce0bc9cb5e4b72807972a3f3df836f5672f4f74dd620c9fe91a258c118d1a26d30da6aa753c45efe137c3d83aa31ad3754c11d88314c3ff40bd7d9b0a55ba45670631cf306616a20634a19832d3301502f55e21a0163a430441530b9988584467ccca43253695cd5625c96f6e3ffe72793bfa7c7275773bb2d8e07c7077add337ef3efc7075fae11f27a7af2e46576faf3ebe2db43939bdfa30baba7ef5fe0a9eac542088980deee402569c32a72683dbb4eeed60f40406fd74a031c02c67a19caad0cbd36b00bebadd09fc66a102f514ecc9ef6d6118ea00a37580c11d60f40e30a4038cd101c66c0b8311421d60687b184d8dc1d5fbf7ef6e461fdfbdfe7cf2f676a4a4039d9c1aba6969ba790a6be40c53532d1fa49dbebffaf0f6ee9f9f3ebcbbfb7ca22c7d903cedf7df33e1bdb8bcfc747b71f97f9fd1997a7c73fb0ee801ac2a5bca57df79383945a7171fdebebf8a31b851883f3c3c439a49a88e19a66a5e741d8015392a8dc8c929c1d48207971f3ffc76753b7af7f1c3e793644129b9bffbe7476879a7f62375bd560eaee5c211aa927401855ac48aa08bdb0b805003f41ed6ef7205db65e00d662aa614c62758f8f7feac3991850e2c0b69950e82d9fdc61eb0d9a90b5cee220e0af484aa9b3d10cb753ece1848ece9e8f222ed6935838d5ccd59192f2de37da382fa0652844a619f9caa504384eae7be8cc7a8c3330b16cb870851231c304f30d7a3cf97601bc9d017b353fcfbe9c5bfdf81aefce10ab4a722ebf4e3ed6be80040370864d25e69dba8fb04006f04f834ba787bf57974f9f14669e028ad8932ccef07e16af1289f4e07cb601edc2fc4fcc1770653319fc3bb33583b17b75717c0a83f038bc41dbc18c0ae085bad1ca85f81e7453f54bb57af3efefb33b5ce2c72aab133649d9a30d9ec54d7ce282b09bb8e0c1881e1b9da48f26d456dc4e4e71fd55f2f57cbe9e0c73f82997ca9d3c18f723299872f61dd5a68f0e332f87a1f5ae4253a2dfc37f851cd7af812a0660107cb3e8c377652c01f2e42dffd59433a1a9ec7ff2ebe839f8a2cf5aaf446d915f0204af61337489e146b8884cec28fc31e6bb7435529246f52e6380ea5540988664fd39f81efcc22293c2e18c369a6a1f455210bd1dabb1cec5ea613eb4dc47d1ad15a799a99d0351b7f96532cb75462f3a9c6fa295a4577fe54665691a734f26d544705ec94a57ab594f3d20f954ee1e5c9c3c9c0594d571320e351dec9e93c80257f0bf6705e8125ede0b51faa84a495ec08afa450929d645e51de821d3fd9103a5b0caa5d0b80bd7c108bb5a05a374ef8c24309967ca48acf372150b1cc29b851810f9b81a10ccc5fc4a2c1bd88b796e0e012cd5c18065e8cd95d878de29e53e04858b22aa50fc1573e9facc286c02a974e0916acf455089aa3c9c0ed2043a548992866fe908b600b41f513b88d906214b3fa5512a792dcaf89dff0fc3ff73efcfdff504b030414000200080021b13a54eab87f1601010000002000002a0000007b37383630363664392d666435352d346132342d383534352d3534353735643637633365307d2e716764edd7b14a03411006e0dd78729568a158583895a72072c1359a2e6b381b0fa2e61aab65efd8c892f32ee43610edf4252c7c0fdf2936be8227466c044925c2ff31d3cc3ff300d3bf8cad333428c7b7dad1215b639cb30e1163ccabbbc1be2dcd675f38fb9dc70e7af72b1fcbabcbac2e00000000000080bff330e5fe6659f2c76da7d3dc0ccbf1d04caa91ad9c5147edacd5d6e1b10ac5402b218c50a9166d9566223361336db68c5ef8a0d1bd8a641251224fe3888285ef03daa540f62fce03b2853b21daa720d7a9c96d71a34665659d2d8b694067714f263f6577f36ceff3379fb1ba00000000000000e0bfdbe01ef77d4faebf749e77665d79fdf66a9fd8d63b504b01023f0314000200080040b13a548e78a3c41bae01006f0313002a0000000000000000000000b681000000007b37383630363664392d666435352d346132342d383534352d3534353735643637633365307d2e716773504b01023f0314000200080021b13a54eab87f1601010000002000002a0000000000000000000000b68163ae01007b37383630363664392d666435352d346132342d383534352d3534353735643637633365307d2e716764504b05060000000002000200b0000000acaf01000000
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: aikavali_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.aikavali_id_seq', 1, false);


--
-- Name: ajanhetki_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.ajanhetki_id_seq', 1, false);


--
-- Name: asiakirja_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.asiakirja_id_seq', 1, false);


--
-- Name: geometria_arvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.geometria_arvo_id_seq', 5, true);


--
-- Name: kaava_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaava_id_seq', 1, true);


--
-- Name: kaavakohde_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavakohde_id_seq', 195, true);


--
-- Name: kaavamaarays_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavamaarays_id_seq', 218, true);


--
-- Name: kaavan_kumoamistieto_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavan_kumoamistieto_id_seq', 1, false);


--
-- Name: kaavan_laatija_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavan_laatija_id_seq', 2, true);


--
-- Name: kaavaselostus_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavaselostus_id_seq', 1, false);


--
-- Name: kaavasuositus_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kaavasuositus_id_seq', 1, false);


--
-- Name: kasittelytapahtuma_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.kasittelytapahtuma_id_seq', 1, false);


--
-- Name: koodiarvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.koodiarvo_id_seq', 1, false);


--
-- Name: korkeuspiste_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.korkeuspiste_id_seq', 10, true);


--
-- Name: korkeusvali_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.korkeusvali_id_seq', 1, false);


--
-- Name: lahtotietoaineisto_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.lahtotietoaineisto_id_seq', 1, false);


--
-- Name: lisatieto_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.lisatieto_id_seq', 1, false);


--
-- Name: numeerinen_arvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.numeerinen_arvo_id_seq', 65, true);


--
-- Name: numeerinen_arvovali_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.numeerinen_arvovali_id_seq', 3, true);


--
-- Name: osallistumis_ja_arviointisuunnitelma_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.osallistumis_ja_arviointisuunnitelma_id_seq', 1, false);


--
-- Name: tekstiarvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.tekstiarvo_id_seq', 18, true);


--
-- Name: tietoyksikko_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.tietoyksikko_id_seq', 89, true);


--
-- Name: tunnusarvo_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.tunnusarvo_id_seq', 1, false);


--
-- Name: vuorovaikutustapahtuma_id_seq; Type: SEQUENCE SET; Schema: kaavatiedot; Owner: postgres
--

SELECT pg_catalog.setval('kaavatiedot.vuorovaikutustapahtuma_id_seq', 1, false);


--
-- Name: asiakirjan_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.asiakirjan_laji_id_seq', 22, true);


--
-- Name: digitaalinen_alkupera_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.digitaalinen_alkupera_id_seq', 4, true);


--
-- Name: kaavalaji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavalaji_id_seq', 16, true);


--
-- Name: kaavamaarays_laji_ak_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavamaarays_laji_ak_id_seq', 277, true);


--
-- Name: kaavamaarays_laji_yk_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavamaarays_laji_yk_id_seq', 243, true);


--
-- Name: kaavan_elinkaaritila_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavan_elinkaaritila_id_seq', 14, true);


--
-- Name: kaavan_kasittelytapahtuman_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavan_kasittelytapahtuman_laji_id_seq', 13, true);


--
-- Name: kaavan_vuorovaikutustapahtuman_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavan_vuorovaikutustapahtuman_laji_id_seq', 7, true);


--
-- Name: kaavoitusteema_ak_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavoitusteema_ak_id_seq', 11, true);


--
-- Name: kaavoitusteema_yk_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.kaavoitusteema_yk_id_seq', 1, true);


--
-- Name: lahtoaineiston_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.lahtoaineiston_laji_id_seq', 24, true);


--
-- Name: lisatiedon_laji_ak_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.lisatiedon_laji_ak_id_seq', 13, true);


--
-- Name: lisatiedon_laji_yk_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.lisatiedon_laji_yk_id_seq', 11, true);


--
-- Name: maanalaisuuden_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.maanalaisuuden_laji_id_seq', 2, true);


--
-- Name: oikeusvaikutteisuuden_laji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.oikeusvaikutteisuuden_laji_id_seq', 2, true);


--
-- Name: sitovuuslaji_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.sitovuuslaji_id_seq', 2, true);


--
-- Name: ymparistomuutoksenlaji_yk_id_seq; Type: SEQUENCE SET; Schema: koodistot; Owner: postgres
--

SELECT pg_catalog.setval('koodistot.ymparistomuutoksenlaji_yk_id_seq', 2, true);


--
-- Name: aikavali aikavali_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.aikavali
    ADD CONSTRAINT aikavali_pk PRIMARY KEY (id);


--
-- Name: ajanhetki ajanhetki_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.ajanhetki
    ADD CONSTRAINT ajanhetki_pk PRIMARY KEY (id);


--
-- Name: asiakirja asiakirja_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT asiakirja_pk PRIMARY KEY (id);


--
-- Name: geometria_arvo geometria_arvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.geometria_arvo
    ADD CONSTRAINT geometria_arvo_pk PRIMARY KEY (id);


--
-- Name: kaava kaava_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaava_pk PRIMARY KEY (id);


--
-- Name: kaava kaava_uq; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaava_uq UNIQUE (id_osallistumis_ja_arviointisuunnitelma);


--
-- Name: kaavakohde kaavakohde_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT kaavakohde_pk PRIMARY KEY (id);


--
-- Name: kaavamaarays kaavamaarays_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavamaarays_pk PRIMARY KEY (id);


--
-- Name: kaavan_kumoamistieto kaavan_kumoamistieto_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_kumoamistieto
    ADD CONSTRAINT kaavan_kumoamistieto_pk PRIMARY KEY (id);


--
-- Name: kaavan_laatija kaavan_laatija_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_laatija
    ADD CONSTRAINT kaavan_laatija_pk PRIMARY KEY (id);


--
-- Name: kaavaselostus kaavaselostus_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus
    ADD CONSTRAINT kaavaselostus_pk PRIMARY KEY (id);


--
-- Name: kaavaselostus kaavaselostus_uq; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus
    ADD CONSTRAINT kaavaselostus_uq UNIQUE (id_kaava);


--
-- Name: kaavasuositus kaavasuositus_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaavasuositus_pk PRIMARY KEY (id);


--
-- Name: kasittelytapahtuma kasittelytapahtuma_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma
    ADD CONSTRAINT kasittelytapahtuma_pk PRIMARY KEY (id);


--
-- Name: koodiarvo koodiarvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.koodiarvo
    ADD CONSTRAINT koodiarvo_pk PRIMARY KEY (id);


--
-- Name: korkeuspiste korkeuspiste_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.korkeuspiste
    ADD CONSTRAINT korkeuspiste_pk PRIMARY KEY (id);


--
-- Name: korkeusvali korkeusvali_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.korkeusvali
    ADD CONSTRAINT korkeusvali_pk PRIMARY KEY (id);


--
-- Name: lahtotietoaineisto lahtotietoaineisto_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lahtotietoaineisto
    ADD CONSTRAINT lahtotietoaineisto_pk PRIMARY KEY (id);


--
-- Name: lisatieto lisatieto_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lisatieto
    ADD CONSTRAINT lisatieto_pk PRIMARY KEY (id);


--
-- Name: numeerinen_arvo numeerinen_arvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.numeerinen_arvo
    ADD CONSTRAINT numeerinen_arvo_pk PRIMARY KEY (id);


--
-- Name: numeerinen_arvovali numeerinen_arvovali_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.numeerinen_arvovali
    ADD CONSTRAINT numeerinen_arvovali_pk PRIMARY KEY (id);


--
-- Name: osallistumis_ja_arviointisuunnitelma osallistumis_ja_arviointisuunnitelma_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.osallistumis_ja_arviointisuunnitelma
    ADD CONSTRAINT osallistumis_ja_arviointisuunnitelma_pk PRIMARY KEY (id);


--
-- Name: tekstiarvo tekstiarvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tekstiarvo
    ADD CONSTRAINT tekstiarvo_pk PRIMARY KEY (id);


--
-- Name: tietoyksikko tietoyksikko_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT tietoyksikko_pk PRIMARY KEY (id);


--
-- Name: tunnusarvo tunnusarvo_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tunnusarvo
    ADD CONSTRAINT tunnusarvo_pk PRIMARY KEY (id);


--
-- Name: vuorovaikutustapahtuma vuorovaikutustapahtuma_pk; Type: CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma
    ADD CONSTRAINT vuorovaikutustapahtuma_pk PRIMARY KEY (id);


--
-- Name: asiakirjan_laji abstrakti_koodilista_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.asiakirjan_laji
    ADD CONSTRAINT abstrakti_koodilista_pk PRIMARY KEY (id);


--
-- Name: digitaalinen_alkupera digitaalinen_alkupera_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.digitaalinen_alkupera
    ADD CONSTRAINT digitaalinen_alkupera_pk PRIMARY KEY (id);


--
-- Name: kaavalaji kaavalaji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavalaji
    ADD CONSTRAINT kaavalaji_pk PRIMARY KEY (id);


--
-- Name: kaavamaarays_laji_ak kaavamaarays_laji_ak_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavamaarays_laji_ak
    ADD CONSTRAINT kaavamaarays_laji_ak_pk PRIMARY KEY (id);


--
-- Name: kaavamaarays_laji_yk kaavamaarays_laji_yk_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavamaarays_laji_yk
    ADD CONSTRAINT kaavamaarays_laji_yk_pk PRIMARY KEY (id);


--
-- Name: kaavan_elinkaaritila kaavan_elinkaaritila_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavan_elinkaaritila
    ADD CONSTRAINT kaavan_elinkaaritila_pk PRIMARY KEY (id);


--
-- Name: kaavan_kasittelytapahtuman_laji kaavan_kasittelytapahtuman_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavan_kasittelytapahtuman_laji
    ADD CONSTRAINT kaavan_kasittelytapahtuman_laji_pk PRIMARY KEY (id);


--
-- Name: kaavan_vuorovaikutustapahtuman_laji kaavan_vuorovaikutustapahtuman_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavan_vuorovaikutustapahtuman_laji
    ADD CONSTRAINT kaavan_vuorovaikutustapahtuman_laji_pk PRIMARY KEY (id);


--
-- Name: kaavoitusteema_ak kaavoitusteema_ak_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavoitusteema_ak
    ADD CONSTRAINT kaavoitusteema_ak_pk PRIMARY KEY (id);


--
-- Name: kaavoitusteema_yk kaavoitusteema_yk_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.kaavoitusteema_yk
    ADD CONSTRAINT kaavoitusteema_yk_pk PRIMARY KEY (id);


--
-- Name: lahtoaineiston_laji lahtoaineiston_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.lahtoaineiston_laji
    ADD CONSTRAINT lahtoaineiston_laji_pk PRIMARY KEY (id);


--
-- Name: lisatiedon_laji_ak lisatiedon_laji_ak_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.lisatiedon_laji_ak
    ADD CONSTRAINT lisatiedon_laji_ak_pk PRIMARY KEY (id);


--
-- Name: lisatiedon_laji_yk lisatiedon_laji_yk_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.lisatiedon_laji_yk
    ADD CONSTRAINT lisatiedon_laji_yk_pk PRIMARY KEY (id);


--
-- Name: maanalaisuuden_laji maanalaisuuden_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.maanalaisuuden_laji
    ADD CONSTRAINT maanalaisuuden_laji_pk PRIMARY KEY (id);


--
-- Name: oikeusvaikutteisuuden_laji oikeusvaikutteisuuden_laji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.oikeusvaikutteisuuden_laji
    ADD CONSTRAINT oikeusvaikutteisuuden_laji_pk PRIMARY KEY (id);


--
-- Name: sitovuuslaji sitovuuslaji_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.sitovuuslaji
    ADD CONSTRAINT sitovuuslaji_pk PRIMARY KEY (id);


--
-- Name: ymparistomuutoksenlaji_yk ymparistomuutoksenlaji_yk_pk; Type: CONSTRAINT; Schema: koodistot; Owner: postgres
--

ALTER TABLE ONLY koodistot.ymparistomuutoksenlaji_yk
    ADD CONSTRAINT ymparistomuutoksenlaji_yk_pk PRIMARY KEY (id);


--
-- Name: qgis_projects qgis_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qgis_projects
    ADD CONSTRAINT qgis_projects_pkey PRIMARY KEY (name);


--
-- Name: asiakirja asiakirja_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT asiakirja_asiakirja FOREIGN KEY (id_asiakirja) REFERENCES kaavatiedot.asiakirja(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asiakirja asiakirjan_laji_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT asiakirjan_laji_asiakirja FOREIGN KEY (id_asiakirjan_laji) REFERENCES koodistot.asiakirjan_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: kaava digitaalinen_alkupera_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT digitaalinen_alkupera_kaava FOREIGN KEY (id_digitaalinen_alkupera) REFERENCES koodistot.digitaalinen_alkupera(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavan_laatija kaava_fk; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_laatija
    ADD CONSTRAINT kaava_fk FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaava kaava_fk; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaava_fk FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: lahtotietoaineisto kaava_fk; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lahtotietoaineisto
    ADD CONSTRAINT kaava_fk FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asiakirja kaava_fk; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kaava_fk FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavakohde kaava_kaavakohde; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT kaava_kaavakohde FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: kaavamaarays kaava_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaava_kaavamaarays FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavan_kumoamistieto kaava_kaavan_kumoamistieto; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavan_kumoamistieto
    ADD CONSTRAINT kaava_kaavan_kumoamistieto FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavaselostus kaava_kaavaselostus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavaselostus
    ADD CONSTRAINT kaava_kaavaselostus FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavasuositus kaava_kaavasuositus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaava_kaavasuositus FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kasittelytapahtuma kaava_kasittelytapahtuma; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma
    ADD CONSTRAINT kaava_kasittelytapahtuma FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: vuorovaikutustapahtuma kaava_vuorovaikutustapahtuma; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma
    ADD CONSTRAINT kaava_vuorovaikutustapahtuma FOREIGN KEY (id_kaava) REFERENCES kaavatiedot.kaava(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavakohde kaavakohde_kaavakohde; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT kaavakohde_kaavakohde FOREIGN KEY (id_kaavakohde) REFERENCES kaavatiedot.kaavakohde(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavamaarays kaavakohde_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavakohde_kaavamaarays FOREIGN KEY (id_kaavakohde) REFERENCES kaavatiedot.kaavakohde(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavasuositus kaavakohde_kaavasuositus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaavakohde_kaavasuositus FOREIGN KEY (id_kaavakohde) REFERENCES kaavatiedot.kaavakohde(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tietoyksikko kaavakohde_tietoyksikko; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT kaavakohde_tietoyksikko FOREIGN KEY (id_kaavakohde) REFERENCES kaavatiedot.kaavakohde(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaava kaavalaji_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaavalaji_kaava FOREIGN KEY (id_kaavalaji) REFERENCES koodistot.kaavalaji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asiakirja kaavamaarays_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kaavamaarays_asiakirja FOREIGN KEY (id_kaavamaarays) REFERENCES kaavatiedot.kaavamaarays(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavamaarays kaavamaarays_laji_ak_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavamaarays_laji_ak_kaavamaarays FOREIGN KEY (id_kaavamaarays_laji_ak) REFERENCES koodistot.kaavamaarays_laji_ak(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: lisatieto kaavamaarays_lisatieto; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lisatieto
    ADD CONSTRAINT kaavamaarays_lisatieto FOREIGN KEY (id_kaavamaarays) REFERENCES kaavatiedot.kaavamaarays(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tietoyksikko kaavamaarays_tietoyksikko; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT kaavamaarays_tietoyksikko FOREIGN KEY (id_kaavamaarays) REFERENCES kaavatiedot.kaavamaarays(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaava kaavan_elinkaaritila_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT kaavan_elinkaaritila_kaava FOREIGN KEY (id_kaavan_elinkaaritila) REFERENCES koodistot.kaavan_elinkaaritila(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavamaarays kaavan_elinkaaritila_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavan_elinkaaritila_kaavamaarays FOREIGN KEY (id_kaavan_elinkaaritila) REFERENCES koodistot.kaavan_elinkaaritila(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavasuositus kaavan_elinkaaritila_kaavasuositus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaavan_elinkaaritila_kaavasuositus FOREIGN KEY (id_kaavan_elinkaaritila) REFERENCES koodistot.kaavan_elinkaaritila(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kasittelytapahtuma kaavan_kasittelytapahtuman_laji_kasittelytapahtuma; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kasittelytapahtuma
    ADD CONSTRAINT kaavan_kasittelytapahtuman_laji_kasittelytapahtuma FOREIGN KEY (id_kaavan_kasittelytapahtuman_laji) REFERENCES koodistot.kaavan_kasittelytapahtuman_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: vuorovaikutustapahtuma kaavan_vuorovaikutustapahtuman_laji_vuorovaikutus_d41d8c; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.vuorovaikutustapahtuma
    ADD CONSTRAINT kaavan_vuorovaikutustapahtuman_laji_vuorovaikutus_d41d8c FOREIGN KEY (id_kaavan_vuorovaikutustapahtuman_laji) REFERENCES koodistot.kaavan_vuorovaikutustapahtuman_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asiakirja kaavaselostus_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kaavaselostus_asiakirja FOREIGN KEY (id_kaavaselostus) REFERENCES kaavatiedot.kaavaselostus(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asiakirja kaavasuositus_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kaavasuositus_asiakirja FOREIGN KEY (id_kaavasuositus) REFERENCES kaavatiedot.kaavasuositus(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tietoyksikko kaavasuositus_tietoyksikko; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT kaavasuositus_tietoyksikko FOREIGN KEY (id_kaavasuositus) REFERENCES kaavatiedot.kaavasuositus(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavamaarays kaavoitusteema_ak_kaavamaarays; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavamaarays
    ADD CONSTRAINT kaavoitusteema_ak_kaavamaarays FOREIGN KEY (id_kaavoitusteema_ak) REFERENCES koodistot.kaavoitusteema_ak(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavasuositus kaavoitusteema_ak_kaavasuositus; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavasuositus
    ADD CONSTRAINT kaavoitusteema_ak_kaavasuositus FOREIGN KEY (id_kaavoitusteema_ak) REFERENCES koodistot.kaavoitusteema_ak(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asiakirja kasittelytapahtuma_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT kasittelytapahtuma_asiakirja FOREIGN KEY (id_kasittelytapahtuma) REFERENCES kaavatiedot.kasittelytapahtuma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: lahtotietoaineisto lahtoaineiston_laji_lahtotietoaineisto; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lahtotietoaineisto
    ADD CONSTRAINT lahtoaineiston_laji_lahtotietoaineisto FOREIGN KEY (id_lahtoaineiston_laji) REFERENCES koodistot.lahtoaineiston_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: lisatieto lisatiedon_laji_ak_lisatieto; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.lisatieto
    ADD CONSTRAINT lisatiedon_laji_ak_lisatieto FOREIGN KEY (id_lisatiedon_laji_ak) REFERENCES koodistot.lisatiedon_laji_ak(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tietoyksikko lisatieto_tietoyksikko; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tietoyksikko
    ADD CONSTRAINT lisatieto_tietoyksikko FOREIGN KEY (id_lisatieto) REFERENCES kaavatiedot.lisatieto(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavakohde maanalaisuuden_laji_kaavakohde; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT maanalaisuuden_laji_kaavakohde FOREIGN KEY (id_maanalaisuuden_laji) REFERENCES koodistot.maanalaisuuden_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: korkeuspiste numeerinen_arvo_korkeuspiste; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.korkeuspiste
    ADD CONSTRAINT numeerinen_arvo_korkeuspiste FOREIGN KEY (id_numeerinen_arvo) REFERENCES kaavatiedot.numeerinen_arvo(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: korkeusvali numeerinen_arvovali_korkeusvali; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.korkeusvali
    ADD CONSTRAINT numeerinen_arvovali_korkeusvali FOREIGN KEY (id_numeerinen_arvovali) REFERENCES kaavatiedot.numeerinen_arvovali(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaava oikeusvaikutteisuuden_laji_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT oikeusvaikutteisuuden_laji_kaava FOREIGN KEY (id_oikeusvaikutteisuuden_laji) REFERENCES koodistot.oikeusvaikutteisuuden_laji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asiakirja osallistumis_ja_arviointisuunnitelma_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT osallistumis_ja_arviointisuunnitelma_asiakirja FOREIGN KEY (id_osallistumis_ja_arviointisuunnitelma) REFERENCES kaavatiedot.osallistumis_ja_arviointisuunnitelma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaava osallistumis_ja_arviointisuunnitelma_kaava; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaava
    ADD CONSTRAINT osallistumis_ja_arviointisuunnitelma_kaava FOREIGN KEY (id_osallistumis_ja_arviointisuunnitelma) REFERENCES kaavatiedot.osallistumis_ja_arviointisuunnitelma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: kaavakohde sitovuuslaji_kaavakohde; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.kaavakohde
    ADD CONSTRAINT sitovuuslaji_kaavakohde FOREIGN KEY (id_sitovuuslaji) REFERENCES koodistot.sitovuuslaji(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: aikavali tietoyksikko_aikavali; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.aikavali
    ADD CONSTRAINT tietoyksikko_aikavali FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ajanhetki tietoyksikko_ajanhetki; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.ajanhetki
    ADD CONSTRAINT tietoyksikko_ajanhetki FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geometria_arvo tietoyksikko_geometria_arvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.geometria_arvo
    ADD CONSTRAINT tietoyksikko_geometria_arvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: koodiarvo tietoyksikko_koodiarvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.koodiarvo
    ADD CONSTRAINT tietoyksikko_koodiarvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: numeerinen_arvo tietoyksikko_numeerinen_arvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.numeerinen_arvo
    ADD CONSTRAINT tietoyksikko_numeerinen_arvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: numeerinen_arvovali tietoyksikko_numeerinen_arvovali; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.numeerinen_arvovali
    ADD CONSTRAINT tietoyksikko_numeerinen_arvovali FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tekstiarvo tietoyksikko_tekstiarvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tekstiarvo
    ADD CONSTRAINT tietoyksikko_tekstiarvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tunnusarvo tietoyksikko_tunnusarvo; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.tunnusarvo
    ADD CONSTRAINT tietoyksikko_tunnusarvo FOREIGN KEY (id_tietoyksikko) REFERENCES kaavatiedot.tietoyksikko(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asiakirja vuorovaikutustapahtuma_asiakirja; Type: FK CONSTRAINT; Schema: kaavatiedot; Owner: postgres
--

ALTER TABLE ONLY kaavatiedot.asiakirja
    ADD CONSTRAINT vuorovaikutustapahtuma_asiakirja FOREIGN KEY (id_vuorovaikutustapahtuma) REFERENCES kaavatiedot.vuorovaikutustapahtuma(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

