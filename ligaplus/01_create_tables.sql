
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
    "Description" character(80) COLLATE pg_catalog."default",
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
    "Description" character(80) COLLATE pg_catalog."default" NOT NULL,
    "Duration" date NOT NULL,
    "StartDate" date NOT NULL,
    "EndData" date NOT NULL,
    CONSTRAINT "Content_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Time"
(
    "Id" integer NOT NULL,
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
    "TimeId" integer NOT NULL,
    "Query" character(128) COLLATE pg_catalog."default",
    CONSTRAINT "UserSearch_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."UserRecommendation"
(
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" integer NOT NULL,
    "ContentId" integer NOT NULL,
    "PositionId" integer NOT NULL,
    CONSTRAINT "UserRecommendation_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."ContentRating"
(
    "ContentId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" integer NOT NULL,
    "Rating" integer NOT NULL,
    PRIMARY KEY ( "ContentId", "UserId")
);

CREATE TABLE IF NOT EXISTS public."ContentUsage"
(
    "ContentId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" integer NOT NULL,
    "Seconds" integer NOT NULL,
    PRIMARY KEY ( "ContentId", "UserId",  "TimeId")
);

CREATE TABLE IF NOT EXISTS public."ContentHit"
(
    "ContentId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "TimeId" integer NOT NULL,
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







