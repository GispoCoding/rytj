-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3-alpha
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: Topi Tjukanov


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: kaavakanta | type: DATABASE --
-- -- DROP DATABASE IF EXISTS kaavakanta;
-- CREATE DATABASE kaavakanta;
-- -- ddl-end --
-- 

-- object: koodistot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS koodistot CASCADE;
CREATE SCHEMA koodistot;
-- ddl-end --

-- object: kaavatiedot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS kaavatiedot CASCADE;
CREATE SCHEMA kaavatiedot;
-- ddl-end --

SET search_path TO pg_catalog,public,koodistot,kaavatiedot;
-- ddl-end --

-- object: postgis | type: EXTENSION --
-- DROP EXTENSION IF EXISTS postgis CASCADE;
CREATE EXTENSION postgis
WITH SCHEMA public;
-- ddl-end --

-- object: koodistot.koodilista_abstrakti | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.koodilista_abstrakti CASCADE;
CREATE TABLE koodistot.koodilista_abstrakti (
	koodiarvo varchar,
	uri varchar,
	jarjestys smallint,
	ylaluokka varchar,
	status varchar,
	nimi_en varchar,
	nimi_fi varchar,
	nimi_sv varchar,
	maaritelma_en varchar,
	maaritelma_fi varchar,
	maaritelma_sv varchar,
	kuvaus_en varchar,
	kuvaus_fi varchar,
	kuvaus_sv varchar,
	nimilyhenne varchar,
	sanasto_uri varchar,
	hierarkiataso varchar,
	tallennusaika timestamp,
	viimeisin_muutos timestamp
);
-- ddl-end --













-- object: koodistot.kaavalaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kaavalaji CASCADE;
CREATE TABLE koodistot.kaavalaji (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT kaavalaji_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --
COMMENT ON TABLE koodistot.kaavalaji IS 'Kaavalajit (maakunta-, yleis- ja asemakaava)';
-- ddl-end --

INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/1', E'1', DEFAULT, E'DRAFT', E'Regional land use plan', E'Maakuntakaava', E'Landskapsplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/11', E'2', E'1.0', E'DRAFT', E'Regional land use plan', E'Kokonaismaakuntakaava', E'Helhetslandskapsplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Koko maakunnan aluetta tai sen osa-aluetta koskeva kaava.', E'Plan som berör hela landskapet eller dess delområde.', DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'12', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/12', E'3', E'1.0', E'DRAFT', E'Phased regional land use plan', E'Vaihemaakuntakaava', E'Etapplandskapsplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Koko maakuntaa tai sen osa-aluetta koskeva rajattuja teemoja käsittelevä maakuntakaava.', E'Landskapsplan som berör hela landskapet eller dess delområde och behandlar begränsade teman.', DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/2', E'4', DEFAULT, E'DRAFT', E'Local master plan', E'Yleiskaava', E'Generalplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'21', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/21', E'5', E'2.0', E'DRAFT', E'Local master plan', E'Yleiskaava', E'Generalplan', DEFAULT, E'yleiskaavan määritelmä', DEFAULT, DEFAULT, E'Koko kunnan aluetta koskeva yleiskaava.', DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/rak/concept-37', E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'22', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/22', E'6', E'2.0', E'DRAFT', E'Phased  local master plan', E'Vaiheyleiskaava', E'Etappgeneralplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Koko kuntaa tai kunnan osa-aluetta koskeva rajattuja teemoja käsittelevä yleiskaava.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'23', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/23', E'7', E'2.0', E'DRAFT', E'Partial local master plan', E'Osayleiskaava', E'Delgeneralplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kunnan osa-aluetta koskeva yleiskaava.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'24', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/24', E'8', E'2.0', E'DRAFT', E'Joint municipal master plan / Joint master plan', E'Kuntien yhteinen yleiskaava', E'Gemensam generalplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kahden tai useamman kunnan aluetta tai osa-aluetta koskeva yleiskaava (MRL 46 §) tai vaiheyleiskaava.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/3', E'9', DEFAULT, E'DRAFT', E'Local detailed plan', E'Asemakaava', E'Detaljplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'31', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/31', E'10', E'3.0', E'DRAFT', E'Local detailed plan', E'Asemakaava', E'Detaljplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'MRL 50 § mukaan laadittu yksityiskohtainen asemakaava tai asemakaavan muutos.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'32', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/32', E'11', E'3.0', E'DRAFT', E'Phased local detailed plan', E'Vaiheasemakaava', E'Etappdetaljplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'MRL 50 § mukaan laadittu rajattuja teemoja käsittelevä asemakaava tai asemakaavan muutos,', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'33', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/33', E'12', E'3.0', E'DRAFT', E'Detailed shore plan', E'Ranta-asemakaava', E'Stranddetaljplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Asemakaava, joka laaditaan pääasiassa loma-asutuksen järjestämiseksi', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'25', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/25', E'13', E'2.0', E'DRAFT', DEFAULT, E'Oikeusvaikutukseton yleiskaava', E'Generalplan utan rättsverkningar', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Koko kuntaa tai kunnan osa-aluetta koskeva yleiskaava, jolla ei ole maankäyttö- ja rakennuslaissa tarkoitettuja oikeusvaikutuksia (MRL 45§).', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'34', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/34', E'14', E'3.0', E'DRAFT', DEFAULT, E'Vaiheranta-asemakaava', E'Etappsranddetaljplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rajattuja teemoja käsittelevä asemakaava, joka laaditaan pääasiassa loma-asutuksen järjestämiseksi.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'35', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/35', E'15', E'3.0', E'DRAFT', DEFAULT, E'Maanalaisten tilojen asemakaava', E'Underjordisk detaljplan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --
INSERT INTO koodistot.kaavalaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'26', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavalaji/code/26', E'17', E'2.0', E'DRAFT', DEFAULT, E'Maanalainen yleiskaava', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 11:24:39', E'2020-12-11 11:24:39');
-- ddl-end --

-- object: koodistot.sitovuuslaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.sitovuuslaji CASCADE;
CREATE TABLE koodistot.sitovuuslaji (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT sitovuuslaji_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --
COMMENT ON TABLE koodistot.sitovuuslaji IS 'Sijainnin sitovuuden avulla ilmaistaan kaavan sisältämien Kaavamääräyskohteiden sijainnin sitovuus tai ohjeellisuus. Asemakaavassa kaikki kohteet ovat sijainniltaan joko sitovia tai ohjeellisia. Yleiskaavassa sitovuuden lajin ilmaiseminen on vapaaehtoista.';
-- ddl-end --

INSERT INTO koodistot.sitovuuslaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_Sitovuuslaji/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Sitova', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavamääräyskohteen sijainti on oikeudellisesti sitova.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 05:59:48', E'2020-12-11 05:59:48');
-- ddl-end --
INSERT INTO koodistot.sitovuuslaji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_Sitovuuslaji/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Ohjeellinen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavamääräyskohteen sijainti ei ole oikeudellisesti sitova.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 06:00:47', E'2020-12-11 06:00:47');
-- ddl-end --

