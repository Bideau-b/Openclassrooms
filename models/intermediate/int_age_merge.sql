with age_open as (

    select
        POURCENTAGE_AGE_OPENCLASSROOM,
        FOURCHETTE_AGE_REGROUPEE,
        ANNEE_DEBUT_FORMATION
    from {{ ref('int_open_age') }}

),

age_insee as (
    
    select
        TRANCHE_AGE,
        ANNEE,
        POURCENTAGE_AGE_INSEE
    from {{ ref('int_insee_age') }}

)


select  
    POURCENTAGE_AGE_OPENCLASSROOM,
    POURCENTAGE_AGE_INSEE,
    TRANCHE_AGE,
    ANNEE_DEBUT_FORMATION,
    ANNEE
from age_open ao
left join age_insee ai on ao.FOURCHETTE_AGE_REGROUPEE = ai.TRANCHE_AGE
where ANNEE_DEBUT_FORMATION=ANNEE