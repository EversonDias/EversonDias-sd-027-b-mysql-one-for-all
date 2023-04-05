SELECT
	name AS pessoa_usuaria,
    (
    SELECT 
		COUNT(music_id)
	FROM
		historic
	WHERE user_id = user.id
	) AS musicas_ouvidas,
    (
    SELECT
		ROUND(SUM(m.duration_seconds) / 60, 2)
	FROM
		music AS m
	INNER JOIN historic AS h
    ON m.id = h.music_id AND h.user_id = user.id
    )  AS total_minutos
FROM user ORDER BY name;