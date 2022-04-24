--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-24 14:37:49 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3360 (class 1262 OID 16384)
-- Name: social-growth-analysis; Type: DATABASE; Schema: -; Owner: social-growth-analysis
--

-- CREATE DATABASE "social-growth-analysis" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "social-growth-analysis" OWNER TO "social-growth-analysis";

\connect "social-growth-analysis"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- TOC entry 218 (class 1259 OID 16437)
-- Name: channel_spend; Type: TABLE; Schema: public; Owner: social-growth-analysis
--

CREATE TABLE "public"."channel_spend" (
    "channel_spend_id" integer NOT NULL,
    "channel_id" integer,
    "month" character varying(45),
    "year" integer,
    "channel" character varying(50),
    "country" character varying(50),
    "spend_euros" integer
);


ALTER TABLE "public"."channel_spend" OWNER TO "social-growth-analysis";

--
-- TOC entry 217 (class 1259 OID 16436)
-- Name: channel_spend_channel_spend_id_seq; Type: SEQUENCE; Schema: public; Owner: social-growth-analysis
--

CREATE SEQUENCE "public"."channel_spend_channel_spend_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."channel_spend_channel_spend_id_seq" OWNER TO "social-growth-analysis";

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 217
-- Name: channel_spend_channel_spend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: social-growth-analysis
--

ALTER SEQUENCE "public"."channel_spend_channel_spend_id_seq" OWNED BY "public"."channel_spend"."channel_spend_id";


--
-- TOC entry 210 (class 1259 OID 16394)
-- Name: customer; Type: TABLE; Schema: public; Owner: social-growth-analysis
--

CREATE TABLE "public"."customer" (
    "customer_id" integer NOT NULL,
    "first_name" character varying(50),
    "last_name" character varying(50),
    "country" character varying(50),
    "email" character varying(50),
    "created_at" timestamp without time zone,
    "updated_at" timestamp without time zone
);


ALTER TABLE "public"."customer" OWNER TO "social-growth-analysis";

--
-- TOC entry 209 (class 1259 OID 16393)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: social-growth-analysis
--

CREATE SEQUENCE "public"."customer_customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."customer_customer_id_seq" OWNER TO "social-growth-analysis";

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 209
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: social-growth-analysis
--

ALTER SEQUENCE "public"."customer_customer_id_seq" OWNED BY "public"."customer"."customer_id";


--
-- TOC entry 214 (class 1259 OID 16413)
-- Name: marketing_channel; Type: TABLE; Schema: public; Owner: social-growth-analysis
--

CREATE TABLE "public"."marketing_channel" (
    "channel_id" integer NOT NULL,
    "customer_id" integer,
    "channel_name" character varying(50),
    "channel_category" character varying(50),
    "conversion_timestamp" timestamp without time zone
);


ALTER TABLE "public"."marketing_channel" OWNER TO "social-growth-analysis";

--
-- TOC entry 213 (class 1259 OID 16412)
-- Name: marketing_channel_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: social-growth-analysis
--

CREATE SEQUENCE "public"."marketing_channel_channel_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."marketing_channel_channel_id_seq" OWNER TO "social-growth-analysis";

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 213
-- Name: marketing_channel_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: social-growth-analysis
--

ALTER SEQUENCE "public"."marketing_channel_channel_id_seq" OWNED BY "public"."marketing_channel"."channel_id";


--
-- TOC entry 212 (class 1259 OID 16401)
-- Name: subscription_product; Type: TABLE; Schema: public; Owner: social-growth-analysis
--

CREATE TABLE "public"."subscription_product" (
    "subscription_id" integer NOT NULL,
    "customer_id" integer,
    "product_id" integer,
    "product_name" character varying(50),
    "is_current_subscription" boolean,
    "is_premium" boolean,
    "created_at" timestamp without time zone,
    "ended_at" timestamp without time zone
);


ALTER TABLE "public"."subscription_product" OWNER TO "social-growth-analysis";

