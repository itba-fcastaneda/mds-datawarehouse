ALTER TABLE IF EXISTS public."User"
	ADD CONSTRAINT "fk_location"
    FOREIGN KEY("LocationId") 
	REFERENCES "Location"("Id");

ALTER TABLE IF EXISTS public."User"
	ADD CONSTRAINT "fk_segments"
    FOREIGN KEY("SegmentId") 
	REFERENCES "Segment"("Id");

ALTER TABLE IF EXISTS public."UserSubscription"
	ADD CONSTRAINT "fk_user"
    FOREIGN KEY("UserId") 
	REFERENCES "User"("Id");

ALTER TABLE IF EXISTS public."UserSubscription"
    ADD CONSTRAINT "fk_subscription"
    FOREIGN KEY("SubscriptionId") 
    REFERENCES "Subscription"("Id");

ALTER TABLE IF EXISTS public."Content"
    ADD CONSTRAINT "fk_category"
    FOREIGN KEY("CategoryId") 
    REFERENCES "Category"("Id");

ALTER TABLE IF EXISTS public."SearchResponse"
    ADD CONSTRAINT "fk_search"
    FOREIGN KEY("SearchId") 
    REFERENCES "UserSearch"("Id");

ALTER TABLE IF EXISTS public."SearchResponse"
    ADD CONSTRAINT "fk_content"
    FOREIGN KEY("ContentId") 
    REFERENCES "Content"("Id");

ALTER TABLE IF EXISTS public."UserSearch"
    ADD CONSTRAINT "fk_user_search"
    FOREIGN KEY("UserId") 
    REFERENCES "User"("Id");

ALTER TABLE IF EXISTS public."UserSearch"
    ADD CONSTRAINT "fk_time_search"
    FOREIGN KEY("TimeId") 
    REFERENCES "Time"("Id");

ALTER TABLE IF EXISTS public."UserRecommendation"
    ADD CONSTRAINT "fk_user_recommendation"
    FOREIGN KEY("UserId") 
    REFERENCES "User"("Id");

ALTER TABLE IF EXISTS public."UserRecommendation"
    ADD CONSTRAINT "fk_time_recommendation"
    FOREIGN KEY("TimeId") 
    REFERENCES "Time"("Id");

ALTER TABLE IF EXISTS public."UserRecommendation"
    ADD CONSTRAINT "fk_content_recommendation"
    FOREIGN KEY("ContentId") 
    REFERENCES "Content"("Id");

ALTER TABLE IF EXISTS public."UserRecommendation"
    ADD CONSTRAINT "fk_position_recommendation"
    FOREIGN KEY("PositionId") 
    REFERENCES "Position"("Id");

ALTER TABLE IF EXISTS public."ContentRating"
    ADD CONSTRAINT "fk_user_rating"
    FOREIGN KEY("UserId") 
    REFERENCES "User"("Id");

ALTER TABLE IF EXISTS public."ContentRating"
    ADD CONSTRAINT "fk_time_rating"
    FOREIGN KEY("TimeId") 
    REFERENCES "Time"("Id");

ALTER TABLE IF EXISTS public."ContentRating"
    ADD CONSTRAINT "fk_content_rating"
    FOREIGN KEY("ContentId") 
    REFERENCES "Content"("Id");

ALTER TABLE IF EXISTS public."ContentUsage"
    ADD CONSTRAINT "fk_user_usage"
    FOREIGN KEY("UserId") 
    REFERENCES "User"("Id");

ALTER TABLE IF EXISTS public."ContentUsage"
    ADD CONSTRAINT "fk_time_usage"
    FOREIGN KEY("TimeId") 
    REFERENCES "Time"("Id");

ALTER TABLE IF EXISTS public."ContentUsage"
    ADD CONSTRAINT "fk_content_usage"
    FOREIGN KEY("ContentId") 
    REFERENCES "Content"("Id");

ALTER TABLE IF EXISTS public."ContentHit"
    ADD CONSTRAINT "fk_user_hit"
    FOREIGN KEY("UserId") 
    REFERENCES "User"("Id");

ALTER TABLE IF EXISTS public."ContentHit"
    ADD CONSTRAINT "fk_time_hit"
    FOREIGN KEY("TimeId") 
    REFERENCES "Time"("Id");

ALTER TABLE IF EXISTS public."ContentHit"
    ADD CONSTRAINT "fk_content_hit"
    FOREIGN KEY("ContentId") 
    REFERENCES "Content"("Id");

ALTER TABLE IF EXISTS public."ContentHit"
    ADD CONSTRAINT "fk_search_hit"
    FOREIGN KEY("SearchId") 
    REFERENCES "UserSearch"("Id");

ALTER TABLE IF EXISTS public."ContentHit"
    ADD CONSTRAINT "fk_recommendation_hit"
    FOREIGN KEY("RecommendationId") 
    REFERENCES "UserRecommendation"("Id");