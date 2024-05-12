--
-- PostgreSQL database cluster dump
--

-- Started on 2024-05-12 11:30:14

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:4kIN6Ai8L3vLyaSS4vUsxw==$AgdKrJ9fsTNP+i+52W4WbmlUgQ3ju06WtELORLySQNU=:ziczn//m7/xYSEuWD+3vDGwkfTXFYjsy1NpgFDaJI9I=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-12 11:30:14

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

-- Completed on 2024-05-12 11:30:14

--
-- PostgreSQL database dump complete
--

--
-- Database "BRT" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-12 11:30:14

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
-- TOC entry 4789 (class 1262 OID 32960)
-- Name: BRT; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "BRT" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "BRT" OWNER TO postgres;

\connect "BRT"

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
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 4789
-- Name: DATABASE "BRT"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "BRT" IS 'Содержит информацию об абонентах оператора “Ромашка”. ';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 33011)
-- Name: subscribers; Type: TABLE; Schema: public; Owner: pg_database_owner
--

CREATE TABLE public.subscribers (
    id integer NOT NULL,
    msisdn character(11) NOT NULL,
    balance numeric(9,1) NOT NULL,
    balance_minutes smallint,
    balance_sms smallint,
    balance_kilobytes integer,
    tariff_id smallint NOT NULL,
    CONSTRAINT subscribers_balance_kilobytes_check CHECK ((balance_kilobytes >= 0)),
    CONSTRAINT subscribers_balance_minutes_check CHECK ((balance_minutes >= 0)),
    CONSTRAINT subscribers_balance_sms_check CHECK ((balance_sms >= 0))
);


ALTER TABLE public.subscribers OWNER TO pg_database_owner;

--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE subscribers; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON TABLE public.subscribers IS 'Содержит информацию об абонентах оператора “Ромашка”';


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.id; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.id IS 'Идентификатор абонента';


--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.msisdn; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.msisdn IS 'Номер телефона абонента';


--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.balance; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.balance IS 'Текущий баланс абонента (у.е.)';


--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.balance_minutes; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.balance_minutes IS 'Остаток минут на счёте';


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.balance_sms; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.balance_sms IS 'Остаток СМС на счёте';


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.balance_kilobytes; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.balance_kilobytes IS 'Остаток килобайт на счёте';


--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.tariff_id; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.tariff_id IS 'Идентификатор тарифа';


--
-- TOC entry 4783 (class 0 OID 33011)
-- Dependencies: 215
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: pg_database_owner
--

COPY public.subscribers (id, msisdn, balance, balance_minutes, balance_sms, balance_kilobytes, tariff_id) FROM stdin;
3	79113333333	100.0	0	0	0	11
1	79111111111	100.0	0	0	0	11
2	79112222222	100.0	50	0	0	12
4	79114444444	100.0	50	0	0	12
5	79115555555	100.0	0	0	0	11
6	79116666666	100.0	50	0	0	12
7	79117777777	100.0	0	0	0	11
8	79118888888	100.0	50	0	0	12
9	79119999999	100.0	0	0	0	11
10	79111000000	100.0	50	0	0	12
\.


--
-- TOC entry 4637 (class 2606 OID 33020)
-- Name: subscribers subscribers_msisdn_key; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_msisdn_key UNIQUE (msisdn);


--
-- TOC entry 4639 (class 2606 OID 33018)
-- Name: subscribers subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


-- Completed on 2024-05-12 11:30:14

--
-- PostgreSQL database dump complete
--

--
-- Database "CDRg" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-12 11:30:14

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
-- TOC entry 4801 (class 1262 OID 32959)
-- Name: CDRg; Type: DATABASE; Schema: -; Owner: pg_database_owner
--

CREATE DATABASE "CDRg" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "CDRg" OWNER TO pg_database_owner;

\connect "CDRg"

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
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 4801
-- Name: DATABASE "CDRg"; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON DATABASE "CDRg" IS 'База данных сервиса “Генератор CDR”, содержащая информацию об абонентах и их звонках, генерируемых самим сервисом.';


--
-- TOC entry 842 (class 1247 OID 33034)
-- Name: calltype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.calltype AS ENUM (
    '01',
    '02'
);


ALTER TYPE public.calltype OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 33055)
-- Name: calls; Type: TABLE; Schema: public; Owner: pg_database_owner
--

