SELECT
MIN(plan.valor_plano) AS faturamento_minimo,
MAX(plan.valor_plano) AS faturamento_maximo,
FORMAT(AVG(plan.valor_plano), 2) AS faturamento_medio,
FORMAT(SUM(plan.valor_plano), 2) AS faturamento_total
FROM SpotifyClone.planos AS plan
JOIN SpotifyClone.usuarios AS usr 
ON plan.plano_id = usr.plano_id; 