--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-1.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO yernazar;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    icon character varying,
    price integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO yernazar;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO yernazar;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: category_subjects; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.category_subjects (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.category_subjects OWNER TO yernazar;

--
-- Name: category_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.category_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_subjects_id_seq OWNER TO yernazar;

--
-- Name: category_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.category_subjects_id_seq OWNED BY public.category_subjects.id;


--
-- Name: commentaries; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.commentaries (
    id bigint NOT NULL,
    user_id integer,
    text text,
    status integer,
    teacher_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.commentaries OWNER TO yernazar;

--
-- Name: commentaries_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.commentaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commentaries_id_seq OWNER TO yernazar;

--
-- Name: commentaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.commentaries_id_seq OWNED BY public.commentaries.id;


--
-- Name: costs; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.costs (
    id bigint NOT NULL,
    teacher_id integer,
    user_id integer,
    value integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.costs OWNER TO yernazar;

--
-- Name: costs_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.costs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.costs_id_seq OWNER TO yernazar;

--
-- Name: costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.costs_id_seq OWNED BY public.costs.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.rates (
    id bigint NOT NULL,
    category_id integer,
    user_id integer,
    value integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.rates OWNER TO yernazar;

--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rates_id_seq OWNER TO yernazar;

--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.rates_id_seq OWNED BY public.rates.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO yernazar;

--
-- Name: subjects; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.subjects (
    id bigint NOT NULL,
    name character varying,
    category_subject_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.subjects OWNER TO yernazar;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO yernazar;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO yernazar;

--
-- Name: tagsUsers; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public."tagsUsers" (
    id bigint NOT NULL,
    user_id integer,
    tag_id integer
);


ALTER TABLE public."tagsUsers" OWNER TO yernazar;

--
-- Name: tagsUsers_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public."tagsUsers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tagsUsers_id_seq" OWNER TO yernazar;

--
-- Name: tagsUsers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public."tagsUsers_id_seq" OWNED BY public."tagsUsers".id;


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO yernazar;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.teachers (
    id bigint NOT NULL,
    name character varying,
    surname character varying,
    avatar character varying,
    university_id integer,
    subject_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.teachers OWNER TO yernazar;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO yernazar;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: universities; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.universities (
    id bigint NOT NULL,
    name character varying,
    adress character varying,
    phone character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying
);


ALTER TABLE public.universities OWNER TO yernazar;

--
-- Name: universities_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.universities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universities_id_seq OWNER TO yernazar;

--
-- Name: universities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.universities_id_seq OWNED BY public.universities.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: yernazar
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    surname character varying,
    adress character varying,
    university_id integer,
    sex integer,
    phone character varying,
    avatar character varying,
    role integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    password character varying
);


ALTER TABLE public.users OWNER TO yernazar;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: yernazar
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO yernazar;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yernazar
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: category_subjects id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.category_subjects ALTER COLUMN id SET DEFAULT nextval('public.category_subjects_id_seq'::regclass);


--
-- Name: commentaries id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.commentaries ALTER COLUMN id SET DEFAULT nextval('public.commentaries_id_seq'::regclass);


--
-- Name: costs id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.costs ALTER COLUMN id SET DEFAULT nextval('public.costs_id_seq'::regclass);


--
-- Name: rates id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.rates ALTER COLUMN id SET DEFAULT nextval('public.rates_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: tagsUsers id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public."tagsUsers" ALTER COLUMN id SET DEFAULT nextval('public."tagsUsers_id_seq"'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: universities id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.universities ALTER COLUMN id SET DEFAULT nextval('public.universities_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-11-10 07:43:13.252761	2018-11-10 07:43:13.252761
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.categories (id, name, icon, price, created_at, updated_at) FROM stdin;
1	Оценивание	cat1.png	5	2018-11-10 09:41:02.547865	2018-11-10 09:41:02.547865
2	Дикция	cat2.png	4	2018-11-10 09:43:09.055828	2018-11-10 09:43:09.055828
\.


--
-- Data for Name: category_subjects; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.category_subjects (id, name, created_at, updated_at) FROM stdin;
1	Technical	2018-11-10 11:04:32.236399	2018-11-10 11:04:32.236399
\.


--
-- Data for Name: commentaries; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.commentaries (id, user_id, text, status, teacher_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: costs; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.costs (id, teacher_id, user_id, value, created_at, updated_at) FROM stdin;
1	1	2	4	2018-11-11 05:07:31.575359	2018-11-11 05:36:32.550382
\.


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.rates (id, category_id, user_id, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.schema_migrations (version) FROM stdin;
20181110073849
20181110080443
20181110083309
20181110083439
20181110083516
20181110083548
20181110083626
20181110083710
20181110084227
20181110211320
20181110215146
20181111053717
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.subjects (id, name, category_subject_id, created_at, updated_at) FROM stdin;
1	Programming	1	2018-11-10 11:04:02.376257	2018-11-10 11:04:02.376257
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.tags (id, title, created_at, updated_at) FROM stdin;
1	Требовательный	2018-11-11 05:49:38.508813	2018-11-11 05:49:38.508813
2	Дает хорошие советы	2018-11-11 05:49:57.616809	2018-11-11 05:49:57.616809
3	Взаимное уважение	2018-11-11 05:50:12.780299	2018-11-11 05:50:12.780299
4	Прогуляли? Прощайтесь с зачетом	2018-11-11 05:51:11.140004	2018-11-11 05:51:11.140004
5	Принимает участие в жизни своих студентов	2018-11-11 05:51:26.377683	2018-11-11 05:51:26.377683
6	Много домашней работы	2018-11-11 05:51:58.211955	2018-11-11 05:51:58.211955
\.


--
-- Data for Name: tagsUsers; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public."tagsUsers" (id, user_id, tag_id) FROM stdin;
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.teachers (id, name, surname, avatar, university_id, subject_id, created_at, updated_at) FROM stdin;
1	Olzhaev	Olzhas	ava.jpg	1	1	2018-11-10 11:03:23.737295	2018-11-10 11:03:23.737295
\.


--
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.universities (id, name, adress, phone, email, created_at, updated_at, image) FROM stdin;
1	IITU	Almaty, Manas 34A	7727123456	support@iitu.kz	2018-11-10 09:39:02.592312	2018-11-10 09:39:02.592312	iitu.jpg
2	SDU	Kaskelen, 1B	7777456895	support@sdu.kz	2018-11-10 09:39:54.714994	2018-11-10 09:39:54.714994	iitu.jpg
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: yernazar
--

COPY public.users (id, name, surname, adress, university_id, sex, phone, avatar, role, created_at, updated_at, email, password) FROM stdin;
1	Ерназар	Карабаев	1-14-40	\N	1	87052275715	\N	\N	2018-11-10 23:03:33.443915	2018-11-10 23:03:33.443915	\N	1-14-40ernazar
2	Ерназар	Карабаев	1-14-40	\N	1	8702275715	noavatar.png	\N	2018-11-10 23:05:18.886478	2018-11-10 23:05:18.886478	soundsnick@gmail.com	1-14-40ernazar
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: category_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.category_subjects_id_seq', 1, true);


--
-- Name: commentaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.commentaries_id_seq', 1, false);


--
-- Name: costs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.costs_id_seq', 1, true);


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.rates_id_seq', 1, false);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.subjects_id_seq', 1, true);


--
-- Name: tagsUsers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public."tagsUsers_id_seq"', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.tags_id_seq', 6, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.teachers_id_seq', 1, true);


--
-- Name: universities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.universities_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yernazar
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category_subjects category_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.category_subjects
    ADD CONSTRAINT category_subjects_pkey PRIMARY KEY (id);


--
-- Name: commentaries commentaries_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.commentaries
    ADD CONSTRAINT commentaries_pkey PRIMARY KEY (id);


--
-- Name: costs costs_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.costs
    ADD CONSTRAINT costs_pkey PRIMARY KEY (id);


--
-- Name: rates rates_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: tagsUsers tagsUsers_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public."tagsUsers"
    ADD CONSTRAINT "tagsUsers_pkey" PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: yernazar
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