CREATE TABLE public.calls (
    id bigint NOT NULL,
    subscriber_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    contacted_subscriber_id integer NOT NULL,
    type integer NOT NULL,
    CONSTRAINT "calls.end_time" CHECK ((end_time >= start_time)) NO INHERIT
);


ALTER TABLE public.calls OWNER TO pg_database_owner;

--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE calls; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON TABLE public.calls IS 'Хранит информацию о звонках абонентов';


--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN calls.id; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.calls.id IS 'Идентификатор вызова';


--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN calls.subscriber_id; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.calls.subscriber_id IS 'Идентификатор абонента';


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN calls.start_time; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.calls.start_time IS 'Дата и время начала вызова';


--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN calls.end_time; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.calls.end_time IS 'Дата и время окончания вызова';


--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN calls.contacted_subscriber_id; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.calls.contacted_subscriber_id IS 'Идентификатор абонента, с которым совершался вызов';


--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 216
-- Name: CONSTRAINT "calls.end_time" ON calls; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON CONSTRAINT "calls.end_time" ON public.calls IS 'Проверка соответствия таймкодов.';


--
-- TOC entry 217 (class 1259 OID 33061)
-- Name: calls_id_seq; Type: SEQUENCE; Schema: public; Owner: pg_database_owner
--

ALTER TABLE public.calls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 33021)
-- Name: subscribers; Type: TABLE; Schema: public; Owner: pg_database_owner
--

CREATE TABLE public.subscribers (
    id integer NOT NULL,
    msisdn character varying(15) NOT NULL
);


ALTER TABLE public.subscribers OWNER TO pg_database_owner;

--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE subscribers; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON TABLE public.subscribers IS 'Хранит номера телефонов абонентов';


--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.id; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.id IS 'Идентификатор абонента';


--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN subscribers.msisdn; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.subscribers.msisdn IS 'Номер телефона абонента';


--
-- TOC entry 4794 (class 0 OID 33055)
-- Dependencies: 216
-- Data for Name: calls; Type: TABLE DATA; Schema: public; Owner: pg_database_owner
--

COPY public.calls (id, subscriber_id, start_time, end_time, contacted_subscriber_id, type) FROM stdin;
\.


--
-- TOC entry 4793 (class 0 OID 33021)
-- Dependencies: 215
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: pg_database_owner
--

COPY public.subscribers (id, msisdn) FROM stdin;
20	79997872222
19	79997787821
18	79991154648
17	79998745115
16	79991411445
15	79517541152
14	79517421555
13	79516448215
12	79512611222
11	79516354645
10	79111000000
9	79119999999
8	79118888888
7	79117777777
6	79116666666
5	79115555555
4	79114444444
3	79113333333
2	79112222222
1	79111111111
\.


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 217
-- Name: calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg_database_owner
--

SELECT pg_catalog.setval('public.calls_id_seq', 1180, true);


--
-- TOC entry 4647 (class 2606 OID 33060)
-- Name: calls calls_pkey; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_pkey PRIMARY KEY (id);


--
-- TOC entry 4643 (class 2606 OID 33027)
-- Name: subscribers subscribers_msisdn_key; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_msisdn_key UNIQUE (msisdn);


--
-- TOC entry 4645 (class 2606 OID 33025)
-- Name: subscribers subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


--
-- TOC entry 4648 (class 2606 OID 33067)
-- Name: calls contacted_subscriber_id; Type: FK CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT contacted_subscriber_id FOREIGN KEY (contacted_subscriber_id) REFERENCES public.subscribers(id) NOT VALID;


--
-- TOC entry 4649 (class 2606 OID 33062)
-- Name: calls subscriber_id; Type: FK CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT subscriber_id FOREIGN KEY (subscriber_id) REFERENCES public.subscribers(id) NOT VALID;


-- Completed on 2024-05-12 11:30:14

--
-- PostgreSQL database dump complete
--

--
-- Database "CRM" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-12 11:30:14

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
-- TOC entry 4823 (class 1262 OID 32957)
-- Name: CRM; Type: DATABASE; Schema: -; Owner: pg_database_owner
--

CREATE DATABASE "CRM" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "CRM" OWNER TO pg_database_owner;

\connect "CRM"

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
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 4823
-- Name: DATABASE "CRM"; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON DATABASE "CRM" IS 'База данных микросервиса CRM, в которой содержатся данные для аутентификации пользователя с ролью “Менеджер”.';


