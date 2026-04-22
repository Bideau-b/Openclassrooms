--chargement table openclassroom pour les données "age"

with age_open as (

    select
        POURCENTAGE_AGE_OPENCLASSROOM,
        FOURCHETTE_AGE_REGROUPEE,
        ANNEE_DEBUT_FORMATION
    from {{ ref('int_open_age') }}

),

--chargement table INSEE pour les données "age"

age_insee as (
    
    select
        TRANCHE_AGE,
        ANNEE,
        POURCENTAGE_AGE_INSEE
    from {{ ref('int_insee_age') }}

)

-- jointure des données openclassrooms avec ceux de l'INSEE sur les tranches d'ages

select  
    POURCENTAGE_AGE_OPENCLASSROOM,
    POURCENTAGE_AGE_INSEE,
    TRANCHE_AGE,
    ANNEE_DEBUT_FORMATION,
    ANNEE
from age_open ao
left join age_insee ai on ao.FOURCHETTE_AGE_REGROUPEE = ai.TRANCHE_AGE --jointure tranches d'ages
where ANNEE_DEBUT_FORMATION=ANNEE --selection et liaison des années de 2022 à 2025