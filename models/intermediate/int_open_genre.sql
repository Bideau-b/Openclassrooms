-- calcul du pourcentage d'étudiants par genre et par an (sans les doublons de formations)

select
        round(count(distinct USER_ID)* 100 / sum(count(distinct USER_ID)) over (Partition by ANNEE_DEBUT_FORMATION),2) as POURCENTAGE_GENRE_OPENCLASSROOM,
        GENRE,
        ANNEE_DEBUT_FORMATION
from {{ ref('stg_openclassrooms') }}
WHERE GENRE<>'unknown' --On retire les données non remplis par les étudiants
GROUP BY GENRE,ANNEE_DEBUT_FORMATION
