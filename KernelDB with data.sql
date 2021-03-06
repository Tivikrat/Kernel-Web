--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2020-02-12 23:54:04

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
-- TOC entry 3091 (class 0 OID 26005)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 26015)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 25997)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add contract	7	add_contract
26	Can change contract	7	change_contract
27	Can delete contract	7	delete_contract
28	Can view contract	7	view_contract
29	Can add elevator	8	add_elevator
30	Can change elevator	8	change_elevator
31	Can delete elevator	8	delete_elevator
32	Can view elevator	8	view_elevator
33	Can add good	9	add_good
34	Can change good	9	change_good
35	Can delete good	9	delete_good
36	Can view good	9	view_good
37	Can add weighing	10	add_weighing
38	Can change weighing	10	change_weighing
39	Can delete weighing	10	delete_weighing
40	Can view weighing	10	view_weighing
41	Can add weight check	11	add_weightcheck
42	Can change weight check	11	change_weightcheck
43	Can delete weight check	11	delete_weightcheck
44	Can view weight check	11	view_weightcheck
45	Can add provider	12	add_provider
46	Can change provider	12	change_provider
47	Can delete provider	12	delete_provider
48	Can view provider	12	view_provider
49	Can add lab assistant	13	add_labassistant
50	Can change lab assistant	13	change_labassistant
51	Can delete lab assistant	13	delete_labassistant
52	Can view lab assistant	13	view_labassistant
53	Can add lab analysis	14	add_labanalysis
54	Can change lab analysis	14	change_labanalysis
55	Can delete lab analysis	14	delete_labanalysis
56	Can view lab analysis	14	view_labanalysis
57	Can add guardian	15	add_guardian
58	Can change guardian	15	change_guardian
59	Can delete guardian	15	delete_guardian
60	Can view guardian	15	view_guardian
61	Can add delivery	16	add_delivery
62	Can change delivery	16	change_delivery
63	Can delete delivery	16	delete_delivery
64	Can view delivery	16	view_delivery
65	Can add Token	17	add_token
66	Can change Token	17	change_token
67	Can delete Token	17	delete_token
68	Can view Token	17	view_token
\.


--
-- TOC entry 3095 (class 0 OID 26023)
-- Dependencies: 213
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$180000$IebDN5m2trkr$Qv9KSbh4IRP4NfPbn2n3dmVv97dT/5B6vRd+U5MPq5o=	2020-02-12 02:08:57.093048+02	f	login			email@email.com	f	t	2020-02-12 02:08:56.818781+02
4	pbkdf2_sha256$180000$OdI4NiUvzDqD$+CuKmgGietHC/zXhUMNEq1CyCjHutlgCZG2dcqDIytM=	\N	f	login1	Максим	Пащенко	email1@email.com	f	t	2020-02-12 02:15:13.698576+02
5	pbkdf2_sha256$180000$jTOvXPO4M4xw$lj5uLmndptekaoPrVtrpT2kCd30QFXR5nVRUuYs2b2I=	2020-02-12 20:11:25.946429+02	f	farmer	Фермер	Фермерниченко	farmer@email.com	f	t	2020-02-12 16:00:04.391478+02
1	pbkdf2_sha256$180000$slJK4T45nLUp$iVh65G9A/kdWuGl+BQDfeYUJ0qF7FjCJ2JEnkXtfskc=	2020-02-12 22:25:05.03234+02	t	Tivikrat				t	t	2020-02-11 17:20:41.04465+02
\.


--
-- TOC entry 3097 (class 0 OID 26033)
-- Dependencies: 215
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 26041)
-- Dependencies: 217
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 26334)
-- Dependencies: 241
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
f5b7213fe37329c023a783800162261a4ec3106f	2020-02-11 17:59:21.515687+02	1
98e9a4a35a5ba878f0d47c6187652fd8eba6a0d7	2020-02-12 02:08:57.104017+02	3
97a2382fa5446e85dd89c75ced50d6feefbef31d	2020-02-12 02:15:14.096512+02	4
98e2652f28820b6076fbc023cecadd61277e7642	2020-02-12 16:00:04.729645+02	5
\.


--
-- TOC entry 3101 (class 0 OID 26101)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 25987)
-- Dependencies: 205
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	elevator	contract
8	elevator	elevator
9	elevator	good
10	elevator	weighing
11	elevator	weightcheck
12	elevator	provider
13	elevator	labassistant
14	elevator	labanalysis
15	elevator	guardian
16	elevator	delivery
17	authtoken	token
\.


