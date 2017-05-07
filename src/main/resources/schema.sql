--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-05-07 16:39:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 18088)
-- Name: app; Type: TABLE; Schema: public; Owner: oauthserver
--

CREATE TABLE app (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name text NOT NULL,
    oauth_client_details_id character varying NOT NULL
);


ALTER TABLE app OWNER TO oauthserver;

--
-- TOC entry 186 (class 1259 OID 18094)
-- Name: app_id_seq; Type: SEQUENCE; Schema: public; Owner: oauthserver
--

CREATE SEQUENCE app_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_id_seq OWNER TO oauthserver;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 186
-- Name: app_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oauthserver
--

ALTER SEQUENCE app_id_seq OWNED BY app.id;


--
-- TOC entry 187 (class 1259 OID 18096)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: oauthserver
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    account_non_expired boolean DEFAULT true NOT NULL,
    account_non_locked boolean DEFAULT true NOT NULL,
    credentials_non_expired boolean DEFAULT true NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE auth_user OWNER TO oauthserver;

--
-- TOC entry 188 (class 1259 OID 18106)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: oauthserver
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO oauthserver;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 188
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oauthserver
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 189 (class 1259 OID 18108)
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: oauthserver
--

CREATE TABLE oauth_access_token (
    token_id character varying NOT NULL,
    token bytea NOT NULL,
    authentication_id character varying NOT NULL,
    user_name character varying,
    client_id character varying NOT NULL,
    authentication bytea NOT NULL,
    refresh_token character varying
);


ALTER TABLE oauth_access_token OWNER TO oauthserver;

--
-- TOC entry 190 (class 1259 OID 18120)
-- Name: oauth_client_details; Type: TABLE; Schema: public; Owner: oauthserver
--

CREATE TABLE oauth_client_details (
    client_id character varying NOT NULL,
    resource_ids character varying NOT NULL,
    client_secret character varying NOT NULL,
    scope character varying NOT NULL,
    authorized_grant_types character varying NOT NULL,
    web_server_redirect_uri character varying,
    authorities character varying NOT NULL,
    access_token_validity integer NOT NULL,
    refresh_token_validity integer,
    additional_information character varying NOT NULL,
    autoapprove character varying NOT NULL
);


ALTER TABLE oauth_client_details OWNER TO oauthserver;

--
-- TOC entry 191 (class 1259 OID 18144)
-- Name: role; Type: TABLE; Schema: public; Owner: oauthserver
--

CREATE TABLE role (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE role OWNER TO oauthserver;

--
-- TOC entry 192 (class 1259 OID 18150)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: oauthserver
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO oauthserver;

--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 192
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oauthserver
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- TOC entry 193 (class 1259 OID 18152)
-- Name: user_role; Type: TABLE; Schema: public; Owner: oauthserver
--

CREATE TABLE user_role (
    user_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE user_role OWNER TO oauthserver;

--
-- TOC entry 2030 (class 2604 OID 18232)
-- Name: app id; Type: DEFAULT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY app ALTER COLUMN id SET DEFAULT nextval('app_id_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 18233)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2036 (class 2604 OID 18234)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- TOC entry 2175 (class 0 OID 18088)
-- Dependencies: 185
-- Data for Name: app; Type: TABLE DATA; Schema: public; Owner: oauthserver
--



--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 186
-- Name: app_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oauthserver
--



--
-- TOC entry 2177 (class 0 OID 18096)
-- Dependencies: 187
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: oauthserver
--



--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 188
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oauthserver
--



--
-- TOC entry 2179 (class 0 OID 18108)
-- Dependencies: 189
-- Data for Name: oauth_access_token; Type: TABLE DATA; Schema: public; Owner: oauthserver
--



--
-- TOC entry 2180 (class 0 OID 18120)
-- Dependencies: 190
-- Data for Name: oauth_client_details; Type: TABLE DATA; Schema: public; Owner: oauthserver
--



--
-- TOC entry 2181 (class 0 OID 18144)
-- Dependencies: 191
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: oauthserver
--

INSERT INTO role VALUES (2, 'ROLE_USER');
INSERT INTO role VALUES (1, 'ROLE_ADMIN');


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 192
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oauthserver
--

SELECT pg_catalog.setval('role_id_seq', 2, true);


--
-- TOC entry 2183 (class 0 OID 18152)
-- Dependencies: 193
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: oauthserver
--



--
-- TOC entry 2040 (class 2606 OID 18161)
-- Name: app app_pk; Type: CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY app
    ADD CONSTRAINT app_pk PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 18163)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2044 (class 2606 OID 18165)
-- Name: oauth_access_token oauth_access_token_pk; Type: CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY oauth_access_token
    ADD CONSTRAINT oauth_access_token_pk PRIMARY KEY (authentication_id);


--
-- TOC entry 2046 (class 2606 OID 18169)
-- Name: oauth_client_details oauth_client_details_pk; Type: CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY oauth_client_details
    ADD CONSTRAINT oauth_client_details_pk PRIMARY KEY (client_id);


--
-- TOC entry 2048 (class 2606 OID 18177)
-- Name: role role_name_unique; Type: CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_name_unique UNIQUE (name);


--
-- TOC entry 2050 (class 2606 OID 18179)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2052 (class 2606 OID 18181)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2053 (class 2606 OID 18182)
-- Name: app app_oauth_client_details_fk; Type: FK CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY app
    ADD CONSTRAINT app_oauth_client_details_fk FOREIGN KEY (oauth_client_details_id) REFERENCES oauth_client_details(client_id) ON DELETE CASCADE;


--
-- TOC entry 2054 (class 2606 OID 18187)
-- Name: app app_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY app
    ADD CONSTRAINT app_user_fk FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE CASCADE;


--
-- TOC entry 2055 (class 2606 OID 18202)
-- Name: oauth_access_token oauth_access_token_oauth_client_details_fk; Type: FK CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY oauth_access_token
    ADD CONSTRAINT oauth_access_token_oauth_client_details_fk FOREIGN KEY (client_id) REFERENCES oauth_client_details(client_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2056 (class 2606 OID 18192)
-- Name: user_role user_role_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_role_fk FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE;


--
-- TOC entry 2057 (class 2606 OID 18197)
-- Name: user_role user_role_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: oauthserver
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_user_fk FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE CASCADE;


-- Completed on 2017-05-07 16:39:01

--
-- PostgreSQL database dump complete
--