-- object: koodistot.maanalaisuuden_laji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.maanalaisuuden_laji CASCADE;
CREATE TABLE koodistot.maanalaisuuden_laji (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT maanalaisuuden_laji_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --
COMMENT ON TABLE koodistot.maanalaisuuden_laji IS 'Maanalaisuuden lajin avulla ilmaistaan koko Kaavan tai sen sisältämien yksittäisten Kaavamääräyskohteiden sijainti maanpinnan ylä tai alapuolella.';
-- ddl-end --

INSERT INTO koodistot.maanalaisuuden_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_MaanalaisuudenLaji/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Maanalainen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'koskee pääosin maanpinnan alapuolista maankäyttöä ja rakentamista', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-18 11:06:21', E'2020-12-18 11:06:21');
-- ddl-end --
INSERT INTO koodistot.maanalaisuuden_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_MaanalaisuudenLaji/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Maanpäällinen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'koskee pääosin maanpinnan yläpuolista maankäyttöä ja rakentamista', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-18 11:07:10', E'2020-12-18 11:07:10');
-- ddl-end --

-- object: koodistot.digitaalinen_alkupera | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.digitaalinen_alkupera CASCADE;
CREATE TABLE koodistot.digitaalinen_alkupera (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT digitaalinen_alkupera_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --
COMMENT ON TABLE koodistot.digitaalinen_alkupera IS 'Digitaalisella alkuperällä tarkoitetaan kaava-aineiston digitoinnin tapaa.';
-- ddl-end --

INSERT INTO koodistot.digitaalinen_alkupera (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Tietomallin mukaan laadittu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavan kansallisen tietomallin mukaisesti tuotettu aineisto.', DEFAULT, E'1', E'2020-12-11 06:20:58', E'2020-12-11 06:22:41');
-- ddl-end --
INSERT INTO koodistot.digitaalinen_alkupera (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Kokonaan digitoitu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaava on jälkikäteen digitoitu tietomallin mukaiseksi. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.', DEFAULT, E'1', E'2020-12-11 06:20:58', E'2020-12-11 06:27:41');
-- ddl-end --
INSERT INTO koodistot.digitaalinen_alkupera (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/03', E'3', DEFAULT, E'DRAFT', DEFAULT, E'Osittain digitoitu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Osa kaavasta (esim. kaavan rajauksen lisäksi aluevaraukset) on jälkikäteen digitoitu tietomallin mukaiseksi. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 06:20:58', E'2020-12-11 06:29:44');
-- ddl-end --
INSERT INTO koodistot.digitaalinen_alkupera (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_DigitaalinenAlkupera/code/04', E'4', DEFAULT, E'DRAFT', DEFAULT, E'Kaavan rajaus digitoitu', DEFAULT, DEFAULT, E'Digitoitu kaavan rajaus, johon on liitetty muut tiedot linkitettyinä dokumentteina. Kaavan tulkinta on tehtävä alkuperäisistä kaava-asiakirjoista.', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 06:20:58', E'2020-12-11 06:32:27');
-- ddl-end --

-- object: koodistot.ymparistomuutoksenlaji_yk | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.ymparistomuutoksenlaji_yk CASCADE;
CREATE TABLE koodistot.ymparistomuutoksenlaji_yk (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT ymparistomuutoksenlaji_yk_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.ymparistomuutoksenlaji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_ymparistomuutoksenLaji_YK/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Olemassa oleva', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavakohde kuvaa kaavan laatimisen hetkellä olemassa olevaa kohdetta. Tällaisia voivat esimerkiksi olla olemassa olevat (jo rakennetut) rakennuspaikat, väylät tai muut kohteet.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 06:16:18', E'2020-12-17 06:16:18');
-- ddl-end --
INSERT INTO koodistot.ymparistomuutoksenlaji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_ymparistomuutoksenLaji_YK/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Uusi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavakohde on uusi eli sitä ei vielä ole   toteutettu. Koodiarvolla voidaan ilmaista esimerkiksi uusi rakennuspaikka, uusi väylä tai muu kaavakohde.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 06:17:41', E'2020-12-17 06:17:41');
-- ddl-end --

-- object: koodistot.kaavan_elinkaaritila | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kaavan_elinkaaritila CASCADE;
CREATE TABLE koodistot.kaavan_elinkaaritila (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT kaavan_elinkaaritila_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Kaavoitusaloite', DEFAULT, DEFAULT, E'Kuntaan saapunut kaavoitusaloite', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Vireilletullut', DEFAULT, DEFAULT, E'viranomainen on ottanut kaava-asian käsiteltäväksi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/jhs/J336', E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/03', E'3', DEFAULT, E'DRAFT', E'material used in preparation', E'Valmistelu', E'beredningsmaterial', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'kaavaprosessin vaihe, jossa laaditaan kaavan valmisteluaineisto. Valmisteluaineisto koostuu kaavaehdotuksen tai muun päätösehdotuksen laatimista varten laadituista ja kerätyistä aineistoista', DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/mrl/concept-203', E'1', E'2020-12-11 11:13:51', E'2021-01-13 19:35:58');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/04', E'4', DEFAULT, E'DRAFT', E'plan proposal', E'Kaavaehdotus', E'planförslag', DEFAULT, E'julkisesti nähtäville asetettava ehdotus kaavaksi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/mrl/concept-147', E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/05', E'5', DEFAULT, E'DRAFT', DEFAULT, E'Tarkistettu kaavaehdotus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/06', E'6', DEFAULT, E'DRAFT', DEFAULT, E'Hyväksytty kaava', DEFAULT, DEFAULT, E'Toimivaltainen viranomainen on hyväksynyt kaavaehdotuksen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/07', E'7', DEFAULT, E'DRAFT', DEFAULT, E'Oikaisukehotuksen alainen', DEFAULT, DEFAULT, E'Kaavasta on jätetty oikaisukehotus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/08', E'8', DEFAULT, E'DRAFT', DEFAULT, E'Valituksen alainen', DEFAULT, DEFAULT, E'Kaavasta on tehty valitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/luvat/c87', E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/09', E'9', DEFAULT, E'DRAFT', DEFAULT, E'Osittain voimassa', DEFAULT, DEFAULT, E'Kaava on kuulutettu osittain voimaan.', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/10', E'10', DEFAULT, E'DRAFT', DEFAULT, E'Voimassa', DEFAULT, DEFAULT, E'Kaava on saanut lainvoiman', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/11', E'11', DEFAULT, E'DRAFT', DEFAULT, E'Kumottu', DEFAULT, DEFAULT, E'Kaava on kumottu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'12', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/12', E'12', DEFAULT, E'DRAFT', DEFAULT, E'Kumoutunut', DEFAULT, DEFAULT, E'Kaava on kumoutunut kaavamuutoksen myötä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'13', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/13', E'13', DEFAULT, E'DRAFT', DEFAULT, E'Rauennut', DEFAULT, DEFAULT, E'Kaava on rauennut kaavoitusprosessin keskeyttämisen myötä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --
INSERT INTO koodistot.kaavan_elinkaaritila (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'14', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanElinkaaritila/code/14', E'14', DEFAULT, E'DRAFT', DEFAULT, E'Hylätty', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 11:13:51', E'2020-12-11 11:13:51');
-- ddl-end --

-- object: koodistot.kaavoitusteema_yk | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kaavoitusteema_yk CASCADE;
CREATE TABLE koodistot.kaavoitusteema_yk (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT kaavoitusteema_yk_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.kaavoitusteema_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_YK/code/01', E'1', DEFAULT, E'DRAFT', E'community structure', E'Yhdyskuntarakenne', E'samhällsstruktur', DEFAULT, E'kaupunkiseudun, kunnan tai kunnan osan keskeisten toimintojen sijoittuminen ja keskinäiset suhteet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/mrl/concept-176', E'1', E'2020-12-11 19:11:55', E'2020-12-11 19:11:55');
-- ddl-end --

-- object: koodistot.kaavoitusteema_ak | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kaavoitusteema_ak CASCADE;
CREATE TABLE koodistot.kaavoitusteema_ak (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT kaavoitusteema_ak_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/01', E'1', DEFAULT, E'DRAFT', E'permitted building volume', E'Rakennusoikeus', E'byggrätt', DEFAULT, E'Oikeus rakentaa määritellylle alueelle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/mrl/concept-162', E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Asuminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/03', E'3', DEFAULT, E'DRAFT', DEFAULT, E'Palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/04', E'4', DEFAULT, E'DRAFT', DEFAULT, E'Elinkeinot', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/05', E'5', DEFAULT, E'DRAFT', DEFAULT, E'Viheralueet ja virkistys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/06', E'6', DEFAULT, E'DRAFT', DEFAULT, E'Kadut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/07', E'7', DEFAULT, E'DRAFT', DEFAULT, E'Kunnallistekniikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/08', E'8', DEFAULT, E'DRAFT', DEFAULT, E'Liikenneverkko', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/09', E'9', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuuriympäristöt', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/10', E'10', DEFAULT, E'DRAFT', DEFAULT, E'Suojelu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --
INSERT INTO koodistot.kaavoitusteema_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_Kaavoitusteema_AK/code/11', E'11', DEFAULT, E'DRAFT', DEFAULT, E'Muu kaavoitusteema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 19:21:16', E'2020-12-11 19:21:16');
-- ddl-end --

-- object: koodistot.kaavamaarays_laji_yk | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kaavamaarays_laji_yk CASCADE;
CREATE TABLE koodistot.kaavamaarays_laji_yk (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT kaavamaarays_laji_yk_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Alueen käyttötarkoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0101', E'2', E'1.0', E'DRAFT', DEFAULT, E'Asuminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010101', E'3', E'101.0', E'DRAFT', DEFAULT, E'Asuinkerrostaloalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010102', E'4', E'101.0', E'DRAFT', DEFAULT, E'Asuinpientaloalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010103', E'5', E'101.0', E'DRAFT', DEFAULT, E'Rivitalojen ja muiden kytkettyjen asuinrakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010104', E'6', E'101.0', E'DRAFT', DEFAULT, E'Erillispientaloalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10105', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010105', E'7', E'101.0', E'DRAFT', DEFAULT, E'Asumista palveleva yhteiskäyttöinen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10106', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010106', E'8', E'101.0', E'DRAFT', DEFAULT, E'Maatilan talouskeskuksen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10107', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010107', E'9', E'101.0', E'DRAFT', DEFAULT, E'Kyläalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10108', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010108', E'10', E'101.0', E'DRAFT', DEFAULT, E'Erityisryhmien palveluasuminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10109', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010109', E'11', E'101.0', E'DRAFT', DEFAULT, E'Muu asuminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0102', E'12', E'1.0', E'DRAFT', DEFAULT, E'Keskustatoiminnot', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010201', E'13', E'102.0', E'DRAFT', DEFAULT, E'Keskustatoimintojen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010202', E'14', E'102.0', E'DRAFT', DEFAULT, E'Keskustatoimintojen alakeskus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010203', E'15', E'102.0', E'DRAFT', DEFAULT, E'Muut keskustatoiminnot', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0103', E'16', E'1.0', E'DRAFT', DEFAULT, E'Elinkeinot, työ ja tuotanto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10301', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010301', E'17', E'103.0', E'DRAFT', DEFAULT, E'Liikerakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10302', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010302', E'18', E'103.0', E'DRAFT', DEFAULT, E'Toimistorakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10303', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010303', E'19', E'103.0', E'DRAFT', DEFAULT, E'Toimitilarakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10304', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010304', E'20', E'103.0', E'DRAFT', DEFAULT, E'Kaupallisten palveluiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10305', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010305', E'21', E'103.0', E'DRAFT', DEFAULT, E'Vähittäiskaupan suuryksikkö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10306', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010306', E'22', E'103.0', E'DRAFT', DEFAULT, E'Vähittäiskaupan myymäläkeskittymä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10307', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010307', E'23', E'103.0', E'DRAFT', DEFAULT, E'Työpaikka-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10308', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010308', E'24', E'103.0', E'DRAFT', DEFAULT, E'Teollisuusalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10309', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010309', E'25', E'103.0', E'DRAFT', DEFAULT, E'Varastorakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10310', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010310', E'26', E'103.0', E'DRAFT', DEFAULT, E'Alue, jolle saa sijoittaa merkittävän, vaarallisia kemikaaleja valmistavan tai varastoivan laitoksen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10311', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010311', E'27', E'103.0', E'DRAFT', DEFAULT, E'Ympäristövaikutuksiltaan merkittävien teollisuustoimintojen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10312', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010312', E'28', E'103.0', E'DRAFT', DEFAULT, E'Kiertotalous', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10313', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010313', E'29', E'103.0', E'DRAFT', DEFAULT, E'Ympäristöhäiriötä aiheuttava tuotantotoiminta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10314', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010314', E'30', E'103.0', E'DRAFT', DEFAULT, E'Muu elinkeinotoiminta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0104', E'31', E'1.0', E'DRAFT', DEFAULT, E'Palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10401', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010401', E'32', E'104.0', E'DRAFT', DEFAULT, E'Palvelurakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10402', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010402', E'33', E'104.0', E'DRAFT', DEFAULT, E'Lähipalveluiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10403', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010403', E'34', E'104.0', E'DRAFT', DEFAULT, E'Huvi- ja viihdepalveluiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10404', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010404', E'35', E'104.0', E'DRAFT', DEFAULT, E'Julkiset palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10405', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010405', E'36', E'104.0', E'DRAFT', DEFAULT, E'Yleisten rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10406', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010406', E'37', E'104.0', E'DRAFT', DEFAULT, E'Julkisten lähipalveluiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10407', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010407', E'38', E'104.0', E'DRAFT', DEFAULT, E'Hallinto- ja virastorakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10408', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010408', E'39', E'104.0', E'DRAFT', DEFAULT, E'Opetustoimintaa palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10409', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010409', E'40', E'104.0', E'DRAFT', DEFAULT, E'Sosiaalitointa ja terveydenhuoltoa palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10410', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010410', E'41', E'104.0', E'DRAFT', DEFAULT, E'Kulttuuritoimintaa palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10411', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010411', E'42', E'104.0', E'DRAFT', DEFAULT, E'Museorakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10412', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010412', E'43', E'104.0', E'DRAFT', DEFAULT, E'Kirkkojen ja muiden seurakunnallisten rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10413', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010413', E'44', E'104.0', E'DRAFT', DEFAULT, E'Urheilutoimintaa palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10414', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010414', E'45', E'104.0', E'DRAFT', DEFAULT, E'Julkisten palveluiden ja hallinnon alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10415', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010415', E'46', E'104.0', E'DRAFT', DEFAULT, E'Muut palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'105', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0105', E'47', E'1.0', E'DRAFT', DEFAULT, E'Virkistys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10501', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010501', E'48', E'105.0', E'DRAFT', DEFAULT, E'Virkistysalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10502', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010502', E'49', E'105.0', E'DRAFT', DEFAULT, E'Puisto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10503', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010503', E'50', E'105.0', E'DRAFT', DEFAULT, E'Lähivirkistysalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10504', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010504', E'51', E'105.0', E'DRAFT', DEFAULT, E'Leikkipuisto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10505', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010505', E'52', E'105.0', E'DRAFT', DEFAULT, E'Urheilupalvelujen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10506', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010506', E'53', E'105.0', E'DRAFT', DEFAULT, E'Retkeily- ja ulkoilualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10507', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010507', E'54', E'105.0', E'DRAFT', DEFAULT, E'Uimaranta-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10508', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010508', E'55', E'105.0', E'DRAFT', DEFAULT, E'Lähimetsä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10509', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010509', E'56', E'105.0', E'DRAFT', DEFAULT, E'Muu virkistysalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'106', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0106', E'57', E'1.0', E'DRAFT', DEFAULT, E'Loma-asuminen ja matkailu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10601', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010601', E'58', E'106.0', E'DRAFT', DEFAULT, E'Loma-asuntojen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10602', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010602', E'59', E'106.0', E'DRAFT', DEFAULT, E'Matkailua palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10603', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010603', E'60', E'106.0', E'DRAFT', DEFAULT, E'Leirintäalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10604', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010604', E'61', E'106.0', E'DRAFT', DEFAULT, E'Asuntovaunualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10605', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010605', E'62', E'106.0', E'DRAFT', DEFAULT, E'Siirtolapuutarha-/palstaviljelyalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10606', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010606', E'63', E'106.0', E'DRAFT', DEFAULT, E'Muu loma-asumisen tai matkailun alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'107', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0107', E'64', E'1.0', E'DRAFT', DEFAULT, E'Liikenne', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10701', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010701', E'65', E'107.0', E'DRAFT', DEFAULT, E'Liikennealue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10702', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010702', E'66', E'107.0', E'DRAFT', DEFAULT, E'Yleisen tien alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10703', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010703', E'67', E'107.0', E'DRAFT', DEFAULT, E'Rautatieliikenteen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10704', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010704', E'68', E'107.0', E'DRAFT', DEFAULT, E'Lentoliikenteen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10705', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010705', E'69', E'107.0', E'DRAFT', DEFAULT, E'Satama-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10706', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010706', E'70', E'107.0', E'DRAFT', DEFAULT, E'Kanava-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10707', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010707', E'71', E'107.0', E'DRAFT', DEFAULT, E'Venesatama/venevalkama', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10708', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010708', E'72', E'107.0', E'DRAFT', DEFAULT, E'Yleinen pysäköintialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10709', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010709', E'73', E'107.0', E'DRAFT', DEFAULT, E'Huoltoasema-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10710', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010710', E'74', E'107.0', E'DRAFT', DEFAULT, E'Henkilöliikenteen terminaalialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10711', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010711', E'75', E'107.0', E'DRAFT', DEFAULT, E'Tavaraliikenteen terminaalialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10712', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010712', E'76', E'107.0', E'DRAFT', DEFAULT, E'Yleisten pysäköintilaitosten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10713', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010713', E'77', E'107.0', E'DRAFT', DEFAULT, E'Autopaikkojen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10714', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010714', E'78', E'107.0', E'DRAFT', DEFAULT, E'Katualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10715', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010715', E'79', E'107.0', E'DRAFT', DEFAULT, E'Muu liikennealue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'108', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0108', E'80', E'1.0', E'DRAFT', DEFAULT, E'Erityisalueet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10801', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010801', E'81', E'108.0', E'DRAFT', DEFAULT, E'Erityisalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10802', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010802', E'82', E'108.0', E'DRAFT', DEFAULT, E'Yhdyskuntateknisen huollon alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10803', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010803', E'83', E'108.0', E'DRAFT', DEFAULT, E'Energiahuollon alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10804', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010804', E'84', E'108.0', E'DRAFT', DEFAULT, E'Jätteenkäsittelyalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10805', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010805', E'85', E'108.0', E'DRAFT', DEFAULT, E'Maa-ainesten ottoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10806', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010806', E'86', E'108.0', E'DRAFT', DEFAULT, E'Kaivosalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10807', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010807', E'87', E'108.0', E'DRAFT', DEFAULT, E'Mastoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10808', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010808', E'88', E'108.0', E'DRAFT', DEFAULT, E'Ampumarata-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10809', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010809', E'89', E'108.0', E'DRAFT', DEFAULT, E'Puolustusvoimien alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10810', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010810', E'90', E'108.0', E'DRAFT', DEFAULT, E'Hautausmaa-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10811', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010811', E'91', E'108.0', E'DRAFT', DEFAULT, E'Suojaviheralue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10812', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010812', E'92', E'108.0', E'DRAFT', DEFAULT, E'Tuulivoimaloiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10813', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010813', E'93', E'108.0', E'DRAFT', DEFAULT, E'Moottorirata', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10814', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010814', E'94', E'108.0', E'DRAFT', DEFAULT, E'Maa-ainesten vastaanotto- tai läjitysalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10815', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010815', E'95', E'108.0', E'DRAFT', DEFAULT, E'Vankila-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:10', E'2020-12-17 09:18:10');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10816', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010816', E'96', E'108.0', E'DRAFT', DEFAULT, E'Muu erityisalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'109', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0109', E'97', E'1.0', E'DRAFT', DEFAULT, E'Suojelu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10901', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010901', E'98', E'109.0', E'DRAFT', DEFAULT, E'Suojelualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10902', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010902', E'99', E'109.0', E'DRAFT', DEFAULT, E'Luonnonsuojelualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10903', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010903', E'100', E'109.0', E'DRAFT', DEFAULT, E'Muinaismuistoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10904', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010904', E'101', E'109.0', E'DRAFT', DEFAULT, E'Rakennuslainsäädännön nojalla suojeltava alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10905', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010905', E'102', E'109.0', E'DRAFT', DEFAULT, E'Rakennussuojelulakien nojalla suojeltu alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10906', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/010906', E'103', E'109.0', E'DRAFT', DEFAULT, E'Muu suojelualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'110', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0110', E'104', E'1.0', E'DRAFT', DEFAULT, E'Maa- ja metsätalous', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11001', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011001', E'105', E'110.0', E'DRAFT', DEFAULT, E'Maa- ja metsätalousalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11002', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011002', E'106', E'110.0', E'DRAFT', DEFAULT, E'Maatalousalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11003', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011003', E'107', E'110.0', E'DRAFT', DEFAULT, E'Kotieläintalouden suuryksikön alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11004', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011004', E'108', E'110.0', E'DRAFT', DEFAULT, E'Puutarha- ja kasvihuonealue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11005', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011005', E'109', E'110.0', E'DRAFT', DEFAULT, E'Maisemallisesti arvokas peltoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11006', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011006', E'110', E'110.0', E'DRAFT', DEFAULT, E'Poronhoitovaltainen maa- ja metsätalousalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11007', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011007', E'111', E'110.0', E'DRAFT', DEFAULT, E'Muu maa- ja metsätalousalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'111', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0111', E'112', E'1.0', E'DRAFT', DEFAULT, E'Vesialueet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011101', E'113', E'111.0', E'DRAFT', DEFAULT, E'Vesialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/011102', E'114', E'111.0', E'DRAFT', DEFAULT, E'Muu vesialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/02', E'115', DEFAULT, E'DRAFT', DEFAULT, E'Rakentaminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0201', E'116', E'2.0', E'DRAFT', DEFAULT, E'Rakennusala', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0202', E'117', E'2.0', E'DRAFT', DEFAULT, E'Rakennuspaikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0203', E'118', E'2.0', E'DRAFT', DEFAULT, E'Asunnon rakennuspaikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'204', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0204', E'119', E'2.0', E'DRAFT', DEFAULT, E'Loma-asunnon rakennuspaikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'205', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0205', E'120', E'2.0', E'DRAFT', DEFAULT, E'Saunan rakennuspaikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'206', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0206', E'121', E'2.0', E'DRAFT', DEFAULT, E'Maatalouden talouskeskuksen rakennuspaikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'207', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0207', E'122', E'2.0', E'DRAFT', DEFAULT, E'Sallittu kokonaiskerrosala', DEFAULT, DEFAULT, E'kokonaiskerrosalan suhde korttelin pinta-alaan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'208', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0208', E'123', E'2.0', E'DRAFT', DEFAULT, E'Aluetehokkuus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'209', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0209', E'124', E'2.0', E'DRAFT', DEFAULT, E'Korttelitehokkuus', DEFAULT, DEFAULT, E'kokonaiskerrosalan suhde tontin/rakennuspaikan pinta-alaan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'210', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0210', E'125', E'2.0', E'DRAFT', DEFAULT, E'Tonttitehokkuus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'211', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0211', E'126', E'2.0', E'DRAFT', DEFAULT, E'Sallittujen rakennuspaikkojen lukumäärä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'212', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0212', E'127', E'2.0', E'DRAFT', DEFAULT, E'Rakennuspaikan vähimmäiskoko', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'213', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0213', E'128', E'2.0', E'DRAFT', DEFAULT, E'Sallittu tuulivoimaloiden määrä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'214', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0214', E'129', E'2.0', E'DRAFT', DEFAULT, E'Vähittäiskaupan suuryksikön sallittu kerrosala', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'215', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0215', E'130', E'2.0', E'DRAFT', DEFAULT, E'Vähittäiskaupan myymäläkeskittymän sallittu kerrosala', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/03', E'131', DEFAULT, E'DRAFT', DEFAULT, E'Liikenne', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'301', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0301', E'132', E'3.0', E'DRAFT', DEFAULT, E'Alueverkon pyöräilyreitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'302', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0302', E'133', E'3.0', E'DRAFT', DEFAULT, E'Eritasoliittymä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'303', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0303', E'134', E'3.0', E'DRAFT', DEFAULT, E'Eritasoristeys ilman liittymää', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'304', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0304', E'135', E'3.0', E'DRAFT', DEFAULT, E'Joukkoliikenteen runkoyhteys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'305', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0305', E'136', E'3.0', E'DRAFT', DEFAULT, E'Kaksiajoratainen päätie/-katu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'306', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0306', E'137', E'3.0', E'DRAFT', DEFAULT, E'Kevyen liikenteen reitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'307', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0307', E'138', E'3.0', E'DRAFT', DEFAULT, E'Laivaväylä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'308', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0308', E'139', E'3.0', E'DRAFT', DEFAULT, E'Liikennetunneli', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'309', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0309', E'140', E'3.0', E'DRAFT', DEFAULT, E'Liittymä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'310', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0310', E'141', E'3.0', E'DRAFT', DEFAULT, E'Linja-autoasema/julkisen liikenteen vaihtopaikka/matkakeskus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'311', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0311', E'142', E'3.0', E'DRAFT', DEFAULT, E'Metroasema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'312', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0312', E'143', E'3.0', E'DRAFT', DEFAULT, E'Metrolinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'313', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0313', E'144', E'3.0', E'DRAFT', DEFAULT, E'Moottori- tai moottoriliikennetie', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'314', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0314', E'145', E'3.0', E'DRAFT', DEFAULT, E'Moottorikelkkailureitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'315', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0315', E'146', E'3.0', E'DRAFT', DEFAULT, E'Pysäkki/seisake', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'316', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0316', E'147', E'3.0', E'DRAFT', DEFAULT, E'Pyöräilyn pää-/runkoreitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'317', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0317', E'148', E'3.0', E'DRAFT', DEFAULT, E'Päärata', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'318', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0318', E'149', E'3.0', E'DRAFT', DEFAULT, E'Raitiotie/Pikaraitiotie', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'319', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0319', E'150', E'3.0', E'DRAFT', DEFAULT, E'Ratsastusreitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'320', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0320', E'151', E'3.0', E'DRAFT', DEFAULT, E'Rautatieasema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'321', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0321', E'152', E'3.0', E'DRAFT', DEFAULT, E'Seututie/pääkatu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'322', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0322', E'153', E'3.0', E'DRAFT', DEFAULT, E'Seutuverkon pyöräilyreitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'323', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0323', E'154', E'3.0', E'DRAFT', DEFAULT, E'Suuntaisliittymä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'324', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0324', E'155', E'3.0', E'DRAFT', DEFAULT, E'Ulkoilu- tai virkistysreitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'325', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0325', E'156', E'3.0', E'DRAFT', DEFAULT, E'Valtatie/kantatie', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'326', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0326', E'157', E'3.0', E'DRAFT', DEFAULT, E'Varattu joukkoliikenteelle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'327', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0327', E'158', E'3.0', E'DRAFT', DEFAULT, E'Varikko', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'328', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0328', E'159', E'3.0', E'DRAFT', DEFAULT, E'Venesatama/venevalkama', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'329', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0329', E'160', E'3.0', E'DRAFT', DEFAULT, E'Veneväylä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'330', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0330', E'161', E'3.0', E'DRAFT', DEFAULT, E'Yhdysrata/sivurata/kaupunkirata', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'331', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0331', E'162', E'3.0', E'DRAFT', DEFAULT, E'Yhdystie/kokoojakatu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'334', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0334', E'163', E'3.0', E'DRAFT', DEFAULT, E'Liityntäpysäköinti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'335', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0335', E'164', E'3.0', E'DRAFT', DEFAULT, E'Muu liikenteeseen liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/04', E'165', DEFAULT, E'DRAFT', DEFAULT, E'Kehittämisperiaatteet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'401', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0401', E'166', E'4.0', E'DRAFT', DEFAULT, E'Yhdyskuntarakenteen laajenemissuunta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'402', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0402', E'167', E'4.0', E'DRAFT', DEFAULT, E'Yhdyskuntarakenteen mahdollinen laajenemisalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'403', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0403', E'168', E'4.0', E'DRAFT', DEFAULT, E'Alueen eheyttämis- tai tiivistämistarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'404', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0404', E'169', E'4.0', E'DRAFT', DEFAULT, E'Ohjeellinen tai vaihtoehtoinen tielinjaus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'405', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0405', E'170', E'4.0', E'DRAFT', DEFAULT, E'Tieliikenteen yhteystarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'406', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0406', E'171', E'4.0', E'DRAFT', DEFAULT, E'Joukkoliikenteen kehittämiskäytävä tai yhteystarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'407', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0407', E'172', E'4.0', E'DRAFT', DEFAULT, E'Kevyen liikenteen yhteystarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'408', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0408', E'173', E'4.0', E'DRAFT', DEFAULT, E'Johdon, putken tai linjan yhteystarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'409', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0409', E'174', E'4.0', E'DRAFT', DEFAULT, E'Viheryhteystarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'410', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0410', E'175', E'4.0', E'DRAFT', DEFAULT, E'Virkistyksen yhteystarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'411', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0411', E'176', E'4.0', E'DRAFT', DEFAULT, E'Julkisen virkistyksen kehittämistarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'412', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0412', E'177', E'4.0', E'DRAFT', DEFAULT, E'Kävely-ympäristön kehittämistarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'413', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0413', E'178', E'4.0', E'DRAFT', DEFAULT, E'Kaupunkikuvallinen kehittämistarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'414', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0414', E'179', E'4.0', E'DRAFT', DEFAULT, E'Meluntorjuntatarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'415', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0415', E'180', E'4.0', E'DRAFT', DEFAULT, E'Ympäristö- tai maisemavaurion korjaustarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'416', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0416', E'181', E'4.0', E'DRAFT', DEFAULT, E'Terveyshaitan poistamistarve', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'418', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0418', E'182', E'4.0', E'DRAFT', DEFAULT, E'Uusi tai olennaisesti muuttuva alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'419', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0419', E'183', E'4.0', E'DRAFT', DEFAULT, E'Pienin toimenpitein kehitettävä alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'421', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0421', E'184', E'4.0', E'DRAFT', DEFAULT, E'Muu kehittämisperiaate', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/05', E'185', DEFAULT, E'DRAFT', DEFAULT, E'Rajoitukset', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'501', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0501', E'186', E'5.0', E'DRAFT', DEFAULT, E'Rakentamisrajoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'502', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0502', E'187', E'5.0', E'DRAFT', DEFAULT, E'Määräaikainen rakentamisrajoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'503', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0503', E'188', E'5.0', E'DRAFT', DEFAULT, E'Toimenpiderajoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'504', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0504', E'189', E'5.0', E'DRAFT', DEFAULT, E'Rakennuksen purkamisrajoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/06', E'190', DEFAULT, E'DRAFT', DEFAULT, E'Alueen osan erityisominaisuudet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'601', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0601', E'191', E'6.0', E'DRAFT', DEFAULT, E'Erityisharkinta-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'602', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0602', E'192', E'6.0', E'DRAFT', DEFAULT, E'Kehittämisalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'603', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0603', E'193', E'6.0', E'DRAFT', DEFAULT, E'Vaara-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'604', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0604', E'194', E'6.0', E'DRAFT', DEFAULT, E'Suojavyöhyke', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'605', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0605', E'195', E'6.0', E'DRAFT', DEFAULT, E'Suunnittelutarvealue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'606', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0606', E'196', E'6.0', E'DRAFT', DEFAULT, E'Reservialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'607', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0607', E'197', E'6.0', E'DRAFT', DEFAULT, E'Muu alueen osan erityisominaisuus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/07', E'198', DEFAULT, E'DRAFT', DEFAULT, E'Ympäristöarvojen vaaliminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'701', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0701', E'199', E'7.0', E'DRAFT', DEFAULT, E'Kulttuurihistoriallisesti arvokas alue tai kohde', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070101', E'200', E'701.0', E'DRAFT', DEFAULT, E'Suojeltava alue tai alueen osa', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070102', E'201', E'701.0', E'DRAFT', DEFAULT, E'Suojeltava rakennus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070103', E'202', E'701.0', E'DRAFT', DEFAULT, E'Suojeltava rakennelma', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070104', E'203', E'701.0', E'DRAFT', DEFAULT, E'Kiinteä suojeltava kohde', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70105', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070105', E'204', E'701.0', E'DRAFT', DEFAULT, E'Kiinteä muinaisjäännös', DEFAULT, DEFAULT, E'Alue tai alueen osa, jolla sijaitsee muinaismuistolailla rauhoitettu kiinteä muinaisjäännös', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'702', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0702', E'205', E'7.0', E'DRAFT', DEFAULT, E'Luontoarvoiltaan arvokas alue tai kohde', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:11', E'2020-12-17 17:43:33');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070201', E'206', E'702.0', E'DRAFT', DEFAULT, E'Suojeltu puu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070202', E'207', E'702.0', E'DRAFT', DEFAULT, E'Säilytettävä puu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070203', E'208', E'702.0', E'DRAFT', DEFAULT, E'Suojeltava vesistö tai vesialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:11', E'2020-12-17 09:18:11');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70204', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070204', E'209', E'702.0', E'DRAFT', DEFAULT, E'Luonnon monimuotoisuuden kannalta tärkeä alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'70205', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/070205', E'210', E'702.0', E'DRAFT', DEFAULT, E'Ekologinen yhteys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'703', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0703', E'211', E'7.0', E'DRAFT', DEFAULT, E'Alue, jolla ympäristö säilytetään', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'704', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0704', E'212', E'7.0', E'DRAFT', DEFAULT, E'Alue, jolla on erityistä ulkoilun ohjaamistarvetta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/08', E'213', DEFAULT, E'DRAFT', DEFAULT, E'Yleismääräykset', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'801', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0801', E'214', E'8.0', E'DRAFT', DEFAULT, E'Yleismääräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'802', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0802', E'215', E'8.0', E'DRAFT', DEFAULT, E'Yleiskaavan käyttö rakennusluvan myöntämisen perusteena', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/09', E'216', DEFAULT, E'DRAFT', DEFAULT, E'Yhdyskuntatekninen huolto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'901', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0901', E'217', E'9.0', E'DRAFT', DEFAULT, E'Johto, putki tai linja', DEFAULT, DEFAULT, E'Yhdyskuntatekniikkaa palveleva johto, putki tai linja, joka voi sijaita maan päällä tai alla. Tällaisia ovat esimerkiksi sähkölinjat, vesijohdot, maakaasun runkoputket ja jätevesiviemärit.', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'902', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0902', E'218', E'9.0', E'DRAFT', DEFAULT, E'Sähkölinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'903', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0903', E'219', E'9.0', E'DRAFT', DEFAULT, E'Kaasulinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'904', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0904', E'220', E'9.0', E'DRAFT', DEFAULT, E'Vesi- tai jätevesitunneli', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'905', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0905', E'221', E'9.0', E'DRAFT', DEFAULT, E'Vesijohto tai siirtoviemäri', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'906', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0906', E'222', E'9.0', E'DRAFT', DEFAULT, E'Kaukolämpölinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'907', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0907', E'223', E'9.0', E'DRAFT', DEFAULT, E'Kaukokylmälinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'908', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0908', E'224', E'9.0', E'DRAFT', DEFAULT, E'Hulevesien hallinta-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'909', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0909', E'225', E'9.0', E'DRAFT', DEFAULT, E'Hulevesien hallinnan kannalta merkittävä alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'910', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0910', E'226', E'9.0', E'DRAFT', DEFAULT, E'Hulevesien purkuoja/-reitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'911', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0911', E'227', E'9.0', E'DRAFT', DEFAULT, E'Hulevesien viivytysalue', DEFAULT, DEFAULT, E'Hulevesien käsittelytapaa ohjaava määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'912', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0912', E'228', E'9.0', E'DRAFT', DEFAULT, E'Hulevesien käsittelytapa', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'913', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0913', E'229', E'9.0', E'DRAFT', DEFAULT, E'Pohjavedenottamo', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'914', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0914', E'230', E'9.0', E'DRAFT', DEFAULT, E'Pohjavedenottamon lähisuoja-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'915', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/0915', E'231', E'9.0', E'DRAFT', DEFAULT, E'Muu yhdyskuntatekniseen huoltoon liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/10', E'232', DEFAULT, E'DRAFT', DEFAULT, E'Ympäristön ja terveyden suojelu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1001', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1001', E'233', E'10.0', E'DRAFT', DEFAULT, E'Pilaantunut maa-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Alue, jolla on maaperän haitta-aineita', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1002', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1002', E'234', E'10.0', E'DRAFT', DEFAULT, E'Tulvavaara-alue', DEFAULT, DEFAULT, E'Alue, joka on tulvavaarassa', DEFAULT, DEFAULT, E'Tulvavaara voi liittyä meritulvaan tai hulevesien aiheuttamaan tulvimiseen', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1003', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1003', E'235', E'10.0', E'DRAFT', DEFAULT, E'Meritulvavaara-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1004', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1004', E'236', E'10.0', E'DRAFT', DEFAULT, E'Hulevesitulvavaara-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1005', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1005', E'237', E'10.0', E'DRAFT', DEFAULT, E'Valuma-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1006', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1006', E'238', E'4.0', E'DRAFT', DEFAULT, E'Virkistyskohde', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1007', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1007', E'239', E'10.0', E'DRAFT', DEFAULT, E'Melualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1008', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1008', E'240', E'10.0', E'DRAFT', DEFAULT, E'Pohjavesialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1009', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1009', E'241', E'10.0', E'DRAFT', DEFAULT, E'Pohjaveden muodostumisalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1010', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1010', E'242', E'10.0', E'DRAFT', DEFAULT, E'Arvokas harjualue tai muu geologinen muodostuma', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1011', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_YK/code/1011', E'243', E'10.0', E'DRAFT', DEFAULT, E'Muu ympäristönsuojeluun liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:18:12', E'2020-12-17 09:18:12');
-- ddl-end --

-- object: koodistot.kaavamaarays_laji_ak | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kaavamaarays_laji_ak CASCADE;
CREATE TABLE koodistot.kaavamaarays_laji_ak (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT kaavamaarays_laji_ak_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Alueen käyttötarkoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0101', E'2', E'1.0', E'DRAFT', DEFAULT, E'Asuminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010101', E'3', E'101.0', E'DRAFT', DEFAULT, E'Asuinkerrostaloalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010102', E'4', E'101.0', E'DRAFT', DEFAULT, E'Asuinpientaloalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010103', E'5', E'101.0', E'DRAFT', DEFAULT, E'Rivitalojen ja muiden kytkettyjen asuinrakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010104', E'6', E'101.0', E'DRAFT', DEFAULT, E'Erillispientaloalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10105', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010105', E'7', E'101.0', E'DRAFT', DEFAULT, E'Asumista palveleva yhteiskäyttöinen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10106', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010106', E'8', E'101.0', E'DRAFT', DEFAULT, E'Maatilan talouskeskuksen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10107', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010107', E'9', E'101.0', E'DRAFT', DEFAULT, E'Kyläalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10108', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010108', E'10', E'101.0', E'DRAFT', DEFAULT, E'Erityisryhmien palveluasuminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10109', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010109', E'11', E'101.0', E'DRAFT', DEFAULT, E'Muu asuminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0102', E'12', E'1.0', E'DRAFT', DEFAULT, E'Keskustatoiminnot', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010201', E'13', E'102.0', E'DRAFT', DEFAULT, E'Keskustatoimintojen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010202', E'14', E'102.0', E'DRAFT', DEFAULT, E'Keskustatoimintojen alakeskus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010203', E'15', E'102.0', E'DRAFT', DEFAULT, E'Muut keskustatoiminnot', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0103', E'16', E'1.0', E'DRAFT', DEFAULT, E'Liike- ja toimistorakentaminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10301', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010301', E'17', E'103.0', E'DRAFT', DEFAULT, E'Liikerakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10302', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010302', E'18', E'103.0', E'DRAFT', DEFAULT, E'Toimistorakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10303', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010303', E'19', E'103.0', E'DRAFT', DEFAULT, E'Toimitilarakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10304', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010304', E'20', E'103.0', E'DRAFT', DEFAULT, E'Kaupallisten palveluiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10305', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010305', E'21', E'103.0', E'DRAFT', DEFAULT, E'Muu liike- ja toimistorakentaminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0104', E'22', E'1.0', E'DRAFT', DEFAULT, E'Palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10401', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010401', E'23', E'104.0', E'DRAFT', DEFAULT, E'Palvelurakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10402', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010402', E'24', E'104.0', E'DRAFT', DEFAULT, E'Lähipalveluiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10403', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010403', E'25', E'104.0', E'DRAFT', DEFAULT, E'Huvi- ja viihdepalveluiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10404', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010404', E'26', E'104.0', E'DRAFT', DEFAULT, E'Muut palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'105', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0105', E'27', E'1.0', E'DRAFT', DEFAULT, E'Julkiset palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:48', E'2020-12-17 09:11:48');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10501', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010501', E'28', E'105.0', E'DRAFT', DEFAULT, E'Julkiset palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10502', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010502', E'29', E'105.0', E'DRAFT', DEFAULT, E'Yleisten rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10503', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010503', E'30', E'105.0', E'DRAFT', DEFAULT, E'Julkisten lähipalveluiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10504', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010504', E'31', E'105.0', E'DRAFT', DEFAULT, E'Hallinto- ja virastorakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10505', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010505', E'32', E'105.0', E'DRAFT', DEFAULT, E'Opetustoimintaa palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10506', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010506', E'33', E'105.0', E'DRAFT', DEFAULT, E'Sosiaalitointa ja terveydenhuoltoa palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10507', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010507', E'34', E'105.0', E'DRAFT', DEFAULT, E'Kulttuuritoimintaa palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10508', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010508', E'35', E'105.0', E'DRAFT', DEFAULT, E'Museorakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10509', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010509', E'36', E'105.0', E'DRAFT', DEFAULT, E'Kirkkojen ja muiden seurakunnallisten rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10510', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010510', E'37', E'105.0', E'DRAFT', DEFAULT, E'Urheilutoimintaa palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10511', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010511', E'38', E'105.0', E'DRAFT', DEFAULT, E'Julkisten palveluiden ja hallinnon alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10512', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010512', E'39', E'105.0', E'DRAFT', DEFAULT, E'Muut julkiset palvelut', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'106', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0106', E'40', E'1.0', E'DRAFT', DEFAULT, E'Työ ja tuotanto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10601', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010601', E'41', E'106.0', E'DRAFT', DEFAULT, E'Työpaikka-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10602', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010602', E'42', E'106.0', E'DRAFT', DEFAULT, E'Teollisuusalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10603', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010603', E'43', E'106.0', E'DRAFT', DEFAULT, E'Varastorakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10604', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010604', E'44', E'106.0', E'DRAFT', DEFAULT, E'Alue, jolle saa sijoittaa merkittävän, vaarallisia kemikaaleja valmistavan tai varastoivan laitoksen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10605', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010605', E'45', E'106.0', E'DRAFT', DEFAULT, E'Ympäristövaikutuksiltaan merkittävien teollisuustoimintojen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10606', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010606', E'46', E'106.0', E'DRAFT', DEFAULT, E'Kiertotalous', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10607', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010607', E'47', E'106.0', E'DRAFT', DEFAULT, E'Ympäristöhäiriötä aiheuttava tuotantotoiminta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10608', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010608', E'48', E'106.0', E'DRAFT', DEFAULT, E'Muu työpaikka- tai tuontantoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'107', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0107', E'49', E'1.0', E'DRAFT', DEFAULT, E'Virkistys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10701', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010701', E'50', E'107.0', E'DRAFT', DEFAULT, E'Virkistysalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10702', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010702', E'51', E'107.0', E'DRAFT', DEFAULT, E'Puisto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10703', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010703', E'52', E'107.0', E'DRAFT', DEFAULT, E'Lähivirkistysalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10704', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010704', E'53', E'107.0', E'DRAFT', DEFAULT, E'Leikkipuisto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10705', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010705', E'54', E'107.0', E'DRAFT', DEFAULT, E'Urheilupalvelujen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10706', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010706', E'55', E'107.0', E'DRAFT', DEFAULT, E'Retkeily- ja ulkoilualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10707', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010707', E'56', E'107.0', E'DRAFT', DEFAULT, E'Uimaranta-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10708', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010708', E'57', E'107.0', E'DRAFT', DEFAULT, E'Lähimetsä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10709', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010709', E'58', E'107.0', E'DRAFT', DEFAULT, E'Muu virkistysalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'108', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0108', E'59', E'1.0', E'DRAFT', DEFAULT, E'Loma-asuminen ja matkailu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10801', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010801', E'60', E'108.0', E'DRAFT', DEFAULT, E'Loma-asuntojen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10802', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010802', E'61', E'108.0', E'DRAFT', DEFAULT, E'Matkailua palvelevien rakennusten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10803', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010803', E'62', E'108.0', E'DRAFT', DEFAULT, E'Leirintäalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10804', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010804', E'63', E'108.0', E'DRAFT', DEFAULT, E'Asuntovaunualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10805', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010805', E'64', E'108.0', E'DRAFT', DEFAULT, E'Siirtolapuutarha-/palstaviljelyalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10806', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010806', E'65', E'108.0', E'DRAFT', DEFAULT, E'Muu loma-asumisen tai matkailun alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'109', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0109', E'66', E'1.0', E'DRAFT', DEFAULT, E'Liikenne', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10901', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010901', E'67', E'109.0', E'DRAFT', DEFAULT, E'Liikennealue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10902', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010902', E'68', E'109.0', E'DRAFT', DEFAULT, E'Yleisen tien alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10903', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010903', E'69', E'109.0', E'DRAFT', DEFAULT, E'Rautatieliikenteen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10904', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010904', E'70', E'109.0', E'DRAFT', DEFAULT, E'Lentoliikenteen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10905', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010905', E'71', E'109.0', E'DRAFT', DEFAULT, E'Satama-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10906', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010906', E'72', E'109.0', E'DRAFT', DEFAULT, E'Kanava-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10907', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010907', E'73', E'109.0', E'DRAFT', DEFAULT, E'Venesatama/venevalkama', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10908', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010908', E'74', E'109.0', E'DRAFT', DEFAULT, E'Yleinen pysäköintialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10909', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010909', E'75', E'109.0', E'DRAFT', DEFAULT, E'Huoltoasema-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10910', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010910', E'76', E'109.0', E'DRAFT', DEFAULT, E'Henkilöliikenteen terminaalialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10911', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010911', E'77', E'109.0', E'DRAFT', DEFAULT, E'Tavaraliikenteen terminaalialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10912', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010912', E'78', E'109.0', E'DRAFT', DEFAULT, E'Yleisten pysäköintilaitosten alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10913', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010913', E'79', E'109.0', E'DRAFT', DEFAULT, E'Autopaikkojen alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10914', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010914', E'80', E'109.0', E'DRAFT', DEFAULT, E'Katualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10915', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/010915', E'81', E'109.0', E'DRAFT', DEFAULT, E'Muu liikennealue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'110', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0110', E'82', E'1.0', E'DRAFT', DEFAULT, E'Erityisalueet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11001', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011001', E'83', E'110.0', E'DRAFT', DEFAULT, E'Erityisalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11002', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011002', E'84', E'110.0', E'DRAFT', DEFAULT, E'Yhdyskuntateknisen huollon alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11003', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011003', E'85', E'110.0', E'DRAFT', DEFAULT, E'Energiahuollon alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11004', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011004', E'86', E'110.0', E'DRAFT', DEFAULT, E'Jätteenkäsittelyalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11005', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011005', E'87', E'110.0', E'DRAFT', DEFAULT, E'Maa-ainesten ottoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11006', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011006', E'88', E'110.0', E'DRAFT', DEFAULT, E'Kaivosalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11007', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011007', E'89', E'110.0', E'DRAFT', DEFAULT, E'Mastoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11008', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011008', E'90', E'110.0', E'DRAFT', DEFAULT, E'Ampumarata-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11009', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011009', E'91', E'110.0', E'DRAFT', DEFAULT, E'Puolustusvoimien alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11010', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011010', E'92', E'110.0', E'DRAFT', DEFAULT, E'Hautausmaa-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11011', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011011', E'93', E'110.0', E'DRAFT', DEFAULT, E'Suojaviheralue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11012', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011012', E'94', E'110.0', E'DRAFT', DEFAULT, E'Tuulivoimaloiden alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11013', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011013', E'95', E'110.0', E'DRAFT', DEFAULT, E'Moottorirata', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11014', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011014', E'96', E'110.0', E'DRAFT', DEFAULT, E'Maa-ainesten vastaanotto- tai läjitysalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11015', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011015', E'97', E'110.0', E'DRAFT', DEFAULT, E'Vankila-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11016', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011016', E'98', E'110.0', E'DRAFT', DEFAULT, E'Muu erityisalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'111', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0111', E'99', E'1.0', E'DRAFT', DEFAULT, E'Suojelu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011101', E'100', E'111.0', E'DRAFT', DEFAULT, E'Suojelualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011102', E'101', E'111.0', E'DRAFT', DEFAULT, E'Luonnonsuojelualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011103', E'102', E'111.0', E'DRAFT', DEFAULT, E'Muinaismuistoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011104', E'103', E'111.0', E'DRAFT', DEFAULT, E'Rakennuslainsäädännön nojalla suojeltava alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11105', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011105', E'104', E'111.0', E'DRAFT', DEFAULT, E'Rakennussuojelulakien nojalla suojeltu alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11106', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011106', E'105', E'111.0', E'DRAFT', DEFAULT, E'Muu suojelualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'112', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0112', E'106', E'1.0', E'DRAFT', DEFAULT, E'Maa- ja metsätalous', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011201', E'107', E'112.0', E'DRAFT', DEFAULT, E'Maa- ja metsätalousalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011202', E'108', E'112.0', E'DRAFT', DEFAULT, E'Maatalousalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011203', E'109', E'112.0', E'DRAFT', DEFAULT, E'Kotieläintalouden suuryksikön alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11204', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011204', E'110', E'112.0', E'DRAFT', DEFAULT, E'Puutarha- ja kasvihuonealue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11205', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011205', E'111', E'112.0', E'DRAFT', DEFAULT, E'Maisemallisesti arvokas peltoalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11206', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011206', E'112', E'112.0', E'DRAFT', DEFAULT, E'Poronhoitovaltainen maa- ja metsätalousalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11207', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011207', E'113', E'112.0', E'DRAFT', DEFAULT, E'Muu maa- ja metsätalousalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'113', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0113', E'114', E'1.0', E'DRAFT', DEFAULT, E'Vesialueet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11301', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011301', E'115', E'113.0', E'DRAFT', DEFAULT, E'Vesialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11302', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/011302', E'116', E'113.0', E'DRAFT', DEFAULT, E'Muu vesialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/02', E'117', DEFAULT, E'DRAFT', DEFAULT, E'Alueen osan käyttötarkoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0201', E'118', E'2.0', E'DRAFT', DEFAULT, E'Yhdyskuntatekninen käyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020101', E'119', E'201.0', E'DRAFT', DEFAULT, E'Johto, putki tai linja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Maan alaista tai maan päällistä johtoa, putkea tai linjaa varten varattu alue.', DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020102', E'120', E'201.0', E'DRAFT', DEFAULT, E'Sähkölinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020103', E'121', E'201.0', E'DRAFT', DEFAULT, E'Kaasulinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020104', E'122', E'201.0', E'DRAFT', DEFAULT, E'Vesi- tai jätevesitunneli', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20105', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020105', E'123', E'201.0', E'DRAFT', DEFAULT, E'Vesijohto tai siirtoviemäri', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20106', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020106', E'124', E'201.0', E'DRAFT', DEFAULT, E'Kaukolämpölinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20107', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020107', E'125', E'201.0', E'DRAFT', DEFAULT, E'Kaukokylmälinja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20108', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020108', E'126', E'201.0', E'DRAFT', DEFAULT, E'Tulvapenger', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20109', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020109', E'127', E'201.0', E'DRAFT', DEFAULT, E'Tulvareitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20110', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020110', E'128', E'201.0', E'DRAFT', DEFAULT, E'Pumppaamo', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20111', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020111', E'129', E'201.0', E'DRAFT', DEFAULT, E'Muuntamo', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20112', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020112', E'130', E'201.0', E'DRAFT', DEFAULT, E'Suojavyöhyke', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20113', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020113', E'131', E'201.0', E'DRAFT', DEFAULT, E'Hulevesijärjestelmä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20114', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020114', E'132', E'201.0', E'DRAFT', DEFAULT, E'Hulevesien viivytysallas', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20115', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020115', E'133', E'201.0', E'DRAFT', DEFAULT, E'Avo-oja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20116', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020116', E'134', E'201.0', E'DRAFT', DEFAULT, E'Muu yhdyskuntatekniseen huoltoon liittyvä käyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0202', E'135', E'2.0', E'DRAFT', DEFAULT, E'Ulkoalueiden käyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020201', E'136', E'202.0', E'DRAFT', DEFAULT, E'Istutettava alueen osa', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020202', E'137', E'202.0', E'DRAFT', DEFAULT, E'Leikkialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020203', E'138', E'202.0', E'DRAFT', DEFAULT, E'Oleskelualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20204', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020204', E'139', E'202.0', E'DRAFT', DEFAULT, E'Puurivi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Säilytettävä/istutettava puurivi', DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20205', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020205', E'140', E'202.0', E'DRAFT', DEFAULT, E'Muuri', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20206', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020206', E'141', E'202.0', E'DRAFT', DEFAULT, E'Pengerrys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20207', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020207', E'142', E'202.0', E'DRAFT', DEFAULT, E'Muu tontinkäyttöön liittyvä käyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0203', E'143', E'2.0', E'DRAFT', DEFAULT, E'Liikennekäyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20301', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020301', E'144', E'203.0', E'DRAFT', DEFAULT, E'Ajoluiska', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Maanalaisiin tiloihin johtava ajoluiska', DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20302', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020302', E'145', E'203.0', E'DRAFT', DEFAULT, E'Ajoyhteys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:49', E'2020-12-17 09:11:49');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20303', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020303', E'146', E'203.0', E'DRAFT', DEFAULT, E'Alikulku', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kadun tai liikennealueen alittava kevyen liikenteen yhteys', DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20304', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020304', E'147', E'203.0', E'DRAFT', DEFAULT, E'Auton säilytyspaikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20305', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020305', E'148', E'203.0', E'DRAFT', DEFAULT, E'Eritasoristeys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20306', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020306', E'149', E'203.0', E'DRAFT', DEFAULT, E'Hidaskatu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20307', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020307', E'150', E'203.0', E'DRAFT', DEFAULT, E'Katuaukio/Tori', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20308', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020308', E'151', E'203.0', E'DRAFT', DEFAULT, E'Liikennetunneli', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20309', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020309', E'152', E'203.0', E'DRAFT', DEFAULT, E'Pelastustie', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20310', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020310', E'153', E'203.0', E'DRAFT', DEFAULT, E'Pihakatu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20311', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020311', E'154', E'203.0', E'DRAFT', DEFAULT, E'Pysäköintialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20312', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020312', E'155', E'203.0', E'DRAFT', DEFAULT, E'Tontille ajo sallittu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20313', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020313', E'156', E'203.0', E'DRAFT', DEFAULT, E'Ulkoilureitti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20314', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020314', E'157', E'203.0', E'DRAFT', DEFAULT, E'Varattu alueen sisäiselle huoltoajolle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20315', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020315', E'158', E'203.0', E'DRAFT', DEFAULT, E'Varattu alueen sisäiselle jalankululle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20316', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020316', E'159', E'203.0', E'DRAFT', DEFAULT, E'Varattu alueen sisäiselle polkupyöräilylle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20317', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020317', E'160', E'203.0', E'DRAFT', DEFAULT, E'Varattu huoltoajolle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20318', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020318', E'161', E'203.0', E'DRAFT', DEFAULT, E'Varattu jalankululle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20319', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020319', E'162', E'203.0', E'DRAFT', DEFAULT, E'Varattu joukkoliikenteelle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20320', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020320', E'163', E'203.0', E'DRAFT', DEFAULT, E'Varattu polkypyöräilylle', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20321', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020321', E'164', E'203.0', E'DRAFT', DEFAULT, E'Yleisen tien näkemäalue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20322', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020322', E'165', E'203.0', E'DRAFT', DEFAULT, E'Yleisen tien suoja-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Yleisen tien suoja-alueeksi varattu alueen osa', DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20323', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020323', E'166', E'203.0', E'DRAFT', DEFAULT, E'Ylikulku', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kadun tai liikennealueen ylittävä kevyen liikenteen yhteys', DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20324', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020324', E'167', E'203.0', E'DRAFT', DEFAULT, E'Muu liikennejärjestelmään liittyvä käyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'204', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0204', E'168', E'2.0', E'DRAFT', DEFAULT, E'Virkistyskäyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20401', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020401', E'169', E'204.0', E'DRAFT', DEFAULT, E'Asuntovaunualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20402', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020402', E'170', E'204.0', E'DRAFT', DEFAULT, E'Frisbeegolf', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20403', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020403', E'171', E'204.0', E'DRAFT', DEFAULT, E'Golf-väylä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Golf-väylä suoja-alueineen', DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20404', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020404', E'172', E'204.0', E'DRAFT', DEFAULT, E'Kenttä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20405', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020405', E'173', E'204.0', E'DRAFT', DEFAULT, E'Koirapuisto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20406', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020406', E'174', E'204.0', E'DRAFT', DEFAULT, E'Mäenlaskupaikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20407', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020407', E'175', E'204.0', E'DRAFT', DEFAULT, E'Ratsastuskenttä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20408', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020408', E'176', E'204.0', E'DRAFT', DEFAULT, E'Telttailu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20409', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020409', E'177', E'204.0', E'DRAFT', DEFAULT, E'Muu virkistyskäyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'205', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0205', E'178', E'2.0', E'DRAFT', DEFAULT, E'Maatalouskäyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20501', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020501', E'179', E'205.0', E'DRAFT', DEFAULT, E'Laidun', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20502', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/020502', E'180', E'205.0', E'DRAFT', DEFAULT, E'Muu maatalouskäyttö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'206', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0206', E'181', E'2.0', E'DRAFT', DEFAULT, E'Rakennusalan käyttötarkoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennuksen käyttötarkoitusta tarkentava kaavamääräys. Käyttötarkoitus ilmaistaan Rakennusluokitus 2018 -koodiston avulla tai tekstiarvona.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'207', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0207', E'182', E'2.0', E'DRAFT', DEFAULT, E'Muu alueen osan käyttötarkoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/03', E'183', DEFAULT, E'DRAFT', DEFAULT, E'Rakentamisen määrä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'301', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0301', E'184', E'3.0', E'DRAFT', DEFAULT, E'Sallittu kerrosala', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Sallittu kerrosala kerrosneliömetreinä (m2)', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'302', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0302', E'185', E'3.0', E'DRAFT', DEFAULT, E'Sallittu rakennustilavuus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennuksen sallittu tilavuus kuutiometreinä (m3)', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'303', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0303', E'186', E'3.0', E'DRAFT', DEFAULT, E'Tehokkuusluku', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'sallitun kerrosalan suhde tontin/rakennuspaikan pinta-alaan', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'304', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0304', E'187', E'3.0', E'DRAFT', DEFAULT, E'Maanpäällinen kerrosluku', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'305', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0305', E'188', E'3.0', E'DRAFT', DEFAULT, E'Maanalainen kerrosluku', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'306', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0306', E'189', E'3.0', E'DRAFT', DEFAULT, E'Kellarin sallittu kerrosalaosuus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'ilmaisee kuinka suuren osan rakennuksen suurimman kerroksen alasta saa kellarikerroksessa käyttää kerrosalaan luettavaksi tilaksi.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'307', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0307', E'190', E'3.0', E'DRAFT', DEFAULT, E'Ullakon sallittu kerrosalaosuus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'ilmaiseen kuinka suuren osan rakennuksen suurimman kerroksen alasta ullakon tasolla saa käyttää kerrosalaan laskettavaksi tilaksi.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'308', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0308', E'191', E'3.0', E'DRAFT', DEFAULT, E'Rakennuspaikkojen määrä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Ranta-asemakaavassa osoitettavien rakennuspaikkojen määrä', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'309', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0309', E'192', E'3.0', E'DRAFT', DEFAULT, E'Lisärakennusoikeus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/04', E'193', DEFAULT, E'DRAFT', DEFAULT, E'Rakennusten sijoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'401', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0401', E'194', E'4.0', E'DRAFT', DEFAULT, E'Rakentamisen suhde alueen pinta-alaan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Luku osoittaa, kuinka suuren osan alueesta tai rakennusalasta saa käyttää rakentamiseen.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'402', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0402', E'195', E'4.0', E'DRAFT', DEFAULT, E'Etäisyys naapuritontin rajasta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennusten etäisyyden naapuritontin rajasta on oltava vähintään kaavamääräykseen liitetyn numeerisen arvon mukainen.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'403', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0403', E'196', E'4.0', E'DRAFT', DEFAULT, E'Rakennusala', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'asemakaavassa rakentamiselle osoitettu, rajoiltaan määrätty korttelin tai tontin osa', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'404', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0404', E'197', E'4.0', E'DRAFT', DEFAULT, E'Rakennettava kiinni rajaan', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennusalan sivu, johon rakennus on rakennettava kiinni', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'405', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0405', E'198', E'4.0', E'DRAFT', DEFAULT, E'Rakennuspaikka', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Ranta-asemakaavan mukainen rakennuspaikka', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'406', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0406', E'199', E'4.0', E'DRAFT', DEFAULT, E'Muu rakennusten sijoitukseen liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/05', E'200', DEFAULT, E'DRAFT', DEFAULT, E'Rakentamistapa', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'501', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0501', E'201', E'5.0', E'DRAFT', DEFAULT, E'Kattokaltevuus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'502', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0502', E'202', E'5.0', E'DRAFT', DEFAULT, E'Uloke', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'503', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0503', E'203', E'5.0', E'DRAFT', DEFAULT, E'Rakennuksen harjansuunta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'504', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0504', E'204', E'5.0', E'DRAFT', DEFAULT, E'Kulkuaukko', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennukseen jätettävä kulkuaukko', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'505', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0505', E'205', E'5.0', E'DRAFT', DEFAULT, E'Valokatteinen tila', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'506', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0506', E'206', E'5.0', E'DRAFT', DEFAULT, E'Suora uloskäynti porrashuoneista', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennuksen sivu, jolla tulee olla suora uloskäynti porrashuoneista', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'507', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0507', E'207', E'5.0', E'DRAFT', DEFAULT, E'Ei saa rakentaa ikkunoita', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennusalan sivu, jonka puoleiseen rakennuksen seinään ei saa sijoittaa ikkunoita', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'508', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0508', E'208', E'5.0', E'DRAFT', DEFAULT, E'Ääneneristävyys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennusalan sivu, jonka puoleisten rakennusten ulkoseinien sekä ikkunoiden ja muiden rakenteiden ääneneristävyyden liikennemelua vastaan on oltava vähintää xx dBA', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'509', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0509', E'209', E'5.0', E'DRAFT', DEFAULT, E'Parvekkeet sijoitettava rungon sisään', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'510', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0510', E'210', E'5.0', E'DRAFT', DEFAULT, E'Hissi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'511', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0511', E'211', E'5.0', E'DRAFT', DEFAULT, E'Viherkatto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'512', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0512', E'212', E'5.0', E'DRAFT', DEFAULT, E'Kelluvat asuinrakennukset', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennukset saa toteuttaa kelluvina', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'513', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0513', E'213', E'5.0', E'DRAFT', DEFAULT, E'Muu rakentamistapaan liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/06', E'214', DEFAULT, E'DRAFT', DEFAULT, E'Korkeusasema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'601', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0601', E'215', E'6.0', E'DRAFT', DEFAULT, E'Maanpinnan korkeusasema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'602', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0602', E'216', E'6.0', E'DRAFT', DEFAULT, E'Rakennuksen vesikaton ylimmän kohdan korkeusasema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'603', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0603', E'217', E'6.0', E'DRAFT', DEFAULT, E'Rakennuksen julkisivupinnan ja vesikaton leikkauskohdan korkeusasema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'604', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0604', E'218', E'6.0', E'DRAFT', DEFAULT, E'Rakennuksen julkisivun enimmäiskorkeus metreinä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'605', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0605', E'219', E'6.0', E'DRAFT', DEFAULT, E'Rakennuksen, rakenteiden ja laitteiden ylin korkeusasema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'606', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0606', E'220', E'6.0', E'DRAFT', DEFAULT, E'Maanalaisen kohteen korkeusasema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'607', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0607', E'221', E'6.0', E'DRAFT', DEFAULT, E'Muu korkeusasemaan liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/07', E'222', DEFAULT, E'DRAFT', DEFAULT, E'Ulkoalueet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennusten ulkopuoleisten alueiden toteuttaminen', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'701', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0701', E'223', E'7.0', E'DRAFT', DEFAULT, E'Vihertehokkuus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'702', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0702', E'224', E'7.0', E'DRAFT', DEFAULT, E'Puusto tai kasvillisuus säilytettävä tai korvattava', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'703', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0703', E'225', E'7.0', E'DRAFT', DEFAULT, E'Olemassa oleva puusto säilytettävä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Olemassa oleva puusto tulee mahdollisuuksien mukaan säilyttää.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'704', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0704', E'226', E'7.0', E'DRAFT', DEFAULT, E'Maisema säilytettävä avoimena', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'705', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0705', E'227', E'7.0', E'DRAFT', DEFAULT, E'Muu ulkoalueiden toteuttamiseen liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/08', E'228', DEFAULT, E'DRAFT', DEFAULT, E'Liikenne', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'801', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0801', E'229', E'8.0', E'DRAFT', DEFAULT, E'Ajoneuvoliittymä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'802', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0802', E'230', E'8.0', E'DRAFT', DEFAULT, E'Ajoneuvoliittymän kielto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Katualueen rajan osa, jonka kohdalta ei saa järjestää ajoneuvoliittymää', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'803', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0803', E'231', E'8.0', E'DRAFT', DEFAULT, E'Autopaikkojen määrä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'804', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0804', E'232', E'8.0', E'DRAFT', DEFAULT, E'Polkupyöräpysäköinnin määrä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'805', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0805', E'233', E'8.0', E'DRAFT', DEFAULT, E'Muu liikenteeseen liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/09', E'234', DEFAULT, E'DRAFT', DEFAULT, E'Ympäristöarvojen vaaliminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'901', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0901', E'235', E'9.0', E'DRAFT', DEFAULT, E'Kulttuurihistoriallisesti arvokas alue tai kohde', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090101', E'236', E'901.0', E'DRAFT', DEFAULT, E'Suojeltava alue tai alueen osa', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090102', E'237', E'901.0', E'DRAFT', DEFAULT, E'Suojeltava rakennus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090103', E'238', E'901.0', E'DRAFT', DEFAULT, E'Suojeltava rakennelma', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090104', E'239', E'901.0', E'DRAFT', DEFAULT, E'Kiinteä suojeltava kohde', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90105', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090105', E'240', E'901.0', E'DRAFT', DEFAULT, E'Kiinteä muinaisjäännös', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Alue tai alueen osa, jolla sijaitsee muinaismuistolailla rauhoitettu kiinteä muinaisjäännös', DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'902', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0902', E'241', E'9.0', E'DRAFT', DEFAULT, E'Luontoarvoiltaan arvokas alue tai kohde', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 17:42:13');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090201', E'242', E'902.0', E'DRAFT', DEFAULT, E'Suojeltu puu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090202', E'243', E'902.0', E'DRAFT', DEFAULT, E'Säilytettävä puu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090203', E'244', E'902.0', E'DRAFT', DEFAULT, E'Suojeltava vesistö tai vesialue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90204', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090204', E'245', E'902.0', E'DRAFT', DEFAULT, E'Luonnon monimuotoisuuden kannalta tärkeä alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'90205', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/090205', E'246', E'902.0', E'DRAFT', DEFAULT, E'Ekologinen yhteys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'3', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'903', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0903', E'247', E'9.0', E'DRAFT', DEFAULT, E'Alue, jolla ympäristö säilytetään', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'904', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/0904', E'248', E'9.0', E'DRAFT', DEFAULT, E'Alue, jolla on erityistä ulkoilun ohjaamistarvetta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:50', E'2020-12-17 09:11:50');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/10', E'249', DEFAULT, E'DRAFT', DEFAULT, E'Tonttijako', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'maa-alueen jakautuminen asemakaavassa osoitetuiksi yksiköiksi, joista on muodostettu tai joista on tarkoitus muodostaa tontteja soveltuvalla kiinteistönmuodostustoimituksella', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1001', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1001', E'250', E'10.0', E'DRAFT', DEFAULT, E'Sitova tonttijako laadittava', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1002', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1002', E'251', E'10.0', E'DRAFT', DEFAULT, E'Esitontti', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/11', E'252', DEFAULT, E'DRAFT', DEFAULT, E'Yleismääräykset', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1101', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1101', E'253', E'11.0', E'DRAFT', DEFAULT, E'Yleismääräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1102', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1102', E'254', E'11.0', E'DRAFT', DEFAULT, E'Ajanmukaisuuden arvioinnin aikaraja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Asemakaavan ajanmukaisuuden arviointi on tehtävä kaavamääräyksen numeerisen arvon osoittaman vuoden kuluttua kaavan voimaantulosta.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1103', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1103', E'255', E'11.0', E'DRAFT', DEFAULT, E'Aluetta koskee sitovat rakentamistapaohjeet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Aluetta koskee sitovat rakennustapaohjeet', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1104', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1104', E'256', E'11.0', E'DRAFT', DEFAULT, E'Aluetta koskee rakentamistapaohjeet', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Alueelle on laadittu rakentamistapaohjeet', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'12', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/12', E'257', DEFAULT, E'DRAFT', DEFAULT, E'Yhdyskuntatekninen huolto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1201', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1201', E'258', E'12.0', E'DRAFT', DEFAULT, E'Alin painovoimainen viemäröintitaso', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1202', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1202', E'259', E'12.0', E'DRAFT', DEFAULT, E'Aurinkokennojen alin sijoittumistaso', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1203', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1203', E'260', E'12.0', E'DRAFT', DEFAULT, E'Vaatimus hulevesisuunnitelman laatimisesta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Alueelle tulee laatia hulevesisuunnitelma.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1204', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1204', E'261', E'12.0', E'DRAFT', DEFAULT, E'Liitettävä kaukolämpöverkkoon', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Alue on liitettävä kaukolämpöverkkoon.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1205', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1205', E'262', E'12.0', E'DRAFT', DEFAULT, E'Hulevesien imeyttämisen periaate tai vaatimus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Hulevesien imeyttämisvaatimus', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1206', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1206', E'263', E'12.0', E'DRAFT', DEFAULT, E'Muu yhdyskuntatekniseen huoltoon liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'13', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/13', E'264', DEFAULT, E'DRAFT', DEFAULT, E'Ympäristön ja terveyden suojelu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1301', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1301', E'265', E'13.0', E'DRAFT', DEFAULT, E'Pilaantunut maa-alue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Alue, jolla on maaperän haitta-aineita', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1302', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1302', E'266', E'13.0', E'DRAFT', DEFAULT, E'Meluaita', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1303', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1303', E'267', E'13.0', E'DRAFT', DEFAULT, E'Meluvalli', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1304', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1304', E'268', E'13.0', E'DRAFT', DEFAULT, E'Melualue', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1305', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1305', E'269', E'13.0', E'DRAFT', DEFAULT, E'Radonhaitta huomioitava', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakentamisessa on huomioitava mahdollinen radonhaitta.', DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1306', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1306', E'270', E'13.0', E'DRAFT', DEFAULT, E'Muu ympäristönsuojeluun liittyvä määräys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'14', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/14', E'271', DEFAULT, E'DRAFT', DEFAULT, E'Nimistö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1401', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1401', E'272', E'14.0', E'DRAFT', DEFAULT, E'Kadun tai tien nimi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1402', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1402', E'273', E'14.0', E'DRAFT', DEFAULT, E'Torin tai katuaukion nimi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1403', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1403', E'274', E'14.0', E'DRAFT', DEFAULT, E'Puiston tai muun yleisen alueen nimi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1404', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1404', E'275', E'14.0', E'DRAFT', DEFAULT, E'Kaupungin- tai kunnanosan nimi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1405', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1405', E'276', E'14.0', E'DRAFT', DEFAULT, E'Korttelinumero', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --
INSERT INTO koodistot.kaavamaarays_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1406', E'http://uri.suomi.fi/codelist/rytj/RY_KaavamaaraysLaji_AK/code/1406', E'277', E'14.0', E'DRAFT', DEFAULT, E'Muu nimistö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-17 09:11:51', E'2020-12-17 09:11:51');
-- ddl-end --

-- object: koodistot.kaavan_vuorovaikutustapahtuman_laji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kaavan_vuorovaikutustapahtuman_laji CASCADE;
CREATE TABLE koodistot.kaavan_vuorovaikutustapahtuman_laji (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT kaavan_vuorovaikutustapahtuman_laji_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Nähtävilläolo', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'kaavan virallinen nähtävilläoloon valmistelu- ja ehdotusvaiheissa', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:48:01', E'2020-12-11 18:48:01');
-- ddl-end --
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Vuorovaikutustilaisuus', DEFAULT, DEFAULT, E'Kaavaan liittyvä tilaisuus tai tapahtuma, jossa toimijoiden on mahdollisuus tuoda esiin suunnitteluun liittyviä näkemyksiään', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:48:01', E'2020-12-11 18:48:01');
-- ddl-end --
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/03', E'3', DEFAULT, E'DRAFT', DEFAULT, E'Tiedonkeruu', DEFAULT, DEFAULT, E'Kaavaan liittyvä kartoitus, jossa kerätään esimerkiksi kyselyn tai muun soveltuvan menetelmän avulla toimijoiden näkökulmia suunnitteluun', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:48:01', E'2020-12-11 18:48:01');
-- ddl-end --
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/04', E'4', DEFAULT, E'DRAFT', DEFAULT, E'Neuvottelu', DEFAULT, DEFAULT, E'Kokous tai muu neuvottelutilaisuus, jossa keskustellaan kaavaan liittyvistä kysymyksistä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:48:01', E'2020-12-11 18:48:01');
-- ddl-end --
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/05', E'5', DEFAULT, E'DRAFT', DEFAULT, E'Sähköinen osallistuminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:48:01', E'2020-12-11 18:48:01');
-- ddl-end --
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/06', E'6', DEFAULT, E'DRAFT', DEFAULT, E'Muutoksenhaku', DEFAULT, DEFAULT, E'toimenpide, jolla tuomioistuimelta tai muulta muutoksenhakuviranomaiselta pyritään saamaan muutos hallintoviranomaisen tai tuomioistuimen ratkaisuun', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/jhs/J180', E'1', E'2020-12-11 18:48:01', E'2021-01-13 19:52:12');
-- ddl-end --
INSERT INTO koodistot.kaavan_vuorovaikutustapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanVuorovaikutustapahtumanLaji/code/07', E'7', DEFAULT, E'DRAFT', DEFAULT, E'Muu vuorovaikutustapahtuma', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:52:41', E'2021-01-13 19:52:41');
-- ddl-end --

-- object: kaavatiedot.versioitu_objekti_abstrakti | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.versioitu_objekti_abstrakti CASCADE;
CREATE TABLE kaavatiedot.versioitu_objekti_abstrakti (
	nimiavaruus varchar,
	viittaustunnus varchar,
	identiteettitunnus varchar,
	tuottajakohtainen_tunnus varchar,
	viimeisin_muutos timestamp DEFAULT now(),
	tallennusaika timestamp DEFAULT now()
);
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.nimiavaruus IS 'tunnusten nimiavaruus';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.viittaustunnus IS 'johdettu nimiavaruudesta, luokan englanninkielisestä nimestä ja paikallisesta tunnuksesta';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.identiteettitunnus IS 'kohteen versioriippumaton tunnus';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.versioitu_objekti_abstrakti.tuottajakohtainen_tunnus IS 'kohteen tunnus tuottajatietojärjestelmässä';
-- ddl-end --

-- object: koodistot.oikeusvaikutteisuuden_laji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.oikeusvaikutteisuuden_laji CASCADE;
CREATE TABLE koodistot.oikeusvaikutteisuuden_laji (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT oikeusvaikutteisuuden_laji_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.oikeusvaikutteisuuden_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_OikeusvaikutteisuudenLaji/code/01', E'1', DEFAULT, E'DRAFT', E'legal consequence', E'Oikeusvaikutteinen', E'rättsverkan', DEFAULT, E'päätetyllä maankäyttöasialla vaikutus, joka luo, muuttaa tai kumoaa oikeuden tai velvollisuuden', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/mrl/concept-157', E'1', E'2020-12-11 06:44:19', E'2020-12-11 06:44:19');
-- ddl-end --
INSERT INTO koodistot.oikeusvaikutteisuuden_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_OikeusvaikutteisuudenLaji/code/02', E'2', DEFAULT, E'DRAFT', E'legal consequence', E'Oikeusvaikutukseton', E'rättsverkan', DEFAULT, E'päätetyllä maankäyttöasialla ei ole vaikutusta, joka luo, muuttaa tai kumoaa oikeuden tai velvollisuuden', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/mrl/concept-157', E'1', E'2020-12-11 06:44:19', E'2020-12-11 06:44:19');
-- ddl-end --

