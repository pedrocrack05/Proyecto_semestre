--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.3

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
-- Name: carrito; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.carrito (
    id_carrito integer NOT NULL,
    id_usuario integer,
    id_producto integer,
    cantidad integer NOT NULL,
    CONSTRAINT carrito_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE public.carrito OWNER TO "BDO_owner";

--
-- Name: carrito_id_carrito_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.carrito_id_carrito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carrito_id_carrito_seq OWNER TO "BDO_owner";

--
-- Name: carrito_id_carrito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.carrito_id_carrito_seq OWNED BY public.carrito.id_carrito;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE public.categoria OWNER TO "BDO_owner";

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_categoria_seq OWNER TO "BDO_owner";

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;


--
-- Name: compra; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    id_usuario integer,
    fecha date,
    total numeric(10,2) NOT NULL,
    estado character varying(50) NOT NULL,
    CONSTRAINT compra_estado_check CHECK (((estado)::text = ANY ((ARRAY['Pendiente'::character varying, 'Completada'::character varying, 'Cancelada'::character varying])::text[])))
);


ALTER TABLE public.compra OWNER TO "BDO_owner";

--
-- Name: compra_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.compra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compra_id_compra_seq OWNER TO "BDO_owner";

--
-- Name: compra_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.compra_id_compra_seq OWNED BY public.compra.id_compra;


--
-- Name: direccion; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.direccion (
    id_direccion integer NOT NULL,
    id_usuario integer,
    direccion text NOT NULL,
    ciudad character varying(100),
    departamento character varying(100),
    codigo_postal character varying(10)
);


ALTER TABLE public.direccion OWNER TO "BDO_owner";

--
-- Name: direccion_id_direccion_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.direccion_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.direccion_id_direccion_seq OWNER TO "BDO_owner";

--
-- Name: direccion_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.direccion_id_direccion_seq OWNED BY public.direccion.id_direccion;


--
-- Name: favoritos; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.favoritos (
    id_favorito integer NOT NULL,
    id_usuario integer,
    id_producto integer
);


ALTER TABLE public.favoritos OWNER TO "BDO_owner";

--
-- Name: favoritos_id_favorito_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.favoritos_id_favorito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favoritos_id_favorito_seq OWNER TO "BDO_owner";

--
-- Name: favoritos_id_favorito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.favoritos_id_favorito_seq OWNED BY public.favoritos.id_favorito;


--
-- Name: mensaje; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.mensaje (
    id_mensaje integer NOT NULL,
    id_usuario_origen integer,
    id_usuario_destino integer,
    contenido text NOT NULL,
    fecha_envio date
);


ALTER TABLE public.mensaje OWNER TO "BDO_owner";

--
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.mensaje_id_mensaje_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mensaje_id_mensaje_seq OWNER TO "BDO_owner";

--
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.mensaje_id_mensaje_seq OWNED BY public.mensaje.id_mensaje;


--
-- Name: pago; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    id_compra integer,
    metodo_pago character varying(50) NOT NULL,
    estado_pago character varying(50) NOT NULL,
    fecha_pago timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pago_estado_pago_check CHECK (((estado_pago)::text = ANY ((ARRAY['Pendiente'::character varying, 'Completado'::character varying, 'Fallido'::character varying])::text[]))),
    CONSTRAINT pago_metodo_pago_check CHECK (((metodo_pago)::text = ANY ((ARRAY['tarjeta'::character varying, 'efectivo'::character varying])::text[])))
);


ALTER TABLE public.pago OWNER TO "BDO_owner";

--
-- Name: pago_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pago_id_pago_seq OWNER TO "BDO_owner";

--
-- Name: pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.pago_id_pago_seq OWNED BY public.pago.id_pago;


--
-- Name: producto; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    id_usuario integer,
    id_categoria integer,
    nombre character varying(100) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    imagen_url text
);


ALTER TABLE public.producto OWNER TO "BDO_owner";

