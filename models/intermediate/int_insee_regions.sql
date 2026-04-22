--regroupement de l'ensemble des DROM sous la variable 'DROM'
with region_temp as (
    select 
        EMPLOIS_TOTAL,
        case 
            when REGION in ('Martinique','La Réunion','Guyane','Guadeloupe','Mayotte') --ajout de Mayotte non présent côté INSEE
            then 'DROM' 
            when REGION = 'Nouvelle Aquitaine'
            then 'Nouvelle-Aquitaine' --renommage région pour liaison avec données openclassrooms
            else REGION
        end as REGION_FINALE
    from {{ ref('stg_insee_emplois_regions_2024') }} 

),

-- calcul du total des emplois suite au regroupement des DROM
    region_temp_2 as (
    select 
        REGION_FINALE,
        sum(EMPLOIS_TOTAL) as EMPLOIS_TOTAL 
    from region_temp
    group by REGION_FINALE
)

-- calcul du pourcentage des emplois par région
select 
    REGION_FINALE,
    2024 as ANNEE, --ajout variable 2024 pour liaison avec les années
    round(EMPLOIS_TOTAL * 100.0 / sum(EMPLOIS_TOTAL) OVER (),2) as POURCENTAGE_REGION_INSEE
from region_temp_2