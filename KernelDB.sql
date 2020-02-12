--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2020-02-12 23:45:23

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
-- TOC entry 209 (class 1259 OID 26005)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "Tivikrat";

--
-- TOC entry 208 (class 1259 OID 26003)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 26015)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "Tivikrat";

--
-- TOC entry 210 (class 1259 OID 26013)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 207 (class 1259 OID 25997)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "Tivikrat";

--
-- TOC entry 206 (class 1259 OID 25995)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 213 (class 1259 OID 26023)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "Tivikrat";

--
-- TOC entry 215 (class 1259 OID 26033)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "Tivikrat";

--
-- TOC entry 214 (class 1259 OID 26031)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 212 (class 1259 OID 26021)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 217 (class 1259 OID 26041)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "Tivikrat";

--
-- TOC entry 216 (class 1259 OID 26039)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 241 (class 1259 OID 26334)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO "Tivikrat";

--
-- TOC entry 219 (class 1259 OID 26101)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "Tivikrat";

--
-- TOC entry 218 (class 1259 OID 26099)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 205 (class 1259 OID 25987)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "Tivikrat";

--
-- TOC entry 204 (class 1259 OID 25985)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 203 (class 1259 OID 25976)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "Tivikrat";

--
-- TOC entry 202 (class 1259 OID 25974)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 240 (class 1259 OID 26323)
-- Name: django_session; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "Tivikrat";

--
-- TOC entry 221 (class 1259 OID 26134)
-- Name: elevator_contract; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_contract (
    id integer NOT NULL,
    name text NOT NULL,
    weight double precision NOT NULL,
    is_confirmed boolean NOT NULL,
    date date NOT NULL,
    good_id integer NOT NULL,
    provider_id integer NOT NULL
);


ALTER TABLE public.elevator_contract OWNER TO "Tivikrat";

--
-- TOC entry 220 (class 1259 OID 26132)
-- Name: elevator_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_contract_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 220
-- Name: elevator_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_contract_id_seq OWNED BY public.elevator_contract.id;


--
-- TOC entry 239 (class 1259 OID 26218)
-- Name: elevator_delivery; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_delivery (
    id integer NOT NULL,
    name text NOT NULL,
    lsd_number text,
    is_lsd_unhurted boolean,
    car_number text,
    driver_name text,
    elevator_id integer NOT NULL,
    guardian_id integer,
    lab_analysis_id integer,
    weight_check_id integer,
    date date,
    provider_id integer NOT NULL,
    to_elevator boolean NOT NULL
);


ALTER TABLE public.elevator_delivery OWNER TO "Tivikrat";

--
-- TOC entry 238 (class 1259 OID 26216)
-- Name: elevator_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_delivery_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 238
-- Name: elevator_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_delivery_id_seq OWNED BY public.elevator_delivery.id;


