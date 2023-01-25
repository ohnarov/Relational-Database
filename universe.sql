--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    birthday date NOT NULL,
    name character varying NOT NULL,
    nikname character varying(30),
    age integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    birthday date NOT NULL,
    age integer,
    nikname character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    birthday date NOT NULL,
    diameter integer,
    weight integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    birthday date NOT NULL,
    weight integer,
    diameter integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    is_dead boolean,
    is_discovered boolean,
    dist_from_earth integer,
    diameter integer,
    galaxy_id integer NOT NULL,
    cost numeric,
    nickname text,
    birthday date NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, '2233-12-03', 'Karter doope', NULL, NULL);
INSERT INTO public.black_hole VALUES (2, '2000-12-01', 'Srusia', NULL, NULL);
INSERT INTO public.black_hole VALUES (3, '1200-02-12', 'Doope', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', '1900-10-12', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Slick boobs', '0001-05-02', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Wromsblast', '1991-08-05', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Evo', '2000-03-14', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Underlight', '1900-04-15', NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'SQured Pants', '2233-12-03', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth moon', '2233-12-03', NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Mars moon', '2000-12-01', NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Black moon', '1200-02-12', NULL, NULL, 3);
INSERT INTO public.moon VALUES (4, 'Mo-3', '0320-12-04', NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'Moo12', '1334-09-12', NULL, NULL, 4);
INSERT INTO public.moon VALUES (6, 'Mooo2', '12908-12-04', NULL, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Mo-4', '0320-02-04', NULL, NULL, 4);
INSERT INTO public.moon VALUES (11, 'Moo13', '1334-06-12', NULL, NULL, 4);
INSERT INTO public.moon VALUES (12, 'Mooo3', '12908-02-04', NULL, NULL, 4);
INSERT INTO public.moon VALUES (15, 'Mo-5', '0320-02-05', NULL, NULL, 4);
INSERT INTO public.moon VALUES (16, 'Moo14', '1334-07-12', NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'Mooo4', '12978-02-04', NULL, NULL, 4);
INSERT INTO public.moon VALUES (18, 'Mo-6', '0320-02-06', NULL, NULL, 4);
INSERT INTO public.moon VALUES (19, 'Moo15', '1334-07-01', NULL, NULL, 4);
INSERT INTO public.moon VALUES (20, 'Mooo5', '12978-02-05', NULL, NULL, 4);
INSERT INTO public.moon VALUES (21, 'Mo-7', '0320-03-06', NULL, NULL, 4);
INSERT INTO public.moon VALUES (22, 'Moo16', '1334-07-02', NULL, NULL, 4);
INSERT INTO public.moon VALUES (23, 'Mooo6', '12978-02-06', NULL, NULL, 4);
INSERT INTO public.moon VALUES (24, 'Mo-8', '0320-03-07', NULL, NULL, 4);
INSERT INTO public.moon VALUES (25, 'Moo17', '1334-07-03', NULL, NULL, 4);
INSERT INTO public.moon VALUES (26, 'Mooo7', '12978-02-07', NULL, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', '2233-12-03', NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', '2000-12-01', NULL, NULL, 7);
INSERT INTO public.planet VALUES (5, 'Urinus', '1200-02-12', NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Blaz-12', '2233-02-03', NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptirus', '2600-12-01', NULL, NULL, 7);
INSERT INTO public.planet VALUES (9, 'Miers', '1200-01-12', NULL, NULL, 8);
INSERT INTO public.planet VALUES (10, 'Blaz-2', '0233-02-03', NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'YUpitnu', '1600-12-01', NULL, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Ulanius', '1203-01-12', NULL, NULL, 8);
INSERT INTO public.planet VALUES (16, 'Earth-2', '0320-12-04', NULL, NULL, 1);
INSERT INTO public.planet VALUES (17, 'Teklo', '1334-09-12', NULL, NULL, 1);
INSERT INTO public.planet VALUES (18, 'Niklio', '12908-12-04', NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Me-me-me', NULL, NULL, NULL, NULL, 1, NULL, NULL, '1233-12-03');
INSERT INTO public.star VALUES (7, 'Yurinus', NULL, NULL, NULL, NULL, 4, NULL, NULL, '2233-12-03');
INSERT INTO public.star VALUES (8, 'Olio', NULL, NULL, NULL, NULL, 5, NULL, NULL, '2000-12-01');
INSERT INTO public.star VALUES (9, 'Michils-19078', NULL, NULL, NULL, NULL, 3, NULL, NULL, '1200-02-12');
INSERT INTO public.star VALUES (11, 'Sun', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2233-12-03');
INSERT INTO public.star VALUES (12, 'Black Star', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2000-12-01');
INSERT INTO public.star VALUES (13, 'NHL', NULL, NULL, NULL, NULL, 1, NULL, NULL, '1200-02-12');


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: black_hole black_hole_birthday_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_birthday_key UNIQUE (birthday);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_birthday_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_birthday_key UNIQUE (birthday);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_birthday_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_birthday_key UNIQUE (birthday);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_birthday_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_birthday_key UNIQUE (birthday);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

