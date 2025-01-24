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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(25) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 345, 346, 4, 2);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 347, 348, 2, 0);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 346, 348, 2, 1);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 345, 347, 1, 0);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 346, 349, 3, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 348, 350, 2, 0);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 347, 351, 2, 1);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 345, 352, 2, 0);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 348, 353, 2, 1);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 350, 354, 1, 0);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 347, 355, 3, 2);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 351, 356, 2, 0);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 346, 357, 2, 1);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 349, 358, 2, 1);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 352, 359, 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 345, 360, 4, 3);
INSERT INTO public.games VALUES (17, 2014, 'Final', 361, 360, 1, 0);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 362, 351, 3, 0);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 360, 362, 1, 0);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 361, 351, 7, 1);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 362, 363, 1, 0);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 360, 347, 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 351, 353, 2, 1);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 361, 345, 1, 0);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 351, 364, 2, 1);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 353, 352, 2, 0);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 345, 365, 2, 0);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 361, 366, 2, 1);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 362, 356, 2, 1);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 363, 367, 2, 1);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 360, 354, 1, 0);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 347, 368, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (345, 'France');
INSERT INTO public.teams VALUES (346, 'Croatia');
INSERT INTO public.teams VALUES (347, 'Belgium');
INSERT INTO public.teams VALUES (348, 'England');
INSERT INTO public.teams VALUES (349, 'Russia');
INSERT INTO public.teams VALUES (350, 'Sweden');
INSERT INTO public.teams VALUES (351, 'Brazil');
INSERT INTO public.teams VALUES (352, 'Uruguay');
INSERT INTO public.teams VALUES (353, 'Colombia');
INSERT INTO public.teams VALUES (354, 'Switzerland');
INSERT INTO public.teams VALUES (355, 'Japan');
INSERT INTO public.teams VALUES (356, 'Mexico');
INSERT INTO public.teams VALUES (357, 'Denmark');
INSERT INTO public.teams VALUES (358, 'Spain');
INSERT INTO public.teams VALUES (359, 'Portugal');
INSERT INTO public.teams VALUES (360, 'Argentina');
INSERT INTO public.teams VALUES (361, 'Germany');
INSERT INTO public.teams VALUES (362, 'Netherlands');
INSERT INTO public.teams VALUES (363, 'Costa Rica');
INSERT INTO public.teams VALUES (364, 'Chile');
INSERT INTO public.teams VALUES (365, 'Nigeria');
INSERT INTO public.teams VALUES (366, 'Algeria');
INSERT INTO public.teams VALUES (367, 'Greece');
INSERT INTO public.teams VALUES (368, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 368, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

