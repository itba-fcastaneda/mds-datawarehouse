SELECT u."SegmentId",
cat."Description",
SUM (v."Seconds") as total,
SUM(SUM(v."Seconds")) OVER (PARTITION BY u."SegmentId") as total_per_segment,
CAST (SUM (v."Seconds") / SUM(SUM(v."Seconds")) OVER (PARTITION BY u."SegmentId") AS NUMERIC(10, 2)) as ratio
FROM "ContentUsage" as v LEFT JOIN "Content" as c ON v."ContentId" = c."Id"
LEFT JOIN "Category" as cat ON c."CategoryId" = cat."Id"
LEFT JOIN "User" as u ON v."UserId" = u."Id"
GROUP BY 1,2