--
-- Name: producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_producto_seq OWNER TO "BDO_owner";

--
-- Name: producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;


--
-- Name: resena; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.resena (
    id_resena integer NOT NULL,
    id_producto integer,
    id_usuario integer,
    calificacion integer NOT NULL,
    comentario text,
    fecha_resena timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT resena_calificacion_check CHECK (((calificacion >= 1) AND (calificacion <= 5)))
);


ALTER TABLE public.resena OWNER TO "BDO_owner";

--
-- Name: resena_id_resena_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.resena_id_resena_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resena_id_resena_seq OWNER TO "BDO_owner";

--
-- Name: resena_id_resena_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.resena_id_resena_seq OWNED BY public.resena.id_resena;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: BDO_owner
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(100) NOT NULL,
    "contraseña" character varying(100) NOT NULL,
    telefono character varying(15),
    tipo_usuario character varying(50) NOT NULL,
    CONSTRAINT usuario_tipo_usuario_check CHECK (((tipo_usuario)::text = ANY ((ARRAY['vendedor'::character varying, 'comprador'::character varying])::text[])))
);


ALTER TABLE public.usuario OWNER TO "BDO_owner";

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: BDO_owner
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO "BDO_owner";

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: BDO_owner
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- Name: carrito id_carrito; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.carrito ALTER COLUMN id_carrito SET DEFAULT nextval('public.carrito_id_carrito_seq'::regclass);


--
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- Name: compra id_compra; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.compra ALTER COLUMN id_compra SET DEFAULT nextval('public.compra_id_compra_seq'::regclass);


--
-- Name: direccion id_direccion; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.direccion ALTER COLUMN id_direccion SET DEFAULT nextval('public.direccion_id_direccion_seq'::regclass);


--
-- Name: favoritos id_favorito; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.favoritos ALTER COLUMN id_favorito SET DEFAULT nextval('public.favoritos_id_favorito_seq'::regclass);


--
-- Name: mensaje id_mensaje; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.mensaje ALTER COLUMN id_mensaje SET DEFAULT nextval('public.mensaje_id_mensaje_seq'::regclass);


--
-- Name: pago id_pago; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.pago ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_id_pago_seq'::regclass);


--
-- Name: producto id_producto; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);


