
CREATE TABLE IF NOT EXISTS public."User"
(
    "Id" integer NOT NULL,
    "Name" character(80) COLLATE pg_catalog."default" NOT NULL,
    "BirthDate" date NOT NULL,
    "Gender" character(2) COLLATE pg_catalog."default",
    "ValidFrom" date NOT NULL,
    "ValidTo" date NOT NULL,
    "LocationId" integer NOT NULL,
    "SegmentId" integer NOT NULL,
    CONSTRAINT "User_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Location"
(
    "Id" integer NOT NULL,
    "State" character(40) COLLATE pg_catalog."default" NOT NULL,
    "Country" character(40) COLLATE pg_catalog."default" NOT NULL,
    "Lat" numeric NOT NULL,
    "Long" numeric NOT NULL,
    CONSTRAINT "Location_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Segment"
(
    "Id" integer NOT NULL,
    "Description" character(80) COLLATE pg_catalog."default",
    CONSTRAINT "Segment_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Subscription"
(
    "Id" integer NOT NULL,
    "Type" character(40) COLLATE pg_catalog."default" NOT NULL,
    "Description" character(300) COLLATE pg_catalog."default",
    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."UserSubscription"
(
    "UserId" integer NOT NULL,
    "SubscriptionId" integer NOT NULL,
    "ValidFrom" date NOT NULL,
    "ValidTo" date NOT NULL,
    PRIMARY KEY ("UserId", "SubscriptionId", "ValidFrom")
);

CREATE TABLE IF NOT EXISTS public."Category"
(
    "Id" integer NOT NULL,
    "Description" character(80) COLLATE pg_catalog."default",
    CONSTRAINT "Category_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Content"
(
    "Id" integer NOT NULL,
    "CategoryId" integer NOT NULL,
    "Description" character(300) COLLATE pg_catalog."default" NOT NULL,
    "Duration" integer,
    "StartDate" date NOT NULL,
    "EndData" date NOT NULL,
    CONSTRAINT "Content_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Time"
(
    "Id" date NOT NULL,
    "Day" integer NOT NULL,
    "Month" integer NOT NULL,
    "Year" integer NOT NULL,
    CONSTRAINT "Time_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Position"
(
    "Id" integer NOT NULL,
    "Position" character(80) COLLATE pg_catalog."default",
    CONSTRAINT "Position_pkey" PRIMARY KEY ("Id")
);


CREATE TABLE IF NOT EXISTS public."SearchResponse"
(
    "SearchId" integer NOT NULL,
    "ContentId" integer NOT NULL,
    "Ranking" integer NOT NULL,
     PRIMARY KEY ("SearchId", "ContentId" )
);

CREATE TABLE IF NOT EXISTS public."UserSearch"
(
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" date NOT NULL,
    "Query" character(128) COLLATE pg_catalog."default",
    CONSTRAINT "UserSearch_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."UserRecommendation"
(
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" date NOT NULL,
    "ContentId" integer NOT NULL,
    "PositionId" integer NOT NULL,
    CONSTRAINT "UserRecommendation_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."ContentRating"
(
    "ContentId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" date NOT NULL,
    "Rating" integer NOT NULL,
    PRIMARY KEY ( "ContentId", "UserId")
);

CREATE TABLE IF NOT EXISTS public."ContentUsage"
(
    "ContentId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" date NOT NULL,
    "Seconds" integer NOT NULL,
    PRIMARY KEY ( "ContentId", "UserId",  "TimeId")
);

CREATE TABLE IF NOT EXISTS public."ContentHit"
(
    "ContentId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" date NOT NULL,
    "SearchId" integer NOT NULL,
    "RecommendationId" integer NOT NULL,
    PRIMARY KEY ( "ContentId", "UserId",  "TimeId")
);


ALTER TABLE IF EXISTS public."User" OWNER to postgres;
ALTER TABLE IF EXISTS public."Location" OWNER to postgres;
ALTER TABLE IF EXISTS public."Segment" OWNER to postgres;
ALTER TABLE IF EXISTS public."Subscription" OWNER to postgres;
ALTER TABLE IF EXISTS public."UserSubscription" OWNER to postgres;
ALTER TABLE IF EXISTS public."Category" OWNER to postgres;
ALTER TABLE IF EXISTS public."Content" OWNER to postgres;
ALTER TABLE IF EXISTS public."Time" OWNER to postgres;
ALTER TABLE IF EXISTS public."Position" OWNER to postgres;
ALTER TABLE IF EXISTS public."SearchResponse" OWNER to postgres;
ALTER TABLE IF EXISTS public."UserSearch" OWNER to postgres;
ALTER TABLE IF EXISTS public."UserRecommendation" OWNER to postgres;
ALTER TABLE IF EXISTS public."ContentRating" OWNER to postgres;
ALTER TABLE IF EXISTS public."ContentUsage" OWNER to postgres;
ALTER TABLE IF EXISTS public."ContentHit" OWNER to postgres;







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