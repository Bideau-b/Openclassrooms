select 
    USER_ID,
    AGE_GROUP as FOURCHETTE_AGE,
    PATH_CATEGORY_NAME as CATEGORIE_PARCOURS,
    coalesce(GENDER,'unknown') as GENRE,
    REGION,
    YEAR_PATH_STARTED as ANNEE_DEBUT_FORMATION
 from {{ source('snowflake','OPENCLASSROOMS_DATA')}}