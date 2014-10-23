--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: breed; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE breed (
    id smallint NOT NULL,
    name text NOT NULL,
    species_id integer
);


ALTER TABLE public.breed OWNER TO action;

--
-- Name: breed_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE breed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.breed_id_seq OWNER TO action;

--
-- Name: breed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE breed_id_seq OWNED BY breed.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text,
    phone text
);


ALTER TABLE public.person OWNER TO action;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO action;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- Name: pet; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE pet (
    id integer NOT NULL,
    name text NOT NULL,
    age integer,
    adopted boolean,
    dead boolean,
    breed_id integer,
    shelter_id integer
);


ALTER TABLE public.pet OWNER TO action;

--
-- Name: pet_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE pet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pet_id_seq OWNER TO action;

--
-- Name: pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE pet_id_seq OWNED BY pet.id;


--
-- Name: pet_person; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE pet_person (
    pet_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.pet_person OWNER TO action;

--
-- Name: shelter; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE shelter (
    id integer NOT NULL,
    name text NOT NULL,
    website text,
    phone text
);


ALTER TABLE public.shelter OWNER TO action;

--
-- Name: shelter_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE shelter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shelter_id_seq OWNER TO action;

--
-- Name: shelter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE shelter_id_seq OWNED BY shelter.id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE species (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.species OWNER TO action;

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_id_seq OWNER TO action;

--
-- Name: species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE species_id_seq OWNED BY species.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY breed ALTER COLUMN id SET DEFAULT nextval('breed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY pet ALTER COLUMN id SET DEFAULT nextval('pet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY shelter ALTER COLUMN id SET DEFAULT nextval('shelter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY species ALTER COLUMN id SET DEFAULT nextval('species_id_seq'::regclass);


--
-- Data for Name: breed; Type: TABLE DATA; Schema: public; Owner: action
--

COPY breed (id, name, species_id) FROM stdin;
1	Persian	1
2	Tabby	1
3	Mixed	1
4	Labrador Retriever	2
5	Golden Retriever	2
6	Labradoodle	2
7	Mixed	2
8	Norwegian Blue	3
9	African Grey	3
\.


--
-- Name: breed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('breed_id_seq', 9, true);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: action
--

COPY person (id, first_name, last_name, email, phone) FROM stdin;
1	Iain	Duncan	\N	\N
2	Ben	White	\N	\N
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('person_id_seq', 2, true);


--
-- Data for Name: pet; Type: TABLE DATA; Schema: public; Owner: action
--

COPY pet (id, name, age, adopted, dead, breed_id, shelter_id) FROM stdin;
\.


--
-- Name: pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('pet_id_seq', 1, false);


--
-- Data for Name: pet_person; Type: TABLE DATA; Schema: public; Owner: action
--

COPY pet_person (pet_id, person_id) FROM stdin;
\.


--
-- Data for Name: shelter; Type: TABLE DATA; Schema: public; Owner: action
--

COPY shelter (id, name, website, phone) FROM stdin;
1	BCSPCA	\N	\N
2	ASPCA	\N	\N
\.


--
-- Name: shelter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('shelter_id_seq', 2, true);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: action
--

COPY species (id, name) FROM stdin;
1	Cat
2	Dog
3	Parrot
\.


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('species_id_seq', 3, true);


--
-- Name: breed_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY breed
    ADD CONSTRAINT breed_pkey PRIMARY KEY (id);


--
-- Name: person_first_name_last_name_key; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_first_name_last_name_key UNIQUE (first_name, last_name);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: pet_person_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY pet_person
    ADD CONSTRAINT pet_person_pkey PRIMARY KEY (pet_id, person_id);


--
-- Name: pet_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);


--
-- Name: shelter_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY shelter
    ADD CONSTRAINT shelter_pkey PRIMARY KEY (id);


--
-- Name: species_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: breed_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: action
--

ALTER TABLE ONLY breed
    ADD CONSTRAINT breed_species_id_fkey FOREIGN KEY (species_id) REFERENCES species(id);


--
-- Name: pet_breed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: action
--

ALTER TABLE ONLY pet
    ADD CONSTRAINT pet_breed_id_fkey FOREIGN KEY (breed_id) REFERENCES breed(id);


--
-- Name: pet_person_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: action
--

ALTER TABLE ONLY pet_person
    ADD CONSTRAINT pet_person_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


--
-- Name: pet_person_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: action
--

ALTER TABLE ONLY pet_person
    ADD CONSTRAINT pet_person_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES pet(id);


--
-- Name: pet_shelter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: action
--

ALTER TABLE ONLY pet
    ADD CONSTRAINT pet_shelter_id_fkey FOREIGN KEY (shelter_id) REFERENCES shelter(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: action
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM action;
GRANT ALL ON SCHEMA public TO action;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT USAGE ON SCHEMA public TO backup_user;


--
-- PostgreSQL database dump complete
--

