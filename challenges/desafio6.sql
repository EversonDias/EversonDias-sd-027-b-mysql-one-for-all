SELECT 
	MIN(value) AS faturamento_minimo,
	MAX(value) AS faturamento_maximo,
    (
		SELECT
			ROUND(AVG(value), 2)
		FROM
			plans AS p
		INNER JOIN
			user AS u
		ON u.plans_id = p.id
	) AS faturamento_medio,
    (
		SELECT
			SUM(value)
		FROM
			plans AS p
		INNER JOIN
			user AS u
		ON u.plans_id = p.id
	) AS faturamento_total
FROM plans;