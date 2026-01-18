--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: cincai; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cincai (
    cincai_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type integer
);


ALTER TABLE public.cincai OWNER TO freecodecamp;

--
-- Name: cincai_cincai_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cincai_cincai_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cincai_cincai_id_seq OWNER TO freecodecamp;

--
-- Name: cincai_cincai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cincai_cincai_id_seq OWNED BY public.cincai.cincai_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    galaxy_type text,
    size character varying(20)
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
    name character varying(20) NOT NULL,
    distance_from_planet integer,
    is_spherical boolean,
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
    name character varying(20) NOT NULL,
    has_life boolean,
    is_spherical boolean,
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
    name character varying(20) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    galaxy_id integer NOT NULL
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
-- Name: cincai cincai_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cincai ALTER COLUMN cincai_id SET DEFAULT nextval('public.cincai_cincai_id_seq'::regclass);


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
-- Data for Name: cincai; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cincai VALUES (1, 'CINCAIA', 1);
INSERT INTO public.cincai VALUES (2, 'CINCAIB', 2);
INSERT INTO public.cincai VALUES (3, 'CINCAIC', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxyA', 'testing description12', 'A', 'small');
INSERT INTO public.galaxy VALUES (2, 'galaxyQ', 'testing description3', 'Q', 'medium');
INSERT INTO public.galaxy VALUES (3, 'galaxyF', 'testing description6', 'F', 'big');
INSERT INTO public.galaxy VALUES (4, 'galaxyM', 'testing description18', 'M', 'small');
INSERT INTO public.galaxy VALUES (5, 'galaxyB', 'testing description9', 'B', 'big');
INSERT INTO public.galaxy VALUES (6, 'galaxyZ', 'testing description1', 'Z', 'medium');
INSERT INTO public.galaxy VALUES (7, 'galaxyH', 'testing description14', 'H', 'small');
INSERT INTO public.galaxy VALUES (8, 'galaxyK', 'testing description7', 'K', 'big');
INSERT INTO public.galaxy VALUES (9, 'galaxyT', 'testing description20', 'T', 'medium');
INSERT INTO public.galaxy VALUES (10, 'galaxyC', 'testing description5', 'C', 'small');
INSERT INTO public.galaxy VALUES (11, 'galaxyP', 'testing description11', 'P', 'big');
INSERT INTO public.galaxy VALUES (12, 'galaxyL', 'testing description2', 'L', 'medium');
INSERT INTO public.galaxy VALUES (13, 'galaxyS', 'testing description16', 'S', 'small');
INSERT INTO public.galaxy VALUES (14, 'galaxyD', 'testing description4', 'D', 'big');
INSERT INTO public.galaxy VALUES (15, 'galaxyX', 'testing description19', 'X', 'medium');
INSERT INTO public.galaxy VALUES (16, 'galaxyJ', 'testing description8', 'J', 'small');
INSERT INTO public.galaxy VALUES (17, 'galaxyN', 'testing description15', 'N', 'big');
INSERT INTO public.galaxy VALUES (18, 'galaxyR', 'testing description10', 'R', 'medium');
INSERT INTO public.galaxy VALUES (19, 'galaxyE', 'testing description13', 'E', 'small');
INSERT INTO public.galaxy VALUES (20, 'galaxyV', 'testing description17', 'V', 'big');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moonH', 45, true, 1);
INSERT INTO public.moon VALUES (2, 'moonC', 12, false, 2);
INSERT INTO public.moon VALUES (3, 'moonM', 78, true, 3);
INSERT INTO public.moon VALUES (4, 'moonA', 34, false, 4);
INSERT INTO public.moon VALUES (5, 'moonT', 90, true, 5);
INSERT INTO public.moon VALUES (6, 'moonF', 27, false, 6);
INSERT INTO public.moon VALUES (7, 'moonK', 61, true, 7);
INSERT INTO public.moon VALUES (8, 'moonB', 20, false, 8);
INSERT INTO public.moon VALUES (9, 'moonR', 83, true, 9);
INSERT INTO public.moon VALUES (10, 'moonE', 16, false, 10);
INSERT INTO public.moon VALUES (11, 'moonN', 55, true, 11);
INSERT INTO public.moon VALUES (12, 'moonJ', 41, false, 12);
INSERT INTO public.moon VALUES (13, 'moonD', 69, true, 13);
INSERT INTO public.moon VALUES (14, 'moonP', 24, false, 14);
INSERT INTO public.moon VALUES (15, 'moonS', 88, true, 15);
INSERT INTO public.moon VALUES (16, 'moonL', 37, false, 16);
INSERT INTO public.moon VALUES (17, 'moonG', 72, true, 17);
INSERT INTO public.moon VALUES (18, 'moonX', 19, false, 18);
INSERT INTO public.moon VALUES (19, 'moonQ', 64, true, 19);
INSERT INTO public.moon VALUES (20, 'moonV', 50, false, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'PlanetA', true, true, 1);
INSERT INTO public.planet VALUES (2, 'PlanetB', true, true, 2);
INSERT INTO public.planet VALUES (3, 'PlanetC', true, true, 3);
INSERT INTO public.planet VALUES (4, 'PlanetD', true, true, 4);
INSERT INTO public.planet VALUES (5, 'PlanetE', true, true, 5);
INSERT INTO public.planet VALUES (6, 'PlanetF', true, true, 6);
INSERT INTO public.planet VALUES (7, 'PlanetG', true, true, 7);
INSERT INTO public.planet VALUES (8, 'PlanetH', true, true, 8);
INSERT INTO public.planet VALUES (9, 'PlanetI', true, true, 9);
INSERT INTO public.planet VALUES (10, 'PlanetJ', true, true, 10);
INSERT INTO public.planet VALUES (11, 'PlanetK', true, true, 11);
INSERT INTO public.planet VALUES (12, 'PlanetL', true, true, 12);
INSERT INTO public.planet VALUES (13, 'PlanetM', true, true, 13);
INSERT INTO public.planet VALUES (14, 'PlanetN', true, true, 14);
INSERT INTO public.planet VALUES (15, 'PlanetO', true, true, 15);
INSERT INTO public.planet VALUES (16, 'PlanetP', true, true, 16);
INSERT INTO public.planet VALUES (17, 'PlanetQ', true, true, 17);
INSERT INTO public.planet VALUES (18, 'PlanetR', true, true, 18);
INSERT INTO public.planet VALUES (19, 'PlanetS', true, true, 19);
INSERT INTO public.planet VALUES (20, 'PlanetT', true, true, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'starQ', 3200, 15, 1);
INSERT INTO public.star VALUES (2, 'starB', 1500, 40, 2);
INSERT INTO public.star VALUES (3, 'starM', 4800, 22, 3);
INSERT INTO public.star VALUES (4, 'starA', 2100, 35, 4);
INSERT INTO public.star VALUES (5, 'starX', 3900, 18, 5);
INSERT INTO public.star VALUES (6, 'starF', 1700, 28, 6);
INSERT INTO public.star VALUES (7, 'starK', 4500, 10, 7);
INSERT INTO public.star VALUES (8, 'starC', 2600, 33, 8);
INSERT INTO public.star VALUES (9, 'starT', 5100, 19, 9);
INSERT INTO public.star VALUES (10, 'starH', 2900, 41, 10);
INSERT INTO public.star VALUES (11, 'starE', 3400, 25, 11);
INSERT INTO public.star VALUES (12, 'starN', 4200, 12, 12);
INSERT INTO public.star VALUES (13, 'starD', 1800, 38, 13);
INSERT INTO public.star VALUES (14, 'starR', 5600, 21, 14);
INSERT INTO public.star VALUES (15, 'starL', 2300, 29, 15);
INSERT INTO public.star VALUES (16, 'starW', 4700, 14, 16);
INSERT INTO public.star VALUES (17, 'starP', 3600, 27, 17);
INSERT INTO public.star VALUES (18, 'starJ', 2000, 34, 18);
INSERT INTO public.star VALUES (19, 'starS', 4100, 16, 19);
INSERT INTO public.star VALUES (20, 'starY', 5300, 23, 20);


--
-- Name: cincai_cincai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cincai_cincai_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: cincai cincai_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cincai
    ADD CONSTRAINT cincai_name_key UNIQUE (name);


--
-- Name: cincai cincai_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cincai
    ADD CONSTRAINT cincai_pkey PRIMARY KEY (cincai_id);


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
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


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
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

