SELECT
	m.name AS cancao,
    COUNT(h.music_id) AS reproducoes
FROM music AS m
INNER JOIN historic AS h
ON m.id = h.music_id
GROUP BY h.music_id
ORDER BY reproducoes DESC, cancao LIMIT 2;