SELECT u."SegmentId",
COUNT(*) as total,
COUNT (h."ContentId") as click,
CAST (COUNT (h."ContentId") / CAST(COUNT(*) AS FLOAT) AS NUMERIC(10, 2)) as ratio
FROM "UserSearch" as s LEFT JOIN "ContentHit" as h ON s."Id" = h."SearchId"
LEFT JOIN "User" as u ON s."UserId" = u."Id"
WHERE u."ValidTo" = '2999-12-31 00:00:00'
GROUP BY 1
ORDER BY 1