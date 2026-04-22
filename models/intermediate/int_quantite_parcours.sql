-- calcul nombre et pourcentage d'étudiants sur l'ensemble des années avec et sans les doublons (doublons = ayant fait plus de 2 formations)

select
    'LIAISON' as LIEN,
    count(DISTINCT USER_ID) as NOMBRE_ETUDIANT_TOTAL, -- total étudiants sans les doublons
    count(USER_ID) - count(DISTINCT USER_ID) as NOMBRE_USER_TOTAL_DOUBLON, --total étudiants en doublons
    round((count(USER_ID) - count(DISTINCT USER_ID)) * 100.0 / sum(count(USER_ID)) over (),2) as USER_DOUBLON_TOTAL_POURCENTAGE --pourcentage étudiants en doublons
from {{ ref('stg_openclassrooms') }}