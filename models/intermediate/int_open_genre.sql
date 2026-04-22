with genre_temp as (

    select
        count(distinct USER_ID) as NOMBRE_USER, --on retire les doublons
        round(count(distinct USER_ID)* 100 / sum(count(distinct USER_ID)) over (Partition by ANNEE_DEBUT_FORMATION),2) as USER_POURCENTAGE, 
        GENRE,
        ANNEE_DEBUT_FORMATION
    from {{ ref('stg_openclassrooms') }}
    WHERE GENRE<>'unknown' --On retire les données non remplis par les étudiants
    GROUP BY GENRE,ANNEE_DEBUT_FORMATION

)

select
    sum(USER_POURCENTAGE) as POURCENTAGE_GENRE_OPENCLASSROOM,
    GENRE,
    ANNEE_DEBUT_FORMATION
FROM genre_temp
GROUP BY GENRE, ANNEE_DEBUT_FORMATION
