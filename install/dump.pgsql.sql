--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products (
    "productId" integer NOT NULL,
    title character varying(128) NOT NULL,
    description text NOT NULL,
    price numeric(10,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "products_productId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."products_productId_seq" OWNER TO postgres;

--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "products_productId_seq" OWNED BY products."productId";


--
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_role (
    "roleId" character varying(255) NOT NULL,
    is_default smallint NOT NULL,
    parent_id character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- Name: user_role_linker; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_role_linker (
    user_id bigint NOT NULL,
    role_id character varying(128) NOT NULL
);


ALTER TABLE public.user_role_linker OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    username character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    display_name character varying(50) DEFAULT NULL::character varying,
    password character varying(128) NOT NULL,
    state smallint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_user_id_seq OWNED BY users.user_id;


--
-- Name: productId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN "productId" SET DEFAULT nextval('"products_productId_seq"'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('user_user_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products ("productId", title, description, price) FROM stdin;
9	LG G2 32GB White	GENERAL 2G Network GSM 850 / 900 / 1800 / 1900 CDMA 800 / 1900 - CDMA version 3G Network HSDPA 850 / 900 / 1900 / 2100 CDMA2000 1xEV-DO - CDMA version 4G Network LTE 900 / 1800 / 2100 / 2600 / 850 LTE - CDMA version SIM Micro-SIM.\r\nDISPLAY Type True HD-IPS + LCD capacitive touchscreen, 16M colors Size 1080 x 1920 pixels, 5.2 inches (~424 ppi pixel density) Multitouch Yes Protection Corning Gorilla Glass 2.\r\nMEMORY Card slot No Internal 16GB, 2 GB RAM\r\nCAMERA Primary 13 MP, 4160 x 3120 pixels, autofocus, optical image stabilization, LED flash, Features Simultaneous video and image recording, geo-tagging, face detection, HDR Video Yes, 1080p@60fps, HDR, stereo sound rec., video stabilization, Secondary Yes, 2.1 MP, 1080p@30fps\r\nFEATURES OS Android OS, v4.2.2 (Jelly Bean), upgradable to v4.4.2 (KitKat) Chipset Qualcomm MSM8974 Snapdragon 800 CPU Quad-core 2.26 GHz Krait 400 GPU Adreno 330 Sensors Accelerometer, gyro, proximity, compass Messaging SMS(threaded view), MMS, Email, Push Mail, IM, RSS Browser HTML5.\r\nBATTERY Non-removable Li-Po 3000 mAh battery Stand-by Up to 790 h (2G) / Up to 900 h (3G) Talk time Up to 16 h 30 min (2G) / Up to 17 h 30 min (3G).	446.00
10	LG G3 16GB Silk White	2G: GSM 850 / 900 / 1800 / 1900, 3G: HSDPA 850 / 900 / 1900 / 2100, 4G: LTE 700 / 800 / 900 / 1800 / 2100 / 2300 / 2600\r\n5.5" True HD-IPS + LCD Capacitive Multi-Touchscreen w/ Protective Corning Gorilla Glass 3\r\nAndroid v4.4.2 (KitKat), Quad-Core 2.5 GHz Krait 400 Processor, Chipset: Qualcomm MSM8975AC Snapdragon 81, Adreno 330 Graphics\r\n13 Megapixel Camera (4160 x 3120 pixels) + Front-Facing 2.1 Megapixel Camera\r\nInternal Memory: 32GB, 3GB RAM + microSD Slot Expandable up to 128GB	577.00
11	HTC One Dual SIM Gracier White	Экран 4.7" (1920x1080, сенсорный емкостный, Multitouch) / моноблок / четырехъядерный Qualcomm Snapdragon 600 1.7 ГГц / камера 4 Мп + фронтальная 2.1 Мп / Bluetooth 4.0 / Wi-Fi 802.11 a/b/g/n/ac / NFC / 2 ГБ оперативной памяти / 32 ГБ встроенной памяти + поддержка microSD / разъем 3.5 мм / поддержка 2-х СИМ-карт / 3G / A-GPS / Android 4.1 (Jelly Bean) + HTC Sense 5 / 137.4 x 68.2 x 10.3 мм, 143 г / серебристый	446.00
2	LG G3 16GB Silk White	2G: GSM 850 / 900 / 1800 / 1900, 3G: HSDPA 850 / 900 / 1900 / 2100, 4G: LTE 700 / 800 / 900 / 1800 / 2100 / 2300 / 2600\r\n5.5" True HD-IPS + LCD Capacitive Multi-Touchscreen w/ Protective Corning Gorilla Glass 3\r\nAndroid v4.4.2 (KitKat), Quad-Core 2.5 GHz Krait 400 Processor, Chipset: Qualcomm MSM8975AC Snapdragon 81, Adreno 330 Graphics\r\n13 Megapixel Camera (4160 x 3120 pixels) + Front-Facing 2.1 Megapixel Camera\r\nInternal Memory: 32GB, 3GB RAM + microSD Slot Expandable up to 128GB	577.00
3	HTC One Dual SIM Gracier White	Экран 4.7" (1920x1080, сенсорный емкостный, Multitouch) / моноблок / четырехъядерный Qualcomm Snapdragon 600 1.7 ГГц / камера 4 Мп + фронтальная 2.1 Мп / Bluetooth 4.0 / Wi-Fi 802.11 a/b/g/n/ac / NFC / 2 ГБ оперативной памяти / 32 ГБ встроенной памяти + поддержка microSD / разъем 3.5 мм / поддержка 2-х СИМ-карт / 3G / A-GPS / Android 4.1 (Jelly Bean) + HTC Sense 5 / 137.4 x 68.2 x 10.3 мм, 143 г / серебристый	446.00
4	LG Google Nexus 5 16GB Black	Slimmer, lighter design. Nexus 5 is precision-built from strong materials, and the intelligently simple design showcases more of what matters to you. At only 4.59 oz and 8.59 mm thin, it's the most powerful Nexus phone yet.\r\nSpeed and power to spare. With 4G/LTE and ultra-fast Wi-Fi, Nexus 5 keeps you connected at blazing speeds. Add in the cutting-edge 2.26GHz Qualcomm SnapdragonTM 800 processor and you'll race through games, zip around the web and switch between apps at the flick of a finger.\r\nStunning 5" display. More room to do what you do, and better colors too. Nexus 5 gives you a Full HD display so you can see every detail in lifelike color with less glare and a wider viewing angle-the perfect canvas for your moments.\r\nPowered by Android 4.4, KitKat. Android is fast and powerful yet simple to use. Focus on getting stuff done without having to think about the technology underneath.	384.00
5	HTC One M8 Metal Grey	Protect the edges of your phone from scratches, shock, dust and dumps and other damages.\r\nSnap-to-Locks Design. Easy install and remove, no tools are required.\r\nUniquely Slim 0.7mm design, lightweight. 100 % Brand new and high quality.\r\nFully access to all the device functions. Such as camera, buttons , controls and ports.\r\n1 Year Warranty Against Manufacture Defects, design and art work finish in USA CA by Beyondcell	669.00
6	Apple iPhone 5s 64GB Silver	4-inch Retina display\r\nA7 chip with M7 motion coprocessor\r\nTouch ID fingerprint sensor\r\nNew 8MP iSight camera with True Tone flash and 1080p HD video recording\r\nUnlocked cell phones are compatible with GSM carriers like AT&T and T-Mobile as well as with GSM SIM cards (e.g. H20 and select prepaid carriers). Unlocked cell phones will not work with CDMA Carriers like Sprint, Verizon, Boost or Virgin.	689.00
7	Nokia Lumia 1020 Yellow	GSM 850 / 900 / 1800 / 1900, 3G Network: HSDPA 850 / 900 / 1900 / 2100, 4G Network: LTE 700 / 850 / 1700 / 1900 / 2100\r\n4.5" AMOLED Capacitive Multi-Touchscreen w/ Protective Corning Gorilla Glass 3\r\nDual-Core 1.5 GHz Krait Processor, Chipset: Qualcomm MSM896 Snapdragon, Adreno 225 Graphics\r\n41 MP (38 MP effective, 7152 x 5368 pixels) ), Carl Zeiss optics, optical image stabilization, auto/manual focus, Xenon & LED Flash+ Front-Facing 1.2 Megapixel Camera, 720p@30fps + Video 1080p@30fps, 4x lossless digital zoom, video light\r\nInternal Memory: 32GB, 2GB RAM	355.00
8	Lenovo S860 Titanium	The Lenovo S860 (Titanium) features a 5.3-inch HD IPS display with a resolution of 1024 x 720 pixels and is powered by a 1.3GHz dual core processor and has 2GB of RAM. It comes with 16GB of inbuilt storage and has a 8.0-megapixel rear camera and 1.6MP front camera. It comes with Android 4.2 jelly bean OS and support a 4000mAh battery capacity with 3G.	345.00
12	LG Google Nexus 5 16GB Black	Slimmer, lighter design. Nexus 5 is precision-built from strong materials, and the intelligently simple design showcases more of what matters to you. At only 4.59 oz and 8.59 mm thin, it's the most powerful Nexus phone yet.\r\nSpeed and power to spare. With 4G/LTE and ultra-fast Wi-Fi, Nexus 5 keeps you connected at blazing speeds. Add in the cutting-edge 2.26GHz Qualcomm SnapdragonTM 800 processor and you'll race through games, zip around the web and switch between apps at the flick of a finger.\r\nStunning 5" display. More room to do what you do, and better colors too. Nexus 5 gives you a Full HD display so you can see every detail in lifelike color with less glare and a wider viewing angle-the perfect canvas for your moments.\r\nPowered by Android 4.4, KitKat. Android is fast and powerful yet simple to use. Focus on getting stuff done without having to think about the technology underneath.	384.00
13	HTC One M8 Metal Grey	Protect the edges of your phone from scratches, shock, dust and dumps and other damages.\r\nSnap-to-Locks Design. Easy install and remove, no tools are required.\r\nUniquely Slim 0.7mm design, lightweight. 100 % Brand new and high quality.\r\nFully access to all the device functions. Such as camera, buttons , controls and ports.\r\n1 Year Warranty Against Manufacture Defects, design and art work finish in USA CA by Beyondcell	669.00
14	Apple iPhone 5s 64GB Silver	4-inch Retina display\r\nA7 chip with M7 motion coprocessor\r\nTouch ID fingerprint sensor\r\nNew 8MP iSight camera with True Tone flash and 1080p HD video recording\r\nUnlocked cell phones are compatible with GSM carriers like AT&T and T-Mobile as well as with GSM SIM cards (e.g. H20 and select prepaid carriers). Unlocked cell phones will not work with CDMA Carriers like Sprint, Verizon, Boost or Virgin.	689.00
15	Nokia Lumia 1020 Yellow	GSM 850 / 900 / 1800 / 1900, 3G Network: HSDPA 850 / 900 / 1900 / 2100, 4G Network: LTE 700 / 850 / 1700 / 1900 / 2100\r\n4.5" AMOLED Capacitive Multi-Touchscreen w/ Protective Corning Gorilla Glass 3\r\nDual-Core 1.5 GHz Krait Processor, Chipset: Qualcomm MSM896 Snapdragon, Adreno 225 Graphics\r\n41 MP (38 MP effective, 7152 x 5368 pixels) ), Carl Zeiss optics, optical image stabilization, auto/manual focus, Xenon & LED Flash+ Front-Facing 1.2 Megapixel Camera, 720p@30fps + Video 1080p@30fps, 4x lossless digital zoom, video light\r\nInternal Memory: 32GB, 2GB RAM	355.00
16	Lenovo S860 Titanium	The Lenovo S860 (Titanium) features a 5.3-inch HD IPS display with a resolution of 1024 x 720 pixels and is powered by a 1.3GHz dual core processor and has 2GB of RAM. It comes with 16GB of inbuilt storage and has a 8.0-megapixel rear camera and 1.6MP front camera. It comes with Android 4.2 jelly bean OS and support a 4000mAh battery capacity with 3G.	345.00
17	LG G2 32GB White	GENERAL 2G Network GSM 850 / 900 / 1800 / 1900 CDMA 800 / 1900 - CDMA version 3G Network HSDPA 850 / 900 / 1900 / 2100 CDMA2000 1xEV-DO - CDMA version 4G Network LTE 900 / 1800 / 2100 / 2600 / 850 LTE - CDMA version SIM Micro-SIM.\r\nDISPLAY Type True HD-IPS + LCD capacitive touchscreen, 16M colors Size 1080 x 1920 pixels, 5.2 inches (~424 ppi pixel density) Multitouch Yes Protection Corning Gorilla Glass 2.\r\nMEMORY Card slot No Internal 16GB, 2 GB RAM\r\nCAMERA Primary 13 MP, 4160 x 3120 pixels, autofocus, optical image stabilization, LED flash, Features Simultaneous video and image recording, geo-tagging, face detection, HDR Video Yes, 1080p@60fps, HDR, stereo sound rec., video stabilization, Secondary Yes, 2.1 MP, 1080p@30fps\r\nFEATURES OS Android OS, v4.2.2 (Jelly Bean), upgradable to v4.4.2 (KitKat) Chipset Qualcomm MSM8974 Snapdragon 800 CPU Quad-core 2.26 GHz Krait 400 GPU Adreno 330 Sensors Accelerometer, gyro, proximity, compass Messaging SMS(threaded view), MMS, Email, Push Mail, IM, RSS Browser HTML5.\r\nBATTERY Non-removable Li-Po 3000 mAh battery Stand-by Up to 790 h (2G) / Up to 900 h (3G) Talk time Up to 16 h 30 min (2G) / Up to 17 h 30 min (3G).	446.00
18	LG G3 16GB Silk White	2G: GSM 850 / 900 / 1800 / 1900, 3G: HSDPA 850 / 900 / 1900 / 2100, 4G: LTE 700 / 800 / 900 / 1800 / 2100 / 2300 / 2600\r\n5.5" True HD-IPS + LCD Capacitive Multi-Touchscreen w/ Protective Corning Gorilla Glass 3\r\nAndroid v4.4.2 (KitKat), Quad-Core 2.5 GHz Krait 400 Processor, Chipset: Qualcomm MSM8975AC Snapdragon 81, Adreno 330 Graphics\r\n13 Megapixel Camera (4160 x 3120 pixels) + Front-Facing 2.1 Megapixel Camera\r\nInternal Memory: 32GB, 3GB RAM + microSD Slot Expandable up to 128GB	577.00
19	HTC One Dual SIM Gracier White	Экран 4.7" (1920x1080, сенсорный емкостный, Multitouch) / моноблок / четырехъядерный Qualcomm Snapdragon 600 1.7 ГГц / камера 4 Мп + фронтальная 2.1 Мп / Bluetooth 4.0 / Wi-Fi 802.11 a/b/g/n/ac / NFC / 2 ГБ оперативной памяти / 32 ГБ встроенной памяти + поддержка microSD / разъем 3.5 мм / поддержка 2-х СИМ-карт / 3G / A-GPS / Android 4.1 (Jelly Bean) + HTC Sense 5 / 137.4 x 68.2 x 10.3 мм, 143 г / серебристый	446.00
20	LG Google Nexus 5 16GB Black	Slimmer, lighter design. Nexus 5 is precision-built from strong materials, and the intelligently simple design showcases more of what matters to you. At only 4.59 oz and 8.59 mm thin, it's the most powerful Nexus phone yet.\r\nSpeed and power to spare. With 4G/LTE and ultra-fast Wi-Fi, Nexus 5 keeps you connected at blazing speeds. Add in the cutting-edge 2.26GHz Qualcomm SnapdragonTM 800 processor and you'll race through games, zip around the web and switch between apps at the flick of a finger.\r\nStunning 5" display. More room to do what you do, and better colors too. Nexus 5 gives you a Full HD display so you can see every detail in lifelike color with less glare and a wider viewing angle-the perfect canvas for your moments.\r\nPowered by Android 4.4, KitKat. Android is fast and powerful yet simple to use. Focus on getting stuff done without having to think about the technology underneath.	384.00
1	LG G2 32GB White	GENERAL 2G Network GSM 850 / 900 / 1800 / 1900 CDMA 800 / 1900 - CDMA version 3G Network HSDPA 850 / 900 / 1900 / 2100 CDMA2000 1xEV-DO - CDMA version 4G Network LTE 900 / 1800 / 2100 / 2600 / 850 LTE - CDMA version SIM Micro-SIM.\r\nDISPLAY Type True HD-IPS + LCD capacitive touchscreen, 16M colors Size 1080 x 1920 pixels, 5.2 inches (~424 ppi pixel density) Multitouch Yes Protection Corning Gorilla Glass 2.\r\nMEMORY Card slot No Internal 16GB, 2 GB RAM\r\nCAMERA Primary 13 MP, 4160 x 3120 pixels, autofocus, optical image stabilization, LED flash, Features Simultaneous video and image recording, geo-tagging, face detection, HDR Video Yes, 1080p@60fps, HDR, stereo sound rec., video stabilization, Secondary Yes, 2.1 MP, 1080p@30fps\r\nFEATURES OS Android OS, v4.2.2 (Jelly Bean), upgradable to v4.4.2 (KitKat) Chipset Qualcomm MSM8974 Snapdragon 800 CPU Quad-core 2.26 GHz Krait 400 GPU Adreno 330 Sensors Accelerometer, gyro, proximity, compass Messaging SMS(threaded view), MMS, Email, Push Mail, IM, RSS Browser HTML5.\r\nBATTERY Non-removable Li-Po 3000 mAh battery Stand-by Up to 790 h (2G) / Up to 900 h (3G) Talk time Up to 16 h 30 min (2G) / Up to 17 h 30 min (3G).	446.00
\.


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"products_productId_seq"', 1, false);


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_role ("roleId", is_default, parent_id) FROM stdin;
user	1	\N
admin	0	user
\.


--
-- Data for Name: user_role_linker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_role_linker (user_id, role_id) FROM stdin;
1	user
2	admin
\.


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_user_id_seq', 10, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (user_id, username, email, display_name, password, state) FROM stdin;
2	admin	admin@mail.ru	\N	$2y$14$CGeYClTxzocet23JR2GNi.mFBEhjULwW9xoNSGBEfxnvrAkB1jJWy	\N
1	user	user@mail.ru	\N	$2y$14$GxdT2nE2ZAGxxpMQVAa3TexV65nnkun1dC6dfsZj41gWFHcyqGI8i	\N
\.


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: user_role_linker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_role_linker
    ADD CONSTRAINT user_role_linker_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY ("roleId");


--
-- Name: user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