--
-- TOC entry 223 (class 1259 OID 26145)
-- Name: elevator_elevator; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_elevator (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.elevator_elevator OWNER TO "Tivikrat";

--
-- TOC entry 222 (class 1259 OID 26143)
-- Name: elevator_elevator_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_elevator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_elevator_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 222
-- Name: elevator_elevator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_elevator_id_seq OWNED BY public.elevator_elevator.id;


--
-- TOC entry 225 (class 1259 OID 26156)
-- Name: elevator_good; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_good (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.elevator_good OWNER TO "Tivikrat";

--
-- TOC entry 224 (class 1259 OID 26154)
-- Name: elevator_good_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_good_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_good_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 224
-- Name: elevator_good_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_good_id_seq OWNED BY public.elevator_good.id;


--
-- TOC entry 237 (class 1259 OID 26210)
-- Name: elevator_guardian; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_guardian (
    id integer NOT NULL,
    elevator_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.elevator_guardian OWNER TO "Tivikrat";

--
-- TOC entry 236 (class 1259 OID 26208)
-- Name: elevator_guardian_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_guardian_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_guardian_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 236
-- Name: elevator_guardian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_guardian_id_seq OWNED BY public.elevator_guardian.id;


--
-- TOC entry 235 (class 1259 OID 26202)
-- Name: elevator_labanalysis; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_labanalysis (
    id integer NOT NULL,
    humidity double precision,
    clogging double precision,
    lab_assistant_id integer NOT NULL
);


ALTER TABLE public.elevator_labanalysis OWNER TO "Tivikrat";

--
-- TOC entry 234 (class 1259 OID 26200)
-- Name: elevator_labanalysis_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_labanalysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_labanalysis_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 234
-- Name: elevator_labanalysis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_labanalysis_id_seq OWNED BY public.elevator_labanalysis.id;


--
-- TOC entry 233 (class 1259 OID 26194)
-- Name: elevator_labassistant; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_labassistant (
    id integer NOT NULL,
    elevator_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.elevator_labassistant OWNER TO "Tivikrat";

--
-- TOC entry 232 (class 1259 OID 26192)
-- Name: elevator_labassistant_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_labassistant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_labassistant_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 232
-- Name: elevator_labassistant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_labassistant_id_seq OWNED BY public.elevator_labassistant.id;


--
-- TOC entry 231 (class 1259 OID 26183)
-- Name: elevator_provider; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_provider (
    id integer NOT NULL,
    name text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.elevator_provider OWNER TO "Tivikrat";

--
-- TOC entry 230 (class 1259 OID 26181)
-- Name: elevator_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_provider_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 230
-- Name: elevator_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_provider_id_seq OWNED BY public.elevator_provider.id;


--
-- TOC entry 227 (class 1259 OID 26167)
-- Name: elevator_weighing; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_weighing (
    id integer NOT NULL,
    elevator_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.elevator_weighing OWNER TO "Tivikrat";

--
-- TOC entry 226 (class 1259 OID 26165)
-- Name: elevator_weighing_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_weighing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_weighing_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 226
-- Name: elevator_weighing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_weighing_id_seq OWNED BY public.elevator_weighing.id;


--
-- TOC entry 229 (class 1259 OID 26175)
-- Name: elevator_weightcheck; Type: TABLE; Schema: public; Owner: Tivikrat
--

CREATE TABLE public.elevator_weightcheck (
    id integer NOT NULL,
    gross_weight double precision,
    net_weight double precision,
    weighing_id integer NOT NULL
);


ALTER TABLE public.elevator_weightcheck OWNER TO "Tivikrat";

--
-- TOC entry 228 (class 1259 OID 26173)
-- Name: elevator_weightcheck_id_seq; Type: SEQUENCE; Schema: public; Owner: Tivikrat
--

CREATE SEQUENCE public.elevator_weightcheck_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevator_weightcheck_id_seq OWNER TO "Tivikrat";

--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 228
-- Name: elevator_weightcheck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tivikrat
--

ALTER SEQUENCE public.elevator_weightcheck_id_seq OWNED BY public.elevator_weightcheck.id;


--
-- TOC entry 2815 (class 2604 OID 26008)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2816 (class 2604 OID 26018)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2814 (class 2604 OID 26000)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2817 (class 2604 OID 26026)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2818 (class 2604 OID 26036)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2819 (class 2604 OID 26044)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2820 (class 2604 OID 26104)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2813 (class 2604 OID 25990)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2812 (class 2604 OID 25979)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2822 (class 2604 OID 26137)
-- Name: elevator_contract id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_contract ALTER COLUMN id SET DEFAULT nextval('public.elevator_contract_id_seq'::regclass);


--
-- TOC entry 2831 (class 2604 OID 26221)
-- Name: elevator_delivery id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_delivery ALTER COLUMN id SET DEFAULT nextval('public.elevator_delivery_id_seq'::regclass);


--
-- TOC entry 2823 (class 2604 OID 26148)
-- Name: elevator_elevator id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_elevator ALTER COLUMN id SET DEFAULT nextval('public.elevator_elevator_id_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 26159)
-- Name: elevator_good id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_good ALTER COLUMN id SET DEFAULT nextval('public.elevator_good_id_seq'::regclass);


--
-- TOC entry 2830 (class 2604 OID 26213)
-- Name: elevator_guardian id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_guardian ALTER COLUMN id SET DEFAULT nextval('public.elevator_guardian_id_seq'::regclass);


--
-- TOC entry 2829 (class 2604 OID 26205)
-- Name: elevator_labanalysis id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_labanalysis ALTER COLUMN id SET DEFAULT nextval('public.elevator_labanalysis_id_seq'::regclass);


--
-- TOC entry 2828 (class 2604 OID 26197)
-- Name: elevator_labassistant id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_labassistant ALTER COLUMN id SET DEFAULT nextval('public.elevator_labassistant_id_seq'::regclass);


--
-- TOC entry 2827 (class 2604 OID 26186)
-- Name: elevator_provider id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_provider ALTER COLUMN id SET DEFAULT nextval('public.elevator_provider_id_seq'::regclass);


--
-- TOC entry 2825 (class 2604 OID 26170)
-- Name: elevator_weighing id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_weighing ALTER COLUMN id SET DEFAULT nextval('public.elevator_weighing_id_seq'::regclass);


--
-- TOC entry 2826 (class 2604 OID 26178)
-- Name: elevator_weightcheck id; Type: DEFAULT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_weightcheck ALTER COLUMN id SET DEFAULT nextval('public.elevator_weightcheck_id_seq'::regclass);


--
-- TOC entry 3091 (class 0 OID 26005)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 26015)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 25997)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add contract	7	add_contract
26	Can change contract	7	change_contract
27	Can delete contract	7	delete_contract
28	Can view contract	7	view_contract
29	Can add elevator	8	add_elevator
30	Can change elevator	8	change_elevator
31	Can delete elevator	8	delete_elevator
32	Can view elevator	8	view_elevator
33	Can add good	9	add_good
34	Can change good	9	change_good
35	Can delete good	9	delete_good
36	Can view good	9	view_good
37	Can add weighing	10	add_weighing
38	Can change weighing	10	change_weighing
39	Can delete weighing	10	delete_weighing
40	Can view weighing	10	view_weighing
41	Can add weight check	11	add_weightcheck
42	Can change weight check	11	change_weightcheck
43	Can delete weight check	11	delete_weightcheck
44	Can view weight check	11	view_weightcheck
45	Can add provider	12	add_provider
46	Can change provider	12	change_provider
47	Can delete provider	12	delete_provider
48	Can view provider	12	view_provider
49	Can add lab assistant	13	add_labassistant
50	Can change lab assistant	13	change_labassistant
51	Can delete lab assistant	13	delete_labassistant
52	Can view lab assistant	13	view_labassistant
53	Can add lab analysis	14	add_labanalysis
54	Can change lab analysis	14	change_labanalysis
55	Can delete lab analysis	14	delete_labanalysis
56	Can view lab analysis	14	view_labanalysis
57	Can add guardian	15	add_guardian
58	Can change guardian	15	change_guardian
59	Can delete guardian	15	delete_guardian
60	Can view guardian	15	view_guardian
61	Can add delivery	16	add_delivery
62	Can change delivery	16	change_delivery
63	Can delete delivery	16	delete_delivery
64	Can view delivery	16	view_delivery
65	Can add Token	17	add_token
66	Can change Token	17	change_token
67	Can delete Token	17	delete_token
68	Can view Token	17	view_token
\.


--
-- TOC entry 3095 (class 0 OID 26023)
-- Dependencies: 213
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$180000$IebDN5m2trkr$Qv9KSbh4IRP4NfPbn2n3dmVv97dT/5B6vRd+U5MPq5o=	2020-02-12 02:08:57.093048+02	f	login			email@email.com	f	t	2020-02-12 02:08:56.818781+02
4	pbkdf2_sha256$180000$OdI4NiUvzDqD$+CuKmgGietHC/zXhUMNEq1CyCjHutlgCZG2dcqDIytM=	\N	f	login1	Максим	Пащенко	email1@email.com	f	t	2020-02-12 02:15:13.698576+02
5	pbkdf2_sha256$180000$jTOvXPO4M4xw$lj5uLmndptekaoPrVtrpT2kCd30QFXR5nVRUuYs2b2I=	2020-02-12 20:11:25.946429+02	f	farmer	Фермер	Фермерниченко	farmer@email.com	f	t	2020-02-12 16:00:04.391478+02
1	pbkdf2_sha256$180000$slJK4T45nLUp$iVh65G9A/kdWuGl+BQDfeYUJ0qF7FjCJ2JEnkXtfskc=	2020-02-12 22:25:05.03234+02	t	Tivikrat				t	t	2020-02-11 17:20:41.04465+02
\.


--
-- TOC entry 3097 (class 0 OID 26033)
-- Dependencies: 215
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 26041)
-- Dependencies: 217
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 26334)
-- Dependencies: 241
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
f5b7213fe37329c023a783800162261a4ec3106f	2020-02-11 17:59:21.515687+02	1
98e9a4a35a5ba878f0d47c6187652fd8eba6a0d7	2020-02-12 02:08:57.104017+02	3
97a2382fa5446e85dd89c75ced50d6feefbef31d	2020-02-12 02:15:14.096512+02	4
98e2652f28820b6076fbc023cecadd61277e7642	2020-02-12 16:00:04.729645+02	5
\.


--
-- TOC entry 3101 (class 0 OID 26101)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 25987)
-- Dependencies: 205
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	elevator	contract
8	elevator	elevator
9	elevator	good
10	elevator	weighing
11	elevator	weightcheck
12	elevator	provider
13	elevator	labassistant
14	elevator	labanalysis
15	elevator	guardian
16	elevator	delivery
17	authtoken	token
\.


--
-- TOC entry 3085 (class 0 OID 25976)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-11 17:02:50.185471+02
2	auth	0001_initial	2020-02-11 17:02:50.271646+02
3	admin	0001_initial	2020-02-11 17:02:50.396919+02
4	admin	0002_logentry_remove_auto_add	2020-02-11 17:02:50.424355+02
5	admin	0003_logentry_add_action_flag_choices	2020-02-11 17:02:50.43632+02
6	contenttypes	0002_remove_content_type_name	2020-02-11 17:02:50.468237+02
7	auth	0002_alter_permission_name_max_length	2020-02-11 17:02:50.476216+02
8	auth	0003_alter_user_email_max_length	2020-02-11 17:02:50.492173+02
9	auth	0004_alter_user_username_opts	2020-02-11 17:02:50.505136+02
10	auth	0005_alter_user_last_login_null	2020-02-11 17:02:50.524116+02
11	auth	0006_require_contenttypes_0002	2020-02-11 17:02:50.527106+02
12	auth	0007_alter_validators_add_error_messages	2020-02-11 17:02:50.541168+02
13	auth	0008_alter_user_username_max_length	2020-02-11 17:02:50.564059+02
14	auth	0009_alter_user_last_name_max_length	2020-02-11 17:02:50.577973+02
15	auth	0010_alter_group_name_max_length	2020-02-11 17:02:50.593928+02
16	auth	0011_update_proxy_permissions	2020-02-11 17:02:50.605897+02
17	elevator	0001_initial	2020-02-11 17:02:50.841167+02
18	sessions	0001_initial	2020-02-11 17:02:50.980218+02
19	authtoken	0001_initial	2020-02-11 17:23:25.902187+02
20	authtoken	0002_auto_20160226_1747	2020-02-11 17:23:26.018874+02
21	elevator	0002_auto_20200212_1122	2020-02-12 11:23:16.526345+02
22	elevator	0003_auto_20200212_1522	2020-02-12 15:22:34.982517+02
23	elevator	0004_delivery_to_elevator	2020-02-12 15:23:22.57445+02
24	elevator	0005_auto_20200212_1531	2020-02-12 15:31:10.998391+02
25	elevator	0006_auto_20200212_1619	2020-02-12 16:19:14.894532+02
26	elevator	0007_auto_20200212_1657	2020-02-12 16:57:05.843932+02
27	elevator	0008_auto_20200212_1755	2020-02-12 17:55:16.425354+02
28	elevator	0009_auto_20200212_1834	2020-02-12 18:34:55.547371+02
\.


--
-- TOC entry 3122 (class 0 OID 26323)
-- Dependencies: 240
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
54ewyqcu33l6ikfrpo31a5bshgqrfgfk	MzhmMmJjNjJjODBmMWQ1MzQxZDFiN2I4NThmMTcwMDY2YWE5NDZhOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZTU2NzhjYjFmZDZjY2MxNWI4MmEzNjlkZThkYjIzNWNmMGU2ZDIwIn0=	2020-02-26 22:25:05.041315+02
\.


--
-- TOC entry 3103 (class 0 OID 26134)
-- Dependencies: 221
-- Data for Name: elevator_contract; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_contract (id, name, weight, is_confirmed, date, good_id, provider_id) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 26218)
-- Dependencies: 239
-- Data for Name: elevator_delivery; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_delivery (id, name, lsd_number, is_lsd_unhurted, car_number, driver_name, elevator_id, guardian_id, lab_analysis_id, weight_check_id, date, provider_id, to_elevator) FROM stdin;
16	ТТН17	\N	\N	\N	\N	2	\N	25	17	2019-10-09	2	t
17	ТТН18	\N	\N	\N	\N	2	\N	26	18	2019-10-09	2	t
18	ТТН19	\N	\N	\N	\N	2	\N	27	19	2019-10-09	2	t
19	ТТН20	\N	\N	\N	\N	2	\N	28	20	2019-10-09	2	t
1	ТТН1	\N	\N	\N	\N	2	\N	5	2	2019-09-27	2	t
2	ТТН2	\N	\N	\N	\N	2	\N	6	3	2019-09-27	2	t
3	ТТН3	\N	\N	\N	\N	2	\N	7	4	2019-09-27	2	t
4	ТТН5	\N	\N	\N	\N	2	\N	8	5	2019-09-30	2	t
5	ТТН6	\N	\N	\N	\N	2	\N	9	6	2019-09-30	2	t
6	ТТН7	\N	\N	\N	\N	2	\N	10	7	2019-10-07	2	t
7	ТТН8	\N	\N	\N	\N	2	\N	11	8	2019-10-07	2	t
8	ТТН9	\N	\N	\N	\N	2	\N	12	9	2019-10-07	2	t
9	ТТН10	\N	\N	\N	\N	2	\N	13	10	2019-10-07	2	t
10	ТТН11	\N	\N	\N	\N	2	\N	14	11	2019-10-07	2	t
11	ТТН12	\N	\N	\N	\N	2	\N	15	12	2019-10-07	2	t
12	ТТН13	\N	\N	\N	\N	2	\N	16	13	2019-10-08	2	t
13	ТТН14	\N	\N	\N	\N	2	\N	17	14	2019-10-08	2	t
14	ТТН15	\N	\N	\N	\N	2	\N	18	15	2019-10-08	2	t
15	ТТН16	\N	\N	\N	\N	2	\N	19	16	2019-10-08	2	t
20	ТТН21	\N	\N	\N	\N	2	\N	20	21	2019-10-09	2	t
21	ТТН22	\N	\N	\N	\N	2	\N	21	22	2019-10-12	2	t
22	ТТН23	\N	\N	\N	\N	2	\N	22	23	2019-10-12	2	t
23	ТТН24	\N	\N	\N	\N	2	\N	23	24	2019-10-12	2	t
24	ТТН25	\N	\N	\N	\N	2	\N	24	25	2019-10-12	2	t
\.


--
-- TOC entry 3105 (class 0 OID 26145)
-- Dependencies: 223
-- Data for Name: elevator_elevator; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_elevator (id, name, address) FROM stdin;
2	Дніпровський Kernel елеватор № 154256	м. Дніпро, вул. Жовтнева, 40
\.


--
-- TOC entry 3107 (class 0 OID 26156)
-- Dependencies: 225
-- Data for Name: elevator_good; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_good (id, name) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 26210)
-- Dependencies: 237
-- Data for Name: elevator_guardian; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_guardian (id, elevator_id, user_id) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 26202)
-- Dependencies: 235
-- Data for Name: elevator_labanalysis; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_labanalysis (id, humidity, clogging, lab_assistant_id) FROM stdin;
5	17.4	3.5	3
6	17	3.3	3
7	17.5	3.1	3
8	16.9	3.5	3
9	17.1	3.9	3
10	17.1	2.95	3
11	16.8	3.2	3
12	17	3.3	3
13	16.9	3.3	3
14	16.8	3.3	3
15	17.1	3.15	3
16	16.8	2.9	3
17	16.8	3	3
18	17.5	2.9	3
19	17.3	2.8	3
22	16.8	3.1	3
23	16.8	2.8	3
24	17.3	2.9	3
25	16.8	2.9	3
26	16.8	3	3
27	16.8	3	3
28	17.3	2.9	3
20	17.35	2.7	3
21	17.1	2.8	3
\.


