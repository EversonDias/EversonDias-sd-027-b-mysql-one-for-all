SELECT 
	art.name AS artista,
    alb.name AS album,
    COUNT(user_id) AS pessoas_seguidoras
FROM
	artist AS art
INNER JOIN
	album AS alb
INNER JOIN
    followers AS fol
ON
	alb.artist_id = art.id AND alb.artist_id = fol.artist_id
GROUP BY 
	alb.name, art.name
ORDER BY 
	pessoas_seguidoras DESC,
    artista ASC,
    album ASC;