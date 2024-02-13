--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    nombre character varying(45),
    dni character varying(9) NOT NULL,
    apellidos character varying(45),
    usuario character varying(45) NOT NULL,
    contrasena character varying(45) NOT NULL,
    email character varying(45),
    telefono character varying(15),
    direccion character varying(45),
    numcredito character varying(45)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitacion (
    id_hab integer NOT NULL,
    cap_adultos integer NOT NULL,
    cap_ninos integer NOT NULL,
    estado character varying(45),
    tipo character varying(45) NOT NULL,
    preciobase character varying(45)
);


ALTER TABLE public.habitacion OWNER TO postgres;

--
-- Name: habitaciones_id_hab_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitaciones_id_hab_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.habitaciones_id_hab_seq OWNER TO postgres;

--
-- Name: habitaciones_id_hab_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitaciones_id_hab_seq OWNED BY public.habitacion.id_hab;


--
-- Name: precio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precio (
    nombre character varying(45) NOT NULL,
    valor integer
);


ALTER TABLE public.precio OWNER TO postgres;

--
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    num_reserva integer NOT NULL,
    num_habitacion integer,
    dni_cliente character varying(9),
    num_adultos integer,
    num_ninos integer,
    acomodacion character varying(45),
    fecha_fin character varying(45),
    fecha_inicio character varying(45)
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- Name: reserva_num_reserva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reserva_num_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reserva_num_reserva_seq OWNER TO postgres;

--
-- Name: reserva_num_reserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reserva_num_reserva_seq OWNED BY public.reserva.num_reserva;


--
-- Name: suplementos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suplementos (
    nombre character varying(45) NOT NULL,
    valor integer
);


ALTER TABLE public.suplementos OWNER TO postgres;

--
-- Name: habitacion id_hab; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion ALTER COLUMN id_hab SET DEFAULT nextval('public.habitaciones_id_hab_seq'::regclass);


--
-- Name: reserva num_reserva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva ALTER COLUMN num_reserva SET DEFAULT nextval('public.reserva_num_reserva_seq'::regclass);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES ('María', '987654321', 'López', 'marialo', 'maria123', 'maria@email.com', '987654321', 'Avenida 456', '123456789');
INSERT INTO public.cliente VALUES ('Pedro', '555555555', 'Gómez', 'pedrog', 'pedro456', 'pedro@email.com', '555555555', 'Carrera 789', '111111111');
INSERT INTO public.cliente VALUES ('Ana', '111111111', 'Martínez', 'anam', 'ana789', 'ana@email.com', '111111111', 'Callejon 567', '222222222');
INSERT INTO public.cliente VALUES ('Carlos', '222222222', 'Sánchez', 'carloss', 'carlos123', 'carlos@email.com', '222222222', 'Plaza 890', '333333333');
INSERT INTO public.cliente VALUES ('Juan', '123456789', 'Pérez', 'juanito', 'contraseña123', 'juan@email.com', '484848484', 'Calle 123', '987654321');


--
-- Data for Name: habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.habitacion VALUES (2, 1, 0, 'Ocupada', 'Individual', '300');
INSERT INTO public.habitacion VALUES (1, 2, 1, 'Disponible', 'Doble', '400');
INSERT INTO public.habitacion VALUES (4, 2, 0, 'Disponible', 'Doble', '400');
INSERT INTO public.habitacion VALUES (3, 4, 2, 'Disponible', 'Familiar', '500');
INSERT INTO public.habitacion VALUES (5, 3, 1, 'Fuera de servicio', 'Suite', '600');


--
-- Data for Name: precio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.precio VALUES ('Individual', 100);
INSERT INTO public.precio VALUES ('Doble', 150);
INSERT INTO public.precio VALUES ('Familiar', 200);
INSERT INTO public.precio VALUES ('Suite', 250);


--
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reserva VALUES (1, 1, '123456789', 2, 1, 'Estandar', '2024-02-01', '2024-02-05');
INSERT INTO public.reserva VALUES (2, 3, '987654321', 3, 2, 'VIP', '2024-03-10', '2024-03-15');
INSERT INTO public.reserva VALUES (3, 2, '555555555', 1, 0, 'Estandar', '2024-04-20', '2024-04-22');
INSERT INTO public.reserva VALUES (4, 4, '111111111', 2, 1, 'Especial', '2024-05-05', '2024-05-10');
INSERT INTO public.reserva VALUES (5, 5, '222222222', 2, 0, 'Estandar', '2024-06-15', '2024-06-20');


--
-- Data for Name: suplementos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.suplementos VALUES ('Desayuno', 10);
INSERT INTO public.suplementos VALUES ('WiFi', 5);
INSERT INTO public.suplementos VALUES ('Estacionamiento', 15);
INSERT INTO public.suplementos VALUES ('Spa', 20);
INSERT INTO public.suplementos VALUES ('Cena', 25);


--
-- Name: habitaciones_id_hab_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitaciones_id_hab_seq', 5, true);


--
-- Name: reserva_num_reserva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reserva_num_reserva_seq', 5, true);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (dni);


--
-- Name: habitacion habitaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitaciones_pkey PRIMARY KEY (id_hab);


--
-- Name: precio precio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precio
    ADD CONSTRAINT precio_pkey PRIMARY KEY (nombre);


--
-- Name: reserva reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (num_reserva);


--
-- Name: suplementos suplementos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suplementos
    ADD CONSTRAINT suplementos_pkey PRIMARY KEY (nombre);


--
-- Name: reserva reserva_dni_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_dni_cliente_fkey FOREIGN KEY (dni_cliente) REFERENCES public.cliente(dni);


--
-- Name: reserva reserva_num_habitacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_num_habitacion_fkey FOREIGN KEY (num_habitacion) REFERENCES public.habitacion(id_hab);


--
-- PostgreSQL database dump complete
--