--
-- TOC entry 3115 (class 0 OID 26194)
-- Dependencies: 233
-- Data for Name: elevator_labassistant; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_labassistant (id, elevator_id, user_id) FROM stdin;
6	2	3
3	2	1
\.


--
-- TOC entry 3113 (class 0 OID 26183)
-- Dependencies: 231
-- Data for Name: elevator_provider; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_provider (id, name, user_id) FROM stdin;
2	Фермерське господарство	5
\.


--
-- TOC entry 3109 (class 0 OID 26167)
-- Dependencies: 227
-- Data for Name: elevator_weighing; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_weighing (id, elevator_id, user_id) FROM stdin;
3	2	1
\.


--
-- TOC entry 3111 (class 0 OID 26175)
-- Dependencies: 229
-- Data for Name: elevator_weightcheck; Type: TABLE DATA; Schema: public; Owner: Tivikrat
--

COPY public.elevator_weightcheck (id, gross_weight, net_weight, weighing_id) FROM stdin;
2	\N	21060	3
3	\N	21100	3
4	\N	21300	3
5	\N	20600	3
6	\N	20260	3
7	\N	21060	3
8	\N	20100	3
9	\N	19100	3
10	\N	20100	3
11	\N	20100	3
12	\N	20040	3
13	\N	22060	3
14	\N	21100	3
15	\N	23100	3
16	\N	21340	3
17	\N	25050	3
18	\N	21100	3
19	\N	21100	3
20	\N	22100	3
21	\N	21040	3
22	\N	21340	3
23	\N	22680	3
24	\N	22100	3
25	\N	21710	3
\.


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 220
-- Name: elevator_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_contract_id_seq', 1, false);


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 238
-- Name: elevator_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_delivery_id_seq', 24, true);


