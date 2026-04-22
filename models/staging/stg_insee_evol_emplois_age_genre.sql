--modif types de données en number et retrait des autres valeurs non numériques pour emplois total et les années

select 
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("ANNEE"),'[^0-9]+','')) AS ANNEE,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("F_15_24"),'[^0-9]+','')) AS F_15_24,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("H_15_24"),'[^0-9]+','')) AS H_15_24,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("E_15_24"),'[^0-9]+','')) AS E_15_24,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("F_25_49"),'[^0-9]+','')) AS F_25_49,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("H_25_49"),'[^0-9]+','')) AS H_25_49,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("E_25_49"),'[^0-9]+','')) AS E_25_49,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("F_50_64"),'[^0-9]+','')) AS F_50_64,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("H_50_64"),'[^0-9]+','')) AS H_50_64,
    TRY_TO_NUMBER(REGEXP_REPLACE(TRIM("E_50_64"),'[^0-9]+','')) AS E_50_64,
 from {{ source('snowflake','INSEE_EMPLOIS_AGE_GENRE')}}
 WHERE LENGTH(REGEXP_REPLACE(TRIM("ANNEE"), '[^0-9]+', '')) = 4 --selection des données avec 4 caractères (les années)