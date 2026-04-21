select
    'LIAISON' as LIEN,
    count(DISTINCT USER_ID) as NOMBRE_ETUDIANT_TOTAL, 
    count(USER_ID) - count(DISTINCT USER_ID) as NOMBRE_USER_TOTAL_DOUBLON,
    round((count(USER_ID) - count(DISTINCT USER_ID)) * 100.0 / sum(count(USER_ID)) over (),2) as USER_DOUBLON_TOTAL_POURCENTAGE
from {{ ref('stg_openclassrooms') }}