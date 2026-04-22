-- Calcul de la somme des emplois et selection des tranches d'ages par an

with age_insee_temp as (
    
    select 
        sum(NOMBRE_PERSONNES) as SOMME_PERSONNES,
        TRANCHE_AGE,
        ANNEE
    from {{ ref('int_insee_genre_age_trt') }}
    WHERE GENRE ='Ensemble' and TRANCHE_AGE in ('15-24 ans','25-49 ans','50-64 ans') --selection de tous les genres et les tranches d'ages souhaitées
    GROUP BY TRANCHE_AGE,ANNEE

    )

-- Calcul du pourcentage des emplois par tranches d'ages et par an

select
    TRANCHE_AGE,
    ANNEE,
    round(SOMME_PERSONNES * 100.0 / sum(SOMME_PERSONNES) over (Partition by ANNEE),2) as POURCENTAGE_AGE_INSEE
from age_insee_temp
