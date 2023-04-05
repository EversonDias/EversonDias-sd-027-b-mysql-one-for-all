SELECT
	name AS pessoa_usuaria,
    (
    SELECT 
		CASE 
        WHEN (YEAR(reproduction_date) >= 2021) THEN	'Ativa'
		ELSE 'Inativa'
        END
	FROM
		historic 
	WHERE user_id = user.id
	ORDER BY reproduction_date DESC LIMIT 1
	) AS status_pessoa_usuaria
FROM user ORDER BY name;