--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 222
-- Name: elevator_elevator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_elevator_id_seq', 2, true);


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 224
-- Name: elevator_good_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_good_id_seq', 9, true);


--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 236
-- Name: elevator_guardian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_guardian_id_seq', 1, false);


--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 234
-- Name: elevator_labanalysis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_labanalysis_id_seq', 28, true);


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 232
-- Name: elevator_labassistant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_labassistant_id_seq', 6, true);


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 230
-- Name: elevator_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_provider_id_seq', 2, true);


--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 226
-- Name: elevator_weighing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_weighing_id_seq', 3, true);


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 228
-- Name: elevator_weightcheck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tivikrat
--

SELECT pg_catalog.setval('public.elevator_weightcheck_id_seq', 25, true);


--
-- TOC entry 2845 (class 2606 OID 26130)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2850 (class 2606 OID 26057)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2853 (class 2606 OID 26020)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 26010)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 26048)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2842 (class 2606 OID 26002)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 26038)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 26072)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2855 (class 2606 OID 26028)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 26046)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 26086)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2858 (class 2606 OID 26124)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2929 (class 2606 OID 26338)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2931 (class 2606 OID 26340)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2873 (class 2606 OID 26110)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 25994)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2837 (class 2606 OID 25992)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25984)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 26330)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2877 (class 2606 OID 26142)
-- Name: elevator_contract elevator_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_contract
    ADD CONSTRAINT elevator_contract_pkey PRIMARY KEY (id);


