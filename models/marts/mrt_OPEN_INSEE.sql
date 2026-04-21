with age_merge as (
        select  
        *,
        'LIAISON' as LIEN
        from {{ ref('int_age_merge') }}
    ),

    genre_merge as (
        select
        *
        from {{ ref('int_genre_merge') }} 
    ),
    
    regions_merge as (
        select
        *
        from {{ ref('int_regions_merge') }}
    ),

    quantite_parcours as (
        select
        *
        from  {{ ref('int_quantite_parcours') }}
    )

select 
    am.ANNEE,
    POURCENTAGE_AGE_OPENCLASSROOM,
    POURCENTAGE_AGE_INSEE,
    TRANCHE_AGE,
    GENRE,
    POURCENTAGE_GENRE_OPENCLASSROOM,
    POURCENTAGE_GENRE_INSEE,
    REGION,
    POURCENTAGE_REGION_OPENCLASSROOM,
    POURCENTAGE_REGION_INSEE,
    NOMBRE_ETUDIANT_TOTAL,
    NOMBRE_USER_TOTAL_DOUBLON,
    USER_DOUBLON_TOTAL_POURCENTAGE

from age_merge am
left join genre_merge gm on am.ANNEE = gm.ANNEE
left join regions_merge rm on am.ANNEE = rm.ANNEE
left join quantite_parcours qp on am.LIEN = qp.LIEN