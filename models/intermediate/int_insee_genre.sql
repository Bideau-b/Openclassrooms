select 
        round(sum(NOMBRE_PERSONNES) * 100.0 / sum(sum(NOMBRE_PERSONNES)) over (Partition by ANNEE),2) as POURCENTAGE_GENRE_INSEE,
        GENRE,
        ANNEE
from {{ ref('int_insee_genre_age_trt') }}
WHERE GENRE<>'Ensemble'
GROUP BY GENRE,ANNEE