--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-06-27 21:15:17

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16439)
-- Name: empregados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empregados (
    codigoempregado integer NOT NULL,
    nomeempregado character varying(80) NOT NULL,
    turnoempregado character varying(10) NOT NULL
);


ALTER TABLE public.empregados OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16437)
-- Name: empregados_codigoempregado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empregados_codigoempregado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empregados_codigoempregado_seq OWNER TO postgres;

--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 200
-- Name: empregados_codigoempregado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empregados_codigoempregado_seq OWNED BY public.empregados.codigoempregado;


--
-- TOC entry 204 (class 1259 OID 16578)
-- Name: ponto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponto (
    id integer NOT NULL,
    codigoempregado integer NOT NULL,
    dataentrada date NOT NULL,
    horaentrada time without time zone,
    horasaida time without time zone,
    horaintervalo time without time zone,
    horaretorno time without time zone,
    observacao character varying(150)
);


ALTER TABLE public.ponto OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16576)
-- Name: ponto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponto_id_seq OWNER TO postgres;

--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 203
-- Name: ponto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponto_id_seq OWNED BY public.ponto.id;


--
-- TOC entry 202 (class 1259 OID 16490)
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turno (
    turno character varying(10) NOT NULL,
    horaentrada time(0) without time zone NOT NULL,
    horasaida time(0) without time zone NOT NULL
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- TOC entry 2860 (class 2604 OID 16442)
-- Name: empregados codigoempregado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empregados ALTER COLUMN codigoempregado SET DEFAULT nextval('public.empregados_codigoempregado_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 16581)
-- Name: ponto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponto ALTER COLUMN id SET DEFAULT nextval('public.ponto_id_seq'::regclass);


--
-- TOC entry 3002 (class 0 OID 16439)
-- Dependencies: 201
-- Data for Name: empregados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empregados VALUES (1, 'Maria Clara Peron', 'Primeiro');
INSERT INTO public.empregados VALUES (2, 'Yan Claus', 'Segundo');
INSERT INTO public.empregados VALUES (3, 'Izabela Soares', 'Terceiro');
INSERT INTO public.empregados VALUES (4, 'Jefferson Teixeira', 'Geral');
INSERT INTO public.empregados VALUES (5, 'Patrick Alves', 'Geral');


--
-- TOC entry 3005 (class 0 OID 16578)
-- Dependencies: 204
-- Data for Name: ponto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ponto VALUES (1, 1, '2021-06-14', '04:45:00', '14:25:00', '09:31:00', '10:32:35', NULL);
INSERT INTO public.ponto VALUES (2, 1, '2021-06-15', '04:55:00', '14:32:37', '09:29:10', '10:32:35', NULL);
INSERT INTO public.ponto VALUES (3, 1, '2021-06-16', '04:53:00', '14:25:05', '09:30:25', '10:32:35', NULL);
INSERT INTO public.ponto VALUES (4, 1, '2021-06-17', '04:37:00', '14:21:37', '09:35:37', '10:36:35', NULL);
INSERT INTO public.ponto VALUES (5, 1, '2021-06-18', '04:59:00', '14:40:37', '09:30:07', '10:33:35', NULL);
INSERT INTO public.ponto VALUES (6, 5, '2021-06-15', '07:05:00', '17:25:00', '12:31:00', '13:32:35', NULL);
INSERT INTO public.ponto VALUES (7, 5, '2021-06-16', '07:15:00', '16:45:00', '12:21:00', '13:32:35', NULL);
INSERT INTO public.ponto VALUES (8, 5, '2021-06-17', '07:05:00', '17:25:00', '12:31:00', '13:32:35', NULL);
INSERT INTO public.ponto VALUES (10, 3, '2021-06-27', '07:00:00', '16:30:00', '11:30:00', '12:30:00', '');


--
-- TOC entry 3003 (class 0 OID 16490)
-- Dependencies: 202
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turno VALUES ('Primeiro', '05:00:00', '14:30:00');
INSERT INTO public.turno VALUES ('Segundo', '13:00:00', '22:30:00');
INSERT INTO public.turno VALUES ('Terceiro', '22:00:00', '05:30:00');
INSERT INTO public.turno VALUES ('Geral', '07:00:00', '16:30:00');


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 200
-- Name: empregados_codigoempregado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empregados_codigoempregado_seq', 6, true);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 203
-- Name: ponto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponto_id_seq', 10, true);


--
-- TOC entry 2863 (class 2606 OID 16444)
-- Name: empregados empregados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empregados
    ADD CONSTRAINT empregados_pkey PRIMARY KEY (codigoempregado);


--
-- TOC entry 2867 (class 2606 OID 16583)
-- Name: ponto ponto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponto
    ADD CONSTRAINT ponto_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 16494)
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (turno);


--
-- TOC entry 2869 (class 2606 OID 16569)
-- Name: empregados fk_controle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empregados
    ADD CONSTRAINT fk_controle FOREIGN KEY (turnoempregado) REFERENCES public.turno(turno);


--
-- TOC entry 2870 (class 2606 OID 16584)
-- Name: ponto fk_controle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponto
    ADD CONSTRAINT fk_controle FOREIGN KEY (codigoempregado) REFERENCES public.empregados(codigoempregado);


--
-- TOC entry 2868 (class 2606 OID 16520)
-- Name: empregados fk_turno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empregados
    ADD CONSTRAINT fk_turno FOREIGN KEY (turnoempregado) REFERENCES public.turno(turno);


-- Completed on 2021-06-27 21:15:17

--
-- PostgreSQL database dump complete
--

