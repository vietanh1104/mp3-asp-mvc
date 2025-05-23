--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2024-09-12 07:34:19

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
-- TOC entry 3374 (class 1262 OID 48394)
-- Name: mine_music; Type: DATABASE; Schema: -; Owner: user1
--

CREATE DATABASE mine_music WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE mine_music OWNER TO user1;

\connect mine_music

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

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 48395)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: user1
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO user1;

--
-- TOC entry 210 (class 1259 OID 48400)
-- Name: authors; Type: TABLE; Schema: public; Owner: user1
--

CREATE TABLE public.authors (
    "Id" uuid NOT NULL,
    "Name" text
);


ALTER TABLE public.authors OWNER TO user1;

--
-- TOC entry 211 (class 1259 OID 48407)
-- Name: categories; Type: TABLE; Schema: public; Owner: user1
--

CREATE TABLE public.categories (
    "Id" uuid NOT NULL,
    "Name" text
);


ALTER TABLE public.categories OWNER TO user1;

--
-- TOC entry 215 (class 1259 OID 48547)
-- Name: favourite_collections; Type: TABLE; Schema: public; Owner: user1
--

CREATE TABLE public.favourite_collections (
    "MediaId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "CreatedAt" timestamp without time zone
);


ALTER TABLE public.favourite_collections OWNER TO user1;

--
-- TOC entry 213 (class 1259 OID 48421)
-- Name: media; Type: TABLE; Schema: public; Owner: user1
--

CREATE TABLE public.media (
    "Id" uuid NOT NULL,
    "Name" text,
    "ContentUrl" text,
    "Description" text,
    "Type" integer NOT NULL,
    "Price" numeric NOT NULL,
    "IsHidden" boolean NOT NULL,
    "IsLocked" boolean NOT NULL,
    "AuthorId" uuid NOT NULL,
    "CategoryId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "CreatedAt" timestamp without time zone NOT NULL,
    "UpdatedAt" timestamp without time zone NOT NULL
);


ALTER TABLE public.media OWNER TO user1;

--
-- TOC entry 214 (class 1259 OID 48465)
-- Name: media_content; Type: TABLE; Schema: public; Owner: user1
--

CREATE TABLE public.media_content (
    "Id" uuid NOT NULL,
    "Type" integer NOT NULL,
    "Value" text,
    "MediaId" uuid NOT NULL,
    "CreatedAt" timestamp without time zone NOT NULL,
    "UpdatedAt" timestamp without time zone NOT NULL
);


ALTER TABLE public.media_content OWNER TO user1;

--
-- TOC entry 216 (class 1259 OID 48572)
-- Name: media_view_history; Type: TABLE; Schema: public; Owner: user1
--

CREATE TABLE public.media_view_history (
    "Id" uuid NOT NULL,
    "MediaId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "CreatedAt" timestamp without time zone NOT NULL,
    "UpdatedAt" timestamp without time zone NOT NULL
);


ALTER TABLE public.media_view_history OWNER TO user1;

--
-- TOC entry 212 (class 1259 OID 48414)
-- Name: users; Type: TABLE; Schema: public; Owner: user1
--

CREATE TABLE public.users (
    "Id" uuid NOT NULL,
    "Username" text,
    "DisplayName" text,
    "AvatarUrl" text,
    "Gender" integer NOT NULL,
    "Dob" timestamp without time zone NOT NULL,
    "Address" text,
    "PhoneNumber" text,
    "Email" text,
    "IsLocked" boolean NOT NULL,
    "IsAdmin" boolean NOT NULL,
    "CreatedAt" timestamp without time zone NOT NULL,
    "UpdatedAt" timestamp without time zone NOT NULL,
    "Password" text
);


ALTER TABLE public.users OWNER TO user1;

--
-- TOC entry 3361 (class 0 OID 48395)
-- Dependencies: 209
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: user1
--

INSERT INTO public."__EFMigrationsHistory" VALUES ('20240329094704_init', '6.0.12');
INSERT INTO public."__EFMigrationsHistory" VALUES ('20240331181644_demoinit', '6.0.12');
INSERT INTO public."__EFMigrationsHistory" VALUES ('20240404165026_update', '6.0.12');
INSERT INTO public."__EFMigrationsHistory" VALUES ('20240407144214_updatedb', '6.0.12');
INSERT INTO public."__EFMigrationsHistory" VALUES ('20240519170451_final', '6.0.29');
INSERT INTO public."__EFMigrationsHistory" VALUES ('20240519171243_final1', '6.0.29');
INSERT INTO public."__EFMigrationsHistory" VALUES ('20240519173708_final2', '6.0.29');


--
-- TOC entry 3362 (class 0 OID 48400)
-- Dependencies: 210
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: user1
--

INSERT INTO public.authors VALUES ('19898cd2-75b4-4d3c-86bd-0d111392ae63', 'Sơn Tùng MTP');
INSERT INTO public.authors VALUES ('19898cd2-75b4-4d3c-86bd-0d111392ae64', 'Đen Vâu');
INSERT INTO public.authors VALUES ('a54c0c25-6172-43ee-8d5f-e1be77d21204', 'BigBang');
INSERT INTO public.authors VALUES ('ea58a553-9db6-40dc-b208-4aad8cd23ead', 'Hoàng Dũng');
INSERT INTO public.authors VALUES ('79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', 'Roonbogz');
INSERT INTO public.authors VALUES ('be591255-7063-4d48-8c5f-4a5c7511e61a', 'Soobin Hoàng Sơn');
INSERT INTO public.authors VALUES ('f117b6b8-506e-4d4b-ad08-debc8c262a67', 'Hiền Hồ');
INSERT INTO public.authors VALUES ('c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', 'Hà Nhi');
INSERT INTO public.authors VALUES ('bdbd760d-5541-4be2-aeec-e217ef4d1c0b', 'Phạm Nguyên Ngọc');
INSERT INTO public.authors VALUES ('c2c9e66d-e589-45ad-ae6e-08fb64d6bcd0', 'Vũ');
INSERT INTO public.authors VALUES ('30f01a96-a9f7-48ff-b5c2-7c6305200164', 'Tiên Tiên');
INSERT INTO public.authors VALUES ('4fe57ce6-c10f-4772-8f05-f3ae146c7fbf', 'Như Quỳnh');
INSERT INTO public.authors VALUES ('19898cd2-75b4-4d3c-86bd-0d111392ae62', 'anonymous');


--
-- TOC entry 3363 (class 0 OID 48407)
-- Dependencies: 211
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: user1
--

INSERT INTO public.categories VALUES ('6d23da42-426f-4572-a7e1-baace7460841', 'Rap');
INSERT INTO public.categories VALUES ('7fdbc6fa-c648-4944-be6a-00c9a6785fce', 'Pop');
INSERT INTO public.categories VALUES ('fe37b02d-ef94-4e3b-b685-46bb8f7b57dc', 'Unknown');
INSERT INTO public.categories VALUES ('5e4ee03b-675b-4b1b-a53e-11143726b994', 'Nhạc vàng');


--
-- TOC entry 3367 (class 0 OID 48547)
-- Dependencies: 215
-- Data for Name: favourite_collections; Type: TABLE DATA; Schema: public; Owner: user1
--