--
-- TOC entry 3085 (class 0 OID 25976)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-11 17:02:50.185471+02
2	auth	0001_initial	2020-02-11 17:02:50.271646+02
3	admin	0001_initial	2020-02-11 17:02:50.396919+02
4	admin	0002_logentry_remove_auto_add	2020-02-11 17:02:50.424355+02
5	admin	0003_logentry_add_action_flag_choices	2020-02-11 17:02:50.43632+02
6	contenttypes	0002_remove_content_type_name	2020-02-11 17:02:50.468237+02
7	auth	0002_alter_permission_name_max_length	2020-02-11 17:02:50.476216+02
8	auth	0003_alter_user_email_max_length	2020-02-11 17:02:50.492173+02
9	auth	0004_alter_user_username_opts	2020-02-11 17:02:50.505136+02
10	auth	0005_alter_user_last_login_null	2020-02-11 17:02:50.524116+02
11	auth	0006_require_contenttypes_0002	2020-02-11 17:02:50.527106+02
12	auth	0007_alter_validators_add_error_messages	2020-02-11 17:02:50.541168+02
13	auth	0008_alter_user_username_max_length	2020-02-11 17:02:50.564059+02
14	auth	0009_alter_user_last_name_max_length	2020-02-11 17:02:50.577973+02
15	auth	0010_alter_group_name_max_length	2020-02-11 17:02:50.593928+02
16	auth	0011_update_proxy_permissions	2020-02-11 17:02:50.605897+02
17	elevator	0001_initial	2020-02-11 17:02:50.841167+02
18	sessions	0001_initial	2020-02-11 17:02:50.980218+02
19	authtoken	0001_initial	2020-02-11 17:23:25.902187+02
20	authtoken	0002_auto_20160226_1747	2020-02-11 17:23:26.018874+02
21	elevator	0002_auto_20200212_1122	2020-02-12 11:23:16.526345+02
22	elevator	0003_auto_20200212_1522	2020-02-12 15:22:34.982517+02
23	elevator	0004_delivery_to_elevator	2020-02-12 15:23:22.57445+02
24	elevator	0005_auto_20200212_1531	2020-02-12 15:31:10.998391+02
25	elevator	0006_auto_20200212_1619	2020-02-12 16:19:14.894532+02
26	elevator	0007_auto_20200212_1657	2020-02-12 16:57:05.843932+02
27	elevator	0008_auto_20200212_1755	2020-02-12 17:55:16.425354+02
28	elevator	0009_auto_20200212_1834	2020-02-12 18:34:55.547371+02
\.


--
-- TOC entry 3122 (class 0 OID 26323)
-- Dependencies: 240
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
54ewyqcu33l6ikfrpo31a5bshgqrfgfk	MzhmMmJjNjJjODBmMWQ1MzQxZDFiN2I4NThmMTcwMDY2YWE5NDZhOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZTU2NzhjYjFmZDZjY2MxNWI4MmEzNjlkZThkYjIzNWNmMGU2ZDIwIn0=	2020-02-26 22:25:05.041315+02
\.


--
-- TOC entry 3103 (class 0 OID 26134)
-- Dependencies: 221
-- Data for Name: elevator_contract; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_contract (id, name, weight, is_confirmed, date, good_id, provider_id) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 26218)
-- Dependencies: 239
-- Data for Name: elevator_delivery; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_delivery (id, name, lsd_number, is_lsd_unhurted, car_number, driver_name, elevator_id, guardian_id, lab_analysis_id, weight_check_id, date, provider_id, to_elevator) FROM stdin;
16	ТТН17	\N	\N	\N	\N	2	\N	25	17	2019-10-09	2	t
17	ТТН18	\N	\N	\N	\N	2	\N	26	18	2019-10-09	2	t
18	ТТН19	\N	\N	\N	\N	2	\N	27	19	2019-10-09	2	t
19	ТТН20	\N	\N	\N	\N	2	\N	28	20	2019-10-09	2	t
1	ТТН1	\N	\N	\N	\N	2	\N	5	2	2019-09-27	2	t
2	ТТН2	\N	\N	\N	\N	2	\N	6	3	2019-09-27	2	t
3	ТТН3	\N	\N	\N	\N	2	\N	7	4	2019-09-27	2	t
4	ТТН5	\N	\N	\N	\N	2	\N	8	5	2019-09-30	2	t
5	ТТН6	\N	\N	\N	\N	2	\N	9	6	2019-09-30	2	t
6	ТТН7	\N	\N	\N	\N	2	\N	10	7	2019-10-07	2	t
7	ТТН8	\N	\N	\N	\N	2	\N	11	8	2019-10-07	2	t
8	ТТН9	\N	\N	\N	\N	2	\N	12	9	2019-10-07	2	t
9	ТТН10	\N	\N	\N	\N	2	\N	13	10	2019-10-07	2	t
10	ТТН11	\N	\N	\N	\N	2	\N	14	11	2019-10-07	2	t
11	ТТН12	\N	\N	\N	\N	2	\N	15	12	2019-10-07	2	t
12	ТТН13	\N	\N	\N	\N	2	\N	16	13	2019-10-08	2	t
13	ТТН14	\N	\N	\N	\N	2	\N	17	14	2019-10-08	2	t
14	ТТН15	\N	\N	\N	\N	2	\N	18	15	2019-10-08	2	t
15	ТТН16	\N	\N	\N	\N	2	\N	19	16	2019-10-08	2	t
20	ТТН21	\N	\N	\N	\N	2	\N	20	21	2019-10-09	2	t
21	ТТН22	\N	\N	\N	\N	2	\N	21	22	2019-10-12	2	t
22	ТТН23	\N	\N	\N	\N	2	\N	22	23	2019-10-12	2	t
23	ТТН24	\N	\N	\N	\N	2	\N	23	24	2019-10-12	2	t
24	ТТН25	\N	\N	\N	\N	2	\N	24	25	2019-10-12	2	t
\.


