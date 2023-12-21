WITH WeeklyViewing AS (
    SELECT
        cu."UserId",
        cu."Seconds",
        cu."TimeId",
        s."Description" AS "SegmentDescription",
        EXTRACT(WEEK FROM cu."TimeId") AS "WeekNumber"
    FROM
        public."ContentUsage" cu
    JOIN
        public."User" u ON cu."UserId" = u."Id"
    JOIN
        public."Segment" s ON u."SegmentId" = s."Id"
    WHERE
        cu."TimeId" <= CURRENT_DATE - INTERVAL '6 days'
)
SELECT
    "SegmentDescription",
    "WeekNumber",
    SUM("TotalSeconds") AS "TotalSeconds",
    LAG(SUM("TotalSeconds"), 1, 0) OVER (PARTITION BY "SegmentDescription" ORDER BY "WeekNumber") AS "PreviousWeekTotalSeconds",
    CASE
        WHEN LAG(SUM("TotalSeconds"), 1, 0) OVER (PARTITION BY "SegmentDescription" ORDER BY "WeekNumber") = 0 THEN NULL
        ELSE ROUND(SUM("TotalSeconds") / LAG(SUM("TotalSeconds"), 1, 0) OVER (PARTITION BY "SegmentDescription" ORDER BY "WeekNumber"),2)
    END AS "Variation"
FROM (
    SELECT
        "SegmentDescription",
        "WeekNumber",
        "UserId",
        SUM("Seconds") AS "TotalSeconds"
    FROM
        WeeklyViewing
    GROUP BY
        "SegmentDescription", "WeekNumber", "UserId"
) AS WeeklySumPerUser
GROUP BY
    "SegmentDescription", "WeekNumber"
ORDER BY
    "SegmentDescription", "WeekNumber";