INSERT INTO public.favourite_collections VALUES ('6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 08:55:11.213883');
INSERT INTO public.favourite_collections VALUES ('f7450d9a-ab05-4b02-9bbe-473e334b06fd', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 08:55:24.670312');
INSERT INTO public.favourite_collections VALUES ('5087667c-2f59-473a-9e78-9e871cb6b3b2', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 08:55:45.599167');
INSERT INTO public.favourite_collections VALUES ('bfac4cfe-1ad6-4b8e-9c22-45d51acd20fb', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 08:55:54.337948');


--
-- TOC entry 3365 (class 0 OID 48421)
-- Dependencies: 213
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: user1
--

INSERT INTO public.media VALUES ('1e25a129-a0e4-4530-8c7b-44abeb1a28cb', 'Loving you sunny', '/media/audio/lovingyousunny.mp3', 'Performed by Kimmese, Đen 
Prod. by Touliver 
 Special Thanks to Glowing Studio, Moov, SpaceSpeakers, JustaTee, Rhymastic, Touliver, Đen, Anna Constanza De. Keulenaar', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:47:18.488662', '2024-05-11 22:47:18.488665');
INSERT INTO public.media VALUES ('036ae7b5-72f2-4fd2-b4f7-06da494f6b42', 'Dĩ vãng nhạt nhòa', '/media/audio/divangnhatnhoa.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:55:21.587278', '2024-05-11 21:55:21.587281');
INSERT INTO public.media VALUES ('2f504a10-f142-43bf-8c8b-ea917d4a53e2', 'Không bằng', '/media/audio/khongbang.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:48:40.580179', '2024-05-11 21:48:40.580181');
INSERT INTO public.media VALUES ('14c5d2c4-4b4c-438f-9d52-6a7ab2e46de1', 'Tội cho em', '/media/audio/toichoem.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:49:15.778362', '2024-05-11 21:49:15.778364');
INSERT INTO public.media VALUES ('03c2e30f-64c6-4ca2-b0db-cc6a78d04513', 'Lối nhỏ', '/media/audio/loinho.mp3', 'Guitarist: Nguyễn Vũ Khoa Danh
Record/Mix/Master: Trác Ngọc Lĩnh
Background vocal: Lynk Lee, Biên, Huỳnh Tân. 
Intro Music: Danse Macabre - Saint-Saens  - David Tobin, Jeff Meegan, Julian Gallant | Audio Network', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:39:25.250755', '2024-05-11 22:39:25.250897');
INSERT INTO public.media VALUES ('2351eacf-09db-4d16-92f6-9fc67cf9cced', 'Nấu ăn cho em', '/media/audio/nauanchoem.mp3', 'Music Producer: Long Nguyễn
Music Arranger : Daigoo
Mixing & Mastering : Anh Minh Xrecords
Recording: Phạm Hoàng Huy - Trường Đặng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:40:32.521341', '2024-05-11 22:40:32.521343');
INSERT INTO public.media VALUES ('6e752c9f-ee95-4001-b76b-00a2a604658c', 'Đi về nhà', '/media/audio/divenha.mp3', 'Sáng tác: Hứa Kim Tuyền, Xuân Ty 
Sáng tác rap: Đen 
Phối khí: Machiot, Jase
Mix & Master: Bố Thỏ Heo
Background vocal: Kimmese và dàn đồng ca', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:41:34.252954', '2024-05-11 22:41:34.252956');
INSERT INTO public.media VALUES ('bd10e5a1-4003-4058-a29d-44edc9b72a10', 'Bài này chill phết', '/media/audio/bainaychillphet.mp3', 'Sáng tác: Hứa Kim Tuyền, Xuân Ty 
Sáng tác rap: Đen 
Phối khí: Machiot, Jase
Mix & Master: Bố Thỏ Heo
Background vocal: Kimmese và dàn đồng ca', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:42:22.739431', '2024-05-11 22:42:22.739434');
INSERT INTO public.media VALUES ('c8440311-f3d8-4749-b43b-1af5ba9622f1', 'Bài này chill phết', '/media/audio/bainaychillphet.mp3', 'Prod. by MADIHU
Record/Mix/Master: Trác Ngọc Lĩnh
Co-writer : Kimmese', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:42:41.860932', '2024-05-11 22:42:41.860935');
INSERT INTO public.media VALUES ('f539a96f-0e48-4f04-b490-4e1af78f881e', 'Mười năm', '/media/audio/muoinam.mp3', 'Composer: Lynk Lee & Đen
Prod. by MISERY
Record/Mix/Master: Trác Ngọc Lĩnh
Record Ack Studio', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:44:22.089364', '2024-05-11 22:44:22.089366');
INSERT INTO public.media VALUES ('a1e13452-262b-4c67-a905-c58f2b923eae', 'Mang tiền về cho mẹ', '/media/audio/mangtienvechome.mp3', 'Thể hiện: Đen, Nguyên Thảo
Sáng tác: denvau
Đạo diễn: Hoàng Thành Đồng
Music production: 808Lab - A.N Productions 
Arranging, Mixing & Mastering : Aazuki 
Guitarist & Recording : Đông Phong', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:45:53.825685', '2024-05-11 22:45:53.825688');
INSERT INTO public.media VALUES ('f1797abb-abc4-4733-84d8-0d9589be19c0', 'Đưa nhau đi trốn', '/media/audio/duanhauditron.mp3', 'Produced by Long Nguyễn 
BACKING VOCALIST: Kim Long, Tường Minh, Hiền VK, Jack Trần, Ngọc Biên', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:49:10.316094', '2024-05-11 22:49:10.316098');
INSERT INTO public.media VALUES ('bbf34d69-e987-4e3c-a52a-769071c99687', 'Vì yêu cứ đâm đầu', '/media/audio/viyeucudamdau.mp3', 'MIN (feat. Đen, JustaTee) - Vì Yêu Cứ Đâm Đầu', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:50:09.208999', '2024-05-11 22:50:09.209003');
INSERT INTO public.media VALUES ('3b8de1f0-08fa-4ed1-a10e-0da49fbc9286', 'Nhạc của rừng', '/media/audio/nhaccuarung.mp3', 'Thể hiện: Đen, Hiền VK 
Đạo diễn: Hoàng Thành Đồng 
Music Producer: Long Nguyễn', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae64', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:51:47.673841', '2024-05-11 22:51:47.673843');
INSERT INTO public.media VALUES ('2ef27942-c9b3-4bc5-8989-c6eab14fc719', 'Chúng ta của tương lai', '/media/audio/chungtacuatuonglai.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:00:48.363062', '2024-05-11 22:00:48.363064');
INSERT INTO public.media VALUES ('728b64c8-8cfb-4cfc-b5c3-e24dc144fb1f', 'Nơi này có anh', '/media/audio/noinaycoanh.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:01:49.189016', '2024-05-11 22:01:49.189018');
INSERT INTO public.media VALUES ('7d537926-f552-4e7e-9709-413beee229a5', 'Buông đôi tay nhau ra', '/media/audio/buongdoitaynhaura.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:07:09.753701', '2024-05-11 22:07:09.753704');
INSERT INTO public.media VALUES ('a4207396-652f-4dfd-a4bc-3bca99b56bd8', 'Cơn mưa ngang qua', '/media/audio/conmuangangqua.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:10:20.518553', '2024-05-11 22:10:20.518555');
INSERT INTO public.media VALUES ('7e7afa04-6715-4590-b68f-1a561e3b9502', 'Chúng ta không thuộc về nhau', '/media/audio/chungtakhongthuocvenhau.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:10:49.964916', '2024-05-11 22:10:49.964919');
INSERT INTO public.media VALUES ('6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', 'Ấn nút thả giấc mơ', '/media/audio/annutthagiacmo.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:11:15.192199', '2024-05-11 22:11:15.1922');
INSERT INTO public.media VALUES ('5b5403af-5d9c-485f-a523-18605f99d234', 'Em đừng đi', '/media/audio/emdungdi.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:15:27.747669', '2024-05-11 22:15:27.747672');
INSERT INTO public.media VALUES ('b55a7923-3fd0-4645-ab53-e8c319f47471', 'Bình yên nơi đâu', '/media/audio/binhyennoidau.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:16:13.208801', '2024-05-11 22:16:13.208804');
INSERT INTO public.media VALUES ('67866f67-dc44-4a62-8f13-5baecf5eff73', 'Làm người luôn yêu em', '/media/audio/lamnguoiluonyeuem.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:16:36.763552', '2024-05-11 22:16:36.763555');
INSERT INTO public.media VALUES ('7920a1da-2ee3-4528-83c8-e475e3d750bd', 'Không phải dạng vừa đâu', '/media/audio/khongphaidangvuadau.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:18:11.585344', '2024-05-11 22:18:11.585347');
INSERT INTO public.media VALUES ('315dc472-f790-47f3-9473-79edcc4ca060', 'Chạy ngay đi', '/media/audio/blue.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-04-07 22:32:02.115308', '2024-04-07 22:32:02.115308');
INSERT INTO public.media VALUES ('c63b4573-e10d-42fd-8f5c-2f8833214132', 'Chưa quên người yêu cũ', '/media/audio/chuaquennguoiyeucu.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:53:53.226668', '2024-05-11 21:53:53.226673');
INSERT INTO public.media VALUES ('80f032f1-2dd4-47a4-88f0-ebf54d24fd54', 'Khước từ', '/media/audio/khuoctu.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:54:07.188834', '2024-05-11 21:54:07.188836');
INSERT INTO public.media VALUES ('c70cfa98-b528-4df8-9d56-d1fc8899b50c', 'Hồi kết', '/media/audio/hoiket.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:54:21.391877', '2024-05-11 21:54:21.391878');
INSERT INTO public.media VALUES ('f169c4ed-a773-4ca4-9576-b9f181de36b2', 'Vì em chưa bao giờ khóc', '/media/audio/viemchuabaogiokhoc.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:55:49.886876', '2024-05-11 21:55:49.886877');
INSERT INTO public.media VALUES ('bf5328e6-d62c-4de7-ba3a-9fc6f917c672', 'Lâu lâu nhắc lại', '/media/audio/laulaunhaclai.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:56:40.50848', '2024-05-11 21:56:40.508484');
INSERT INTO public.media VALUES ('e0f37b00-d617-4122-ae63-f766c91ea64e', 'Chúng ta của hiện tại', '/media/audio/chungtacuahientai.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-04-07 22:32:02.11518', '2024-04-07 22:32:02.11518');
INSERT INTO public.media VALUES ('f7450d9a-ab05-4b02-9bbe-473e334b06fd', 'Blue', '/media/audio/blue.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-04-07 22:32:02.115306', '2024-04-07 22:32:02.115306');
INSERT INTO public.media VALUES ('ec7e5673-bea5-4ce3-b741-1fc7d589067a', 'Nhắn nhủ', '/media/audio/nhannhu.mp3', 'Làm beat, mix master, viết nhạc, thu âm: Ronboogz  
Làm cái clip này: Nguyễn Đức Trọng', 0, 0, false, false, '79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:53:17.82533', '2024-05-11 22:53:17.825334');
INSERT INTO public.media VALUES ('62e05c7d-290e-4215-a94e-ed1e6bc12f10', 'Nói dối', '/media/audio/noidoi.mp3', 'Produce: Ronboogz 
Artwork: Nghĩa Trần 
Lyrics video: Nguyễn Đức Trọng', 0, 0, false, false, '79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:54:22.482385', '2024-05-11 22:54:22.482404');
INSERT INTO public.media VALUES ('47ac9efb-420b-4d03-b430-3a695fd3b43a', 'Anh chỉ muốn', '/media/audio/anhchimuon.mp3', 'Làm beat, mix master, viết nhạc, thu âm: Ronboogz 
Quay phim: Võ Hồng Sơn', 0, 0, false, false, '79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:55:37.091074', '2024-05-11 22:55:37.091076');
INSERT INTO public.media VALUES ('0380613f-160b-499a-a8d7-78d369733d06', 'Don''t côi', '/media/audio/dontcoi.mp3', 'Prod by Ronboogz  
Mix & master: Ronboogz', 0, 0, false, false, '79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:56:43.01924', '2024-05-11 22:56:43.019241');
INSERT INTO public.media VALUES ('054ffbe8-f27b-40f6-bdb4-6031f971c1f6', 'Khi mà', '/media/audio/khima.mp3', 'Prod by Ronboogz  
Mix & master: Ronboogz', 0, 0, false, false, '79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:57:35.904112', '2024-05-11 22:57:35.904114');
INSERT INTO public.media VALUES ('a2fd3c17-99ff-4655-b62c-e19f9716c222', 'Sớm mai', '/media/audio/sommai.mp3', 'PiaLinh, Ronboogz, BONN!EX', 0, 0, false, false, '79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:58:44.103794', '2024-05-11 22:58:44.103796');
INSERT INTO public.media VALUES ('adc34f2a-ba98-493d-ad7d-be4931c8609b', 'Lời không nói', '/media/audio/loikhongnoi.mp3', 'Music producer/mix master: Ronboogz 
Composer: Ronboogz', 0, 0, false, false, '79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:59:38.518659', '2024-05-11 22:59:38.518663');
INSERT INTO public.media VALUES ('0b847399-d650-4485-acce-ec03c8f9ecf3', 'Chỉ là một hai câu', '/media/audio/chilamothaicau.mp3', 'Music producer/mix master: Ronboogz 
Composer: Ronboogz', 0, 0, false, false, '79ba2e1d-07ba-44fe-a8b9-87796bc78d1e', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:00:47.788715', '2024-05-11 23:00:47.788718');
INSERT INTO public.media VALUES ('c3a433f1-da46-4e98-adb9-9f2ff3f7c195', 'Loser', '/media/audio/loser.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:03:39.734759', '2024-05-11 23:03:39.734761');
INSERT INTO public.media VALUES ('70731ed0-4688-4447-8845-1c5600873314', 'Fantastic baby', '/media/audio/fantasticbaby.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:04:41.918997', '2024-05-11 23:04:41.919');
INSERT INTO public.media VALUES ('8a1416c4-937d-449e-8cab-d0523d770733', 'Last dance', '/media/audio/lastdance.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:09:42.514228', '2024-05-11 23:09:42.514232');
INSERT INTO public.media VALUES ('9b208cca-ee23-44f9-9c78-f1f5ab13b13e', 'Still life', '/media/audio/stilllife.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:10:19.453875', '2024-05-11 23:10:19.453879');
INSERT INTO public.media VALUES ('9ad40d31-967e-488e-9cc8-63bb32783b33', 'Bang bang bang', '/media/audio/bangbangbang.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:14:13.896452', '2024-05-11 23:14:13.896456');
INSERT INTO public.media VALUES ('f7c6d246-1e0d-4c97-9fd9-1ad5cf50c09a', 'Bae bae', '/media/audio/baebae.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:15:08.516504', '2024-05-11 23:15:08.516507');
INSERT INTO public.media VALUES ('caf159c8-e121-49fa-923d-bd2dfb791e9e', 'Bad boy', '/media/audio/badboy.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:15:43.103864', '2024-05-11 23:15:43.103867');
INSERT INTO public.media VALUES ('73182dfd-9b06-4aa9-9d17-b3cf9dc2c480', 'Sober', '/media/audio/sober.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:18:09.119355', '2024-05-11 23:18:09.11936');
INSERT INTO public.media VALUES ('28c4e4e2-c2a0-4c9c-a9a2-6457b900c905', 'We like 2 party', '/media/audio/welike2party.mp3', 'BigBang', 0, 0, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:19:02.194968', '2024-05-11 23:19:02.194971');
INSERT INTO public.media VALUES ('eb1b8f1f-901c-498e-8474-d0d944368acb', 'Về phía mưa', '/media/audio/vephiamua.mp3', 'Thể hiện/Sáng tác: Hoàng Dũng', 0, 0, false, false, 'ea58a553-9db6-40dc-b208-4aad8cd23ead', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:22:18.973533', '2024-05-11 23:22:18.973536');
INSERT INTO public.media VALUES ('56311821-a325-4c08-9789-3175e82008b8', 'Chờ anh nhé', '/media/audio/choanhnhe.mp3', 'Thể hiện/Sáng tác: Hoàng Dũng', 0, 0, false, false, 'ea58a553-9db6-40dc-b208-4aad8cd23ead', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:22:40.376331', '2024-05-11 23:22:40.376332');
INSERT INTO public.media VALUES ('bedae1cd-6ecf-418b-bf76-cf85696cdf75', 'Đôi lời', '/media/audio/doiloi.mp3', 'Thể hiện/Sáng tác: Hoàng Dũng', 0, 0, false, false, 'ea58a553-9db6-40dc-b208-4aad8cd23ead', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:22:54.190626', '2024-05-11 23:22:54.190678');
INSERT INTO public.media VALUES ('cfe5582a-d5dc-49c5-bfc7-3f72d5edcde6', 'Nàng thơ', '/media/audio/nangtho.mp3', 'Thể hiện/Sáng tác: Hoàng Dũng', 0, 0, false, false, 'ea58a553-9db6-40dc-b208-4aad8cd23ead', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:24:28.685366', '2024-05-11 23:24:28.685368');
INSERT INTO public.media VALUES ('24895ee7-3750-4e1f-8312-b54052d3b2c1', 'Yếu đuối', '/media/audio/yeuduoi.mp3', 'Thể hiện/Sáng tác: Hoàng Dũng', 0, 0, false, false, 'ea58a553-9db6-40dc-b208-4aad8cd23ead', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:24:49.482897', '2024-05-11 23:24:49.4829');
INSERT INTO public.media VALUES ('8333df1e-c9c4-4f42-905c-0234aebae4da', 'Tôi là ai trong em', '/media/audio/toilaaitrongem.mp3', 'Thể hiện/Sáng tác: Hoàng Dũng', 0, 0, false, false, 'ea58a553-9db6-40dc-b208-4aad8cd23ead', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 23:25:17.637696', '2024-05-11 23:25:17.637699');
INSERT INTO public.media VALUES ('b9704121-5f05-4878-ae08-d519abd0ba51', 'Cảm ơn tổn thương', '/media/audio/camontonthuong.mp3', 'Thể hiện/Sáng tác: Phạm Nguyên Ngọc', 0, 0, false, false, 'bdbd760d-5541-4be2-aeec-e217ef4d1c0b', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:33:32.799893', '2024-05-12 09:33:32.800031');
INSERT INTO public.media VALUES ('bc6fa624-7dad-4a0c-83f8-1760b8e59419', 'Chẳng thể với lấy', '/media/audio/changthevoilay.mp3', 'Thể hiện/Sáng tác: Phạm Nguyên Ngọc', 0, 0, false, false, 'bdbd760d-5541-4be2-aeec-e217ef4d1c0b', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:33:46.058228', '2024-05-12 09:33:46.058231');
INSERT INTO public.media VALUES ('931e131d-d93c-48a3-97ac-20536b9ca012', 'Chuyện người anh thương', '/media/audio/chuyennguoianhthuong.mp3', 'Thể hiện/Sáng tác: Phạm Nguyên Ngọc', 0, 0, false, false, 'bdbd760d-5541-4be2-aeec-e217ef4d1c0b', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:34:24.657729', '2024-05-12 09:34:24.657731');
INSERT INTO public.media VALUES ('c97bffdd-fe37-4b0c-9b6b-0a04d372ffc0', 'Mưa ơi đừng buồn', '/media/audio/muaoidungbuon.mp3', 'Thể hiện/Sáng tác: Phạm Nguyên Ngọc', 0, 0, false, false, 'bdbd760d-5541-4be2-aeec-e217ef4d1c0b', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:34:36.889786', '2024-05-12 09:34:36.889788');
INSERT INTO public.media VALUES ('c01f58f4-0ec6-496b-a5e4-31fec3b6e835', 'Người cũ', '/media/audio/nguoicu.mp3', 'Thể hiện/Sáng tác: Phạm Nguyên Ngọc', 0, 0, false, false, 'bdbd760d-5541-4be2-aeec-e217ef4d1c0b', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:35:01.455896', '2024-05-12 09:35:01.455898');
INSERT INTO public.media VALUES ('5b4478fb-ad12-4c7e-8d60-519a202115d7', 'Người lạ, người thương', '/media/audio/nguoilanguoithuong.mp3', 'Thể hiện/Sáng tác: Phạm Nguyên Ngọc', 0, 0, false, false, 'bdbd760d-5541-4be2-aeec-e217ef4d1c0b', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:35:17.499289', '2024-05-12 09:35:17.499291');
INSERT INTO public.media VALUES ('a4c83015-2782-4082-adea-9eb3e76ffa4e', 'Chuyện những người yêu xa', '/media/audio/chuyennhungnguoiyeuxa.mp3', 'Thể hiện/Sáng tác: Vũ', 0, 0, false, false, 'c2c9e66d-e589-45ad-ae6e-08fb64d6bcd0', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:37:04.218339', '2024-05-12 09:37:04.218341');
INSERT INTO public.media VALUES ('91fc5d80-5694-45ae-b07b-383e0c4eefe9', 'Đừng khóc một mình', '/media/audio/dungkhocmotminh.mp3', 'Thể hiện/Sáng tác: Hiền Hồ', 0, 0, false, false, 'f117b6b8-506e-4d4b-ad08-debc8c262a67', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:38:50.400721', '2024-05-12 09:38:50.400724');
INSERT INTO public.media VALUES ('22a53804-e53b-49c7-b1ab-fbb1af0b4ef3', 'Gặp nhưng không ở lại', '/media/audio/gapnhungkhongolai.mp3', 'Thể hiện/Sáng tác: Hiền Hồ', 0, 0, false, false, 'f117b6b8-506e-4d4b-ad08-debc8c262a67', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:39:43.505831', '2024-05-12 09:39:43.505833');
INSERT INTO public.media VALUES ('4c45b3a6-8746-4489-8959-da51d7444f53', 'Anh vui không', '/media/audio/anhvuikhong.mp3', 'Thể hiện/Sáng tác: Tiên Tiên', 0, 0, false, false, '30f01a96-a9f7-48ff-b5c2-7c6305200164', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:45:07.365445', '2024-05-12 09:45:07.365447');
INSERT INTO public.media VALUES ('f583ba34-db85-4e27-84b0-2b28ffce67a3', 'My everything', '/media/audio/myeverything.mp3', 'Thể hiện/Sáng tác: Tiên Tiên', 0, 0, false, false, '30f01a96-a9f7-48ff-b5c2-7c6305200164', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:47:02.686858', '2024-05-12 09:47:02.686861');
INSERT INTO public.media VALUES ('7f1cfe02-2630-4eba-bd18-343bdd37b675', 'I can''t', '/media/audio/icant.mp3', 'Thể hiện/Sáng tác: Tiên Tiên', 0, 0, false, false, '30f01a96-a9f7-48ff-b5c2-7c6305200164', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:47:34.171216', '2024-05-12 09:47:34.171218');
INSERT INTO public.media VALUES ('7f8df952-44bc-4e15-9919-62482c871621', 'Say you do', '/media/audio/sayyoudo.mp3', 'Thể hiện/Sáng tác: Tiên Tiên', 0, 0, false, false, '30f01a96-a9f7-48ff-b5c2-7c6305200164', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:48:52.600901', '2024-05-12 09:48:52.600903');
INSERT INTO public.media VALUES ('91f6e230-2fa5-47b2-8c73-c96934eb9984', 'Đi về đâu', '/media/audio/divedau.mp3', 'Thể hiện/Sáng tác: Tiên Tiên', 0, 0, false, false, '30f01a96-a9f7-48ff-b5c2-7c6305200164', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:49:28.350936', '2024-05-12 09:49:28.350937');
INSERT INTO public.media VALUES ('5087667c-2f59-473a-9e78-9e871cb6b3b2', 'Let not fall in love', '/media/audio/letsnotfallinlove.mp3', 'BigBang', 0, 2000000, false, false, 'a54c0c25-6172-43ee-8d5f-e1be77d21204', '6d23da42-426f-4572-a7e1-baace7460841', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-04-07 22:32:02.115307', '2024-04-07 22:32:02.115307');
INSERT INTO public.media VALUES ('b5a894c0-2aaf-47ed-b66e-77cdd65efdec', 'Giá như', '/media/audio/gianhu.mp3', 'Thể hiện/Sáng tác: Soobin Hoàng Sơn', 0, 0, false, false, 'be591255-7063-4d48-8c5f-4a5c7511e61a', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:51:31.175011', '2024-05-12 09:51:31.175013');
INSERT INTO public.media VALUES ('30188fc0-abd9-4bbc-8f08-588843a07931', 'Yêu thương ngày đó', '/media/audio/yeuthuongngaydo.mp3', 'Thể hiện/Sáng tác: Soobin Hoàng Sơn', 0, 0, false, false, 'be591255-7063-4d48-8c5f-4a5c7511e61a', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:52:17.506615', '2024-05-12 09:52:17.506616');
INSERT INTO public.media VALUES ('d39776ac-8d59-4104-90ef-4a0a1dcdef9b', 'BlackJack', '/media/audio/blackjack.mp3', 'Thể hiện/Sáng tác: Soobin Hoàng Sơn', 0, 0, false, false, 'be591255-7063-4d48-8c5f-4a5c7511e61a', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:53:24.563176', '2024-05-12 09:53:24.563178');
INSERT INTO public.media VALUES ('d3fbdb77-4b45-4044-84a7-46acec4ca2f6', 'Duyên phận', '/media/audio/duyenphan.mp3', 'Thể hiện: Như Quỳnh', 0, 0, false, false, '4fe57ce6-c10f-4772-8f05-f3ae146c7fbf', '5e4ee03b-675b-4b1b-a53e-11143726b994', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 10:14:32.442879', '2024-05-12 10:14:32.443076');
INSERT INTO public.media VALUES ('f3a3c4c5-de06-4a26-aac7-d89624fb1ecd', 'Chắc anh đang', '/media/audio/chacanhdang.mp3', 'Thể hiện/Sáng tác: Tiên Tiên', 0, 0, false, false, '30f01a96-a9f7-48ff-b5c2-7c6305200164', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 09:44:17.542961', '2024-05-12 09:44:17.542963');
INSERT INTO public.media VALUES ('c330f890-e217-4632-9f8b-56ebfb4a061e', 'Muộn rồi mà sao còn', '/media/audio/muonroimasaocon.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:02:21.438657', '2024-05-11 22:02:21.43866');
INSERT INTO public.media VALUES ('e2b04c63-c7b0-46c9-83c0-4d0b04ac36cf', 'Đừng về trễ nha', '/media/audio/dungvetrenha.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 22:15:46.754795', '2024-05-11 22:15:46.754796');
INSERT INTO public.media VALUES ('d7f3cd6a-9896-441e-8d2a-2ae7feb91abf', 'Ai rồi cũng sẽ khác', '/media/audio/airoicungsekhac.mp3', 'Thể hiện: Hà Nhi', 0, 0, false, false, 'c52fa0f0-f4d1-418d-be45-ed4543f7ddb8', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-11 21:57:40.46638', '2024-05-11 21:57:40.466381');
INSERT INTO public.media VALUES ('74ceb593-18ce-4e1c-9b5a-bb666fe184dd', 'Lâu đài tình ái', '/media/audio/laudaitinhai.mp3', 'Thể hiện: Unknown', 0, 0, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae62', '5e4ee03b-675b-4b1b-a53e-11143726b994', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-12 10:24:05.820925', '2024-05-12 10:24:05.820929');
INSERT INTO public.media VALUES ('bfac4cfe-1ad6-4b8e-9c22-45d51acd20fb', 'Chắc ai đó sẽ về', '/media/audio/chacaidoseve.mp3', 'Thể hiện/sáng tác: Sơn Tùng', 0, 2000000, false, false, '19898cd2-75b4-4d3c-86bd-0d111392ae63', '7fdbc6fa-c648-4944-be6a-00c9a6785fce', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-04-07 22:32:02.115304', '2024-04-07 22:32:02.115304');


--
-- TOC entry 3366 (class 0 OID 48465)
-- Dependencies: 214
-- Data for Name: media_content; Type: TABLE DATA; Schema: public; Owner: user1
--

INSERT INTO public.media_content VALUES ('0cf89168-d600-435e-80c1-09f1b3035d20', 0, '/images/media/blue.jpg', 'f7450d9a-ab05-4b02-9bbe-473e334b06fd', '2024-04-07 22:32:02.115305', '2024-04-07 22:32:02.115305');
INSERT INTO public.media_content VALUES ('0cf89168-d600-435e-80c1-09f1b3035d21', 0, '/images/media/blue.jpg', 'f7450d9a-ab05-4b02-9bbe-473e334b06fd', '2024-04-07 22:32:02.115306', '2024-04-07 22:32:02.115306');
INSERT INTO public.media_content VALUES ('142ad6ec-a913-4771-9df3-20f1d3ed8390', 0, '/images/media/chay_ngay_di.jpg', '315dc472-f790-47f3-9473-79edcc4ca060', '2024-04-07 22:32:02.115308', '2024-04-07 22:32:02.115308');
INSERT INTO public.media_content VALUES ('142ad6ec-a913-4771-9df3-20f1d3ed8391', 0, '/images/media/chay_ngay_di.jpg', '315dc472-f790-47f3-9473-79edcc4ca060', '2024-04-07 22:32:02.115308', '2024-04-07 22:32:02.115308');
INSERT INTO public.media_content VALUES ('4ae773b0-8db3-4dc8-b371-832af3613ee8', 0, '/images/media/let_not_fall_in_love.jpg', '5087667c-2f59-473a-9e78-9e871cb6b3b2', '2024-04-07 22:32:02.115307', '2024-04-07 22:32:02.115307');
INSERT INTO public.media_content VALUES ('4ae773b0-8db3-4dc8-b371-832af3613ee9', 0, '/images/media/let_not_fall_in_love.jpg', '5087667c-2f59-473a-9e78-9e871cb6b3b2', '2024-04-07 22:32:02.115307', '2024-04-07 22:32:02.115307');
INSERT INTO public.media_content VALUES ('98f5ca24-1d91-40e5-b0ea-9abf908d24cb', 0, '/images/media/chac_ai_do_se_ve.jpg', 'bfac4cfe-1ad6-4b8e-9c22-45d51acd20fb', '2024-04-07 22:32:02.115303', '2024-04-07 22:32:02.115303');
INSERT INTO public.media_content VALUES ('98f5ca24-1d91-40e5-b0ea-9abf908d24cd', 0, '/images/media/chac_ai_do_se_ve.jpg', 'bfac4cfe-1ad6-4b8e-9c22-45d51acd20fb', '2024-04-07 22:32:02.115304', '2024-04-07 22:32:02.115304');
INSERT INTO public.media_content VALUES ('d235b516-fe6d-44cc-86c6-24bac034b588', 0, '/images/media/chung_ta_cua_hien_tai.jpg', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '2024-04-07 22:32:02.115057', '2024-04-07 22:32:02.115057');
INSERT INTO public.media_content VALUES ('d235b516-fe6d-44cc-86c6-24bac034b589', 0, '/images/media/blue.jpg', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '2024-04-07 22:32:02.115059', '2024-04-07 22:32:02.115059');
INSERT INTO public.media_content VALUES ('d4dfee9f-a21c-47f7-bb48-13c294b83a68', 0, '/images/media/empty.jpg', '2f504a10-f142-43bf-8c8b-ea917d4a53e2', '2024-05-11 21:48:40.582584', '2024-05-11 21:48:40.582585');
INSERT INTO public.media_content VALUES ('b2cf4940-5d37-4ecd-ac2d-4c1dea742038', 0, '/images/media/empty.jpg', '14c5d2c4-4b4c-438f-9d52-6a7ab2e46de1', '2024-05-11 21:49:15.778463', '2024-05-11 21:49:15.778463');
INSERT INTO public.media_content VALUES ('2ae258b7-8c0b-437a-8aa4-0d0f6583f0b7', 0, '/images/media/empty.jpg', 'c63b4573-e10d-42fd-8f5c-2f8833214132', '2024-05-11 21:53:53.226956', '2024-05-11 21:53:53.226957');
INSERT INTO public.media_content VALUES ('6c25eeca-da90-4799-85c0-31fb09337784', 0, '/images/media/empty.jpg', '80f032f1-2dd4-47a4-88f0-ebf54d24fd54', '2024-05-11 21:54:07.188868', '2024-05-11 21:54:07.188868');
INSERT INTO public.media_content VALUES ('5771cf3f-7048-4073-b856-24eb849aa144', 0, '/images/media/empty.jpg', 'c70cfa98-b528-4df8-9d56-d1fc8899b50c', '2024-05-11 21:54:21.391919', '2024-05-11 21:54:21.391919');
INSERT INTO public.media_content VALUES ('2e0c9b32-69fb-424a-8511-7b5628ef6bdc', 0, '/images/media/empty.jpg', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '2024-05-11 21:55:21.587354', '2024-05-11 21:55:21.587354');
INSERT INTO public.media_content VALUES ('f55ba91a-39f1-4521-aba6-28b8a9a540e7', 0, '/images/media/empty.jpg', 'f169c4ed-a773-4ca4-9576-b9f181de36b2', '2024-05-11 21:55:49.886923', '2024-05-11 21:55:49.886923');
INSERT INTO public.media_content VALUES ('77734924-9b70-4e20-8e5a-169dc07f2759', 0, '/images/media/empty.jpg', 'bf5328e6-d62c-4de7-ba3a-9fc6f917c672', '2024-05-11 21:56:40.508552', '2024-05-11 21:56:40.508552');
INSERT INTO public.media_content VALUES ('bd480aeb-0a93-4d58-adb6-492f603f9908', 0, '/images/media/empty.jpg', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '2024-05-11 21:57:40.466468', '2024-05-11 21:57:40.466468');
INSERT INTO public.media_content VALUES ('a8b29eee-5fe4-4ce8-b888-a8963de8d43a', 0, '/images/media/empty.jpg', '2ef27942-c9b3-4bc5-8989-c6eab14fc719', '2024-05-11 22:00:48.363141', '2024-05-11 22:00:48.363142');
INSERT INTO public.media_content VALUES ('5d4c7444-5038-4344-8a6a-3b606adef2ef', 0, '/images/media/empty.jpg', '728b64c8-8cfb-4cfc-b5c3-e24dc144fb1f', '2024-05-11 22:01:49.189058', '2024-05-11 22:01:49.189058');
INSERT INTO public.media_content VALUES ('f4023051-d55c-4b7e-b4b4-49618a326fea', 0, '/images/media/empty.jpg', 'c330f890-e217-4632-9f8b-56ebfb4a061e', '2024-05-11 22:02:21.438788', '2024-05-11 22:02:21.438789');
INSERT INTO public.media_content VALUES ('e211088e-425e-40d6-b8a9-1a399aa796c1', 0, '/images/media/empty.jpg', '7d537926-f552-4e7e-9709-413beee229a5', '2024-05-11 22:07:09.753761', '2024-05-11 22:07:09.753761');
INSERT INTO public.media_content VALUES ('e2672176-f745-4819-9738-c557a05036eb', 0, '/images/media/empty.jpg', 'a4207396-652f-4dfd-a4bc-3bca99b56bd8', '2024-05-11 22:10:20.518601', '2024-05-11 22:10:20.518601');
INSERT INTO public.media_content VALUES ('eb2b4412-6208-459f-9b36-ad0e3d7efb64', 0, '/images/media/empty.jpg', '7e7afa04-6715-4590-b68f-1a561e3b9502', '2024-05-11 22:10:49.965098', '2024-05-11 22:10:49.965098');
INSERT INTO public.media_content VALUES ('ffed43f2-9a5e-4ce4-8b0f-2dbbd923a06f', 0, '/images/media/empty.jpg', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '2024-05-11 22:11:15.192233', '2024-05-11 22:11:15.192233');
INSERT INTO public.media_content VALUES ('1c6874e4-1388-4c2d-8c87-b1a22463b3d6', 0, '/images/media/empty.jpg', '5b5403af-5d9c-485f-a523-18605f99d234', '2024-05-11 22:15:27.747754', '2024-05-11 22:15:27.747754');
INSERT INTO public.media_content VALUES ('1774ef2c-e2a8-48f2-8916-3ca9fce57b70', 0, '/images/media/empty.jpg', 'e2b04c63-c7b0-46c9-83c0-4d0b04ac36cf', '2024-05-11 22:15:46.754831', '2024-05-11 22:15:46.754831');
INSERT INTO public.media_content VALUES ('ebaed126-97d3-46f6-9a2d-010f890ccbee', 0, '/images/media/empty.jpg', 'b55a7923-3fd0-4645-ab53-e8c319f47471', '2024-05-11 22:16:13.208859', '2024-05-11 22:16:13.208859');
INSERT INTO public.media_content VALUES ('e2cd70c4-207a-49f4-b933-5d6d2a2d5ca9', 0, '/images/media/empty.jpg', '67866f67-dc44-4a62-8f13-5baecf5eff73', '2024-05-11 22:16:36.763616', '2024-05-11 22:16:36.763616');
INSERT INTO public.media_content VALUES ('206b8807-a181-4df0-9aae-462ad4b089cb', 0, '/images/media/empty.jpg', '7920a1da-2ee3-4528-83c8-e475e3d750bd', '2024-05-11 22:18:11.585447', '2024-05-11 22:18:11.585447');
INSERT INTO public.media_content VALUES ('07478c1a-f64a-4f89-b2f9-a5d6246f9ccb', 0, '/images/media/empty.jpg', '03c2e30f-64c6-4ca2-b0db-cc6a78d04513', '2024-05-11 22:39:25.263701', '2024-05-11 22:39:25.263702');
INSERT INTO public.media_content VALUES ('f0ebed51-a596-4a67-896b-55fef2afc798', 0, '/images/media/empty.jpg', '2351eacf-09db-4d16-92f6-9fc67cf9cced', '2024-05-11 22:40:32.521392', '2024-05-11 22:40:32.521392');
INSERT INTO public.media_content VALUES ('4fcdd3a8-8763-458d-80a8-7f249cd56836', 0, '/images/media/empty.jpg', '6e752c9f-ee95-4001-b76b-00a2a604658c', '2024-05-11 22:41:34.252993', '2024-05-11 22:41:34.252993');
INSERT INTO public.media_content VALUES ('c1d7defe-68b1-4b97-a8cc-fdd3beb0dabc', 0, '/images/media/empty.jpg', 'bd10e5a1-4003-4058-a29d-44edc9b72a10', '2024-05-11 22:42:22.739476', '2024-05-11 22:42:22.739476');
INSERT INTO public.media_content VALUES ('dab2f1bc-53bc-4998-9894-7e7357c3aaa2', 0, '/images/media/empty.jpg', 'c8440311-f3d8-4749-b43b-1af5ba9622f1', '2024-05-11 22:42:41.860976', '2024-05-11 22:42:41.860977');
INSERT INTO public.media_content VALUES ('9f894702-b996-4b7f-9b81-edeb05274a99', 0, '/images/media/empty.jpg', 'f539a96f-0e48-4f04-b490-4e1af78f881e', '2024-05-11 22:44:22.089448', '2024-05-11 22:44:22.089448');
INSERT INTO public.media_content VALUES ('d99ac242-3137-4c0c-ad42-8ed4f52ecb87', 0, '/images/media/empty.jpg', 'a1e13452-262b-4c67-a905-c58f2b923eae', '2024-05-11 22:45:53.825749', '2024-05-11 22:45:53.825749');
INSERT INTO public.media_content VALUES ('5f15e6b9-a203-49b2-8df2-6f65c3695600', 0, '/images/media/empty.jpg', '1e25a129-a0e4-4530-8c7b-44abeb1a28cb', '2024-05-11 22:47:18.488725', '2024-05-11 22:47:18.488725');
INSERT INTO public.media_content VALUES ('fc918108-289e-4db7-b7f2-88b1db0122c2', 0, '/images/media/empty.jpg', 'f1797abb-abc4-4733-84d8-0d9589be19c0', '2024-05-11 22:49:10.316148', '2024-05-11 22:49:10.316148');
INSERT INTO public.media_content VALUES ('e030c37a-936a-495f-94c8-351e609d2b9a', 0, '/images/media/empty.jpg', 'bbf34d69-e987-4e3c-a52a-769071c99687', '2024-05-11 22:50:09.209054', '2024-05-11 22:50:09.209054');
INSERT INTO public.media_content VALUES ('d21b6ff8-6770-488b-98e9-f762b07fa597', 0, '/images/media/empty.jpg', '3b8de1f0-08fa-4ed1-a10e-0da49fbc9286', '2024-05-11 22:51:47.673922', '2024-05-11 22:51:47.673922');
INSERT INTO public.media_content VALUES ('420322a4-4903-419c-ba94-3ef6ad826b89', 0, '/images/media/empty.jpg', 'ec7e5673-bea5-4ce3-b741-1fc7d589067a', '2024-05-11 22:53:17.825408', '2024-05-11 22:53:17.825408');
INSERT INTO public.media_content VALUES ('a108ee35-c0c9-4995-9ec9-6c04db734262', 0, '/images/media/empty.jpg', '62e05c7d-290e-4215-a94e-ed1e6bc12f10', '2024-05-11 22:54:22.482498', '2024-05-11 22:54:22.482498');
INSERT INTO public.media_content VALUES ('a789067d-f4c4-4a3f-9640-a76acbf89977', 0, '/images/media/empty.jpg', '47ac9efb-420b-4d03-b430-3a695fd3b43a', '2024-05-11 22:55:37.091114', '2024-05-11 22:55:37.091114');
INSERT INTO public.media_content VALUES ('74f2cf1b-f3fe-4465-8ba9-4f68c92b18dc', 0, '/images/media/empty.jpg', '0380613f-160b-499a-a8d7-78d369733d06', '2024-05-11 22:56:43.019268', '2024-05-11 22:56:43.019268');
INSERT INTO public.media_content VALUES ('8d2a826a-21ec-4b11-a8fc-0f633316e81a', 0, '/images/media/empty.jpg', '054ffbe8-f27b-40f6-bdb4-6031f971c1f6', '2024-05-11 22:57:35.904153', '2024-05-11 22:57:35.904154');
INSERT INTO public.media_content VALUES ('7a3a3305-d155-42f4-b1fd-b64c78cd59f3', 0, '/images/media/empty.jpg', 'a2fd3c17-99ff-4655-b62c-e19f9716c222', '2024-05-11 22:58:44.103866', '2024-05-11 22:58:44.103866');
INSERT INTO public.media_content VALUES ('8d1b5ac1-4169-4427-8e0b-9faba220aded', 0, '/images/media/empty.jpg', 'adc34f2a-ba98-493d-ad7d-be4931c8609b', '2024-05-11 22:59:38.51872', '2024-05-11 22:59:38.51872');
INSERT INTO public.media_content VALUES ('a04e022e-ab30-467d-854b-eb7cc9da93d0', 0, '/images/media/empty.jpg', '0b847399-d650-4485-acce-ec03c8f9ecf3', '2024-05-11 23:00:47.788756', '2024-05-11 23:00:47.788756');
INSERT INTO public.media_content VALUES ('d295b668-78bc-428d-81e3-76dd5e944293', 0, '/images/media/empty.jpg', 'c3a433f1-da46-4e98-adb9-9f2ff3f7c195', '2024-05-11 23:03:39.736319', '2024-05-11 23:03:39.736325');
INSERT INTO public.media_content VALUES ('a25ca4ae-29ab-4658-851f-ac4fc4b2833f', 0, '/images/media/empty.jpg', '70731ed0-4688-4447-8845-1c5600873314', '2024-05-11 23:04:41.919036', '2024-05-11 23:04:41.919036');
INSERT INTO public.media_content VALUES ('7de87830-9b27-4c52-8cb2-22d77e665249', 0, '/images/media/empty.jpg', '8a1416c4-937d-449e-8cab-d0523d770733', '2024-05-11 23:09:42.514318', '2024-05-11 23:09:42.514318');
INSERT INTO public.media_content VALUES ('932524a0-e14c-4d27-b53a-28cac2f31137', 0, '/images/media/empty.jpg', '9b208cca-ee23-44f9-9c78-f1f5ab13b13e', '2024-05-11 23:10:19.453979', '2024-05-11 23:10:19.453979');
INSERT INTO public.media_content VALUES ('45ca3ec7-59cc-4b5f-8eb2-e697d7693b59', 0, '/images/media/empty.jpg', '9ad40d31-967e-488e-9cc8-63bb32783b33', '2024-05-11 23:14:13.896535', '2024-05-11 23:14:13.896535');
INSERT INTO public.media_content VALUES ('febde217-49cb-4584-a023-ca892150b9cc', 0, '/images/media/empty.jpg', 'f7c6d246-1e0d-4c97-9fd9-1ad5cf50c09a', '2024-05-11 23:15:08.516558', '2024-05-11 23:15:08.516558');
INSERT INTO public.media_content VALUES ('e9203b06-f2d2-47dc-9306-7d30e6040bb0', 0, '/images/media/empty.jpg', 'caf159c8-e121-49fa-923d-bd2dfb791e9e', '2024-05-11 23:15:43.103907', '2024-05-11 23:15:43.103907');
INSERT INTO public.media_content VALUES ('8d691d03-1272-4f92-9710-0d52d39a0efb', 0, '/images/media/empty.jpg', '73182dfd-9b06-4aa9-9d17-b3cf9dc2c480', '2024-05-11 23:18:09.11944', '2024-05-11 23:18:09.11944');
INSERT INTO public.media_content VALUES ('ccfd54f1-3527-40b0-9c14-24d39cc18e80', 0, '/images/media/empty.jpg', '28c4e4e2-c2a0-4c9c-a9a2-6457b900c905', '2024-05-11 23:19:02.195084', '2024-05-11 23:19:02.195084');
INSERT INTO public.media_content VALUES ('6e27722b-ecb7-4f7d-820c-9ec2c53df961', 0, '/images/media/empty.jpg', 'eb1b8f1f-901c-498e-8474-d0d944368acb', '2024-05-11 23:22:18.973577', '2024-05-11 23:22:18.973577');
INSERT INTO public.media_content VALUES ('2f34f9f9-c592-49fc-acd8-6c22021447ab', 0, '/images/media/empty.jpg', '56311821-a325-4c08-9789-3175e82008b8', '2024-05-11 23:22:40.376359', '2024-05-11 23:22:40.376359');
INSERT INTO public.media_content VALUES ('4ec32e72-b763-487b-9523-8ec341cd64b4', 0, '/images/media/empty.jpg', 'bedae1cd-6ecf-418b-bf76-cf85696cdf75', '2024-05-11 23:22:54.190719', '2024-05-11 23:22:54.190719');
INSERT INTO public.media_content VALUES ('0d119ec2-dfa3-4beb-b418-800abda2f62f', 0, '/images/media/empty.jpg', 'cfe5582a-d5dc-49c5-bfc7-3f72d5edcde6', '2024-05-11 23:24:28.685444', '2024-05-11 23:24:28.685444');
INSERT INTO public.media_content VALUES ('0120c418-1bdc-4808-940b-450ecfaf14f7', 0, '/images/media/empty.jpg', '24895ee7-3750-4e1f-8312-b54052d3b2c1', '2024-05-11 23:24:49.482955', '2024-05-11 23:24:49.482955');
INSERT INTO public.media_content VALUES ('773d9230-2796-4466-8a17-9b32a3cdfb7e', 0, '/images/media/empty.jpg', '8333df1e-c9c4-4f42-905c-0234aebae4da', '2024-05-11 23:25:17.637748', '2024-05-11 23:25:17.637749');
INSERT INTO public.media_content VALUES ('e111adfe-8408-4097-801f-02861eb64b66', 0, '/images/media/empty.jpg', 'b9704121-5f05-4878-ae08-d519abd0ba51', '2024-05-12 09:33:32.807369', '2024-05-12 09:33:32.80737');
INSERT INTO public.media_content VALUES ('1a775a87-3a39-419b-8b05-969d05ac7256', 0, '/images/media/empty.jpg', 'bc6fa624-7dad-4a0c-83f8-1760b8e59419', '2024-05-12 09:33:46.058352', '2024-05-12 09:33:46.058352');
INSERT INTO public.media_content VALUES ('1276330c-868f-4e9f-8ada-cadecbb0441a', 0, '/images/media/empty.jpg', '931e131d-d93c-48a3-97ac-20536b9ca012', '2024-05-12 09:34:24.657761', '2024-05-12 09:34:24.657761');
INSERT INTO public.media_content VALUES ('a24f7efc-ab12-4680-bbeb-a2b4252008eb', 0, '/images/media/empty.jpg', 'c97bffdd-fe37-4b0c-9b6b-0a04d372ffc0', '2024-05-12 09:34:36.889817', '2024-05-12 09:34:36.889817');
INSERT INTO public.media_content VALUES ('dd0a5a58-4eb1-4b5a-a4b0-f0becfc05115', 0, '/images/media/empty.jpg', 'c01f58f4-0ec6-496b-a5e4-31fec3b6e835', '2024-05-12 09:35:01.455941', '2024-05-12 09:35:01.455941');
INSERT INTO public.media_content VALUES ('9ab9d584-148e-46c9-9119-badc7716aee2', 0, '/images/media/empty.jpg', '5b4478fb-ad12-4c7e-8d60-519a202115d7', '2024-05-12 09:35:17.499337', '2024-05-12 09:35:17.499337');
INSERT INTO public.media_content VALUES ('01af71c6-b43e-46d9-9bad-edc14f4013ed', 0, '/images/media/empty.jpg', 'a4c83015-2782-4082-adea-9eb3e76ffa4e', '2024-05-12 09:37:04.218388', '2024-05-12 09:37:04.218388');
INSERT INTO public.media_content VALUES ('075915c8-776c-48d0-85dc-30a26834fa22', 0, '/images/media/empty.jpg', '91fc5d80-5694-45ae-b07b-383e0c4eefe9', '2024-05-12 09:38:50.400777', '2024-05-12 09:38:50.400777');
INSERT INTO public.media_content VALUES ('b95e113d-ffb9-4751-82fc-aa2b2bd93079', 0, '/images/media/empty.jpg', '22a53804-e53b-49c7-b1ab-fbb1af0b4ef3', '2024-05-12 09:39:43.505862', '2024-05-12 09:39:43.505862');
INSERT INTO public.media_content VALUES ('7561700c-6e24-4388-8deb-bd5b2f7193a4', 0, '/images/media/empty.jpg', 'f3a3c4c5-de06-4a26-aac7-d89624fb1ecd', '2024-05-12 09:44:17.542994', '2024-05-12 09:44:17.542994');
INSERT INTO public.media_content VALUES ('a25c0e07-9c52-4e71-82fb-1f792d4a95a7', 0, '/images/media/empty.jpg', '4c45b3a6-8746-4489-8959-da51d7444f53', '2024-05-12 09:45:07.365529', '2024-05-12 09:45:07.365529');
INSERT INTO public.media_content VALUES ('e5ac1b23-7d07-43af-8e20-2881dc9c7558', 0, '/images/media/empty.jpg', 'f583ba34-db85-4e27-84b0-2b28ffce67a3', '2024-05-12 09:47:02.686912', '2024-05-12 09:47:02.686912');
INSERT INTO public.media_content VALUES ('7534442c-f18c-4032-9830-04f5b71da278', 0, '/images/media/empty.jpg', '7f1cfe02-2630-4eba-bd18-343bdd37b675', '2024-05-12 09:47:34.171249', '2024-05-12 09:47:34.171249');
INSERT INTO public.media_content VALUES ('a1278aa6-de45-4b46-9c5d-87530894fed3', 0, '/images/media/empty.jpg', '7f8df952-44bc-4e15-9919-62482c871621', '2024-05-12 09:48:52.600941', '2024-05-12 09:48:52.600941');
INSERT INTO public.media_content VALUES ('577f59a9-b4c0-47b6-babd-27343d8ecad0', 0, '/images/media/empty.jpg', '91f6e230-2fa5-47b2-8c73-c96934eb9984', '2024-05-12 09:49:28.35098', '2024-05-12 09:49:28.35098');
INSERT INTO public.media_content VALUES ('620e0c81-24cc-4bbe-9060-302149bb880c', 0, '/images/media/empty.jpg', 'b5a894c0-2aaf-47ed-b66e-77cdd65efdec', '2024-05-12 09:51:31.175059', '2024-05-12 09:51:31.175059');
INSERT INTO public.media_content VALUES ('6a0f5583-9e8c-4279-b986-1ef4d392c577', 0, '/images/media/empty.jpg', '30188fc0-abd9-4bbc-8f08-588843a07931', '2024-05-12 09:52:17.506663', '2024-05-12 09:52:17.506663');
INSERT INTO public.media_content VALUES ('76e6c68f-ce0d-4e9a-9fde-f43bfa5ab159', 0, '/images/media/empty.jpg', 'd39776ac-8d59-4104-90ef-4a0a1dcdef9b', '2024-05-12 09:53:24.563226', '2024-05-12 09:53:24.563226');
INSERT INTO public.media_content VALUES ('5eb731d1-dd31-4d98-a1dc-8a2534adc895', 0, '/images/media/empty.jpg', 'd3fbdb77-4b45-4044-84a7-46acec4ca2f6', '2024-05-12 10:14:32.45093', '2024-05-12 10:14:32.450931');
INSERT INTO public.media_content VALUES ('4a188b45-8d6a-4fc1-9312-9dbfe6a76d50', 0, '/images/media/empty.jpg', '74ceb593-18ce-4e1c-9b5a-bb666fe184dd', '2024-05-12 10:24:05.821069', '2024-05-12 10:24:05.821069');


--
-- TOC entry 3368 (class 0 OID 48572)
-- Dependencies: 216
-- Data for Name: media_view_history; Type: TABLE DATA; Schema: public; Owner: user1
--

INSERT INTO public.media_view_history VALUES ('8fe138c3-2cee-43e6-977c-964f964f1e9a', 'f7450d9a-ab05-4b02-9bbe-473e334b06fd', '00000000-0000-0000-0000-61446981112f', '2024-04-07 22:32:09.415139', '2024-04-07 22:32:09.415143');
INSERT INTO public.media_view_history VALUES ('f2c8db7f-d8ba-4760-b29b-3639a09b0eb5', 'f7450d9a-ab05-4b02-9bbe-473e334b06fd', '00000000-0000-0000-0000-61446981112f', '2024-04-09 00:13:08.137993', '2024-04-09 00:13:08.137993');
INSERT INTO public.media_view_history VALUES ('7fdafb69-79f3-45cd-a419-9562a9638284', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '00000000-0000-0000-0000-61446981112f', '2024-05-11 22:21:56.459842', '2024-05-11 22:21:56.459844');
INSERT INTO public.media_view_history VALUES ('f2340208-3c71-4eeb-bf94-e7621d47a32f', '7e7afa04-6715-4590-b68f-1a561e3b9502', '00000000-0000-0000-0000-61446981112f', '2024-05-11 22:22:46.295037', '2024-05-11 22:22:46.295038');
INSERT INTO public.media_view_history VALUES ('81b33ef5-5ce8-4738-b0ce-46b9e8cbcb72', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '00000000-0000-0000-0000-61446981112f', '2024-05-11 22:23:41.17531', '2024-05-11 22:23:41.175311');
INSERT INTO public.media_view_history VALUES ('38c0833d-f040-4719-95ff-150c8e34e16c', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '00000000-0000-0000-0000-61446981112f', '2024-05-11 22:24:25.846812', '2024-05-11 22:24:25.846813');
INSERT INTO public.media_view_history VALUES ('a2ecbe86-c38f-4cde-a588-c301cbf05210', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '00000000-0000-0000-0000-61446981112f', '2024-05-11 22:26:43.363696', '2024-05-11 22:26:43.363696');
INSERT INTO public.media_view_history VALUES ('d3cd3fc7-9c2c-4d5f-b30f-5cc0da2a5075', 'bf5328e6-d62c-4de7-ba3a-9fc6f917c672', '00000000-0000-0000-0000-61446981112f', '2024-05-11 22:31:05.865539', '2024-05-11 22:31:05.86554');
INSERT INTO public.media_view_history VALUES ('6cb07234-f544-414d-ad5e-6cd8271b52cf', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:37:06.349534', '2024-05-12 12:37:06.349535');
INSERT INTO public.media_view_history VALUES ('71ac5390-1d8f-438b-9159-16ed772a76ad', '2ef27942-c9b3-4bc5-8989-c6eab14fc719', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:37:29.097129', '2024-05-12 12:37:29.09713');
INSERT INTO public.media_view_history VALUES ('1e332014-465b-48ed-a896-41b2e1b95562', '2ef27942-c9b3-4bc5-8989-c6eab14fc719', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:38:20.934114', '2024-05-12 12:38:20.934115');
INSERT INTO public.media_view_history VALUES ('da143862-b18b-48e7-b29d-4877683e08cb', 'c63b4573-e10d-42fd-8f5c-2f8833214132', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:38:57.713975', '2024-05-12 12:38:57.713976');
INSERT INTO public.media_view_history VALUES ('3597d5f1-7b4a-4f63-a99f-f560d7961d53', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:39:57.682417', '2024-05-12 12:39:57.682418');
INSERT INTO public.media_view_history VALUES ('2045df34-d434-4564-920b-5f425bdc1249', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:40:39.944636', '2024-05-12 12:40:39.944636');
INSERT INTO public.media_view_history VALUES ('b0233d67-4332-4d5a-b666-ef3e47e63bec', '2ef27942-c9b3-4bc5-8989-c6eab14fc719', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:42:15.526447', '2024-05-12 12:42:15.526448');
INSERT INTO public.media_view_history VALUES ('61592015-fcba-4891-a416-7e530f6c3231', '2ef27942-c9b3-4bc5-8989-c6eab14fc719', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:43:20.616326', '2024-05-12 12:43:20.616326');
INSERT INTO public.media_view_history VALUES ('c39729b5-ca4e-4f6e-a243-a063ed289eeb', '2ef27942-c9b3-4bc5-8989-c6eab14fc719', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:44:20.017502', '2024-05-12 12:44:20.017503');
INSERT INTO public.media_view_history VALUES ('65e899f0-4dfb-4add-ab71-0f9a2694b4f5', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:48:28.81947', '2024-05-12 12:48:28.81947');
INSERT INTO public.media_view_history VALUES ('a82ab526-3db2-4d46-b7f4-0e445787c94b', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:48:38.783183', '2024-05-12 12:48:38.783183');
INSERT INTO public.media_view_history VALUES ('4e2dfef9-ae4d-44f3-b1ae-c32167d90417', '315dc472-f790-47f3-9473-79edcc4ca060', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:52:10.435776', '2024-05-12 12:52:10.435776');
INSERT INTO public.media_view_history VALUES ('7cd7fb0e-7189-4f8c-be92-f32ed976252e', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:52:19.577408', '2024-05-12 12:52:19.577408');
INSERT INTO public.media_view_history VALUES ('124832a7-0713-4d2b-a58a-939c70284b35', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:52:23.079783', '2024-05-12 12:52:23.079783');
INSERT INTO public.media_view_history VALUES ('eecdb0ec-4508-4974-9be9-7b3e7bff2531', '5087667c-2f59-473a-9e78-9e871cb6b3b2', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:52:29.021197', '2024-05-12 12:52:29.021197');
INSERT INTO public.media_view_history VALUES ('db3a6c93-b87d-49c9-965f-00b41bf31773', '315dc472-f790-47f3-9473-79edcc4ca060', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:52:40.126597', '2024-05-12 12:52:40.126597');
INSERT INTO public.media_view_history VALUES ('99abee32-1344-4be5-bc62-176250e14b06', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:52:48.723698', '2024-05-12 12:52:48.723698');
INSERT INTO public.media_view_history VALUES ('d5e43d88-39e6-4a76-8e65-77ab4bc878a3', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '00000000-0000-0000-0000-61446981112f', '2024-05-12 12:54:01.383827', '2024-05-12 12:54:01.383827');
INSERT INTO public.media_view_history VALUES ('b5cbaf53-f1e1-4b8a-821d-358859567629', 'c63b4573-e10d-42fd-8f5c-2f8833214132', '00000000-0000-0000-0000-61446981112f', '2024-05-12 13:23:20.350973', '2024-05-12 13:23:20.350974');
INSERT INTO public.media_view_history VALUES ('e9fe12b7-f6e5-4482-a49e-f2f14b48fa13', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '00000000-0000-0000-0000-61446981112f', '2024-05-12 13:30:36.315307', '2024-05-12 13:30:36.315309');
INSERT INTO public.media_view_history VALUES ('86e5f38e-9981-44a4-994a-9c98e8187d0f', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '00000000-0000-0000-0000-61446981112f', '2024-05-12 13:34:05.662425', '2024-05-12 13:34:05.662425');
INSERT INTO public.media_view_history VALUES ('f0dcd507-a10d-44e6-9d03-4dcb80f6092c', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '00000000-0000-0000-0000-61446981112f', '2024-05-12 13:34:23.844551', '2024-05-12 13:34:23.844551');
INSERT INTO public.media_view_history VALUES ('cf7e38fc-5c70-49e0-afe4-1373010ce12c', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '00000000-0000-0000-0000-61446981112f', '2024-05-12 22:04:42.140626', '2024-05-12 22:04:42.140636');
INSERT INTO public.media_view_history VALUES ('a3ac13de-89a6-46d3-a474-fbbac4dc01a9', 'f7c6d246-1e0d-4c97-9fd9-1ad5cf50c09a', '00000000-0000-0000-0000-61446981112f', '2024-05-12 22:11:12.269217', '2024-05-12 22:11:12.269219');
INSERT INTO public.media_view_history VALUES ('e468334f-1467-4fbd-9bcc-c6e754a784e8', '47ac9efb-420b-4d03-b430-3a695fd3b43a', '00000000-0000-0000-0000-61446981112f', '2024-05-12 22:11:33.919337', '2024-05-12 22:11:33.919491');
INSERT INTO public.media_view_history VALUES ('6f1e9f93-2baa-42a0-8114-6b87ae789fa6', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '00000000-0000-0000-0000-61446981112f', '2024-05-12 22:47:54.853043', '2024-05-12 22:47:54.853046');
INSERT INTO public.media_view_history VALUES ('561f042d-c3fb-4ddd-a012-7b65280c2c53', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '00000000-0000-0000-0000-61446981112f', '2024-05-12 22:48:07.675681', '2024-05-12 22:48:07.675682');
INSERT INTO public.media_view_history VALUES ('ef578b84-4822-4e1a-8bd4-6c998c26faa2', 'f7450d9a-ab05-4b02-9bbe-473e334b06fd', '00000000-0000-0000-0000-61446981112f', '2024-05-12 22:49:43.931434', '2024-05-12 22:49:43.931434');
INSERT INTO public.media_view_history VALUES ('ca5197e0-61fe-482f-a515-2b39c926b8a2', 'f7450d9a-ab05-4b02-9bbe-473e334b06fd', '00000000-0000-0000-0000-61446981112f', '2024-05-12 22:49:53.23219', '2024-05-12 22:49:53.23219');
INSERT INTO public.media_view_history VALUES ('f8cd8434-4e0e-4f0d-8bd4-d629b29ee59a', 'f7450d9a-ab05-4b02-9bbe-473e334b06fd', '00000000-0000-0000-0000-61446981112f', '2024-05-12 22:50:10.019513', '2024-05-12 22:50:10.019514');
INSERT INTO public.media_view_history VALUES ('1a097fb6-12a7-4cd2-8024-8698d67bab70', '2ef27942-c9b3-4bc5-8989-c6eab14fc719', '00000000-0000-0000-0000-61446981112f', '2024-05-13 00:16:06.156739', '2024-05-13 00:16:06.156743');
INSERT INTO public.media_view_history VALUES ('f4bdacd6-2874-4004-b973-1ceb3d782816', '2ef27942-c9b3-4bc5-8989-c6eab14fc719', '00000000-0000-0000-0000-61446981112f', '2024-05-13 00:16:09.351724', '2024-05-13 00:16:09.351725');
INSERT INTO public.media_view_history VALUES ('dac79172-26a4-4e7a-867d-689baf356f96', '6e752c9f-ee95-4001-b76b-00a2a604658c', '00000000-0000-0000-0000-61446981112f', '2024-05-13 00:16:20.488043', '2024-05-13 00:16:20.488045');
INSERT INTO public.media_view_history VALUES ('1cfb461a-3c06-458e-8415-5c119ca33ee4', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '00000000-0000-0000-0000-61446981112f', '2024-05-13 00:40:52.580039', '2024-05-13 00:40:52.58004');
INSERT INTO public.media_view_history VALUES ('bddb4cad-04a3-4d8d-97ae-96d595280a9a', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '00000000-0000-0000-0000-61446981112f', '2024-05-13 00:42:10.811757', '2024-05-13 00:42:10.811757');
INSERT INTO public.media_view_history VALUES ('fe148387-ec94-4a13-8a76-64c075d063d6', '7920a1da-2ee3-4528-83c8-e475e3d750bd', '00000000-0000-0000-0000-61446981112f', '2024-05-13 00:59:30.354313', '2024-05-13 00:59:30.354313');
INSERT INTO public.media_view_history VALUES ('7fada32b-c254-45df-84ba-77ca0b91c38b', '7920a1da-2ee3-4528-83c8-e475e3d750bd', '00000000-0000-0000-0000-61446981112f', '2024-05-13 00:59:33.187326', '2024-05-13 00:59:33.187327');
INSERT INTO public.media_view_history VALUES ('a0327256-e84f-4245-a84a-0df86dbb7532', '7920a1da-2ee3-4528-83c8-e475e3d750bd', '00000000-0000-0000-0000-61446981112f', '2024-05-13 01:00:20.948369', '2024-05-13 01:00:20.948369');
INSERT INTO public.media_view_history VALUES ('baf902ad-3ae9-43cf-92c5-a6a156d1fc13', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '00000000-0000-0000-0000-61446981112f', '2024-05-13 01:03:38.826159', '2024-05-13 01:03:38.826162');
INSERT INTO public.media_view_history VALUES ('b784040d-5661-4364-8b44-91c68085bb3f', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '00000000-0000-0000-0000-61446981112f', '2024-05-13 01:04:16.074484', '2024-05-13 01:04:16.074485');
INSERT INTO public.media_view_history VALUES ('dd88a37b-d8a5-421a-962f-cede9c236e4a', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '00000000-0000-0000-0000-61446981112f', '2024-05-13 01:04:27.407277', '2024-05-13 01:04:27.407279');
INSERT INTO public.media_view_history VALUES ('38b34075-8e22-41b6-a360-5dbcdd677b1e', '03c2e30f-64c6-4ca2-b0db-cc6a78d04513', '00000000-0000-0000-0000-61446981112f', '2024-05-18 11:20:55.886179', '2024-05-18 11:20:55.88618');
INSERT INTO public.media_view_history VALUES ('74ad0433-52f7-40a6-93f3-093a968b411c', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '00000000-0000-0000-0000-61446981112f', '2024-05-18 11:22:48.589898', '2024-05-18 11:22:48.589899');
INSERT INTO public.media_view_history VALUES ('e0f6a6ec-402a-4ef5-81df-c20085256c74', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '00000000-0000-0000-0000-61446981112f', '2024-05-18 11:31:27.165659', '2024-05-18 11:31:27.16566');
INSERT INTO public.media_view_history VALUES ('be897763-d608-4800-a119-ab7bc60764fa', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '00000000-0000-0000-0000-61446981112f', '2024-05-18 11:31:32.522548', '2024-05-18 11:31:32.522549');
INSERT INTO public.media_view_history VALUES ('ed3be40e-b2a4-4fb3-8cf5-6874ae4030f5', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 22:31:03.570495', '2024-05-19 22:31:03.570496');
INSERT INTO public.media_view_history VALUES ('ef3f7486-ed2d-480a-bfd7-4a8f02cdcb5b', 'bfac4cfe-1ad6-4b8e-9c22-45d51acd20fb', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-13 01:04:24.839647', '2024-05-13 01:04:24.839648');
INSERT INTO public.media_view_history VALUES ('59cf3371-2f48-4621-b14f-4253f1a5a7ce', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-13 01:04:29.847895', '2024-05-13 01:04:29.847896');
INSERT INTO public.media_view_history VALUES ('81f8a6c8-713b-4bdf-af96-aba5cf2cc62a', '5087667c-2f59-473a-9e78-9e871cb6b3b2', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-13 01:06:50.86674', '2024-05-13 01:06:50.86674');
INSERT INTO public.media_view_history VALUES ('1be0d56c-b032-49ce-a4d5-4cd89399e049', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-18 11:29:28.100712', '2024-05-18 11:29:28.100713');
INSERT INTO public.media_view_history VALUES ('be1a31a6-b600-419f-ac7b-28bbbecab5f1', '47ac9efb-420b-4d03-b430-3a695fd3b43a', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-18 11:32:48.346102', '2024-05-18 11:32:48.346102');
INSERT INTO public.media_view_history VALUES ('8a7407bf-9486-4e19-9bfa-0b5a2ac62083', 'f169c4ed-a773-4ca4-9576-b9f181de36b2', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-18 11:43:02.568436', '2024-05-18 11:43:02.568437');
INSERT INTO public.media_view_history VALUES ('b1ac8ea4-3f2b-4390-8c8c-a990272a4457', '74ceb593-18ce-4e1c-9b5a-bb666fe184dd', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-18 11:48:12.207064', '2024-05-18 11:48:12.207066');
INSERT INTO public.media_view_history VALUES ('6d70e52c-6517-4309-bd61-2f08a3a15375', '67866f67-dc44-4a62-8f13-5baecf5eff73', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-18 11:48:21.59018', '2024-05-18 11:48:21.590181');
INSERT INTO public.media_view_history VALUES ('7430e444-824a-44d3-8caa-0c1dc0cd5049', 'd39776ac-8d59-4104-90ef-4a0a1dcdef9b', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-18 13:27:22.459969', '2024-05-18 13:27:22.45997');
INSERT INTO public.media_view_history VALUES ('e2497dd7-1442-4147-9b3e-6ee147f3c2f4', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 22:29:20.88293', '2024-05-19 22:29:20.882933');
INSERT INTO public.media_view_history VALUES ('ff9aee6e-faab-45ae-b0d9-94ffd1d560a8', 'bfac4cfe-1ad6-4b8e-9c22-45d51acd20fb', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 22:48:56.212802', '2024-05-19 22:48:56.212802');
INSERT INTO public.media_view_history VALUES ('66117b1e-3f7e-4a09-aa04-d1257e303fbd', '74ceb593-18ce-4e1c-9b5a-bb666fe184dd', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 22:51:10.031564', '2024-05-19 22:51:10.031566');
INSERT INTO public.media_view_history VALUES ('64130fd2-70b9-4c0c-a328-975b8d1b6eaa', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:17:37.950269', '2024-05-19 23:17:37.95027');
INSERT INTO public.media_view_history VALUES ('6f6e98c8-205f-4c8f-b172-508319883dbf', '74ceb593-18ce-4e1c-9b5a-bb666fe184dd', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:36:23.893039', '2024-05-19 23:36:23.89304');
INSERT INTO public.media_view_history VALUES ('2da30423-95b1-4338-9803-4c7918eda186', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:37:41.766126', '2024-05-19 23:37:41.766126');
INSERT INTO public.media_view_history VALUES ('414c1857-d7bc-4e41-bbd4-200624cc1958', '14c5d2c4-4b4c-438f-9d52-6a7ab2e46de1', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:37:47.076329', '2024-05-19 23:37:47.07633');
INSERT INTO public.media_view_history VALUES ('4032b203-10d8-4c68-9fe9-4a0ec0fed873', 'bfac4cfe-1ad6-4b8e-9c22-45d51acd20fb', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:43:58.472078', '2024-05-19 23:43:58.472078');
INSERT INTO public.media_view_history VALUES ('95b2a8f2-7481-460e-b732-df4a8e3c821c', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:44:15.125113', '2024-05-19 23:44:15.125114');
INSERT INTO public.media_view_history VALUES ('632c0d10-4a1d-44e9-be0d-6f066df292cd', 'd39776ac-8d59-4104-90ef-4a0a1dcdef9b', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:44:16.646434', '2024-05-19 23:44:16.646435');
INSERT INTO public.media_view_history VALUES ('4eaa638c-1501-4bab-b2ce-6eaa3f13ea1f', '67866f67-dc44-4a62-8f13-5baecf5eff73', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:47:23.272478', '2024-05-19 23:47:23.272479');
INSERT INTO public.media_view_history VALUES ('f7d0226a-6dc5-4b00-ad51-8b75a61cff5a', 'f169c4ed-a773-4ca4-9576-b9f181de36b2', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:47:24.496041', '2024-05-19 23:47:24.496042');
INSERT INTO public.media_view_history VALUES ('754ac6d7-7907-4d15-bebd-730a3b5fbae9', '47ac9efb-420b-4d03-b430-3a695fd3b43a', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:47:25.040754', '2024-05-19 23:47:25.040755');
INSERT INTO public.media_view_history VALUES ('72d50695-8960-42d5-be4e-866dd590094d', 'd7f3cd6a-9896-441e-8d2a-2ae7feb91abf', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:47:25.527534', '2024-05-19 23:47:25.527535');
INSERT INTO public.media_view_history VALUES ('1bc55a7c-9215-417a-b985-8245517260e3', '5087667c-2f59-473a-9e78-9e871cb6b3b2', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:47:26.009354', '2024-05-19 23:47:26.009355');
INSERT INTO public.media_view_history VALUES ('3279831d-78bb-481e-8faa-c5b3ce2b80b9', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-19 23:48:07.674449', '2024-05-19 23:48:07.674449');
INSERT INTO public.media_view_history VALUES ('9b87f799-17e6-43c0-a857-fda2e0ca76f9', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 00:09:03.286841', '2024-05-20 00:09:03.286842');
INSERT INTO public.media_view_history VALUES ('09969ba5-bf90-43c3-97c2-61022158ddd2', '036ae7b5-72f2-4fd2-b4f7-06da494f6b42', '9977f562-da08-41b6-bd29-b93a40833a46', '2024-05-20 00:09:22.184147', '2024-05-20 00:09:22.184147');
INSERT INTO public.media_view_history VALUES ('a257e4a0-28a5-4d26-bd71-80e283805611', '6cef7e25-03f3-4a79-b3a4-bc05b2bef84b', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 08:55:09.326675', '2024-05-20 08:55:09.326675');
INSERT INTO public.media_view_history VALUES ('db8fe4ef-69c4-4f3d-b039-e03424eb7eca', 'f7450d9a-ab05-4b02-9bbe-473e334b06fd', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 08:55:22.920995', '2024-05-20 08:55:22.920995');
INSERT INTO public.media_view_history VALUES ('9177ed89-f2e0-478b-88f9-395f7fa796b6', '5087667c-2f59-473a-9e78-9e871cb6b3b2', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 08:55:44.451592', '2024-05-20 08:55:44.451592');
INSERT INTO public.media_view_history VALUES ('879ab97f-447a-437c-911b-bac6fb7c66bf', 'bfac4cfe-1ad6-4b8e-9c22-45d51acd20fb', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-20 08:55:52.939601', '2024-05-20 08:55:52.939601');
INSERT INTO public.media_view_history VALUES ('fa8d2f9e-b9cb-47b8-9a91-7aa130c2d430', 'e0f37b00-d617-4122-ae63-f766c91ea64e', '800eac18-f5c3-4f83-a64b-92f1b92c5afb', '2024-05-29 13:33:18.310693', '2024-05-29 13:33:18.310696');


--
-- TOC entry 3364 (class 0 OID 48414)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user1
--

INSERT INTO public.users VALUES ('00000000-0000-0000-0000-61446981112f', 'anonymous', 'Anonymous', '/images/avatars/empty.jpg', 0, '2024-04-07 22:32:02.112672', 'Thạch Thất, Hà Nội', '', '', false, false, '2024-04-07 22:32:02.112798', '2024-04-07 22:32:02.11282', '');
INSERT INTO public.users VALUES ('44db2929-809b-41f8-9ce4-61446981112f', 'anhcanviet', 'Cấn Việt Anh', '/images/avatars/user1.jpg', 0, '2024-04-07 22:32:02.112868', 'Thạch Thất, Hà Nội', '0123456111', 'anhcanviet@gmail.com', false, false, '2024-04-07 22:32:02.112869', '2024-04-07 22:32:02.112869', 'a141c47927929bc2d1fb6d336a256df4');
INSERT INTO public.users VALUES ('6dbdf1c9-5f97-41bf-876b-712d2143ab44', 'hieulevan', 'Lê Văn Hiếu', '/images/avatars/empty.jpg', 0, '2024-04-07 22:32:02.114584', 'Cẩm Giàng, Hải Dương', '0123456222', 'hieulevan@gmail.com', false, false, '2024-04-07 22:32:02.114584', '2024-04-07 22:32:02.114584', 'a141c47927929bc2d1fb6d336a256df4');
INSERT INTO public.users VALUES ('9977f562-da08-41b6-bd29-b93a40833a46', 'anguyenvan', 'Nguyễn Văn A', '/images/avatars/empty.jpg', 1, '2001-10-01 00:00:00', 'Thạch Thất', NULL, NULL, false, false, '2024-05-18 11:16:54.555816', '2024-05-18 11:16:54.555819', 'a141c47927929bc2d1fb6d336a256df4');
INSERT INTO public.users VALUES ('54ed32a3-6abe-4159-8903-6ac9dd0ea5ea', 'cnguyenvan', 'Nguyễn Văn C', '/images/avatars/empty.jpg', 1, '2001-10-01 00:00:00', 'Thạch Thất', NULL, NULL, false, false, '2024-05-18 11:16:54.258239', '2024-05-18 11:16:54.258243', 'a141c47927929bc2d1fb6d336a256df4');
INSERT INTO public.users VALUES ('800eac18-f5c3-4f83-a64b-92f1b92c5afb', 'admin', 'Admin', '/images/avatars/user1.jpg', 0, '2024-04-07 22:32:02.114607', 'Thạch Thất, Hà Nội', '0123456444', 'admin@gmail.com', false, true, '2024-04-07 22:32:02.114608', '2024-04-07 22:32:02.114608', 'a141c47927929bc2d1fb6d336a256df4');
INSERT INTO public.users VALUES ('fd998c87-d3db-4703-abcb-02463aaf9cd2', 'bnguyenthi', 'Nguyễn Thị B', '/images/avatars/fd998c87-d3db-4703-abcb-02463aaf9cd2.jpg', 1, '2024-05-19 00:00:00', 'Thạch Thất, Hà Nội', '0123456333', 'bnguyenthi@gmail.com', true, false, '2024-04-07 22:32:02.114605', '2024-04-07 22:32:02.114605', 'a141c47927929bc2d1fb6d336a256df4');


--
-- TOC entry 3192 (class 2606 OID 48399)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 3194 (class 2606 OID 48406)
-- Name: authors PK_authors; Type: CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT "PK_authors" PRIMARY KEY ("Id");


--
-- TOC entry 3196 (class 2606 OID 48413)
-- Name: categories PK_categories; Type: CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "PK_categories" PRIMARY KEY ("Id");


--
-- TOC entry 3209 (class 2606 OID 48551)
-- Name: favourite_collections PK_favourite_collections; Type: CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.favourite_collections
    ADD CONSTRAINT "PK_favourite_collections" PRIMARY KEY ("UserId", "MediaId");


--
-- TOC entry 3203 (class 2606 OID 48427)
-- Name: media PK_media; Type: CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT "PK_media" PRIMARY KEY ("Id");


--
-- TOC entry 3206 (class 2606 OID 48613)
-- Name: media_content PK_media_content; Type: CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media_content
    ADD CONSTRAINT "PK_media_content" PRIMARY KEY ("Id");


--
-- TOC entry 3213 (class 2606 OID 48576)
-- Name: media_view_history PK_media_view_history; Type: CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media_view_history
    ADD CONSTRAINT "PK_media_view_history" PRIMARY KEY ("Id");


--
-- TOC entry 3198 (class 2606 OID 48420)
-- Name: users PK_users; Type: CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_users" PRIMARY KEY ("Id");


--
-- TOC entry 3207 (class 1259 OID 48601)
-- Name: IX_favourite_collections_MediaId; Type: INDEX; Schema: public; Owner: user1
--

CREATE INDEX "IX_favourite_collections_MediaId" ON public.favourite_collections USING btree ("MediaId");


--
-- TOC entry 3199 (class 1259 OID 48477)
-- Name: IX_media_AuthorId; Type: INDEX; Schema: public; Owner: user1
--

CREATE INDEX "IX_media_AuthorId" ON public.media USING btree ("AuthorId");


--
-- TOC entry 3200 (class 1259 OID 48478)
-- Name: IX_media_CategoryId; Type: INDEX; Schema: public; Owner: user1
--

CREATE INDEX "IX_media_CategoryId" ON public.media USING btree ("CategoryId");


--
-- TOC entry 3201 (class 1259 OID 48479)
-- Name: IX_media_UserId; Type: INDEX; Schema: public; Owner: user1
--

CREATE INDEX "IX_media_UserId" ON public.media USING btree ("UserId");


--
-- TOC entry 3204 (class 1259 OID 48480)
-- Name: IX_media_content_MediaId; Type: INDEX; Schema: public; Owner: user1
--

CREATE INDEX "IX_media_content_MediaId" ON public.media_content USING btree ("MediaId");


--
-- TOC entry 3210 (class 1259 OID 48587)
-- Name: IX_media_view_history_MediaId; Type: INDEX; Schema: public; Owner: user1
--

CREATE INDEX "IX_media_view_history_MediaId" ON public.media_view_history USING btree ("MediaId");


--
-- TOC entry 3211 (class 1259 OID 48588)
-- Name: IX_media_view_history_UserId; Type: INDEX; Schema: public; Owner: user1
--

CREATE INDEX "IX_media_view_history_UserId" ON public.media_view_history USING btree ("UserId");


--
-- TOC entry 3218 (class 2606 OID 48602)
-- Name: favourite_collections FK_favourite_collections_media_MediaId; Type: FK CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.favourite_collections
    ADD CONSTRAINT "FK_favourite_collections_media_MediaId" FOREIGN KEY ("MediaId") REFERENCES public.media("Id") ON DELETE CASCADE;


--
-- TOC entry 3219 (class 2606 OID 48607)
-- Name: favourite_collections FK_favourite_collections_users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.favourite_collections
    ADD CONSTRAINT "FK_favourite_collections_users_UserId" FOREIGN KEY ("UserId") REFERENCES public.users("Id") ON DELETE CASCADE;


--
-- TOC entry 3214 (class 2606 OID 48428)
-- Name: media FK_media_authors_AuthorId; Type: FK CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT "FK_media_authors_AuthorId" FOREIGN KEY ("AuthorId") REFERENCES public.authors("Id") ON DELETE CASCADE;


--
-- TOC entry 3215 (class 2606 OID 48433)
-- Name: media FK_media_categories_CategoryId; Type: FK CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT "FK_media_categories_CategoryId" FOREIGN KEY ("CategoryId") REFERENCES public.categories("Id") ON DELETE CASCADE;


--
-- TOC entry 3217 (class 2606 OID 48614)
-- Name: media_content FK_media_content_media_MediaId; Type: FK CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media_content
    ADD CONSTRAINT "FK_media_content_media_MediaId" FOREIGN KEY ("MediaId") REFERENCES public.media("Id") ON DELETE CASCADE;


--
-- TOC entry 3216 (class 2606 OID 48438)
-- Name: media FK_media_users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT "FK_media_users_UserId" FOREIGN KEY ("UserId") REFERENCES public.users("Id") ON DELETE CASCADE;


--
-- TOC entry 3220 (class 2606 OID 48577)
-- Name: media_view_history FK_media_view_history_media_MediaId; Type: FK CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media_view_history
    ADD CONSTRAINT "FK_media_view_history_media_MediaId" FOREIGN KEY ("MediaId") REFERENCES public.media("Id") ON DELETE CASCADE;


--
-- TOC entry 3221 (class 2606 OID 48582)
-- Name: media_view_history FK_media_view_history_users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: user1
--

ALTER TABLE ONLY public.media_view_history
    ADD CONSTRAINT "FK_media_view_history_users_UserId" FOREIGN KEY ("UserId") REFERENCES public.users("Id") ON DELETE CASCADE;


-- Completed on 2024-09-12 07:34:19

--
-- PostgreSQL database dump complete
--