--
-- TOC entry 2920 (class 2606 OID 26226)
-- Name: elevator_delivery elevator_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_delivery
    ADD CONSTRAINT elevator_delivery_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 26353)
-- Name: elevator_elevator elevator_elevator_name_cdcba150_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_elevator
    ADD CONSTRAINT elevator_elevator_name_cdcba150_uniq UNIQUE (name);


--
-- TOC entry 2883 (class 2606 OID 26153)
-- Name: elevator_elevator elevator_elevator_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_elevator
    ADD CONSTRAINT elevator_elevator_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 26356)
-- Name: elevator_good elevator_good_name_0ac2daaa_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_good
    ADD CONSTRAINT elevator_good_name_0ac2daaa_uniq UNIQUE (name);


--
-- TOC entry 2888 (class 2606 OID 26164)
-- Name: elevator_good elevator_good_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_good
    ADD CONSTRAINT elevator_good_pkey PRIMARY KEY (id);


--
-- TOC entry 2912 (class 2606 OID 26215)
-- Name: elevator_guardian elevator_guardian_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_guardian
    ADD CONSTRAINT elevator_guardian_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 26364)
-- Name: elevator_guardian elevator_guardian_user_id_elevator_id_f97bcfd6_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_guardian
    ADD CONSTRAINT elevator_guardian_user_id_elevator_id_f97bcfd6_uniq UNIQUE (user_id, elevator_id);