--
-- TOC entry 211 (class 1259 OID 16400)
-- Name: subscription_prodtc_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: social-growth-analysis
--

CREATE SEQUENCE "public"."subscription_prodtc_subscription_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."subscription_prodtc_subscription_id_seq" OWNER TO "social-growth-analysis";

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 211
-- Name: subscription_prodtc_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: social-growth-analysis
--

ALTER SEQUENCE "public"."subscription_prodtc_subscription_id_seq" OWNED BY "public"."subscription_product"."subscription_id";


--
-- TOC entry 216 (class 1259 OID 16425)
-- Name: transaction; Type: TABLE; Schema: public; Owner: social-growth-analysis
--

CREATE TABLE "public"."transaction" (
    "transaction_id" integer NOT NULL,
    "customer_id" integer,
    "merchant_id" integer,
    "merchant_name" character varying(50),
    "transaction_type" character varying(50),
    "currency" character varying(3),
    "created_at" timestamp without time zone
);


ALTER TABLE "public"."transaction" OWNER TO "social-growth-analysis";

--
-- TOC entry 215 (class 1259 OID 16424)
-- Name: transaction_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: social-growth-analysis
--

CREATE SEQUENCE "public"."transaction_transaction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."transaction_transaction_id_seq" OWNER TO "social-growth-analysis";

--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 215
-- Name: transaction_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: social-growth-analysis
--

ALTER SEQUENCE "public"."transaction_transaction_id_seq" OWNED BY "public"."transaction"."transaction_id";


--
-- TOC entry 3191 (class 2604 OID 16440)
-- Name: channel_spend channel_spend_id; Type: DEFAULT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."channel_spend" ALTER COLUMN "channel_spend_id" SET DEFAULT "nextval"('"public"."channel_spend_channel_spend_id_seq"'::"regclass");


--
-- TOC entry 3187 (class 2604 OID 16397)
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."customer" ALTER COLUMN "customer_id" SET DEFAULT "nextval"('"public"."customer_customer_id_seq"'::"regclass");


--
-- TOC entry 3189 (class 2604 OID 16416)
-- Name: marketing_channel channel_id; Type: DEFAULT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."marketing_channel" ALTER COLUMN "channel_id" SET DEFAULT "nextval"('"public"."marketing_channel_channel_id_seq"'::"regclass");


--
-- TOC entry 3188 (class 2604 OID 16404)
-- Name: subscription_product subscription_id; Type: DEFAULT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."subscription_product" ALTER COLUMN "subscription_id" SET DEFAULT "nextval"('"public"."subscription_prodtc_subscription_id_seq"'::"regclass");


--
-- TOC entry 3190 (class 2604 OID 16428)
-- Name: transaction transaction_id; Type: DEFAULT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."transaction" ALTER COLUMN "transaction_id" SET DEFAULT "nextval"('"public"."transaction_transaction_id_seq"'::"regclass");


--
-- TOC entry 3354 (class 0 OID 16437)
-- Dependencies: 218
-- Data for Name: channel_spend; Type: TABLE DATA; Schema: public; Owner: social-growth-analysis
--

INSERT INTO "public"."channel_spend" VALUES (1, 6, '3', 2019, 'twitter', 'Germany', 5000);
INSERT INTO "public"."channel_spend" VALUES (2, 6, '3', 2020, 'twitter', 'Spain', 5500);
INSERT INTO "public"."channel_spend" VALUES (3, 7, '4', 2020, 'linkedin', 'Germany', 200);
INSERT INTO "public"."channel_spend" VALUES (4, 7, '10', 2021, 'linkedin', 'Brazil', 300);
INSERT INTO "public"."channel_spend" VALUES (5, 7, '12', 2019, 'linkedin', 'Germany', 100);
INSERT INTO "public"."channel_spend" VALUES (6, 8, '6', 2020, 'tv', 'Germany', 400);
INSERT INTO "public"."channel_spend" VALUES (7, 9, '6', 2019, 'twitter', 'Germany', 6000);
INSERT INTO "public"."channel_spend" VALUES (8, 6, '3', 2019, 'twitter', 'Germany', 4000);
INSERT INTO "public"."channel_spend" VALUES (9, 8, '10', 2019, 'tv', 'Germany', 10000);
INSERT INTO "public"."channel_spend" VALUES (10, 8, '12', 2019, 'tv', 'Argentina', 10000);
INSERT INTO "public"."channel_spend" VALUES (11, 9, '3', 2020, 'website', 'Spain', 300);
INSERT INTO "public"."channel_spend" VALUES (12, 9, '12', 2019, 'website', 'Spain', 200);


