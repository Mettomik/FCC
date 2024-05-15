--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: exoplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exoplanet (
    exoplanet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius_km numeric(20,2),
    star_id integer,
    planet_type character varying(20)
);


ALTER TABLE public.exoplanet OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exoplanet_exoplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exoplanet_exoplanet_id_seq OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exoplanet_exoplanet_id_seq OWNED BY public.exoplanet.exoplanet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    distance_light_years numeric(10,2),
    size character varying(50),
    age_in_millions_of_years integer
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
    name character varying(100) NOT NULL,
    diameter_km numeric(20,2),
    planet_id integer,
    description text,
    crater_count integer
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
    name character varying(100) NOT NULL,
    type character varying(50),
    radius_km numeric(20,2),
    star_id integer,
    has_life boolean,
    is_habitable boolean
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
    name character varying(100) NOT NULL,
    spectral_class character varying(10),
    luminosity numeric(10,2),
    galaxy_id integer
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
-- Name: exoplanet exoplanet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet ALTER COLUMN exoplanet_id SET DEFAULT nextval('public.exoplanet_exoplanet_id_seq'::regclass);


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
-- Data for Name: exoplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exoplanet VALUES (1, 'Proxima Centauri b', 6000.00, 2, 'Terrestrial');
INSERT INTO public.exoplanet VALUES (2, 'TRAPPIST-1e', 5730.00, 3, 'Terrestrial');
INSERT INTO public.exoplanet VALUES (3, 'KELT-9b', 142970.00, 3, 'Hot Jupiter');
INSERT INTO public.exoplanet VALUES (4, 'Tau Ceti e', 18000.00, 4, 'Super-Earth');
INSERT INTO public.exoplanet VALUES (5, 'OGLE-2005-BLG-390Lb', 30000.00, 5, 'Super-Earth');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000.00, 'Large', 130000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 200000.00, 'Large', 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 300000.00, 'Small', 6000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 500000.00, 'Large', 150000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 400000.00, 'Medium', 120000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 600000.00, 'Medium', 18000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474.20, 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5262.40, 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 3121.60, 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 4821.60, 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 5150.00, 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Rhea', 1528.00, 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Triton', 2706.80, 8, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Charon', 1212.00, 9, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Iapetus', 1436.00, 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Moon of Mars 1', 10.00, 4, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Moon of Mars 2', 15.00, 4, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Moon of Jupiter 1', 40.00, 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Moon of Jupiter 2', 30.00, 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Moon of Jupiter 3', 25.00, 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Moon of Saturn 1', 35.00, 6, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Moon of Saturn 2', 28.00, 6, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Moon of Uranus 1', 20.00, 7, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Moon of Neptune 1', 18.00, 8, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.20, 4, 'This moon is the largest natural satellite of the planet Mars.', 10);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.40, 4, 'This moon is the smallest natural satellite of the planet Mars.', 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 2439.70, 1, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 6051.80, 1, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 6371.00, 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 3389.50, 1, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 69911.00, 1, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 58232.00, 1, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 25362.00, 1, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 24622.00, 1, false, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', 6000.00, 5, true, true);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 'Terrestrial', 6400.00, 3, false, true);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 'Super-Earth', 24766.00, 6, false, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Terrestrial', 5730.00, 6, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1.00, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A1V', 25.40, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'G2V', 0.50, 1);
INSERT INTO public.star VALUES (4, 'Batelgeuse', 'M2Ia', 120000.00, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'AOV', 40.10, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'B8Ia', 120000.00, 2);


--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exoplanet_exoplanet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: exoplanet exoplanet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_name_key UNIQUE (name);


--
-- Name: exoplanet exoplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_pkey PRIMARY KEY (exoplanet_id);


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
-- Name: exoplanet exoplanet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