--
-- TOC entry 2909 (class 2606 OID 26207)
-- Name: elevator_labanalysis elevator_labanalysis_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_labanalysis
    ADD CONSTRAINT elevator_labanalysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 26199)
-- Name: elevator_labassistant elevator_labassistant_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_labassistant
    ADD CONSTRAINT elevator_labassistant_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 26366)
-- Name: elevator_labassistant elevator_labassistant_user_id_elevator_id_859c73c9_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_labassistant
    ADD CONSTRAINT elevator_labassistant_user_id_elevator_id_859c73c9_uniq UNIQUE (user_id, elevator_id);


--
-- TOC entry 2899 (class 2606 OID 26191)
-- Name: elevator_provider elevator_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_provider
    ADD CONSTRAINT elevator_provider_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 26172)
-- Name: elevator_weighing elevator_weighing_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_weighing
    ADD CONSTRAINT elevator_weighing_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 26368)
-- Name: elevator_weighing elevator_weighing_user_id_elevator_id_1561392c_uniq; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_weighing
    ADD CONSTRAINT elevator_weighing_user_id_elevator_id_1561392c_uniq UNIQUE (user_id, elevator_id);


--
-- TOC entry 2896 (class 2606 OID 26180)
-- Name: elevator_weightcheck elevator_weightcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_weightcheck
    ADD CONSTRAINT elevator_weightcheck_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 1259 OID 26131)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2848 (class 1259 OID 26068)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2851 (class 1259 OID 26069)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2838 (class 1259 OID 26054)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2859 (class 1259 OID 26084)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2862 (class 1259 OID 26083)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2865 (class 1259 OID 26098)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2868 (class 1259 OID 26097)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2856 (class 1259 OID 26125)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2927 (class 1259 OID 26346)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2871 (class 1259 OID 26121)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2874 (class 1259 OID 26122)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2923 (class 1259 OID 26332)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2926 (class 1259 OID 26331)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2875 (class 1259 OID 26321)
-- Name: elevator_contract_good_id_9aee5fd8; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_contract_good_id_9aee5fd8 ON public.elevator_contract USING btree (good_id);


--
-- TOC entry 2878 (class 1259 OID 26322)
-- Name: elevator_contract_provider_id_69400083; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_contract_provider_id_69400083 ON public.elevator_contract USING btree (provider_id);