--
-- TOC entry 3346 (class 0 OID 16394)
-- Dependencies: 210
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: social-growth-analysis
--

INSERT INTO "public"."customer" VALUES (1, 'Ana', 'Andrade', 'Germany', 'anaberlin83@hotmail.com', '2019-01-01 19:10:25', '2022-04-24 19:10:25');
INSERT INTO "public"."customer" VALUES (2, 'Antonio', 'Brites', 'Spain', 'antonio.brites@hotmail.com', '2019-10-01 19:10:25', '2022-04-24 19:10:25');
INSERT INTO "public"."customer" VALUES (3, 'Thompson', 'Honorato', 'Brazil', 'thompson.honorato85@hotmail.com', '2020-01-01 19:10:25', '2022-04-24 19:10:25');
INSERT INTO "public"."customer" VALUES (4, 'Lucas', 'Linhares', 'Argentina', 'lucas.linhares@hotmail.com', '2019-01-01 19:10:25', '2022-04-24 19:10:25');


--
-- TOC entry 3350 (class 0 OID 16413)
-- Dependencies: 214
-- Data for Name: marketing_channel; Type: TABLE DATA; Schema: public; Owner: social-growth-analysis
--

INSERT INTO "public"."marketing_channel" VALUES (6, 1, 'twitter', 'social', '2019-01-01 19:10:25');
INSERT INTO "public"."marketing_channel" VALUES (7, 2, 'linkedin', 'social', '2019-10-01 19:10:25');
INSERT INTO "public"."marketing_channel" VALUES (8, 3, 'tv', 'traditional', '2020-01-01 19:10:25');
INSERT INTO "public"."marketing_channel" VALUES (9, 4, 'website', 'online', '2019-01-01 19:10:25');


--
-- TOC entry 3348 (class 0 OID 16401)
-- Dependencies: 212
-- Data for Name: subscription_product; Type: TABLE DATA; Schema: public; Owner: social-growth-analysis
--

INSERT INTO "public"."subscription_product" VALUES (1, 2, 1, 'metal', true, true, '2021-01-22 19:10:25', NULL);
INSERT INTO "public"."subscription_product" VALUES (2, 2, 3, 'standard', false, false, '2019-10-01 19:10:25', '2021-01-22 19:10:25');
INSERT INTO "public"."subscription_product" VALUES (3, 1, 1, 'metal', true, true, '2020-10-04 19:10:25', NULL);
INSERT INTO "public"."subscription_product" VALUES (4, 1, 2, 'you', false, false, '2019-01-01 19:10:25', '2020-10-04 19:10:25');
INSERT INTO "public"."subscription_product" VALUES (7, 3, 3, 'standard', false, false, '2020-01-01 19:10:25', '2020-06-01 19:10:25');
INSERT INTO "public"."subscription_product" VALUES (8, 3, 2, 'you', true, true, '2020-06-01 19:10:25', NULL);
INSERT INTO "public"."subscription_product" VALUES (10, 4, 3, 'standard', true, false, '2019-01-01 19:10:25', NULL);


--
-- TOC entry 3352 (class 0 OID 16425)
-- Dependencies: 216
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: social-growth-analysis
--

