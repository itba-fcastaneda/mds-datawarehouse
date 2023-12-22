
WITH totales AS(
SELECT "UserId",
SUM ("Seconds") as total
FROM "ContentUsage" as v LEFT JOIN "Content" as c
ON v."ContentId" = c."Id"
WHERE "UserId" IN (
	SELECT "UserId"
	FROM "UserSubscription"
	WHERE "ValidTo" >= CURRENT_DATE - INTERVAL '30 days'
	EXCEPT
	SELECT "UserId"
	FROM "UserSubscription"
	WHERE "ValidTo" = '2999-12-31 00:00:00'
	)
GROUP BY 1
),
parciales AS (
SELECT "UserId",
SUM ("Seconds") as bajado
FROM "ContentUsage" as v LEFT JOIN "Content" as c
ON v."ContentId" = c."Id"
WHERE "UserId" IN (
	SELECT "UserId"
	FROM "UserSubscription"
	WHERE "ValidTo" >= CURRENT_DATE - INTERVAL '30 days'
	EXCEPT
	SELECT "UserId"
	FROM "UserSubscription"
	WHERE "ValidTo" = '2999-12-31 00:00:00'
	)
AND "ContentId" IN(
	SELECT "Id"
	FROM "Content"
	WHERE c."EndDate" >= CURRENT_DATE - INTERVAL '60 days'
	AND c."EndDate" < CURRENT_DATE - INTERVAL '30 days'
	EXCEPT
	SELECT "Id"
	FROM "Content"
	WHERE "EndDate" = '2999-12-31 00:00:00'
)
GROUP BY 1
)

SELECT totales."UserId",
SUM(total) as total,
SUM(bajado) as bajado,
CAST (SUM(bajado) / SUM(total) AS NUMERIC(10, 2)) as ratio
FROM totales LEFT JOIN parciales
ON totales."UserId" = parciales."UserId"
GROUP BY 1
