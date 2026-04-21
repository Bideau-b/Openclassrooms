with region_temp as (
    select 
        EMPLOIS_TOTAL,
        case 
            when REGION in ('Martinique','La Réunion','Guyane','Guadeloupe','Mayotte')
            then 'DROM'
            else REGION
        end as REGION_FINALE
    from {{ ref('stg_insee_emplois_regions_2024') }} 
    WHERE EMPLOIS_TOTAL IS NOT NULL

),

    region_temp_2 as (
    select 
        REGION_FINALE,
        sum(EMPLOIS_TOTAL) as EMPLOIS_TOTAL
    from region_temp
    group by REGION_FINALE
)

select 
    REGION_FINALE,
    2024 as ANNEE,
    round(EMPLOIS_TOTAL * 100.0 / sum(EMPLOIS_TOTAL) OVER (),2) as POURCENTAGE_REGION_INSEE
from region_temp_2