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
-- Name: distance_from_earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distance_from_earth (
    distance_from_earth_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    average_lifespan integer,
    is_intelligent boolean DEFAULT false NOT NULL,
    distance_from_earth_db character varying(255)
);


ALTER TABLE public.distance_from_earth OWNER TO freecodecamp;

--
-- Name: distance_from_earth_distance_from_earth_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distance_from_earth_distance_from_earth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_from_earth_distance_from_earth_id_seq OWNER TO freecodecamp;

--
-- Name: distance_from_earth_distance_from_earth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distance_from_earth_distance_from_earth_id_seq OWNED BY public.distance_from_earth.distance_from_earth_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    num_stars integer NOT NULL,
    galaxy_size numeric(10,2),
    is_visited boolean DEFAULT false NOT NULL,
    galaxy_db character varying(255)
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
    name character varying(30),
    planet_id integer,
    moon_size numeric(10,2),
    is_inhabited boolean DEFAULT false NOT NULL,
    moon_db character varying(255)
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
    name character varying(30),
    star_id integer,
    planet_type text,
    num_moons integer NOT NULL,
    has_rings boolean DEFAULT false NOT NULL,
    planet_db character varying(255)
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
    name character varying(30),
    star_type character varying(50),
    distance_from_earth integer NOT NULL,
    is_supernova boolean DEFAULT false NOT NULL,
    galaxy_id integer,
    star_db character varying(255)
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
-- Name: distance_from_earth distance_from_earth_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth ALTER COLUMN distance_from_earth_id SET DEFAULT nextval('public.distance_from_earth_distance_from_earth_id_seq'::regclass);


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
-- Data for Name: distance_from_earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distance_from_earth VALUES (1, 'Xenonites', 1, 200, true, NULL);
INSERT INTO public.distance_from_earth VALUES (2, 'Martians', 2, 100, false, NULL);
INSERT INTO public.distance_from_earth VALUES (3, 'Zaltrons', 3, 150, true, NULL);
INSERT INTO public.distance_from_earth VALUES (4, 'Galaxians', 4, 250, true, NULL);
INSERT INTO public.distance_from_earth VALUES (5, 'Plutonians', 5, 500, false, NULL);
INSERT INTO public.distance_from_earth VALUES (6, 'Xenonites', 1, 200, true, NULL);
INSERT INTO public.distance_from_earth VALUES (7, 'Martians', 2, 100, false, NULL);
INSERT INTO public.distance_from_earth VALUES (8, 'Zaltrons', 3, 150, true, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 200, 250000.00, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 100, 500000.00, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50, 150000.00, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 300, 200000.00, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 400, 350000.00, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 150, 200000.00, true, NULL);
INSERT INTO public.galaxy VALUES (7, 'Andromeda', 200, 250000.00, true, NULL);
INSERT INTO public.galaxy VALUES (8, 'Milky Way', 100, 500000.00, true, NULL);
INSERT INTO public.galaxy VALUES (9, 'Triangulum', 50, 150000.00, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474.80, false, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.00, false, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.20, false, NULL);
INSERT INTO public.moon VALUES (4, 'Luna', 1, 3474.80, false, NULL);
INSERT INTO public.moon VALUES (5, 'Phobos', 2, 11.00, false, NULL);
INSERT INTO public.moon VALUES (6, 'Deimos', 2, 6.20, false, NULL);
INSERT INTO public.moon VALUES (7, 'Ganymede', 4, 5262.40, false, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150.00, false, NULL);
INSERT INTO public.moon VALUES (9, 'Io', 4, 3643.20, false, NULL);
INSERT INTO public.moon VALUES (10, 'Europa', 4, 3121.60, false, NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', 4, 4821.00, false, NULL);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 396.20, false, NULL);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 504.00, false, NULL);
INSERT INTO public.moon VALUES (14, 'Triton', 7, 2706.80, false, NULL);
INSERT INTO public.moon VALUES (15, 'Charon', 7, 1212.00, false, NULL);
INSERT INTO public.moon VALUES (16, 'Rhea', 6, 1528.00, false, NULL);
INSERT INTO public.moon VALUES (17, 'Iapetus', 6, 1469.00, false, NULL);
INSERT INTO public.moon VALUES (18, 'Tethys', 6, 1062.00, false, NULL);
INSERT INTO public.moon VALUES (19, 'Hyperion', 6, 360.00, false, NULL);
INSERT INTO public.moon VALUES (20, 'Dione', 6, 1123.00, false, NULL);
INSERT INTO public.moon VALUES (21, 'Titania', 6, 1577.00, false, NULL);
INSERT INTO public.moon VALUES (22, 'Oberon', 6, 1522.00, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 3, 'Terrestrial', 1, false, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 3, 'Terrestrial', 2, false, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 3, 'Terrestrial', 0, false, NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', 6, 'Gas Giant', 79, true, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 6, 'Gas Giant', 82, true, NULL);
INSERT INTO public.planet VALUES (6, 'Uranus', 6, 'Ice Giant', 27, true, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', 6, 'Ice Giant', 14, false, NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', 3, 'Terrestrial', 0, false, NULL);
INSERT INTO public.planet VALUES (9, 'Titan', 5, 'Gas Giant', 1, true, NULL);
INSERT INTO public.planet VALUES (10, 'Io', 5, 'Gas Giant', 1, false, NULL);
INSERT INTO public.planet VALUES (11, 'Europa', 5, 'Gas Giant', 1, false, NULL);
INSERT INTO public.planet VALUES (12, 'Enceladus', 5, 'Ice Giant', 1, true, NULL);
INSERT INTO public.planet VALUES (13, 'Earth', 3, 'Terrestrial', 1, false, NULL);
INSERT INTO public.planet VALUES (14, 'Mars', 3, 'Terrestrial', 2, false, NULL);
INSERT INTO public.planet VALUES (15, 'Venus', 3, 'Terrestrial', 0, false, NULL);
INSERT INTO public.planet VALUES (16, 'Jupiter', 6, 'Gas Giant', 79, true, NULL);
INSERT INTO public.planet VALUES (17, 'Saturn', 6, 'Gas Giant', 82, true, NULL);
INSERT INTO public.planet VALUES (18, 'Uranus', 6, 'Ice Giant', 27, true, NULL);
INSERT INTO public.planet VALUES (19, 'Neptune', 6, 'Ice Giant', 14, false, NULL);
INSERT INTO public.planet VALUES (20, 'Mercury', 3, 'Terrestrial', 0, false, NULL);
INSERT INTO public.planet VALUES (21, 'Titan', 5, 'Gas Giant', 1, true, NULL);
INSERT INTO public.planet VALUES (22, 'Io', 5, 'Gas Giant', 1, false, NULL);
INSERT INTO public.planet VALUES (23, 'Europa', 5, 'Gas Giant', 1, false, NULL);
INSERT INTO public.planet VALUES (24, 'Enceladus', 5, 'Ice Giant', 1, true, NULL);
INSERT INTO public.planet VALUES (25, 'Earth', 3, 'Terrestrial', 1, false, NULL);
INSERT INTO public.planet VALUES (26, 'Mars', 3, 'Terrestrial', 2, false, NULL);
INSERT INTO public.planet VALUES (27, 'Venus', 3, 'Terrestrial', 0, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 'Red Dwarf', 4, false, 2, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Supergiant', 642, true, 1, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 'Main Sequence', 8, false, 2, NULL);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Red Dwarf', 4, false, 2, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 'Supergiant', 770, true, 4, NULL);
INSERT INTO public.star VALUES (6, 'Antares', 'Supergiant', 550, true, 3, NULL);
INSERT INTO public.star VALUES (7, 'Alpha Centauri', 'Red Dwarf', 4, false, 2, NULL);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 'Supergiant', 642, true, 1, NULL);
INSERT INTO public.star VALUES (9, 'Sirius', 'Main Sequence', 8, false, 2, NULL);


--
-- Name: distance_from_earth_distance_from_earth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distance_from_earth_distance_from_earth_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 27, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: distance_from_earth distance_from_earth_distance_from_earth_db_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT distance_from_earth_distance_from_earth_db_key UNIQUE (distance_from_earth_db);


--
-- Name: distance_from_earth distance_from_earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT distance_from_earth_pkey PRIMARY KEY (distance_from_earth_id);


--
-- Name: galaxy galaxy_galaxy_db_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_db_key UNIQUE (galaxy_db);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_db_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_db_key UNIQUE (moon_db);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_db_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_db_key UNIQUE (planet_db);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_db_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_db_key UNIQUE (star_db);


--
-- Name: distance_from_earth unique_distance_from_earth_db; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT unique_distance_from_earth_db UNIQUE (distance_from_earth_db);


--
-- Name: galaxy unique_galaxy_db; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_db UNIQUE (galaxy_db);


--
-- Name: moon unique_moon_db; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_db UNIQUE (moon_db);


--
-- Name: planet unique_planet_db; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_db UNIQUE (planet_db);


--
-- Name: star unique_star_db; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_db UNIQUE (star_db);


--
-- Name: distance_from_earth distance_from_earth_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT distance_from_earth_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey1 FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

