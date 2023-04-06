SELECT 
	art.name AS artista,
    alb.name AS album
FROM
	artist AS art
INNER JOIN
	album AS alb
ON
	alb.artist_id = art.id
WHERE art.name = 'Elis Regina'
GROUP BY 
	alb.name, art.name;