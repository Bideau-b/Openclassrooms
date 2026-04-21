select 
    ANNEE,
    'F' AS GENRE,
    '15-24 ans' AS TRANCHE_AGE,
    F_15_24 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}

union all

select 
    ANNEE,
    'M' AS GENRE,
    '15-24 ans' AS TRANCHE_AGE,
    H_15_24 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}

union all

select 
    ANNEE,
    'Ensemble' AS GENRE,
    '15-24 ans' AS TRANCHE_AGE,
    E_15_24 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}

union all

select 
    ANNEE,
    'F' AS GENRE,
    '25-49 ans' AS TRANCHE_AGE,
    F_25_49 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}

union all

select 
    ANNEE,
    'M' AS GENRE,
    '25-49 ans' AS TRANCHE_AGE,
    H_25_49 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}

union all

select 
    ANNEE,
    'Ensemble' AS GENRE,
    '25-49 ans' AS TRANCHE_AGE,
    E_25_49 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}

union all

select 
    ANNEE,
    'F' AS GENRE,
    '50-64 ans' AS TRANCHE_AGE,
    F_50_64 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}

union all

select 
    ANNEE,
    'M' AS GENRE,
    '50-64 ans' AS TRANCHE_AGE,
    H_50_64 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}

union all

select 
    ANNEE,
    'Ensemble' AS GENRE,
    '50-64 ans' AS TRANCHE_AGE,
    E_50_64 AS NOMBRE_PERSONNES
from {{ ref('stg_insee_evol_emplois_age_genre') }}