--
-- Name: resena id_resena; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.resena ALTER COLUMN id_resena SET DEFAULT nextval('public.resena_id_resena_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Data for Name: carrito; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.carrito VALUES (1, 1, 1, 1);
INSERT INTO public.carrito VALUES (2, 2, 2, 2);
INSERT INTO public.carrito VALUES (3, 3, 3, 1);
INSERT INTO public.carrito VALUES (4, 4, 4, 3);
INSERT INTO public.carrito VALUES (5, 5, 5, 1);
INSERT INTO public.carrito VALUES (6, 6, 6, 2);
INSERT INTO public.carrito VALUES (7, 7, 7, 1);
INSERT INTO public.carrito VALUES (8, 8, 8, 2);
INSERT INTO public.carrito VALUES (9, 9, 9, 1);
INSERT INTO public.carrito VALUES (10, 10, 10, 1);
INSERT INTO public.carrito VALUES (11, 11, 11, 2);
INSERT INTO public.carrito VALUES (12, 12, 12, 1);
INSERT INTO public.carrito VALUES (13, 13, 13, 1);
INSERT INTO public.carrito VALUES (14, 14, 14, 1);
INSERT INTO public.carrito VALUES (15, 15, 15, 3);
INSERT INTO public.carrito VALUES (16, 16, 16, 1);
INSERT INTO public.carrito VALUES (17, 17, 17, 1);
INSERT INTO public.carrito VALUES (18, 18, 18, 2);
INSERT INTO public.carrito VALUES (19, 19, 19, 1);
INSERT INTO public.carrito VALUES (20, 20, 20, 1);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.categoria VALUES (1, 'Electrónica', 'Dispositivos electrónicos y gadgets.');
INSERT INTO public.categoria VALUES (2, 'Ropa', 'Ropa y accesorios para todos los géneros.');
INSERT INTO public.categoria VALUES (3, 'Hogar', 'Artículos y muebles para el hogar.');
INSERT INTO public.categoria VALUES (4, 'Juguetes', 'Juguetes y juegos para niños.');
INSERT INTO public.categoria VALUES (5, 'Deportes', 'Equipos y accesorios deportivos.');
INSERT INTO public.categoria VALUES (6, 'Libros', 'Libros de diferentes géneros y categorías.');
INSERT INTO public.categoria VALUES (7, 'Belleza', 'Productos de belleza y cuidado personal.');
INSERT INTO public.categoria VALUES (8, 'Jardinería', 'Herramientas y productos para jardinería.');
INSERT INTO public.categoria VALUES (9, 'Automotriz', 'Accesorios y piezas para vehículos.');
INSERT INTO public.categoria VALUES (10, 'Salud', 'Productos para el bienestar y la salud.');
INSERT INTO public.categoria VALUES (11, 'Tecnología', 'Últimos avances en tecnología.');
INSERT INTO public.categoria VALUES (12, 'Relojes', 'Relojes y accesorios de tiempo.');
INSERT INTO public.categoria VALUES (13, 'Electrodomésticos', 'Electrodomésticos para el hogar.');
INSERT INTO public.categoria VALUES (14, 'Música', 'Instrumentos y accesorios musicales.');
INSERT INTO public.categoria VALUES (15, 'Cine', 'Películas y productos relacionados.');
INSERT INTO public.categoria VALUES (16, 'Fotografía', 'Cámaras y accesorios de fotografía.');
INSERT INTO public.categoria VALUES (17, 'Viajes', 'Equipos y accesorios para viajar.');
INSERT INTO public.categoria VALUES (18, 'Cómics', 'Cómics y novelas gráficas.');
INSERT INTO public.categoria VALUES (19, 'Coleccionables', 'Artículos coleccionables y raros.');
INSERT INTO public.categoria VALUES (20, 'Artesanía', 'Productos hechos a mano y artesanales.');


--
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.compra VALUES (1, 1, '2024-08-01', 719.98, 'Pendiente');
INSERT INTO public.compra VALUES (2, 2, '2024-08-02', 29.99, 'Completada');
INSERT INTO public.compra VALUES (3, 3, '2024-08-03', 499.99, 'Cancelada');
INSERT INTO public.compra VALUES (4, 4, '2024-08-04', 15.99, 'Pendiente');
INSERT INTO public.compra VALUES (5, 5, '2024-08-05', 89.99, 'Completada');
INSERT INTO public.compra VALUES (6, 6, '2024-08-06', 19.99, 'Cancelada');
INSERT INTO public.compra VALUES (7, 7, '2024-08-07', 24.99, 'Pendiente');
INSERT INTO public.compra VALUES (8, 8, '2024-08-08', 12.99, 'Completada');
INSERT INTO public.compra VALUES (9, 9, '2024-08-09', 22.99, 'Cancelada');
INSERT INTO public.compra VALUES (10, 10, '2024-08-10', 14.99, 'Pendiente');
INSERT INTO public.compra VALUES (11, 11, '2024-08-11', 89.99, 'Completada');
INSERT INTO public.compra VALUES (12, 12, '2024-08-12', 49.99, 'Cancelada');
INSERT INTO public.compra VALUES (13, 13, '2024-08-13', 299.99, 'Pendiente');
INSERT INTO public.compra VALUES (14, 14, '2024-08-14', 129.99, 'Completada');
INSERT INTO public.compra VALUES (15, 15, '2024-08-15', 9.99, 'Cancelada');
INSERT INTO public.compra VALUES (16, 16, '2024-08-16', 799.99, 'Pendiente');
INSERT INTO public.compra VALUES (17, 17, '2024-08-17', 119.99, 'Completada');
INSERT INTO public.compra VALUES (18, 18, '2024-08-18', 8.99, 'Cancelada');
INSERT INTO public.compra VALUES (19, 19, '2024-08-19', 49.99, 'Pendiente');
INSERT INTO public.compra VALUES (20, 20, '2024-08-20', 159.99, 'Completada');


--
-- Data for Name: direccion; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.direccion VALUES (1, 1, 'Carrera 10 #15-20', 'Medellín', 'Antioquia', '050001');
INSERT INTO public.direccion VALUES (2, 2, 'Avenida 80 #45-67', 'Medellín', 'Antioquia', '050002');
INSERT INTO public.direccion VALUES (3, 3, 'Calle 33 #10-15', 'Medellín', 'Antioquia', '050003');
INSERT INTO public.direccion VALUES (4, 4, 'Transversal 5 #20-30', 'Medellín', 'Antioquia', '050004');
INSERT INTO public.direccion VALUES (5, 5, 'Carrera 50 #70-90', 'Medellín', 'Antioquia', '050005');
INSERT INTO public.direccion VALUES (6, 6, 'Calle 45 #30-50', 'Medellín', 'Antioquia', '050006');
INSERT INTO public.direccion VALUES (7, 7, 'Avenida 70 #20-40', 'Medellín', 'Antioquia', '050007');
INSERT INTO public.direccion VALUES (8, 8, 'Calle 12 #45-67', 'Medellín', 'Antioquia', '050008');
INSERT INTO public.direccion VALUES (9, 9, 'Carrera 30 #10-12', 'Medellín', 'Antioquia', '050009');
INSERT INTO public.direccion VALUES (10, 10, 'Avenida 33 #60-80', 'Medellín', 'Antioquia', '050010');
INSERT INTO public.direccion VALUES (11, 11, 'Calle 22 #40-60', 'Medellín', 'Antioquia', '050011');
INSERT INTO public.direccion VALUES (12, 12, 'Transversal 8 #15-25', 'Medellín', 'Antioquia', '050012');
INSERT INTO public.direccion VALUES (13, 13, 'Carrera 20 #10-30', 'Medellín', 'Antioquia', '050013');
INSERT INTO public.direccion VALUES (14, 14, 'Calle 10 #70-90', 'Medellín', 'Antioquia', '050014');
INSERT INTO public.direccion VALUES (15, 15, 'Avenida 55 #10-25', 'Medellín', 'Antioquia', '050015');
INSERT INTO public.direccion VALUES (16, 16, 'Calle 5 #35-50', 'Medellín', 'Antioquia', '050016');
INSERT INTO public.direccion VALUES (17, 17, 'Carrera 60 #20-40', 'Medellín', 'Antioquia', '050017');
INSERT INTO public.direccion VALUES (18, 18, 'Avenida 90 #50-70', 'Medellín', 'Antioquia', '050018');
INSERT INTO public.direccion VALUES (19, 19, 'Calle 35 #25-45', 'Medellín', 'Antioquia', '050019');
INSERT INTO public.direccion VALUES (20, 20, 'Transversal 7 #10-20', 'Medellín', 'Antioquia', '050020');


--
-- Data for Name: favoritos; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.favoritos VALUES (1, 1, 1);
INSERT INTO public.favoritos VALUES (2, 2, 2);
INSERT INTO public.favoritos VALUES (3, 3, 3);
INSERT INTO public.favoritos VALUES (4, 4, 4);
INSERT INTO public.favoritos VALUES (5, 5, 5);
INSERT INTO public.favoritos VALUES (6, 6, 6);
INSERT INTO public.favoritos VALUES (7, 7, 7);
INSERT INTO public.favoritos VALUES (8, 8, 8);
INSERT INTO public.favoritos VALUES (9, 9, 9);
INSERT INTO public.favoritos VALUES (10, 10, 10);
INSERT INTO public.favoritos VALUES (11, 11, 11);
INSERT INTO public.favoritos VALUES (12, 12, 12);
INSERT INTO public.favoritos VALUES (13, 13, 13);
INSERT INTO public.favoritos VALUES (14, 14, 14);
INSERT INTO public.favoritos VALUES (15, 15, 15);
INSERT INTO public.favoritos VALUES (16, 16, 16);
INSERT INTO public.favoritos VALUES (17, 17, 17);
INSERT INTO public.favoritos VALUES (18, 18, 18);
INSERT INTO public.favoritos VALUES (19, 19, 19);
INSERT INTO public.favoritos VALUES (20, 20, 20);


--
-- Data for Name: mensaje; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.mensaje VALUES (1, 1, 2, 'Hola, ¿estás interesado en el producto?', '2024-08-01');
INSERT INTO public.mensaje VALUES (2, 2, 3, 'Gracias por tu compra, ¿cómo te fue?', '2024-08-02');
INSERT INTO public.mensaje VALUES (3, 3, 4, 'Tu pedido está en camino.', '2024-08-03');
INSERT INTO public.mensaje VALUES (4, 4, 5, 'Tu reseña ha sido publicada.', '2024-08-04');
INSERT INTO public.mensaje VALUES (5, 5, 6, 'Confirmamos tu pago.', '2024-08-05');
INSERT INTO public.mensaje VALUES (6, 6, 7, 'El producto está agotado.', '2024-08-06');
INSERT INTO public.mensaje VALUES (7, 7, 8, 'Gracias por tu paciencia.', '2024-08-07');
INSERT INTO public.mensaje VALUES (8, 8, 9, 'Tu pedido ha sido enviado.', '2024-08-08');
INSERT INTO public.mensaje VALUES (9, 9, 10, 'Estamos preparando tu compra.', '2024-08-09');
INSERT INTO public.mensaje VALUES (10, 10, 11, 'Tu carrito ha sido actualizado.', '2024-08-10');
INSERT INTO public.mensaje VALUES (11, 11, 12, 'Gracias por tu reseña.', '2024-08-11');
INSERT INTO public.mensaje VALUES (12, 12, 13, 'Tu cuenta ha sido actualizada.', '2024-08-12');
INSERT INTO public.mensaje VALUES (13, 13, 14, 'Tu compra ha sido cancelada.', '2024-08-13');
INSERT INTO public.mensaje VALUES (14, 14, 15, 'El artículo está en oferta.', '2024-08-14');
INSERT INTO public.mensaje VALUES (15, 15, 16, '¿Necesitas ayuda con tu pedido?', '2024-08-15');
INSERT INTO public.mensaje VALUES (16, 16, 17, 'El envío se ha retrasado.', '2024-08-16');
INSERT INTO public.mensaje VALUES (17, 17, 18, 'Tu reseña ha sido aprobada.', '2024-08-17');
INSERT INTO public.mensaje VALUES (18, 18, 19, 'Tu producto ha llegado.', '2024-08-18');
INSERT INTO public.mensaje VALUES (19, 19, 20, 'Tu pago ha sido procesado.', '2024-08-19');
INSERT INTO public.mensaje VALUES (20, 20, 1, 'Gracias por tu interés.', '2024-08-20');


--
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.pago VALUES (1, 1, 'tarjeta', 'Pendiente', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (2, 2, 'efectivo', 'Completado', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (3, 3, 'tarjeta', 'Fallido', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (4, 4, 'efectivo', 'Pendiente', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (5, 5, 'tarjeta', 'Completado', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (6, 6, 'efectivo', 'Fallido', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (7, 7, 'tarjeta', 'Pendiente', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (8, 8, 'efectivo', 'Completado', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (9, 9, 'tarjeta', 'Fallido', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (10, 10, 'efectivo', 'Pendiente', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (11, 11, 'tarjeta', 'Completado', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (12, 12, 'efectivo', 'Fallido', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (13, 13, 'tarjeta', 'Pendiente', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (14, 14, 'efectivo', 'Completado', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (15, 15, 'tarjeta', 'Fallido', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (16, 16, 'efectivo', 'Pendiente', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (17, 17, 'tarjeta', 'Completado', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (18, 18, 'efectivo', 'Fallido', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (19, 19, 'tarjeta', 'Pendiente', '2024-09-12 01:02:29.82725');
INSERT INTO public.pago VALUES (20, 20, 'efectivo', 'Completado', '2024-09-12 01:02:29.82725');


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.producto VALUES (1, 1, 1, 'Smartphone XYZ', 'Smartphone de última generación.', 699.99, 50, 'http://example.com/img/smartphone.jpg');
INSERT INTO public.producto VALUES (2, 2, 2, 'Camisa de algodón', 'Camisa cómoda y elegante.', 29.99, 100, 'http://example.com/img/camisa.jpg');
INSERT INTO public.producto VALUES (3, 3, 3, 'Sofá de cuero', 'Sofá grande y cómodo.', 499.99, 20, 'http://example.com/img/sofa.jpg');
INSERT INTO public.producto VALUES (4, 4, 4, 'Muñeca de trapo', 'Muñeca suave y amigable.', 15.99, 200, 'http://example.com/img/muneca.jpg');
INSERT INTO public.producto VALUES (5, 5, 5, 'Raqueta de tenis', 'Raqueta profesional de tenis.', 89.99, 30, 'http://example.com/img/raqueta.jpg');
INSERT INTO public.producto VALUES (6, 6, 6, 'Novela de ciencia ficción', 'Una novela emocionante.', 19.99, 150, 'http://example.com/img/libro.jpg');
INSERT INTO public.producto VALUES (7, 7, 7, 'Crema facial', 'Crema hidratante para el rostro.', 24.99, 80, 'http://example.com/img/crema.jpg');
INSERT INTO public.producto VALUES (8, 8, 8, 'Maceta de jardín', 'Maceta de cerámica para plantas.', 12.99, 60, 'http://example.com/img/maceta.jpg');
INSERT INTO public.producto VALUES (9, 9, 9, 'Cubierta de volante', 'Cubierta de volante para vehículos.', 22.99, 40, 'http://example.com/img/cubierta.jpg');
INSERT INTO public.producto VALUES (10, 10, 10, 'Vitaminas multivitamínicas', 'Suplemento de vitaminas.', 14.99, 100, 'http://example.com/img/vitaminas.jpg');
INSERT INTO public.producto VALUES (11, 11, 11, 'Auriculares Bluetooth', 'Auriculares inalámbricos.', 89.99, 75, 'http://example.com/img/auriculares.jpg');
INSERT INTO public.producto VALUES (12, 12, 12, 'Reloj digital', 'Reloj con pantalla digital.', 49.99, 45, 'http://example.com/img/reloj.jpg');
INSERT INTO public.producto VALUES (13, 13, 13, 'Nevera compacta', 'Nevera pequeña y eficiente.', 299.99, 25, 'http://example.com/img/nevera.jpg');
INSERT INTO public.producto VALUES (14, 14, 14, 'Guitarra acústica', 'Guitarra de buena calidad.', 129.99, 15, 'http://example.com/img/guitarra.jpg');
INSERT INTO public.producto VALUES (15, 15, 15, 'DVD de película', 'Película en formato DVD.', 9.99, 300, 'http://example.com/img/dvd.jpg');
INSERT INTO public.producto VALUES (16, 16, 16, 'Cámara DSLR', 'Cámara profesional para fotografía.', 799.99, 10, 'http://example.com/img/camara.jpg');
INSERT INTO public.producto VALUES (17, 17, 17, 'Maleta de viaje', 'Maleta duradera y espaciosa.', 119.99, 40, 'http://example.com/img/maleta.jpg');
INSERT INTO public.producto VALUES (18, 18, 18, 'Cómic de superhéroes', 'Cómic de aventuras de superhéroes.', 8.99, 250, 'http://example.com/img/comic.jpg');
INSERT INTO public.producto VALUES (19, 19, 19, 'Figura coleccionable', 'Figura limitada y coleccionable.', 49.99, 30, 'http://example.com/img/figura.jpg');
INSERT INTO public.producto VALUES (20, 20, 20, 'Cuadro pintado a mano', 'Cuadro artístico de gran calidad.', 159.99, 5, 'http://example.com/img/cuadro.jpg');


--
-- Data for Name: resena; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.resena VALUES (1, 1, 1, 5, 'Excelente producto, muy recomendable.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (2, 2, 2, 4, 'Buena calidad, pero un poco caro.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (3, 3, 3, 3, 'El sofá es cómodo, pero llegó tarde.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (4, 4, 4, 5, 'Mi hija adora esta muñeca.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (5, 5, 5, 4, 'Buena raqueta, aunque podría ser más ligera.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (6, 6, 6, 5, 'Muy buen libro, lo disfruté mucho.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (7, 7, 7, 4, 'Crema efectiva, aunque el envase podría ser mejor.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (8, 8, 8, 5, 'Ideal para mis plantas.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (9, 9, 9, 3, 'Cumple su función, pero el diseño podría mejorar.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (10, 10, 10, 5, 'Gran suplemento, lo recomiendo.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (11, 11, 11, 4, 'Sonido excelente, aunque la batería dura poco.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (12, 12, 12, 5, 'Muy buen reloj, fácil de usar.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (13, 13, 13, 3, 'La nevera funciona bien, pero el ruido es molesto.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (14, 14, 14, 4, 'Buena guitarra para principiantes.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (15, 15, 15, 2, 'La película no era lo que esperaba.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (16, 16, 16, 5, 'Perfecta para mis necesidades de fotografía.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (17, 17, 17, 4, 'Espaciosa y duradera, ideal para viajes.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (18, 18, 18, 5, 'Un cómic entretenido, con una gran historia.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (19, 19, 19, 5, 'Figura muy bien hecha, excelente para coleccionistas.', '2024-09-12 01:02:36.447157');
INSERT INTO public.resena VALUES (20, 20, 20, 4, 'El cuadro es bonito, pero llegó con un pequeño rasguño.', '2024-09-12 01:02:36.447157');


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: BDO_owner
--

INSERT INTO public.usuario VALUES (1, 'Juan Pérez', 'juan.perez@example.com', 'contraseña123', '3001234567', 'vendedor');
INSERT INTO public.usuario VALUES (2, 'Ana Gómez', 'ana.gomez@example.com', 'contraseña456', '3002345678', 'comprador');
INSERT INTO public.usuario VALUES (3, 'Carlos Fernández', 'carlos.fernandez@example.com', 'contraseña789', '3003456789', 'vendedor');
INSERT INTO public.usuario VALUES (4, 'María Rodríguez', 'maria.rodriguez@example.com', 'contraseña012', '3004567890', 'comprador');
INSERT INTO public.usuario VALUES (5, 'Luis Martínez', 'luis.martinez@example.com', 'contraseña345', '3005678901', 'vendedor');
INSERT INTO public.usuario VALUES (6, 'Laura López', 'laura.lopez@example.com', 'contraseña678', '3006789012', 'comprador');
INSERT INTO public.usuario VALUES (7, 'Jorge Sánchez', 'jorge.sanchez@example.com', 'contraseña901', '3007890123', 'vendedor');
INSERT INTO public.usuario VALUES (8, 'Paola Herrera', 'paola.herrera@example.com', 'contraseña234', '3008901234', 'comprador');
INSERT INTO public.usuario VALUES (9, 'Ricardo Castro', 'ricardo.castro@example.com', 'contraseña567', '3009012345', 'vendedor');
INSERT INTO public.usuario VALUES (10, 'Sofía Morales', 'sofia.morales@example.com', 'contraseña890', '3000123456', 'comprador');
INSERT INTO public.usuario VALUES (11, 'Pedro Ramírez', 'pedro.ramirez@example.com', 'contraseña1234', '3001234568', 'vendedor');
INSERT INTO public.usuario VALUES (12, 'Catalina Torres', 'catalina.torres@example.com', 'contraseña4567', '3002345679', 'comprador');
INSERT INTO public.usuario VALUES (13, 'Felipe Vargas', 'felipe.vargas@example.com', 'contraseña7890', '3003456780', 'vendedor');
INSERT INTO public.usuario VALUES (14, 'Isabella Gómez', 'isabella.gomez@example.com', 'contraseña0123', '3004567891', 'comprador');
INSERT INTO public.usuario VALUES (15, 'Andrés Martínez', 'andres.martinez@example.com', 'contraseña3456', '3005678902', 'vendedor');
INSERT INTO public.usuario VALUES (16, 'Natalia Romero', 'natalia.romero@example.com', 'contraseña6789', '3006789013', 'comprador');
INSERT INTO public.usuario VALUES (17, 'Emilio Díaz', 'emilio.diaz@example.com', 'contraseña9012', '3007890124', 'vendedor');
INSERT INTO public.usuario VALUES (18, 'Daniela Castillo', 'daniela.castillo@example.com', 'contraseña2345', '3008901235', 'comprador');
INSERT INTO public.usuario VALUES (19, 'Javier Moreno', 'javier.moreno@example.com', 'contraseña5678', '3009012346', 'vendedor');
INSERT INTO public.usuario VALUES (20, 'Valentina Cruz', 'valentina.cruz@example.com', 'contraseña8901', '3000123457', 'comprador');
INSERT INTO public.usuario VALUES (21, 'Andrés Pérez', 'andres.perez@example.com', 'contraseña12345', '3001234569', 'vendedor');


--
-- Name: carrito_id_carrito_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.carrito_id_carrito_seq', 20, true);


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 20, true);


--
-- Name: compra_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.compra_id_compra_seq', 20, true);


--
-- Name: direccion_id_direccion_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.direccion_id_direccion_seq', 20, true);


--
-- Name: favoritos_id_favorito_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.favoritos_id_favorito_seq', 20, true);


--
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.mensaje_id_mensaje_seq', 20, true);


--
-- Name: pago_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.pago_id_pago_seq', 20, true);


--
-- Name: producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.producto_id_producto_seq', 20, true);


--
-- Name: resena_id_resena_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.resena_id_resena_seq', 20, true);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: BDO_owner
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 21, true);


--
-- Name: carrito carrito_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY (id_carrito);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);


--
-- Name: direccion direccion_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id_direccion);


--
-- Name: favoritos favoritos_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.favoritos
    ADD CONSTRAINT favoritos_pkey PRIMARY KEY (id_favorito);


--
-- Name: mensaje mensaje_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id_mensaje);


--
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);


--
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);


--
-- Name: resena resena_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_pkey PRIMARY KEY (id_resena);


--
-- Name: usuario usuario_correo_key; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_correo_key UNIQUE (correo);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: carrito carrito_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- Name: carrito carrito_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: compra compra_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: direccion direccion_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: favoritos favoritos_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.favoritos
    ADD CONSTRAINT favoritos_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- Name: favoritos favoritos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.favoritos
    ADD CONSTRAINT favoritos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: mensaje mensaje_id_usuario_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_id_usuario_destino_fkey FOREIGN KEY (id_usuario_destino) REFERENCES public.usuario(id_usuario);


--
-- Name: mensaje mensaje_id_usuario_origen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_id_usuario_origen_fkey FOREIGN KEY (id_usuario_origen) REFERENCES public.usuario(id_usuario);


--
-- Name: pago pago_id_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra);


--
-- Name: producto producto_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


--
-- Name: producto producto_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: resena resena_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- Name: resena resena_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: BDO_owner
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- PostgreSQL database dump complete
--

