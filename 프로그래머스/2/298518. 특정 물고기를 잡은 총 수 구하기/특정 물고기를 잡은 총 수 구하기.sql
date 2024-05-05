SELECT
SUM(CASE WHEN fni.FISH_NAME = 'BASS' THEN 1 ELSE 0 END)
+ SUM(CASE WHEN fni.FISH_NAME = 'SNAPPER' THEN 1 ELSE 0 END) AS FISH_COUNT
FROM FISH_INFO fi
INNER JOIN FISH_NAME_INFO fni ON fi.FISH_TYPE = fni.FISH_TYPE;