with age_temp as (
    
    select
        count(distinct USER_ID) as NOMBRE_USER, --on retire les doublons
        round(count(distinct USER_ID) * 100.0 / sum(count(distinct USER_ID)) over (Partition by ANNEE_DEBUT_FORMATION),2) as USER_POURCENTAGE,
        case 
            when FOURCHETTE_AGE in ('20-24 ans')
            then '15-24 ans'
            when FOURCHETTE_AGE in ('25-29 ans','30-34 ans','35-39 ans','40-44 ans','45-49 ans')
            then '25-49 ans'
            when FOURCHETTE_AGE in ('50-54 ans','55-59 ans','60 ans ou plus')
            then '50-64 ans'
        end as FOURCHETTE_AGE_REGROUPEE,
        ANNEE_DEBUT_FORMATION
    from {{ ref('stg_openclassrooms') }}
    GROUP BY FOURCHETTE_AGE,ANNEE_DEBUT_FORMATION

)
  
select
        sum(USER_POURCENTAGE) as POURCENTAGE_AGE_OPENCLASSROOM,
        FOURCHETTE_AGE_REGROUPEE,
        ANNEE_DEBUT_FORMATION
FROM age_temp
GROUP BY FOURCHETTE_AGE_REGROUPEE, ANNEE_DEBUT_FORMATION