--
-- TOC entry 2916 (class 1259 OID 26317)
-- Name: elevator_delivery_elevator_id_41c34e5e; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_delivery_elevator_id_41c34e5e ON public.elevator_delivery USING btree (elevator_id);


--
-- TOC entry 2917 (class 1259 OID 26318)
-- Name: elevator_delivery_guardian_id_8e070861; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_delivery_guardian_id_8e070861 ON public.elevator_delivery USING btree (guardian_id);


--
-- TOC entry 2918 (class 1259 OID 26319)
-- Name: elevator_delivery_lab_analysis_id_cc8c2264; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_delivery_lab_analysis_id_cc8c2264 ON public.elevator_delivery USING btree (lab_analysis_id);


--
-- TOC entry 2921 (class 1259 OID 26374)
-- Name: elevator_delivery_provider_id_d2034d87; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_delivery_provider_id_d2034d87 ON public.elevator_delivery USING btree (provider_id);


--
-- TOC entry 2922 (class 1259 OID 26320)
-- Name: elevator_delivery_weight_check_id_db394c88; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_delivery_weight_check_id_db394c88 ON public.elevator_delivery USING btree (weight_check_id);


--
-- TOC entry 2879 (class 1259 OID 26354)
-- Name: elevator_elevator_name_cdcba150_like; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_elevator_name_cdcba150_like ON public.elevator_elevator USING btree (name text_pattern_ops);


--
-- TOC entry 2884 (class 1259 OID 26357)
-- Name: elevator_good_name_0ac2daaa_like; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_good_name_0ac2daaa_like ON public.elevator_good USING btree (name text_pattern_ops);


--
-- TOC entry 2910 (class 1259 OID 26289)
-- Name: elevator_guardian_elevator_id_d4e0efad; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_guardian_elevator_id_d4e0efad ON public.elevator_guardian USING btree (elevator_id);


--
-- TOC entry 2913 (class 1259 OID 26290)
-- Name: elevator_guardian_user_id_b8c83e92; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_guardian_user_id_b8c83e92 ON public.elevator_guardian USING btree (user_id);


--
-- TOC entry 2907 (class 1259 OID 26278)
-- Name: elevator_labanalysis_lab_assistant_id_37aef6b4; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_labanalysis_lab_assistant_id_37aef6b4 ON public.elevator_labanalysis USING btree (lab_assistant_id);


--
-- TOC entry 2901 (class 1259 OID 26271)
-- Name: elevator_labassistant_elevator_id_d45c2640; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_labassistant_elevator_id_d45c2640 ON public.elevator_labassistant USING btree (elevator_id);


--
-- TOC entry 2904 (class 1259 OID 26272)
-- Name: elevator_labassistant_user_id_0b4d5b67; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_labassistant_user_id_0b4d5b67 ON public.elevator_labassistant USING btree (user_id);


--
-- TOC entry 2900 (class 1259 OID 26260)
-- Name: elevator_provider_user_id_dc58b387; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_provider_user_id_dc58b387 ON public.elevator_provider USING btree (user_id);


--
-- TOC entry 2889 (class 1259 OID 26247)
-- Name: elevator_weighing_elevator_id_b8299372; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_weighing_elevator_id_b8299372 ON public.elevator_weighing USING btree (elevator_id);


--
-- TOC entry 2894 (class 1259 OID 26248)
-- Name: elevator_weighing_user_id_fb02b42f; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_weighing_user_id_fb02b42f ON public.elevator_weighing USING btree (user_id);


--
-- TOC entry 2897 (class 1259 OID 26254)
-- Name: elevator_weightcheck_weighing_id_d5104d2d; Type: INDEX; Schema: public; Owner: Tivikrat
--

CREATE INDEX elevator_weightcheck_weighing_id_d5104d2d ON public.elevator_weightcheck USING btree (weighing_id);


