# -*- coding: utf-8 -*-
"""
Created on Thu Jul 15 09:13:51 2021

@author: Topi Tjukanov
"""

import pandas as pd


codelists = [
    'RY_LahtotietoaineistonLaji', 
    'RY_AsiakirjanLaji_YKAK',
    'RY_OikeusvaikutteisuudenLaji',
    'RY_Kaavalaji',
    'RY_KaavanElinkaaritila',
    'RY_Sitovuuslaji',
    'RY_MaanalaisuudenLaji',
    'RY_DigitaalinenAlkupera',
    'RY_YmparistomuutoksenLaji_YK',
    'RY_Kaavoitusteema_AK',
    'RY_Kaavoitusteema_YK',
    'RY_KaavamaaraysLaji_AK',
    'RY_KaavamaaraysLaji_YK',
    'RY_LisatiedonLaji_AK',
    'RY_LisatiedonLaji_YK',
    'RY_KaavanKasittelytapahtumanLaji',
    'RY_KaavanVuorovaikutustapahtumanLaji']


baseURL = 'https://koodistot.suomi.fi/codelist-api/api/v1/coderegistries/rytj/codeschemes/'
endURL = '/codes/?format=csv'


for theme in codelists:

    codelistURL = baseURL + theme + endURL
    df = pd.read_csv(codelistURL)
    
    columnMapping = {
    '':'id',
    'CODEVALUE':'koodiarvo',
    'URI':'uri', 
    'ORDER':'jarjestys', 
    'BROADER':'ylaluokka', 
    'STATUS':'status', 
    'PREFLABEL_EN':'nimi_en', 
    'PREFLABEL_FI':'nimi_fi', 
    'PREFLABEL_SV':'nimi_sv', 
    'DEFINITION_EN':'maaritelma_en', 
    'DEFINITION_FI':'maaritelma_fi', 
    'DEFINITION_SV':'maaritelma_sv', 
    'DESCRIPTION_EN':'kuvaus_en', 
    'DESCRIPTION_FI':'kuvaus_fi', 
    'DESCRIPTION_SV':'kuvaus_sv', 
    'SHORTNAME':'nimilyhenne', 
    'CONCEPTURI':'sanasto_uri', 
    'HIERARCHYLEVEL':'hierarkiataso', 
    'CREATED':'tallennusaika', 
    'MODIFIED':'viimeisin_muutos'}

    for i in iter(columnMapping.items()):
        if i[0] in df.columns:
            pass
        else:
            df.insert(0, i[1], '', False)

    
    df.rename(columns = columnMapping, inplace = True)
    df = df[columnMapping.values()]
            
    df.to_csv(theme + '.csv', sep=';', index = False)
