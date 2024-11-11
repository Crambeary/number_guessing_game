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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    number_guesser_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guesser_number_guesser_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guesser_number_guesser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guesser_number_guesser_id_seq OWNER TO freecodecamp;

--
-- Name: number_guesser_number_guesser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guesser_number_guesser_id_seq OWNED BY public.number_guess.number_guesser_id;


--
-- Name: number_guess number_guesser_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN number_guesser_id SET DEFAULT nextval('public.number_guesser_number_guesser_id_seq'::regclass);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES (21, 'Marc', 2, 9);
INSERT INTO public.number_guess VALUES (25, 'user_1731358221938', 2, 133);
INSERT INTO public.number_guess VALUES (24, 'user_1731358221939', 5, 50);
INSERT INTO public.number_guess VALUES (27, 'user_1731358239432', 2, 142);
INSERT INTO public.number_guess VALUES (26, 'user_1731358239433', 5, 24);
INSERT INTO public.number_guess VALUES (23, 'user_1731357945537', 1, 757);
INSERT INTO public.number_guess VALUES (22, 'user_1731357945538', 1, 759);


--
-- Name: number_guesser_number_guesser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guesser_number_guesser_id_seq', 27, true);


--
-- Name: number_guess number_guesser_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guesser_pkey PRIMARY KEY (number_guesser_id);


--
-- Name: number_guess number_guesser_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guesser_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

