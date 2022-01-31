# RYTJ
**1. Kaavatietomallin luontiin tarkoitetut skriptit ja pgModeler malli**

Toteutettu PostgreSQL 13+ & PostGIS 3+. 

Dokumentaatio:
https://kaavatietomalli.fi/

**2. Espoon ja Valkeakosken testiasemakaavat**

- Valkeakoski lisätty 26.1.2022
- Espoo lisätty 31.1.2022

Testiaineistot löytyvät Esimerkkiaineistot-kansiosta sql-dumppina. Lähtödatana on käytetty DXF-aineistoja ja kaavakartan (pdf) sisältämiä tietoja. Tiedot on digitoitu uudelleen QGIS-ohjelmistolla ja täytetty saatavilla olevat tiedot kaavatietomallin mukaisesti PostGISiin, josta otettu datadumppi. Testidata ei sisällä versiointitunnuksia (koska niitä ei ole vielä saatavilla). Testidata ei sisällä myöskään kaavan elinkaaren tilan muutoksia.

Lähtödatat:
- Valkeakosken Tanssilavan asemakaavan pdf https://www.valkeakoski.fi/uploads/2021/07/5370e105-522_tanssilavan-asemakaava_ehdotusvaihe_.pdf
- Espoo Tapiolan keskus asemakaavamuutos 210431 (AK. 12:82)



