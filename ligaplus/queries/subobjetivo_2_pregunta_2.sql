WITH ContentLaunchWeek AS (
    SELECT
        "Id" AS "ContentId",
        EXTRACT(WEEK FROM "StartDate") AS "LaunchWeek"
    FROM
        public."Content"
),
TotalUsers AS (
    SELECT
        COUNT(DISTINCT "Id") AS "TotalUsers"
    FROM
        public."User"
)

SELECT
    clw."ContentId",
    clw."LaunchWeek",
    COUNT(DISTINCT cu."UserId") AS "UsersWhoSaw",
    tu."TotalUsers",
    ROUND(COUNT(DISTINCT cu."UserId")::numeric / tu."TotalUsers"::numeric,2) *100 AS "PercentageUsersSaw"
FROM
    ContentLaunchWeek clw
JOIN
    public."ContentUsage" cu ON clw."ContentId" = cu."ContentId"
JOIN
    public."UserSubscription" us ON cu."UserId" = us."UserId"
JOIN
    public."User" u ON us."UserId" = u."Id"
CROSS JOIN
    TotalUsers tu
WHERE
    EXTRACT(WEEK FROM cu."TimeId") = clw."LaunchWeek"
GROUP BY
    clw."ContentId", clw."LaunchWeek", tu."TotalUsers"
ORDER BY
    clw."ContentId";