-- object: kaavatiedot.kaavan_kumoamistieto | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.kaavan_kumoamistieto CASCADE;
CREATE TABLE kaavatiedot.kaavan_kumoamistieto (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	kumottavan_kaavan_tunnus varchar,
	kumoaa_kaavan_kokonaan boolean,
	geom geometry(MULTISURFACEZ, 3067),
	kumottavan_maarayksen_tunnus varchar,
	kumottavan_suosituksen_tunnus varchar,
	id_kaava bigint,
	CONSTRAINT kaavan_kumoamistieto_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE kaavatiedot.kaavan_kumoamistieto IS 'tieto kaavan hyväksymisen johdosta kokonaisuudessaan kumoutuvasta kaavasta tai kaavan kumottavasta osa-alueesta, yksittäisistä kaavakohteista tai kaavamääräyksistä.
kumoamistieto kuvaa miten kaavan voimaantulo vaikuttaa toisten kaavojen ja niiden sisältämien määräysten tai suositusten kumoutumiseen.';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.kaavan_kumoamistieto.kumottavan_kaavan_tunnus IS 'URI';
-- ddl-end --

-- object: koodistot.asiakirjan_laji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.asiakirjan_laji CASCADE;
CREATE TABLE koodistot.asiakirjan_laji (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT abstrakti_koodilista_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Hakemus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaava-asiaan liittyvä hakemus, esimerkiksi kaavoitusaloite tai -hakemus.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Havainnekuva', DEFAULT, DEFAULT, E'Kaavaa havainnollistava visualisointi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/03', E'3', DEFAULT, E'DRAFT', DEFAULT, E'Kaavakartta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Juridisen kaavakartan sähköinen versio. Esimerkiksi vanhan, digitoidun kaavakartan skannattu versio.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/04', E'4', DEFAULT, E'DRAFT', DEFAULT, E'Kaavaselostus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/05', E'5', DEFAULT, E'DRAFT', DEFAULT, E'Karttaliite', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavaan liitetty karttaa esittävä dokumentti.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/06', E'6', DEFAULT, E'DRAFT', DEFAULT, E'Kirje', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/07', E'7', DEFAULT, E'DRAFT', DEFAULT, E'Kuulutus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/08', E'8', DEFAULT, E'DRAFT', DEFAULT, E'Lausunto', DEFAULT, DEFAULT, E'asiakirja tai asiakirjojen muodostama kokonaisuus, jolla lausuntopyynnön saanut toimija esittää näkemyksensä tarkastelun kohteesta asiankäsittelyn aikana', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/09', E'9', DEFAULT, E'DRAFT', E'opinion', E'Mielipide', E'åsikt', DEFAULT, E'osallisen tai yhteisön jäsenen esittämä kannanotto viranomaisen valmisteluaineistoon', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/10', E'10', DEFAULT, E'DRAFT', DEFAULT, E'Muistio', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/11', E'11', DEFAULT, E'DRAFT', E'objection', E'Muistutus', E'anmärkning', DEFAULT, E'asianosaisen esittämä kannanotto kaavaehdotukseen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'12', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/12', E'12', DEFAULT, E'DRAFT', DEFAULT, E'Osallistumis- ja arviointisuunnitelma', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'13', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/13', E'13', DEFAULT, E'DRAFT', DEFAULT, E'Päätös', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'14', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/14', E'14', DEFAULT, E'DRAFT', DEFAULT, E'Pöytäkirja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'15', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/15', E'15', DEFAULT, E'DRAFT', DEFAULT, E'Raportti', DEFAULT, DEFAULT, E'Raportti voi olla esimerkiksi yhteenveto vuorovaikutustapahtumasta tai -tapahtumien kokonaisuudesta.', DEFAULT, DEFAULT, E'asiakirja, joka sisältää yhteenvedon kaavan valmisteluun liittyvästä asiasta', DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'16', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/16', E'16', DEFAULT, E'DRAFT', DEFAULT, E'Selvitys', DEFAULT, DEFAULT, E'Kaavan laadinnassa hyödynnetyt selvitykset. Selvityksiä voivat olla esimerkiksi luonto-, maisema-, kulttuuriperintö-, liikenne- tai palveluverkkoselvitykset.', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'17', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/17', E'17', DEFAULT, E'DRAFT', DEFAULT, E'Sopimus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'18', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/18', E'18', DEFAULT, E'DRAFT', DEFAULT, E'Suunnitelma', DEFAULT, DEFAULT, E'Kaavatyöhön liittyvä erillinen suunnitelma, esimerkiksi katujen tai yleisten alueiden suunnitelma', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'19', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/19', E'19', DEFAULT, E'DRAFT', DEFAULT, E'Suunnitteluohje', DEFAULT, DEFAULT, E'Suunnitteluohje voi olla esimerkiksi rakentamistapaohje tai lähiympäristön suunnitteluohje.', DEFAULT, DEFAULT, E'Kaavan suunnitteluratkaisuja täydentävä ohjeistus jatkosuunnittelua varten.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/20', E'20', DEFAULT, E'DRAFT', DEFAULT, E'Valitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'21', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/21', E'21', DEFAULT, E'DRAFT', DEFAULT, E'Vastine', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --
INSERT INTO koodistot.asiakirjan_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'22', E'http://uri.suomi.fi/codelist/rytj/RY_AsiakirjanLaji_YKAK/code/22', E'22', DEFAULT, E'DRAFT', DEFAULT, E'Muu asiakirja', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2021-01-13 19:32:11', E'2021-01-13 19:32:11');
-- ddl-end --

-- object: kaavatiedot.kaava | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.kaava CASCADE;
CREATE TABLE kaavatiedot.kaava (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	kaavatunnus uuid DEFAULT gen_random_uuid(),
	vireilletulo_aika timestamp,
	hyvaksymisen_aika timestamp,
	tallennusaika timestamp DEFAULT now(),
	viimeisin_muutos timestamp,
	id_digitaalinen_alkupera integer,
	id_oikeusvaikutteisuuden_laji integer,
	id_kaavalaji integer,
	id_osallistumis_ja_arviointisuunnitelma bigint,
	id_kaavan_laatija bigint,
	id_kaavan_elinkaaritila integer,
	nimi varchar,
	kuvaus varchar,
	geom geometry(MULTISURFACEZ, 3067),
	voimassaolo_alku timestamp,
	voimassaolo_loppu timestamp,
	metatietokuvaus varchar,

-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
	CONSTRAINT kaava_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.versioitu_objekti_abstrakti);
-- ddl-end --

-- object: kaavatiedot.kaavan_laatija | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.kaavan_laatija CASCADE;
CREATE TABLE kaavatiedot.kaavan_laatija (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	nimi varchar,
	nimike varchar,
	rooli varchar,

-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),
	CONSTRAINT kaavan_laatija_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.versioitu_objekti_abstrakti);
-- ddl-end --

INSERT INTO kaavatiedot.kaavan_laatija (id, nimi, nimike, rooli) VALUES (DEFAULT, E'John Doe', E'Urban Planner', E'GIS analysis');
-- ddl-end --
INSERT INTO kaavatiedot.kaavan_laatija (id, nimi, nimike, rooli) VALUES (DEFAULT, E'Jane Doe', E'Architect', E'Head of planning');
-- ddl-end --

-- object: kaavatiedot.asiakirja | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.asiakirja CASCADE;
CREATE TABLE kaavatiedot.asiakirja (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	asiakirjan_tunnus varchar,
	nimi varchar,
	lisatietolinkki varchar,
	metatietokuvaus varchar,
	id_asiakirjan_laji integer NOT NULL,
	id_kaavasuositus bigint,
	id_kaavaselostus bigint,
	id_osallistumis_ja_arviointisuunnitelma bigint,
	id_kaavamaarays bigint,
	id_asiakirja bigint,
	id_vuorovaikutustapahtuma bigint,
	id_kasittelytapahtuma bigint,

-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),
	CONSTRAINT asiakirja_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.versioitu_objekti_abstrakti);
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.asiakirja.asiakirjan_tunnus IS 'asiakirjan pysyvä tunnus, esim. diaarinumero tai muu dokumentinhallinnan tunnus';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.asiakirja.nimi IS 'asiakirjan nimi';
-- ddl-end --

