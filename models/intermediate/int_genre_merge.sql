with genre_open as (
    
    select
        POURCENTAGE_GENRE_OPENCLASSROOM,
        GENRE,
        ANNEE_DEBUT_FORMATION
    from {{ ref('int_open_genre') }}

),

genre_insee as (
    
    select 
        POURCENTAGE_GENRE_INSEE,
        GENRE,
        ANNEE
    from {{ ref('int_insee_genre') }}

)

select  
    gop.GENRE,
    POURCENTAGE_GENRE_OPENCLASSROOM,
    POURCENTAGE_GENRE_INSEE,
    ANNEE_DEBUT_FORMATION,
    ANNEE
from genre_open gop
left join genre_insee gi on gop.GENRE = gi.GENRE
where ANNEE_DEBUT_FORMATION=ANNEE