--
-- TOC entry 3105 (class 0 OID 26145)
-- Dependencies: 223
-- Data for Name: elevator_elevator; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_elevator (id, name, address) FROM stdin;
2	Дніпровський Kernel елеватор № 154256	м. Дніпро, вул. Жовтнева, 40
\.


--
-- TOC entry 3107 (class 0 OID 26156)
-- Dependencies: 225
-- Data for Name: elevator_good; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_good (id, name) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 26210)
-- Dependencies: 237
-- Data for Name: elevator_guardian; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_guardian (id, elevator_id, user_id) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 26202)
-- Dependencies: 235
-- Data for Name: elevator_labanalysis; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_labanalysis (id, humidity, clogging, lab_assistant_id) FROM stdin;
5	17.4	3.5	3
6	17	3.3	3
7	17.5	3.1	3
8	16.9	3.5	3
9	17.1	3.9	3
10	17.1	2.95	3
11	16.8	3.2	3
12	17	3.3	3
13	16.9	3.3	3
14	16.8	3.3	3
15	17.1	3.15	3
16	16.8	2.9	3
17	16.8	3	3
18	17.5	2.9	3
19	17.3	2.8	3
22	16.8	3.1	3
23	16.8	2.8	3
24	17.3	2.9	3
25	16.8	2.9	3
26	16.8	3	3
27	16.8	3	3
28	17.3	2.9	3
20	17.35	2.7	3
21	17.1	2.8	3
\.


--
-- TOC entry 3115 (class 0 OID 26194)
-- Dependencies: 233
-- Data for Name: elevator_labassistant; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_labassistant (id, elevator_id, user_id) FROM stdin;
6	2	3
3	2	1
\.


--
-- TOC entry 3113 (class 0 OID 26183)
-- Dependencies: 231
-- Data for Name: elevator_provider; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_provider (id, name, user_id) FROM stdin;
2	Фермерське господарство	5
\.


--
-- TOC entry 3109 (class 0 OID 26167)
-- Dependencies: 227
-- Data for Name: elevator_weighing; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_weighing (id, elevator_id, user_id) FROM stdin;
3	2	1
\.


--
-- TOC entry 3111 (class 0 OID 26175)
-- Dependencies: 229
-- Data for Name: elevator_weightcheck; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_weightcheck (id, gross_weight, net_weight, weighing_id) FROM stdin;
2	\N	21060	3
3	\N	21100	3
4	\N	21300	3
5	\N	20600	3
6	\N	20260	3
7	\N	21060	3
8	\N	20100	3
9	\N	19100	3
10	\N	20100	3
11	\N	20100	3
12	\N	20040	3
13	\N	22060	3
14	\N	21100	3
15	\N	23100	3
16	\N	21340	3
17	\N	25050	3
18	\N	21100	3
19	\N	21100	3
20	\N	22100	3
21	\N	21040	3
22	\N	21340	3
23	\N	22680	3
24	\N	22100	3
25	\N	21710	3
\.


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 220
-- Name: elevator_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_contract_id_seq', 1, false);


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 238
-- Name: elevator_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_delivery_id_seq', 24, true);


--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 222
-- Name: elevator_elevator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_elevator_id_seq', 2, true);


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 224
-- Name: elevator_good_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_good_id_seq', 9, true);


--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 236
-- Name: elevator_guardian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_guardian_id_seq', 1, false);


--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 234
-- Name: elevator_labanalysis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_labanalysis_id_seq', 28, true);


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 232
-- Name: elevator_labassistant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_labassistant_id_seq', 6, true);


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 230
-- Name: elevator_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_provider_id_seq', 2, true);


--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 226
-- Name: elevator_weighing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_weighing_id_seq', 3, true);


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 228
-- Name: elevator_weightcheck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_weightcheck_id_seq', 25, true);


-- Completed on 2020-02-12 23:54:04

--
-- PostgreSQL database dump complete
--

