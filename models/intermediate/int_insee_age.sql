with age_insee_temp as (
    
    select 
        sum(NOMBRE_PERSONNES) as SOMME_PERSONNES,
        TRANCHE_AGE,
        ANNEE
    from {{ ref('int_insee_genre_age_trt') }}
    WHERE GENRE ='Ensemble' and TRANCHE_AGE in ('15-24 ans','25-49 ans','50-64 ans')
    GROUP BY TRANCHE_AGE,ANNEE

    )

select
    TRANCHE_AGE,
    ANNEE,
    round(SOMME_PERSONNES * 100.0 / sum(SOMME_PERSONNES) over (Partition by ANNEE),2) as POURCENTAGE_AGE_INSEE
from age_insee_temp