--
-- TOC entry 2934 (class 2606 OID 26063)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2933 (class 2606 OID 26058)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2932 (class 2606 OID 26049)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2936 (class 2606 OID 26078)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2935 (class 2606 OID 26073)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2938 (class 2606 OID 26092)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2937 (class 2606 OID 26087)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2957 (class 2606 OID 26347)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2939 (class 2606 OID 26111)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2940 (class 2606 OID 26116)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2941 (class 2606 OID 26227)
-- Name: elevator_contract elevator_contract_good_id_9aee5fd8_fk_elevator_good_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_contract
    ADD CONSTRAINT elevator_contract_good_id_9aee5fd8_fk_elevator_good_id FOREIGN KEY (good_id) REFERENCES public.elevator_good(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2942 (class 2606 OID 26232)
-- Name: elevator_contract elevator_contract_provider_id_69400083_fk_elevator_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_contract
    ADD CONSTRAINT elevator_contract_provider_id_69400083_fk_elevator_provider_id FOREIGN KEY (provider_id) REFERENCES public.elevator_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2952 (class 2606 OID 26296)
-- Name: elevator_delivery elevator_delivery_elevator_id_41c34e5e_fk_elevator_elevator_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_delivery
    ADD CONSTRAINT elevator_delivery_elevator_id_41c34e5e_fk_elevator_elevator_id FOREIGN KEY (elevator_id) REFERENCES public.elevator_elevator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2954 (class 2606 OID 26375)
-- Name: elevator_delivery elevator_delivery_guardian_id_8e070861_fk_elevator_guardian_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_delivery
    ADD CONSTRAINT elevator_delivery_guardian_id_8e070861_fk_elevator_guardian_id FOREIGN KEY (guardian_id) REFERENCES public.elevator_guardian(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2955 (class 2606 OID 26390)
-- Name: elevator_delivery elevator_delivery_lab_analysis_id_cc8c2264_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_delivery
    ADD CONSTRAINT elevator_delivery_lab_analysis_id_cc8c2264_fk_elevator_ FOREIGN KEY (lab_analysis_id) REFERENCES public.elevator_labanalysis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2953 (class 2606 OID 26369)
-- Name: elevator_delivery elevator_delivery_provider_id_d2034d87_fk_elevator_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_delivery
    ADD CONSTRAINT elevator_delivery_provider_id_d2034d87_fk_elevator_provider_id FOREIGN KEY (provider_id) REFERENCES public.elevator_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2956 (class 2606 OID 26395)
-- Name: elevator_delivery elevator_delivery_weight_check_id_db394c88_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_delivery
    ADD CONSTRAINT elevator_delivery_weight_check_id_db394c88_fk_elevator_ FOREIGN KEY (weight_check_id) REFERENCES public.elevator_weightcheck(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2950 (class 2606 OID 26279)
-- Name: elevator_guardian elevator_guardian_elevator_id_d4e0efad_fk_elevator_elevator_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_guardian
    ADD CONSTRAINT elevator_guardian_elevator_id_d4e0efad_fk_elevator_elevator_id FOREIGN KEY (elevator_id) REFERENCES public.elevator_elevator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2951 (class 2606 OID 26284)
-- Name: elevator_guardian elevator_guardian_user_id_b8c83e92_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_guardian
    ADD CONSTRAINT elevator_guardian_user_id_b8c83e92_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2949 (class 2606 OID 26273)
-- Name: elevator_labanalysis elevator_labanalysis_lab_assistant_id_37aef6b4_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_labanalysis
    ADD CONSTRAINT elevator_labanalysis_lab_assistant_id_37aef6b4_fk_elevator_ FOREIGN KEY (lab_assistant_id) REFERENCES public.elevator_labassistant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2947 (class 2606 OID 26261)
-- Name: elevator_labassistant elevator_labassistan_elevator_id_d45c2640_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_labassistant
    ADD CONSTRAINT elevator_labassistan_elevator_id_d45c2640_fk_elevator_ FOREIGN KEY (elevator_id) REFERENCES public.elevator_elevator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2948 (class 2606 OID 26358)
-- Name: elevator_labassistant elevator_labassistant_user_id_0b4d5b67_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_labassistant
    ADD CONSTRAINT elevator_labassistant_user_id_0b4d5b67_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2946 (class 2606 OID 26255)
-- Name: elevator_provider elevator_provider_user_id_dc58b387_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_provider
    ADD CONSTRAINT elevator_provider_user_id_dc58b387_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2943 (class 2606 OID 26237)
-- Name: elevator_weighing elevator_weighing_elevator_id_b8299372_fk_elevator_elevator_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_weighing
    ADD CONSTRAINT elevator_weighing_elevator_id_b8299372_fk_elevator_elevator_id FOREIGN KEY (elevator_id) REFERENCES public.elevator_elevator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2944 (class 2606 OID 26242)
-- Name: elevator_weighing elevator_weighing_user_id_fb02b42f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_weighing
    ADD CONSTRAINT elevator_weighing_user_id_fb02b42f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2945 (class 2606 OID 26249)
-- Name: elevator_weightcheck elevator_weightcheck_weighing_id_d5104d2d_fk_elevator_; Type: FK CONSTRAINT; Schema: public; Owner: Tivikrat
--

ALTER TABLE ONLY public.elevator_weightcheck
    ADD CONSTRAINT elevator_weightcheck_weighing_id_d5104d2d_fk_elevator_ FOREIGN KEY (weighing_id) REFERENCES public.elevator_weighing(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-02-12 23:45:23

--
-- PostgreSQL database dump complete
--