-- object: digitaalinen_alkupera_kaava | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaava DROP CONSTRAINT IF EXISTS digitaalinen_alkupera_kaava CASCADE;
ALTER TABLE kaavatiedot.kaava ADD CONSTRAINT digitaalinen_alkupera_kaava FOREIGN KEY (id_digitaalinen_alkupera)
REFERENCES koodistot.digitaalinen_alkupera (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.lahtotietoaineisto | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.lahtotietoaineisto CASCADE;
CREATE TABLE kaavatiedot.lahtotietoaineisto (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	aineistotunnus varchar,
	nimi varchar,
	id_lahtoaineiston_laji integer NOT NULL,
	geom geometry(MULTISURFACEZ, 3067),
	lisatietolinkki varchar,
	metatietokuvaus varchar,
	CONSTRAINT lahtotietoaineisto_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.aineistotunnus IS 'lähtötietoaineiston tunnus';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.lisatietolinkki IS 'viittaus ulkoiseen lisätietokuvaukseen asiakirjasta';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.lahtotietoaineisto.metatietokuvaus IS 'viittaus ulkoiseen metatietokuvaukseen';
-- ddl-end --

-- object: koodistot.lahtoaineiston_laji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.lahtoaineiston_laji CASCADE;
CREATE TABLE koodistot.lahtoaineiston_laji (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT lahtoaineiston_laji_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Aluerajat', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Hallinnolliset rajat - kunnat, maakunnat, AVI, valtio, Hallinnolliset rajat (kuntapohjaiset tilastointialueet) - kunnat, seutukunnat, maakunnat, vaalipiirit, suuralueet, AVI, ELY, Aluevesien rajat, Rajavyöhyke, kuvaukseen paliskunnat, saamelaisten kotiseutualue, koltta-alue', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 17:43:09');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Energia', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/03', E'3', DEFAULT, E'DRAFT', DEFAULT, E'Ihmisten elinolot ja elinympäristö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Työpaikat, alueen sosiaalista luonnetta ja ympäristöterveyttä kartoittavat selvitykset, kokemustieto', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/04', E'4', DEFAULT, E'DRAFT', DEFAULT, E'Ilma ja ilmasto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Tuulisuutta ja pienilmastoa koskevat selvitykset, ilmastonmuutoksen resilienssi jne.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/05', E'5', DEFAULT, E'DRAFT', DEFAULT, E'Kaupunkikuva ja maisema', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'esim. kaupunkikuvallinen tai maisemarakenneselvitys', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/06', E'6', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuuriympäristö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kulttuurimaisemaa, muinaismuistoja ja rakennettua kulttuuriympäristöä koskevat selvitykset, kuten Valtakunnallisesti merkittävät arkeologiset kohteet (VARK), kiinteät muinaisjäännökset ja niiden suoja-alueet, arkeologiset kohteet sekä muu kulttuuriympäristö Metsähallituksen hallinoimilla alueilla, valtakunnallisesti merkittävät rakennetut kulttuuriympäristöt, maailmanperintökohteet, museotiet ja -sillat, rakennussuojelu, erityislaeilla suojellut rakennukset, valtakunnallisesti arvokkaat maisema-alueet, kansalliset kaupunkipuistot, historiallisen ajan kylätontit, perinnemaisemat ja -biotoopit', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/07', E'7', DEFAULT, E'DRAFT', DEFAULT, E'Liikenne', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Liikennejärjestelmän ja katuverkon toimivuusselvitykset, eri kulkumuotoja ja näiden jakaumaa koskevat selvitykset', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/08', E'8', DEFAULT, E'DRAFT', DEFAULT, E'Luonto ja luonnonvarat', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kasvi- ja eläinlajit, luonnon monimuotoisuus ja luonnonvarat. Luontoselvitykset: kasvillisuus, eläimistö, Natura 2000 -tarkastelut jne. Luonnontilaisten alueiden verkosto, koko, määrä, laatu ja yhtenäisyys, perinnebiotoopit. Luonnonvarat: käytön määrä ja kestävyys: kierrätys- ja uudelleen- käyttömahdollisuudet, jne', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/09', E'9', DEFAULT, E'DRAFT', DEFAULT, E'Palveluverkko', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Julkiset palvelut (etenkin kasvatus/sivistys, sote, kulttuuri- ja vapaa-aika), Kaupalliset palvelut (etenkin vähittäiskauppa)', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 17:44:45');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/10', E'10', DEFAULT, E'DRAFT', DEFAULT, E'Maa- ja kallioperä, maanpeite', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Maaperä- ja rakennettavuusselvitykset, maankamaran mekaaninen muuttaminen', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/11', E'11', DEFAULT, E'DRAFT', DEFAULT, E'Pohjakartta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'12', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/12', E'12', DEFAULT, E'DRAFT', E'building', E'Rakennukset ja rakenteet', E'byggnad', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/rakymp/c6', E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'13', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/13', E'13', DEFAULT, E'DRAFT', DEFAULT, E'Suunnitelmat', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1301', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/1301', E'14', E'13', E'DRAFT', E'area use plan', E'Alueidenkäytön suunnitelmat', E'områdesanvändningsplan', DEFAULT, E'kunnan tai maakunnan liiton tekemä suunnitelma alueiden käytöstä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/mrl/concept-204', E'2', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1302', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/1302', E'15', E'13', E'DRAFT', DEFAULT, E'Muut suunnitelmat', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'2', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'14', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/14', E'16', DEFAULT, E'DRAFT', DEFAULT, E'Työpaikat ja elinkeinoelämä', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Elinkeinot ja elinkeinorakenne', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 17:45:40');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'15', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/15', E'17', DEFAULT, E'DRAFT', DEFAULT, E'Vesi- ja jätehuolto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'16', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/16', E'18', DEFAULT, E'DRAFT', DEFAULT, E'Vesien hoito ja suojelu', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Hulevesi- ja tulvaselvitykset', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'17', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/17', E'19', DEFAULT, E'DRAFT', DEFAULT, E'Viestintäverkko', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'18', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/18', E'20', DEFAULT, E'DRAFT', DEFAULT, E'Virkistys ja viherrakenne', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Virkistyspalveluihin ja viherrakenteeseen liittyvät selvitykset', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 17:47:24');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'19', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/19', E'21', DEFAULT, E'DRAFT', DEFAULT, E'Väestö', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Väestörekisteri ja väestötilastot', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'20', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/20', E'22', DEFAULT, E'DRAFT', E'community structure', E'Yhdyskuntarakenne', E'samhällsstruktur', DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Rakennukset ja rakennelmat (MML, kunnat) Kiinteistötiedot (KTJ), Yhdyskuntarakenteen seurantajärjestelmä YKR, Taajama-alueet, Keskusta-alueet ja kaupan alueet', DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/mrl/concept-176', E'1', E'2020-12-11 15:39:18', E'2020-12-11 17:44:27');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'21', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/21', E'23', DEFAULT, E'DRAFT', DEFAULT, E'Yhdyskuntatalous', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Yhdyskuntatalous, esimerkiksi rakennusten ja infrastruktuurin rakentamisesta, käytöstä ja kunnossapidosta, maan hankinnasta ja myynnistä sekä palvelujen toteuttamisesta ja ylläpidosta aiheutuvat kustannukset ja tulot', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:39:18', E'2020-12-11 15:39:18');
-- ddl-end --
INSERT INTO koodistot.lahtoaineiston_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'22', E'http://uri.suomi.fi/codelist/rytj/RY_LahtotietoaineistonLaji/code/22', E'24', DEFAULT, E'DRAFT', DEFAULT, E'Muu lähtötietoaineisto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 17:48:08', E'2020-12-11 17:48:08');
-- ddl-end --

-- object: oikeusvaikutteisuuden_laji_kaava | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaava DROP CONSTRAINT IF EXISTS oikeusvaikutteisuuden_laji_kaava CASCADE;
ALTER TABLE kaavatiedot.kaava ADD CONSTRAINT oikeusvaikutteisuuden_laji_kaava FOREIGN KEY (id_oikeusvaikutteisuuden_laji)
REFERENCES koodistot.oikeusvaikutteisuuden_laji (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.osallistumis_ja_arviointisuunnitelma | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.osallistumis_ja_arviointisuunnitelma CASCADE;
CREATE TABLE kaavatiedot.osallistumis_ja_arviointisuunnitelma (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),
	CONSTRAINT osallistumis_ja_arviointisuunnitelma_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.versioitu_objekti_abstrakti);
-- ddl-end --

-- object: osallistumis_ja_arviointisuunnitelma_kaava | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaava DROP CONSTRAINT IF EXISTS osallistumis_ja_arviointisuunnitelma_kaava CASCADE;
ALTER TABLE kaavatiedot.kaava ADD CONSTRAINT osallistumis_ja_arviointisuunnitelma_kaava FOREIGN KEY (id_osallistumis_ja_arviointisuunnitelma)
REFERENCES kaavatiedot.osallistumis_ja_arviointisuunnitelma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaava_uq | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaava DROP CONSTRAINT IF EXISTS kaava_uq CASCADE;
ALTER TABLE kaavatiedot.kaava ADD CONSTRAINT kaava_uq UNIQUE (id_osallistumis_ja_arviointisuunnitelma);
-- ddl-end --

-- object: kaavan_laatija_kaava | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaava DROP CONSTRAINT IF EXISTS kaavan_laatija_kaava CASCADE;
ALTER TABLE kaavatiedot.kaava ADD CONSTRAINT kaavan_laatija_kaava FOREIGN KEY (id_kaavan_laatija)
REFERENCES kaavatiedot.kaavan_laatija (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.kaavamaarays | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.kaavamaarays CASCADE;
CREATE TABLE kaavatiedot.kaavamaarays (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	id_kaavamaarays_laji_ak integer NOT NULL,
	id_kaavan_elinkaaritila integer,
	id_kaavoitusteema_ak integer,
	voimassaolo_alku timestamp,
	voimassaolo_loppu timestamp,
	id_kaavakohde bigint,
	id_kaava bigint,
	CONSTRAINT kaavamaarays_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE kaavatiedot.kaavamaarays IS 'kaavaan sisältyvä velvoittava määräys, jolla ohjataan alueiden suunnittelua ja rakentamista.
Kaavoissa käytettävät kaavamääräysten lajit on yhteisesti sovittu. Määräys voi kohdistua joko yksittäiseen kaavakohteeseen tai koko kaavaan. Kaavamääräykseen voi sisältyä sen lajiin perustuvaa ohjausvaikutusta tarkentavia arvoja ja lisätietoja.';
-- ddl-end --

-- object: kaavamaarays_laji_ak_kaavamaarays | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavamaarays DROP CONSTRAINT IF EXISTS kaavamaarays_laji_ak_kaavamaarays CASCADE;
ALTER TABLE kaavatiedot.kaavamaarays ADD CONSTRAINT kaavamaarays_laji_ak_kaavamaarays FOREIGN KEY (id_kaavamaarays_laji_ak)
REFERENCES koodistot.kaavamaarays_laji_ak (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavan_elinkaaritila_kaavamaarays | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavamaarays DROP CONSTRAINT IF EXISTS kaavan_elinkaaritila_kaavamaarays CASCADE;
ALTER TABLE kaavatiedot.kaavamaarays ADD CONSTRAINT kaavan_elinkaaritila_kaavamaarays FOREIGN KEY (id_kaavan_elinkaaritila)
REFERENCES koodistot.kaavan_elinkaaritila (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavoitusteema_ak_kaavamaarays | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavamaarays DROP CONSTRAINT IF EXISTS kaavoitusteema_ak_kaavamaarays CASCADE;
ALTER TABLE kaavatiedot.kaavamaarays ADD CONSTRAINT kaavoitusteema_ak_kaavamaarays FOREIGN KEY (id_kaavoitusteema_ak)
REFERENCES koodistot.kaavoitusteema_ak (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.lisatieto | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.lisatieto CASCADE;
CREATE TABLE kaavatiedot.lisatieto (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	nimi varchar,
	id_lisatiedon_laji_ak integer,
	id_kaavamaarays bigint,
	CONSTRAINT lisatieto_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: koodistot.lisatiedon_laji_ak | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.lisatiedon_laji_ak CASCADE;
CREATE TABLE koodistot.lisatiedon_laji_ak (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT lisatiedon_laji_ak_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Käyttötarkoituksen osuus kerrosalasta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kuvaa yhden käyttötarkoituksen osuuden yhden tai usemman rakennuksen sallitusta kerrosalasta', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Käyttötarkoituskohdistus', DEFAULT, DEFAULT, E'kohdistaa liittyvän kaavamääryksen koskemaan ainoastaan lisätiedon arvona annettuja käyttötarkoituksia', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/03', E'3', DEFAULT, E'DRAFT', DEFAULT, E'Kohteen geometrian osa', DEFAULT, DEFAULT, E'liitetty arvo ilmaisee sen osan liittyvän kohteen geometriasta, jota kaavamääräys koskee.', DEFAULT, DEFAULT, E'Esim. se osa korttelin tai tontin rajaviivaa, johon rakennukset on rakennettava kiinni, tai osa yhtenä paikkatietokohteena määritellyn liikenneväylän viivaa.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/04', E'4', DEFAULT, E'DRAFT', DEFAULT, E'Poisluettava käyttötarkoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Annetut käyttötarkoitukset suljetaan pois kaavamääräyksen kuvaamista sallituista käyttötarkoituksista. Käytetään, mikäli on luontevampaa sulkea tiettyjä yksityiskohtaisia käyttötarkoituksia pois sallittujen joukosta kuin kuvata kaikki sallitut käyttötarkoitukset.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/05', E'5', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuurihistoriallinen merkittävyys', E'kulturhistorisk betydelse', DEFAULT, E'kohteesta muodostettu käsitys, joka perustuu kohteen kulttuurihistoriallisten arvojen ja kulttuuristen merkitysten analysointiin sekä sen suhteuttamiseen muihin vastaaviin kohteisiin', DEFAULT, DEFAULT, E'Kulttuurihistoriallinen merkittävyys voi olla kansainvälinen, valtakunnallinen, maakunnallinen, paikallinen tai vähäinen.', DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/rakkultymp/c15', E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/06', E'6', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuurihistoriallinen arvotyyppi', DEFAULT, DEFAULT, E'Kohteelle määritetyt kulttuurihistorialliset ominaisuudet', DEFAULT, DEFAULT, E'Kulttuurihistoriallisia ominaisuuksia ovat esimerkiksi rakennustaiteellinen, rakennustekninen, arkkitehtoninen ja maisemallinen.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/07', E'7', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuurihistoriallinen tyyppi', DEFAULT, DEFAULT, E'Kuvaa kohteen kulttuurihistoriallista käyttötarkoitusta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/08', E'8', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuurihistoriallisen merkittävyyden kriteerit', DEFAULT, DEFAULT, E'Kuvaa kulttuurihistoriallisen merkittävyyden kriteerejä, joita kohde edustaa.', DEFAULT, DEFAULT, E'Merkittävyys voi liittyä edustavuuteen, alkuperäisyyteen, harvinaisuuteen, tyypillisyyteen tai historialliseen merkittävyyteen.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/09', E'9', DEFAULT, E'DRAFT', DEFAULT, E'Ympäristöarvon peruste', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-11 15:10:24');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/10', E'10', DEFAULT, E'DRAFT', DEFAULT, E'Ympäristö- tai luontoarvon merkittävyys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:10:24', E'2020-12-17 09:20:33');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/11', E'11', DEFAULT, E'DRAFT', DEFAULT, E'Muu lisätiedon laji', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:20:54', E'2020-12-17 09:20:54');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'12', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/12', E'12', DEFAULT, E'DRAFT', DEFAULT, E'Lukumäärä per kerrosneliömetri', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kuvaa suureen arvon kutakin rakennuksen kerrosneliömetriä kohden.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-29 11:12:46', E'2020-12-29 11:12:46');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_ak (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'13', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_AK/code/13', E'13', DEFAULT, E'DRAFT', DEFAULT, E'Lukumäärä per asunto', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kuvaa suureen arvon kutakin rakennuksen asuntoa kohden.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-29 11:13:29', E'2020-12-29 11:13:29');
-- ddl-end --

-- object: koodistot.kaavan_kasittelytapahtuman_laji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kaavan_kasittelytapahtuman_laji CASCADE;
CREATE TABLE koodistot.kaavan_kasittelytapahtuman_laji (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT kaavan_kasittelytapahtuman_laji_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Kaavan ajanmukaisuuden arviointi', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavan ajanmukaisuus arvioidaan', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Kaavoitusaloitteen hyväksyminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/03', E'3', DEFAULT, E'DRAFT', DEFAULT, E'Kaavoituksen käynnistäminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/04', E'4', DEFAULT, E'DRAFT', DEFAULT, E'Kaavan vireilletulo', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaava-asia kuulutetaan vireille', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/05', E'5', DEFAULT, E'DRAFT', DEFAULT, E'Kaavan valmisteluaineiston nähtäville asettaminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavan valmisteluaineisto asetetaan nähtäville', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/06', E'6', DEFAULT, E'DRAFT', DEFAULT, E'Kaavaehdotuksen nähtäville asettaminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/07', E'7', DEFAULT, E'DRAFT', DEFAULT, E'Tarkistetun kaavaehdotuksen nähtäville asettaminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2021-01-13 19:44:13');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/08', E'8', DEFAULT, E'DRAFT', DEFAULT, E'Kaavaprosessin keskeyttäminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/09', E'9', DEFAULT, E'DRAFT', DEFAULT, E'Kaavan hyväksyminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/10', E'10', DEFAULT, E'DRAFT', DEFAULT, E'Kaavan hyväksyminen oikaisukehotuksen johdosta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavasta annettu oikaisukehotus käsitellään', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/11', E'11', DEFAULT, E'DRAFT', DEFAULT, E'Kaavan kumoaminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaavoitusprosessin myötä muutettava tai kumottava kaava kumoutuu', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'12', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/12', E'12', DEFAULT, E'DRAFT', DEFAULT, E'Valituksen vastineiden hyväksyminen', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --
INSERT INTO koodistot.kaavan_kasittelytapahtuman_laji (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'13', E'http://uri.suomi.fi/codelist/rytj/RY_KaavanKasittelytapahtumanLaji/code/13', E'13', DEFAULT, E'DRAFT', DEFAULT, E'Kaavan voimaantulo', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kaava saa lainvoiman voimaantulokuulutuksella', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 18:29:53', E'2020-12-11 18:29:53');
-- ddl-end --

-- object: lisatiedon_laji_ak_lisatieto | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.lisatieto DROP CONSTRAINT IF EXISTS lisatiedon_laji_ak_lisatieto CASCADE;
ALTER TABLE kaavatiedot.lisatieto ADD CONSTRAINT lisatiedon_laji_ak_lisatieto FOREIGN KEY (id_lisatiedon_laji_ak)
REFERENCES koodistot.lisatiedon_laji_ak (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.kaavaselostus | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.kaavaselostus CASCADE;
CREATE TABLE kaavatiedot.kaavaselostus (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	id_kaava bigint,

-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),
	CONSTRAINT kaavaselostus_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.versioitu_objekti_abstrakti);
-- ddl-end --

-- object: kaavatiedot.kaavakohde | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.kaavakohde CASCADE;
CREATE TABLE kaavatiedot.kaavakohde (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	liittyvan_lahtotietokohteen_tunnus varchar,
	id_sitovuuslaji integer,
	id_maanalaisuuden_laji integer,
	geom geometry(MULTISURFACEZ, 3067),
	id_kaava bigint NOT NULL,
	id_kaavakohde bigint,

-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),
	CONSTRAINT kaavakohde_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.versioitu_objekti_abstrakti);
-- ddl-end --
COMMENT ON TABLE kaavatiedot.kaavakohde IS 'kaavaan sisältyvä aluerajaus tai kohde, jonka alueella maankäyttöä tai rakentamista halutaan ohjata

Kaavakohteella on maantieteellinen sijainti ja muoto. Velvoittava ohjausvaikutus kuvataan liittyvien kaavamääräysten ja ei-velvoittava liittyvien kaavasuositusten avulla.';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.kaavakohde.liittyvan_lahtotietokohteen_tunnus IS 'viittaus kaavan lähtötietoaineistoon sisältyvään tietokohteeseen, joka liittyy kaavakohteeseen. Esim. pohjavesialue';
-- ddl-end --
COMMENT ON COLUMN kaavatiedot.kaavakohde.geom IS 'Kaikkien kaavaan liittyvien paikkatietokohteiden yhteinen abstrakti yläluokka. Kohteen geometria voi olla 2-ulotteinen piste, viiva tai alue, tai 3-ulotteinen kappale. Moniosaiset geometriat (multigeometry) ovat sallittuja. Haluttaessa korkeusulottuvuus voidaan ilmaista 2-ulotteisen geometria-attribuutin arvo ja pystysuuntainenRajaus-attribuutin kuvaamien korkeusvälien avulla, myös useampana erillisenä kerroksena. Tällöin kohteen ulottuvuus vastaa 3-ulotteista avaruusgeometriaa, joka muodostuu työntämällä 2-ulotteista pintaa ylös- ja/tai alaspäin annatun korkeusvälin rajoihin saakka. Huomaa, että Korkeusvali-luokan ylä- tai alaraja (korkeuden maksimi- tai minimiarvo) voi myös puuttua, jolloin kohde kattaa alueen ylöspäin tai alaspäin annetusta korkeudesta.';
-- ddl-end --

-- object: maanalaisuuden_laji_kaavakohde | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavakohde DROP CONSTRAINT IF EXISTS maanalaisuuden_laji_kaavakohde CASCADE;
ALTER TABLE kaavatiedot.kaavakohde ADD CONSTRAINT maanalaisuuden_laji_kaavakohde FOREIGN KEY (id_maanalaisuuden_laji)
REFERENCES koodistot.maanalaisuuden_laji (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.kaavasuositus | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.kaavasuositus CASCADE;
CREATE TABLE kaavatiedot.kaavasuositus (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	id_kaavan_elinkaaritila integer,
	id_kaavoitusteema_ak integer,
	voimassaolo_alku timestamp,
	voimassaolo_loppu timestamp,
	id_kaava bigint,
	id_kaavakohde bigint,
	CONSTRAINT kaavasuositus_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE kaavatiedot.kaavasuositus IS 'kaavaan sisältyvä ei-velvoittava ohje, joka ilmentää esimerkiksi toteutuksen tapaa ja tavoitetta.
Suositus voi kohdistua joko yksittäiseen kaavakohteeseen tai koko kaavaan. Kaavasuositukseen voi sisältyä sen ohjausvaikutusta tarkentavia arvoja.';
-- ddl-end --

-- object: kaavan_elinkaaritila_kaavasuositus | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavasuositus DROP CONSTRAINT IF EXISTS kaavan_elinkaaritila_kaavasuositus CASCADE;
ALTER TABLE kaavatiedot.kaavasuositus ADD CONSTRAINT kaavan_elinkaaritila_kaavasuositus FOREIGN KEY (id_kaavan_elinkaaritila)
REFERENCES koodistot.kaavan_elinkaaritila (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavoitusteema_ak_kaavasuositus | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavasuositus DROP CONSTRAINT IF EXISTS kaavoitusteema_ak_kaavasuositus CASCADE;
ALTER TABLE kaavatiedot.kaavasuositus ADD CONSTRAINT kaavoitusteema_ak_kaavasuositus FOREIGN KEY (id_kaavoitusteema_ak)
REFERENCES koodistot.kaavoitusteema_ak (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.korkeusvali | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.korkeusvali CASCADE;
CREATE TABLE kaavatiedot.korkeusvali (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	geom geometry(POINTZ, 3067),
	id_numeerinen_arvovali bigint,
	CONSTRAINT korkeusvali_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE kaavatiedot.korkeusvali IS 'Arvo, joka kuvaa kahden pystysuuntaisella koordinaatiston koordinaatin välistä janaa.';
-- ddl-end --

-- object: kaava_kaavakohde | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavakohde DROP CONSTRAINT IF EXISTS kaava_kaavakohde CASCADE;
ALTER TABLE kaavatiedot.kaavakohde ADD CONSTRAINT kaava_kaavakohde FOREIGN KEY (id_kaava)
REFERENCES kaavatiedot.kaava (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.tekstiarvo | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.tekstiarvo CASCADE;
CREATE TABLE kaavatiedot.tekstiarvo (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	arvo text,
	syntaksi varchar,
	id_tietoyksikko bigint,
	CONSTRAINT tekstiarvo_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: kaavatiedot.geometria_arvo | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.geometria_arvo CASCADE;
CREATE TABLE kaavatiedot.geometria_arvo (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	geom_polygon geometry(MULTISURFACEZ, 3067),
	geom_point geometry(MULTIPOINTZ, 3067),
	geom_line geometry(MULTILINESTRINGZ, 3067),
	id_tietoyksikko bigint,
	CONSTRAINT geometria_arvo_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: kaavatiedot.tunnusarvo | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.tunnusarvo CASCADE;
CREATE TABLE kaavatiedot.tunnusarvo (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	nimi varchar,
	rekisteri_tunnus varchar,
	id_tietoyksikko bigint,
	CONSTRAINT tunnusarvo_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: kaava_kaavaselostus | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavaselostus DROP CONSTRAINT IF EXISTS kaava_kaavaselostus CASCADE;
ALTER TABLE kaavatiedot.kaavaselostus ADD CONSTRAINT kaava_kaavaselostus FOREIGN KEY (id_kaava)
REFERENCES kaavatiedot.kaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaselostus_uq | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavaselostus DROP CONSTRAINT IF EXISTS kaavaselostus_uq CASCADE;
ALTER TABLE kaavatiedot.kaavaselostus ADD CONSTRAINT kaavaselostus_uq UNIQUE (id_kaava);
-- ddl-end --

-- object: kaava_kaavasuositus | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavasuositus DROP CONSTRAINT IF EXISTS kaava_kaavasuositus CASCADE;
ALTER TABLE kaavatiedot.kaavasuositus ADD CONSTRAINT kaava_kaavasuositus FOREIGN KEY (id_kaava)
REFERENCES kaavatiedot.kaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavalaji_kaava | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaava DROP CONSTRAINT IF EXISTS kaavalaji_kaava CASCADE;
ALTER TABLE kaavatiedot.kaava ADD CONSTRAINT kaavalaji_kaava FOREIGN KEY (id_kaavalaji)
REFERENCES koodistot.kaavalaji (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavan_elinkaaritila_kaava | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaava DROP CONSTRAINT IF EXISTS kaavan_elinkaaritila_kaava CASCADE;
ALTER TABLE kaavatiedot.kaava ADD CONSTRAINT kaavan_elinkaaritila_kaava FOREIGN KEY (id_kaavan_elinkaaritila)
REFERENCES koodistot.kaavan_elinkaaritila (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: asiakirjan_laji_asiakirja | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.asiakirja DROP CONSTRAINT IF EXISTS asiakirjan_laji_asiakirja CASCADE;
ALTER TABLE kaavatiedot.asiakirja ADD CONSTRAINT asiakirjan_laji_asiakirja FOREIGN KEY (id_asiakirjan_laji)
REFERENCES koodistot.asiakirjan_laji (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: lahtoaineiston_laji_lahtotietoaineisto | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.lahtotietoaineisto DROP CONSTRAINT IF EXISTS lahtoaineiston_laji_lahtotietoaineisto CASCADE;
ALTER TABLE kaavatiedot.lahtotietoaineisto ADD CONSTRAINT lahtoaineiston_laji_lahtotietoaineisto FOREIGN KEY (id_lahtoaineiston_laji)
REFERENCES koodistot.lahtoaineiston_laji (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavakohde_kaavasuositus | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavasuositus DROP CONSTRAINT IF EXISTS kaavakohde_kaavasuositus CASCADE;
ALTER TABLE kaavatiedot.kaavasuositus ADD CONSTRAINT kaavakohde_kaavasuositus FOREIGN KEY (id_kaavakohde)
REFERENCES kaavatiedot.kaavakohde (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavakohde_kaavamaarays | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavamaarays DROP CONSTRAINT IF EXISTS kaavakohde_kaavamaarays CASCADE;
ALTER TABLE kaavatiedot.kaavamaarays ADD CONSTRAINT kaavakohde_kaavamaarays FOREIGN KEY (id_kaavakohde)
REFERENCES kaavatiedot.kaavakohde (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaava_kaavamaarays | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavamaarays DROP CONSTRAINT IF EXISTS kaava_kaavamaarays CASCADE;
ALTER TABLE kaavatiedot.kaavamaarays ADD CONSTRAINT kaava_kaavamaarays FOREIGN KEY (id_kaava)
REFERENCES kaavatiedot.kaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaava_kaavan_kumoamistieto | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavan_kumoamistieto DROP CONSTRAINT IF EXISTS kaava_kaavan_kumoamistieto CASCADE;
ALTER TABLE kaavatiedot.kaavan_kumoamistieto ADD CONSTRAINT kaava_kaavan_kumoamistieto FOREIGN KEY (id_kaava)
REFERENCES kaavatiedot.kaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: sitovuuslaji_kaavakohde | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavakohde DROP CONSTRAINT IF EXISTS sitovuuslaji_kaavakohde CASCADE;
ALTER TABLE kaavatiedot.kaavakohde ADD CONSTRAINT sitovuuslaji_kaavakohde FOREIGN KEY (id_sitovuuslaji)
REFERENCES koodistot.sitovuuslaji (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: koodistot.lisatiedon_laji_yk | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.lisatiedon_laji_yk CASCADE;
CREATE TABLE koodistot.lisatiedon_laji_yk (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,

-- 	koodiarvo varchar,
-- 	uri varchar,
-- 	jarjestys smallint,
-- 	ylaluokka varchar,
-- 	status varchar,
-- 	nimi_en varchar,
-- 	nimi_fi varchar,
-- 	nimi_sv varchar,
-- 	maaritelma_en varchar,
-- 	maaritelma_fi varchar,
-- 	maaritelma_sv varchar,
-- 	kuvaus_en varchar,
-- 	kuvaus_fi varchar,
-- 	kuvaus_sv varchar,
-- 	nimilyhenne varchar,
-- 	sanasto_uri varchar,
-- 	hierarkiataso varchar,
-- 	tallennusaika timestamp,
-- 	viimeisin_muutos timestamp,
	CONSTRAINT lisatiedon_laji_yk_pk PRIMARY KEY (id)

)
 INHERITS(koodistot.koodilista_abstrakti);
-- ddl-end --

INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'1', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/01', E'1', DEFAULT, E'DRAFT', DEFAULT, E'Käyttötarkoituksen osuus kerrosalasta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Kuvaa yhden käyttötarkoituksen osuuden yhden tai usemman rakennuksen sallitusta kerrosalasta', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-11 15:13:35');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'2', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/02', E'2', DEFAULT, E'DRAFT', DEFAULT, E'Käyttötarkoituskohdistus', DEFAULT, DEFAULT, E'kohdistaa liittyvän kaavamääryksen koskemaan ainoastaan lisätiedon arvona annettuja käyttötarkoituksia', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-11 15:13:35');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'3', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/03', E'3', DEFAULT, E'DRAFT', DEFAULT, E'Kohteen geometrian osa', DEFAULT, DEFAULT, E'liitetty arvo ilmaisee sen osan liittyvän kohteen geometriasta, jota kaavamääräys koskee.', DEFAULT, DEFAULT, E'Esim. se osa korttelin tai tontin rajaviivaa, johon rakennukset on rakennettava kiinni, tai osa yhtenä paikkatietokohteena määritellyn liikenneväylän viivaa.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-11 15:13:35');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'4', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/04', E'4', DEFAULT, E'DRAFT', DEFAULT, E'Poisluettava käyttötarkoitus', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'Annetut käyttötarkoitukset suljetaan pois kaavamääräyksen kuvaamista sallituista käyttötarkoituksista. Käytetään, mikäli on luontevampaa sulkea tiettyjä yksityiskohtaisia käyttötarkoituksia pois sallittujen joukosta kuin kuvata kaikki sallitut käyttötarkoitukset.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-11 15:13:35');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'5', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/05', E'5', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuurihistoriallinen merkittävyys', E'kulturhistorisk betydelse', DEFAULT, E'kohteesta muodostettu käsitys, joka perustuu kohteen kulttuurihistoriallisten arvojen ja kulttuuristen merkitysten analysointiin sekä sen suhteuttamiseen muihin vastaaviin kohteisiin', DEFAULT, DEFAULT, E'Kulttuurihistoriallinen merkittävyys voi olla kansainvälinen, valtakunnallinen, maakunnallinen, paikallinen tai vähäinen.', DEFAULT, DEFAULT, E'http://uri.suomi.fi/terminology/rakkultymp/c15', E'1', E'2020-12-11 15:13:35', E'2020-12-11 15:13:35');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'6', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/06', E'6', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuurihistoriallinen arvotyyppi', DEFAULT, DEFAULT, E'Kohteelle määritetyt kulttuurihistorialliset ominaisuudet', DEFAULT, DEFAULT, E'Kulttuurihistoriallisia ominaisuuksia ovat esimerkiksi rakennustaiteellinen, rakennustekninen, arkkitehtoninen ja maisemallinen.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-11 15:13:35');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'7', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/07', E'7', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuurihistoriallinen tyyppi', DEFAULT, DEFAULT, E'Kuvaa kohteen kulttuurihistoriallista käyttötarkoitusta', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-11 15:13:35');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'8', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/08', E'8', DEFAULT, E'DRAFT', DEFAULT, E'Kulttuurihistoriallisen merkittävyyden kriteerit', DEFAULT, DEFAULT, E'Kuvaa kulttuurihistoriallisen merkittävyyden kriteerejä, joita kohde edustaa.', DEFAULT, DEFAULT, E'Merkittävyys voi liittyä edustavuuteen, alkuperäisyyteen, harvinaisuuteen, tyypillisyyteen tai historialliseen merkittävyyteen.', DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-11 15:13:35');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'9', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/09', E'9', DEFAULT, E'DRAFT', DEFAULT, E'Ympäristö- tai luontoarvon peruste', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-17 09:19:10');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'10', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/10', E'10', DEFAULT, E'DRAFT', DEFAULT, E'Ympäristö- tai luontoarvon merkittävyys', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-11 15:13:35', E'2020-12-17 09:19:37');
-- ddl-end --
INSERT INTO koodistot.lisatiedon_laji_yk (id, koodiarvo, uri, jarjestys, ylaluokka, status, nimi_en, nimi_fi, nimi_sv, maaritelma_en, maaritelma_fi, maaritelma_sv, kuvaus_en, kuvaus_fi, kuvaus_sv, nimilyhenne, sanasto_uri, hierarkiataso, tallennusaika, viimeisin_muutos) VALUES (DEFAULT, E'11', E'http://uri.suomi.fi/codelist/rytj/RY_LisatiedonLaji_YK/code/11', E'11', DEFAULT, E'DRAFT', DEFAULT, E'Muu lisätiedon laji', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, E'1', E'2020-12-17 09:19:58', E'2020-12-17 09:19:58');
-- ddl-end --

-- object: kaavatiedot.tietoyksikko | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.tietoyksikko CASCADE;
CREATE TABLE kaavatiedot.tietoyksikko (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	nimi varchar,
	id_kaavakohde bigint,
	id_lisatieto bigint,
	id_kaavamaarays bigint,
	id_kaavasuositus bigint,

-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),
	CONSTRAINT tietoyksikko_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.versioitu_objekti_abstrakti);
-- ddl-end --

-- object: tietoyksikko_tekstiarvo | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.tekstiarvo DROP CONSTRAINT IF EXISTS tietoyksikko_tekstiarvo CASCADE;
ALTER TABLE kaavatiedot.tekstiarvo ADD CONSTRAINT tietoyksikko_tekstiarvo FOREIGN KEY (id_tietoyksikko)
REFERENCES kaavatiedot.tietoyksikko (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavasuositus_asiakirja | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.asiakirja DROP CONSTRAINT IF EXISTS kaavasuositus_asiakirja CASCADE;
ALTER TABLE kaavatiedot.asiakirja ADD CONSTRAINT kaavasuositus_asiakirja FOREIGN KEY (id_kaavasuositus)
REFERENCES kaavatiedot.kaavasuositus (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaselostus_asiakirja | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.asiakirja DROP CONSTRAINT IF EXISTS kaavaselostus_asiakirja CASCADE;
ALTER TABLE kaavatiedot.asiakirja ADD CONSTRAINT kaavaselostus_asiakirja FOREIGN KEY (id_kaavaselostus)
REFERENCES kaavatiedot.kaavaselostus (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: osallistumis_ja_arviointisuunnitelma_asiakirja | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.asiakirja DROP CONSTRAINT IF EXISTS osallistumis_ja_arviointisuunnitelma_asiakirja CASCADE;
ALTER TABLE kaavatiedot.asiakirja ADD CONSTRAINT osallistumis_ja_arviointisuunnitelma_asiakirja FOREIGN KEY (id_osallistumis_ja_arviointisuunnitelma)
REFERENCES kaavatiedot.osallistumis_ja_arviointisuunnitelma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavamaarays_asiakirja | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.asiakirja DROP CONSTRAINT IF EXISTS kaavamaarays_asiakirja CASCADE;
ALTER TABLE kaavatiedot.asiakirja ADD CONSTRAINT kaavamaarays_asiakirja FOREIGN KEY (id_kaavamaarays)
REFERENCES kaavatiedot.kaavamaarays (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tietoyksikko_geometria_arvo | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.geometria_arvo DROP CONSTRAINT IF EXISTS tietoyksikko_geometria_arvo CASCADE;
ALTER TABLE kaavatiedot.geometria_arvo ADD CONSTRAINT tietoyksikko_geometria_arvo FOREIGN KEY (id_tietoyksikko)
REFERENCES kaavatiedot.tietoyksikko (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tietoyksikko_tunnusarvo | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.tunnusarvo DROP CONSTRAINT IF EXISTS tietoyksikko_tunnusarvo CASCADE;
ALTER TABLE kaavatiedot.tunnusarvo ADD CONSTRAINT tietoyksikko_tunnusarvo FOREIGN KEY (id_tietoyksikko)
REFERENCES kaavatiedot.tietoyksikko (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.ajanhetki | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.ajanhetki CASCADE;
CREATE TABLE kaavatiedot.ajanhetki (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	arvo timestamp,
	id_tietoyksikko bigint,
	CONSTRAINT ajanhetki_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: kaavatiedot.aikavali | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.aikavali CASCADE;
CREATE TABLE kaavatiedot.aikavali (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	alku timestamp,
	loppu timestamp,
	id_tietoyksikko bigint,
	CONSTRAINT aikavali_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: tietoyksikko_aikavali | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.aikavali DROP CONSTRAINT IF EXISTS tietoyksikko_aikavali CASCADE;
ALTER TABLE kaavatiedot.aikavali ADD CONSTRAINT tietoyksikko_aikavali FOREIGN KEY (id_tietoyksikko)
REFERENCES kaavatiedot.tietoyksikko (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.koodiarvo | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.koodiarvo CASCADE;
CREATE TABLE kaavatiedot.koodiarvo (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	koodistotunnus varchar,
	otsikko varchar,
	id_tietoyksikko bigint,
	CONSTRAINT koodiarvo_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: tietoyksikko_koodiarvo | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.koodiarvo DROP CONSTRAINT IF EXISTS tietoyksikko_koodiarvo CASCADE;
ALTER TABLE kaavatiedot.koodiarvo ADD CONSTRAINT tietoyksikko_koodiarvo FOREIGN KEY (id_tietoyksikko)
REFERENCES kaavatiedot.tietoyksikko (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.numeerinen_arvo | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.numeerinen_arvo CASCADE;
CREATE TABLE kaavatiedot.numeerinen_arvo (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	arvo numeric,
	mittayksikko varchar,
	id_tietoyksikko bigint,
	CONSTRAINT numeerinen_arvo_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: kaavatiedot.numeerinen_arvovali | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.numeerinen_arvovali CASCADE;
CREATE TABLE kaavatiedot.numeerinen_arvovali (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	minimiarvo numeric,
	maksimiarvo numeric,
	mittayksikko varchar,
	id_tietoyksikko bigint,
	CONSTRAINT numeerinen_arvovali_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: tietoyksikko_numeerinen_arvo | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.numeerinen_arvo DROP CONSTRAINT IF EXISTS tietoyksikko_numeerinen_arvo CASCADE;
ALTER TABLE kaavatiedot.numeerinen_arvo ADD CONSTRAINT tietoyksikko_numeerinen_arvo FOREIGN KEY (id_tietoyksikko)
REFERENCES kaavatiedot.tietoyksikko (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tietoyksikko_numeerinen_arvovali | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.numeerinen_arvovali DROP CONSTRAINT IF EXISTS tietoyksikko_numeerinen_arvovali CASCADE;
ALTER TABLE kaavatiedot.numeerinen_arvovali ADD CONSTRAINT tietoyksikko_numeerinen_arvovali FOREIGN KEY (id_tietoyksikko)
REFERENCES kaavatiedot.tietoyksikko (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: numeerinen_arvovali_korkeusvali | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.korkeusvali DROP CONSTRAINT IF EXISTS numeerinen_arvovali_korkeusvali CASCADE;
ALTER TABLE kaavatiedot.korkeusvali ADD CONSTRAINT numeerinen_arvovali_korkeusvali FOREIGN KEY (id_numeerinen_arvovali)
REFERENCES kaavatiedot.numeerinen_arvovali (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.korkeuspiste | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.korkeuspiste CASCADE;
CREATE TABLE kaavatiedot.korkeuspiste (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	geom geometry(POINTZ, 3067),
	id_numeerinen_arvo bigint,
	CONSTRAINT korkeuspiste_pk PRIMARY KEY (id)

);
-- ddl-end --

-- object: numeerinen_arvo_korkeuspiste | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.korkeuspiste DROP CONSTRAINT IF EXISTS numeerinen_arvo_korkeuspiste CASCADE;
ALTER TABLE kaavatiedot.korkeuspiste ADD CONSTRAINT numeerinen_arvo_korkeuspiste FOREIGN KEY (id_numeerinen_arvo)
REFERENCES kaavatiedot.numeerinen_arvo (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavakohde_kaavakohde | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kaavakohde DROP CONSTRAINT IF EXISTS kaavakohde_kaavakohde CASCADE;
ALTER TABLE kaavatiedot.kaavakohde ADD CONSTRAINT kaavakohde_kaavakohde FOREIGN KEY (id_kaavakohde)
REFERENCES kaavatiedot.kaavakohde (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: asiakirja_asiakirja | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.asiakirja DROP CONSTRAINT IF EXISTS asiakirja_asiakirja CASCADE;
ALTER TABLE kaavatiedot.asiakirja ADD CONSTRAINT asiakirja_asiakirja FOREIGN KEY (id_asiakirja)
REFERENCES kaavatiedot.asiakirja (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavakohde_tietoyksikko | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.tietoyksikko DROP CONSTRAINT IF EXISTS kaavakohde_tietoyksikko CASCADE;
ALTER TABLE kaavatiedot.tietoyksikko ADD CONSTRAINT kaavakohde_tietoyksikko FOREIGN KEY (id_kaavakohde)
REFERENCES kaavatiedot.kaavakohde (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tietoyksikko_ajanhetki | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.ajanhetki DROP CONSTRAINT IF EXISTS tietoyksikko_ajanhetki CASCADE;
ALTER TABLE kaavatiedot.ajanhetki ADD CONSTRAINT tietoyksikko_ajanhetki FOREIGN KEY (id_tietoyksikko)
REFERENCES kaavatiedot.tietoyksikko (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: lisatieto_tietoyksikko | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.tietoyksikko DROP CONSTRAINT IF EXISTS lisatieto_tietoyksikko CASCADE;
ALTER TABLE kaavatiedot.tietoyksikko ADD CONSTRAINT lisatieto_tietoyksikko FOREIGN KEY (id_lisatieto)
REFERENCES kaavatiedot.lisatieto (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavamaarays_tietoyksikko | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.tietoyksikko DROP CONSTRAINT IF EXISTS kaavamaarays_tietoyksikko CASCADE;
ALTER TABLE kaavatiedot.tietoyksikko ADD CONSTRAINT kaavamaarays_tietoyksikko FOREIGN KEY (id_kaavamaarays)
REFERENCES kaavatiedot.kaavamaarays (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavasuositus_tietoyksikko | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.tietoyksikko DROP CONSTRAINT IF EXISTS kaavasuositus_tietoyksikko CASCADE;
ALTER TABLE kaavatiedot.tietoyksikko ADD CONSTRAINT kaavasuositus_tietoyksikko FOREIGN KEY (id_kaavasuositus)
REFERENCES kaavatiedot.kaavasuositus (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.tapahtuma_abstrakti | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.tapahtuma_abstrakti CASCADE;
CREATE TABLE kaavatiedot.tapahtuma_abstrakti (
	nimi varchar,
	tapahtuma_aika timestamp,
	kuvaus varchar,
	sijainti geometry(MULTISURFACEZ, 3067),
	lisatietolinkki varchar,
	peruttu boolean DEFAULT FALSE
-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),

)
 INHERITS(kaavatiedot.versioitu_objekti_abstrakti);
-- ddl-end --

-- object: kaavatiedot.kasittelytapahtuma | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.kasittelytapahtuma CASCADE;
CREATE TABLE kaavatiedot.kasittelytapahtuma (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	id_kaavan_kasittelytapahtuman_laji integer,
	id_kaava bigint,

-- 	nimi varchar,
-- 	tapahtuma_aika timestamp,
-- 	kuvaus varchar,
-- 	sijainti geometry(MULTISURFACEZ, 3067),
-- 	lisatietolinkki varchar,
-- 	peruttu boolean DEFAULT FALSE,
-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),
	CONSTRAINT kasittelytapahtuma_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.tapahtuma_abstrakti);
-- ddl-end --

-- object: kaavan_kasittelytapahtuman_laji_kasittelytapahtuma | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kasittelytapahtuma DROP CONSTRAINT IF EXISTS kaavan_kasittelytapahtuman_laji_kasittelytapahtuma CASCADE;
ALTER TABLE kaavatiedot.kasittelytapahtuma ADD CONSTRAINT kaavan_kasittelytapahtuman_laji_kasittelytapahtuma FOREIGN KEY (id_kaavan_kasittelytapahtuman_laji)
REFERENCES koodistot.kaavan_kasittelytapahtuman_laji (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavatiedot.vuorovaikutustapahtuma | type: TABLE --
-- DROP TABLE IF EXISTS kaavatiedot.vuorovaikutustapahtuma CASCADE;
CREATE TABLE kaavatiedot.vuorovaikutustapahtuma (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	id_kaavan_vuorovaikutustapahtuman_laji integer,
	id_kaava bigint,

-- 	nimi varchar,
-- 	tapahtuma_aika timestamp,
-- 	kuvaus varchar,
-- 	sijainti geometry(MULTISURFACEZ, 3067),
-- 	lisatietolinkki varchar,
-- 	peruttu boolean DEFAULT FALSE,
-- 	nimiavaruus varchar,
-- 	viittaustunnus varchar,
-- 	identiteettitunnus varchar,
-- 	tuottajakohtainen_tunnus varchar,
-- 	viimeisin_muutos timestamp DEFAULT now(),
-- 	tallennusaika timestamp DEFAULT now(),
	CONSTRAINT vuorovaikutustapahtuma_pk PRIMARY KEY (id)

)
 INHERITS(kaavatiedot.tapahtuma_abstrakti);
-- ddl-end --

-- object: kaavan_vuorovaikutustapahtuman_laji_vuorovaikutus_d41d8c | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.vuorovaikutustapahtuma DROP CONSTRAINT IF EXISTS kaavan_vuorovaikutustapahtuman_laji_vuorovaikutus_d41d8c CASCADE;
ALTER TABLE kaavatiedot.vuorovaikutustapahtuma ADD CONSTRAINT kaavan_vuorovaikutustapahtuman_laji_vuorovaikutus_d41d8c FOREIGN KEY (id_kaavan_vuorovaikutustapahtuman_laji)
REFERENCES koodistot.kaavan_vuorovaikutustapahtuman_laji (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: vuorovaikutustapahtuma_asiakirja | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.asiakirja DROP CONSTRAINT IF EXISTS vuorovaikutustapahtuma_asiakirja CASCADE;
ALTER TABLE kaavatiedot.asiakirja ADD CONSTRAINT vuorovaikutustapahtuma_asiakirja FOREIGN KEY (id_vuorovaikutustapahtuma)
REFERENCES kaavatiedot.vuorovaikutustapahtuma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kasittelytapahtuma_asiakirja | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.asiakirja DROP CONSTRAINT IF EXISTS kasittelytapahtuma_asiakirja CASCADE;
ALTER TABLE kaavatiedot.asiakirja ADD CONSTRAINT kasittelytapahtuma_asiakirja FOREIGN KEY (id_kasittelytapahtuma)
REFERENCES kaavatiedot.kasittelytapahtuma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaava_vuorovaikutustapahtuma | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.vuorovaikutustapahtuma DROP CONSTRAINT IF EXISTS kaava_vuorovaikutustapahtuma CASCADE;
ALTER TABLE kaavatiedot.vuorovaikutustapahtuma ADD CONSTRAINT kaava_vuorovaikutustapahtuma FOREIGN KEY (id_kaava)
REFERENCES kaavatiedot.kaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaava_kasittelytapahtuma | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.kasittelytapahtuma DROP CONSTRAINT IF EXISTS kaava_kasittelytapahtuma CASCADE;
ALTER TABLE kaavatiedot.kasittelytapahtuma ADD CONSTRAINT kaava_kasittelytapahtuma FOREIGN KEY (id_kaava)
REFERENCES kaavatiedot.kaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavamaarays_lisatieto | type: CONSTRAINT --
-- ALTER TABLE kaavatiedot.lisatieto DROP CONSTRAINT IF EXISTS kaavamaarays_lisatieto CASCADE;
ALTER TABLE kaavatiedot.lisatieto ADD CONSTRAINT kaavamaarays_lisatieto FOREIGN KEY (id_kaavamaarays)
REFERENCES kaavatiedot.kaavamaarays (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


