-- calcul du pourcentage d'étudiants par régions sur l'année 2024

select
    round(count(USER_ID) * 100.0 / sum(count(USER_ID)) over (Partition by ANNEE_DEBUT_FORMATION),2) as POURCENTAGE_REGION_OPENCLASSROOM, 
    REGION,
    ANNEE_DEBUT_FORMATION
from {{ ref('stg_openclassrooms') }}
WHERE ANNEE_DEBUT_FORMATION = 2024 --filtre sur l'année
GROUP BY REGION,ANNEE_DEBUT_FORMATION
