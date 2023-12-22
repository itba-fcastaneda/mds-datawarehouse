WITH WeeklyAverageRating AS (
    SELECT
        c."CategoryId",
        cr."TimeId",
        AVG(cr."Rating") AS "AverageRating",
        EXTRACT(WEEK FROM cr."TimeId") AS "WeekNumber"
    FROM
        public."Content" c
    JOIN
        public."ContentRating" cr ON c."Id" = cr."ContentId"
    WHERE
        cr."TimeId" <= CURRENT_DATE - INTERVAL '6 days'
    GROUP BY
        c."CategoryId", cr."TimeId"
)
SELECT
    ca."Description" AS "CategoryDescription",
    "WeekNumber",
    ROUND(AVG("AverageRating"),2) AS "WeeklyAverageRating",
    ROUND(LAG(AVG("AverageRating"), 1) OVER (PARTITION BY c."CategoryId" ORDER BY "WeekNumber"),2) AS "PreviousWeekAverageRating",
    CASE
        WHEN LAG(AVG("AverageRating"), 1) OVER (PARTITION BY c."CategoryId" ORDER BY "WeekNumber") = 0 THEN NULL
        ELSE ROUND(((AVG("AverageRating") / LAG(AVG("AverageRating"), 1) OVER (PARTITION BY c."CategoryId" ORDER BY "WeekNumber")) - 1) * 100,2)
    END AS "VariationRate"
FROM
    WeeklyAverageRating
JOIN
    public."Category" ca ON WeeklyAverageRating."CategoryId" = ca."Id"
JOIN
    public."Content" c ON WeeklyAverageRating."CategoryId" = c."CategoryId"
GROUP BY
    c."CategoryId", "WeekNumber", ca."Description"
ORDER BY
    c."CategoryId", "WeekNumber";