INSERT INTO "public"."transaction" VALUES (1, 1, 1, 'Zalando', 'online', '500', '2019-03-22 19:10:25');
INSERT INTO "public"."transaction" VALUES (2, 1, 2, 'H&M', 'card', '100', '2020-06-22 19:10:25');
INSERT INTO "public"."transaction" VALUES (4, 2, 3, 'Adidas', 'card', '80', '2019-10-22 19:10:25');
INSERT INTO "public"."transaction" VALUES (5, 2, 4, 'Zara', 'card', '700', '2020-01-12 19:10:25');
INSERT INTO "public"."transaction" VALUES (6, 1, 5, 'Zara Home', 'atm', '140', '2019-03-21 19:10:25');
INSERT INTO "public"."transaction" VALUES (7, 1, 1, 'Zalando', 'online', '300', '2021-05-19 19:10:25');
INSERT INTO "public"."transaction" VALUES (3, 1, 3, 'Adidas', 'atm', '60', '2022-04-22 19:10:25');
INSERT INTO "public"."transaction" VALUES (8, 2, 1, 'Zalando', 'online', '700', '2022-04-20 19:10:25');


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 217
-- Name: channel_spend_channel_spend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: social-growth-analysis
--

SELECT pg_catalog.setval('"public"."channel_spend_channel_spend_id_seq"', 12, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 209
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: social-growth-analysis
--

SELECT pg_catalog.setval('"public"."customer_customer_id_seq"', 4, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 213
-- Name: marketing_channel_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: social-growth-analysis
--

SELECT pg_catalog.setval('"public"."marketing_channel_channel_id_seq"', 9, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 211
-- Name: subscription_prodtc_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: social-growth-analysis
--

SELECT pg_catalog.setval('"public"."subscription_prodtc_subscription_id_seq"', 10, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 215
-- Name: transaction_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: social-growth-analysis
--

SELECT pg_catalog.setval('"public"."transaction_transaction_id_seq"', 8, true);


--
-- TOC entry 3201 (class 2606 OID 16442)
-- Name: channel_spend channel_spend_pkey; Type: CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."channel_spend"
    ADD CONSTRAINT "channel_spend_pkey" PRIMARY KEY ("channel_spend_id");


--
-- TOC entry 3193 (class 2606 OID 16399)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."customer"
    ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id");


--
-- TOC entry 3197 (class 2606 OID 16418)
-- Name: marketing_channel marketing_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."marketing_channel"
    ADD CONSTRAINT "marketing_channel_pkey" PRIMARY KEY ("channel_id");


--
-- TOC entry 3195 (class 2606 OID 16406)
-- Name: subscription_product subscription_prodtc_pkey; Type: CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."subscription_product"
    ADD CONSTRAINT "subscription_prodtc_pkey" PRIMARY KEY ("subscription_id");


--
-- TOC entry 3199 (class 2606 OID 16430)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."transaction"
    ADD CONSTRAINT "transaction_pkey" PRIMARY KEY ("transaction_id");


--
-- TOC entry 3205 (class 2606 OID 16443)
-- Name: channel_spend channel_spend_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."channel_spend"
    ADD CONSTRAINT "channel_spend_channel_id_fkey" FOREIGN KEY ("channel_id") REFERENCES "public"."marketing_channel"("channel_id");


--
-- TOC entry 3203 (class 2606 OID 16419)
-- Name: marketing_channel marketing_channel_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."marketing_channel"
    ADD CONSTRAINT "marketing_channel_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("customer_id");


--
-- TOC entry 3202 (class 2606 OID 16407)
-- Name: subscription_product subscription_prodtc_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."subscription_product"
    ADD CONSTRAINT "subscription_prodtc_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("customer_id");


--
-- TOC entry 3204 (class 2606 OID 16431)
-- Name: transaction transaction_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: social-growth-analysis
--

ALTER TABLE ONLY "public"."transaction"
    ADD CONSTRAINT "transaction_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("customer_id");


-- Completed on 2022-04-24 14:37:50 -03

--
-- PostgreSQL database dump complete
--

