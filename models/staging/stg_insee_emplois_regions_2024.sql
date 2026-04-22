--modif types de données en number et retrait des autres valeurs non numériques pour emplois total
select 
    REGION,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("EMPLOIS_TOTAL"),'[^0-9]+','')) AS EMPLOIS_TOTAL,
from {{ source('snowflake','INSEE_EMPLOIS_REGIONS_2024')}}
WHERE REGION IN ('Martinique','La Réunion','Guyane','Guadeloupe','Mayotte','Bourgogne-Franche-Comté','Normandie','Centre-Val de Loire','Pays de la Loire','Bretagne','Provence-Alpes-Côte d''Azur','Nouvelle Aquitaine','Corse','Occitanie','Grand Est','Hauts-de-France','Auvergne-Rhône-Alpes','Île-de-France')
and EMPLOIS_TOTAL is not null