SELECT v."ContentId",
AVG (v."Seconds") as Seconds,
AVG(c."Duration") as Duration,
CASE WHEN COALESCE(AVG(c."Duration"), 0) = 0 THEN NULL
     ELSE CAST (AVG(v."Seconds") / AVG(c."Duration") AS NUMERIC(10, 2))
END AS Ratio 
FROM "ContentUsage" as v LEFT JOIN "Content" as c ON v."ContentId" = c."Id"
GROUP BY 1
ORDER BY 1