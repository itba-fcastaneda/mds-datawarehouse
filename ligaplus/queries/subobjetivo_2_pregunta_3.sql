SELECT u."SegmentId",
COUNT (r."Id") as recommendations,
COUNT (c."ContentId") as clicks,
CAST (COUNT (c."ContentId")/ CAST(COUNT (r."Id") AS FLOAT) AS NUMERIC(10, 2)) as clicks_rate,
COUNT (v."ContentId") as views,
CAST (COUNT (v."ContentId")/ CAST(COUNT (r."Id") AS FLOAT) AS NUMERIC(10, 2)) as views_rate
FROM "UserRecommendation" as r LEFT JOIN "User" as u
ON r."UserId" = u."Id"
LEFT JOIN "ContentHit" as c ON r."Id" = c."RecommendationId"
LEFT JOIN "ContentUsage" as v ON c."ContentId" = v."ContentId" AND c."UserId" = v."UserId" AND c."TimeId" < v."TimeId"
WHERE u."ValidTo" = '2999-12-31 00:00:00'
GROUP BY 1
ORDER BY 1