--
-- TOC entry 2 (class 3079 OID 33072)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 32970)
-- Name: managers; Type: TABLE; Schema: public; Owner: pg_database_owner
--

CREATE TABLE public.managers (
    id smallint NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(64) NOT NULL
);


ALTER TABLE public.managers OWNER TO pg_database_owner;

--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE managers; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON TABLE public.managers IS 'База данных микросервиса CRM, в которой содержатся данные для аутентификации пользователя с ролью “Менеджер”.';


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN managers.id; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.managers.id IS 'Идентификатор менеджера';


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN managers.username; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.managers.username IS 'Логин менеджера';


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN managers.password; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.managers.password IS 'Пароль менеджера (хранится в зашифрованном виде) ';


--
-- TOC entry 4817 (class 0 OID 32970)
-- Dependencies: 216
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: pg_database_owner
--

COPY public.managers (id, username, password) FROM stdin;
1	manager1	n6SVT98dRFo7s
2	manager2	.9.fKKnXh52ow
3	manager3	Vr7ww3PXqWUyg
\.


--
-- TOC entry 4671 (class 2606 OID 32974)
-- Name: managers CRM_pkey; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT "CRM_pkey" PRIMARY KEY (id);


--
-- TOC entry 4673 (class 2606 OID 32976)
-- Name: managers username; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT username UNIQUE (username);


-- Completed on 2024-05-12 11:30:15

--
-- PostgreSQL database dump complete
--

--
-- Database "HRS" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-12 11:30:15

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
-- TOC entry 4786 (class 1262 OID 32958)
-- Name: HRS; Type: DATABASE; Schema: -; Owner: pg_database_owner
--

CREATE DATABASE "HRS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "HRS" OWNER TO pg_database_owner;

\connect "HRS"

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
-- TOC entry 4787 (class 0 OID 0)
-- Dependencies: 4786
-- Name: DATABASE "HRS"; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON DATABASE "HRS" IS 'Содержит информацию о тарифах оператора “Ромашка”.';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 32961)
-- Name: tariffs; Type: TABLE; Schema: public; Owner: pg_database_owner
--

CREATE TABLE public.tariffs (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    details jsonb NOT NULL
);


ALTER TABLE public.tariffs OWNER TO pg_database_owner;

--
-- TOC entry 4788 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE tariffs; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON TABLE public.tariffs IS 'Содержит информацию о тарифах оператора “Ромашка”';


--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN tariffs.id; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.tariffs.id IS 'Идентификатор тарифа';


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN tariffs.name; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.tariffs.name IS 'Название тарифа';


--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN tariffs.details; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON COLUMN public.tariffs.details IS 'JSON, содержащий детальную информацию о тарифе (количество предоставляемых минут, стоимость обслуживания и т.п.)';


--
-- TOC entry 4780 (class 0 OID 32961)
-- Dependencies: 215
-- Data for Name: tariffs; Type: TABLE DATA; Schema: public; Owner: pg_database_owner
--

COPY public.tariffs (id, name, details) FROM stdin;
11	Классика	[{"type": "incomingCost", "value": 0}, {"type": "incomingCostForSubs", "value": 0}, {"type": "outgoingCost", "value": 2.5}, {"type": "outgoingCostForSubs", "value": 1.5}]
12	Помесячный	[{"type": "minutesAmount", "value": 50}, {"type": "monthlyFee", "value": 100}]
\.


--
-- TOC entry 4634 (class 2606 OID 32967)
-- Name: tariffs HRS_pkey; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.tariffs
    ADD CONSTRAINT "HRS_pkey" PRIMARY KEY (id);


--
-- TOC entry 4636 (class 2606 OID 32969)
-- Name: tariffs name; Type: CONSTRAINT; Schema: public; Owner: pg_database_owner
--

ALTER TABLE ONLY public.tariffs
    ADD CONSTRAINT name UNIQUE (name);


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 4636
-- Name: CONSTRAINT name ON tariffs; Type: COMMENT; Schema: public; Owner: pg_database_owner
--

COMMENT ON CONSTRAINT name ON public.tariffs IS 'Название тарифа';


-- Completed on 2024-05-12 11:30:15

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-12 11:30:15

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4777 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2024-05-12 11:30:15

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-05-12 11:30:15

--
-- PostgreSQL database cluster dump complete
--

