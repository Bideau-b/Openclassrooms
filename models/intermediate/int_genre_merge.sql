--chargement table openclassroom pour les données "genre"

with genre_open as (
    
    select
        POURCENTAGE_GENRE_OPENCLASSROOM,
        GENRE,
        ANNEE_DEBUT_FORMATION
    from {{ ref('int_open_genre') }}

),

--chargement table INSEE pour les données "genre"

genre_insee as (
    
    select 
        POURCENTAGE_GENRE_INSEE,
        GENRE,
        ANNEE
    from {{ ref('int_insee_genre') }}

)

-- jointure des données openclassrooms avec ceux de l'INSEE sur les genres

select  
    gop.GENRE,
    POURCENTAGE_GENRE_OPENCLASSROOM,
    POURCENTAGE_GENRE_INSEE,
    ANNEE_DEBUT_FORMATION,
    ANNEE
from genre_open gop
left join genre_insee gi on gop.GENRE = gi.GENRE --jointure genre
where ANNEE_DEBUT_FORMATION=ANNEE --selection et liaison des années de 2022 à 2025