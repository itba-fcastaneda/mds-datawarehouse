SELECT SUM(cu."Seconds"), ca."Description"
FROM public."ContentUsage" cu
JOIN public."Content" c ON cu."ContentId" = c."Id"
JOIN public."Category" ca ON c."CategoryId" = ca."Id"
JOIN public."UserSubscription" us ON cu."UserId" = us."UserId"
JOIN public."Subscription" s ON us."SubscriptionId" = s."Id"
WHERE s."Type" = 'Premium'
GROUP BY ca."Description";