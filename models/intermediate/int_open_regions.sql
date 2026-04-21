select
    round(count(distinct USER_ID) * 100.0 / sum(count(distinct USER_ID)) over (Partition by ANNEE_DEBUT_FORMATION),2) as POURCENTAGE_REGION_OPENCLASSROOM, 
    REGION,
    ANNEE_DEBUT_FORMATION
from {{ ref('stg_openclassrooms') }}
WHERE ANNEE_DEBUT_FORMATION = 2024
GROUP BY REGION,ANNEE_DEBUT_FORMATION
