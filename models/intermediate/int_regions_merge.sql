--chargement table openclassroom pour les données "régions"

with regions_open as (

    select
        REGION,
        POURCENTAGE_REGION_OPENCLASSROOM,
        ANNEE_DEBUT_FORMATION
    from {{ ref('int_open_regions') }}

),

--chargement table insee pour les données "régions"

regions_insee as (
    
    select 
        REGION_FINALE,
        POURCENTAGE_REGION_INSEE,
        ANNEE
    from {{ ref('int_insee_regions') }}

)

-- jointure des données openclassrooms avec ceux de l'INSEE sur les régions

select  
    POURCENTAGE_REGION_OPENCLASSROOM,
    POURCENTAGE_REGION_INSEE,
    REGION, 
    REGION_FINALE,
    ANNEE_DEBUT_FORMATION,
    ANNEE
from regions_open ro
left join regions_insee ri on ro.REGION = ri.REGION_FINALE --jointure régions
where ANNEE_DEBUT_FORMATION=ANNEE --liaison avec l'année 2024