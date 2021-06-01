CREATE SCHEMA bienestar_medico;


ALTER SCHEMA bienestar_medico OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 53192)
-- Name: bienestar_solicitud; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bienestar_solicitud;


ALTER SCHEMA bienestar_solicitud OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 53345)
-- Name: acceso_historia_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.acceso_historia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.acceso_historia_id_seq OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 219 (class 1259 OID 53347)
-- Name: acceso_historia; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.acceso_historia (
    id integer DEFAULT nextval('bienestar_medico.acceso_historia_id_seq'::regclass) NOT NULL,
    historia_clinica_id integer NOT NULL,
    profesional_id integer NOT NULL,
    fecha_acceso timestamp with time zone DEFAULT now() NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.acceso_historia OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 53354)
-- Name: anamnesis_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.anamnesis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.anamnesis_id_seq OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 53356)
-- Name: anamnesis; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.anamnesis (
    id integer DEFAULT nextval('bienestar_medico.anamnesis_id_seq'::regclass) NOT NULL,
    historia_clinica_id integer NOT NULL,
    tratamiento text NOT NULL,
    medicamentos text NOT NULL,
    alergias text NOT NULL,
    hemorragias text NOT NULL,
    irradiaciones text NOT NULL,
    sinusitis text NOT NULL,
    enfermedad_respiratoria text NOT NULL,
    cardiopatias text NOT NULL,
    diabetes text NOT NULL,
    fiebre_reumatica text NOT NULL,
    hepatitis text NOT NULL,
    hipertension text NOT NULL,
    antecedente_familiar text NOT NULL,
    cepillado integer NOT NULL,
    seda integer NOT NULL,
    enjuague integer NOT NULL,
    dulces boolean NOT NULL,
    fuma boolean NOT NULL,
    chicle boolean NOT NULL,
    otras text,
    ultima_visita date NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.anamnesis OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 53365)
-- Name: antecedente_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.antecedente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.antecedente_id_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 53367)
-- Name: antecedente; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.antecedente (
    id integer DEFAULT nextval('bienestar_medico.antecedente_id_seq'::regclass) NOT NULL,
    historia_clinica_id integer NOT NULL,
    tipo_antecedente_id integer NOT NULL,
    observaciones text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.antecedente OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 53376)
-- Name: antecedente_psicologico_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.antecedente_psicologico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.antecedente_psicologico_id_seq OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 53378)
-- Name: antecedente_psicologico; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.antecedente_psicologico (
    id integer DEFAULT nextval('bienestar_medico.antecedente_psicologico_id_seq'::regclass) NOT NULL,
    historia_clinica_id integer NOT NULL,
    tipo_antecedente_psicologico_id integer NOT NULL,
    pasado_somatico text NOT NULL,
    actual_somatico text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.antecedente_psicologico OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 53387)
-- Name: comportamiento_consulta_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.comportamiento_consulta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.comportamiento_consulta_id_seq OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 53389)
-- Name: comportamiento_consulta; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.comportamiento_consulta (
    id integer DEFAULT nextval('bienestar_medico.comportamiento_consulta_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    problematica text NOT NULL,
    afrontamiento text NOT NULL,
    comportamiento text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.comportamiento_consulta OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 53398)
-- Name: composicion_familiar_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.composicion_familiar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.composicion_familiar_id_seq OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 53400)
-- Name: composicion_familiar; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.composicion_familiar (
    id integer DEFAULT nextval('bienestar_medico.composicion_familiar_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    observaciones text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.composicion_familiar OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 53409)
-- Name: control_placa_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.control_placa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.control_placa_id_seq OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 53411)
-- Name: control_placa; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.control_placa (
    id integer DEFAULT nextval('bienestar_medico.control_placa_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    indice_anterior integer NOT NULL,
    indice_actual integer NOT NULL,
    diagrama json NOT NULL,
    observaciones text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.control_placa OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 53420)
-- Name: convencion_odontograma_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.convencion_odontograma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.convencion_odontograma_id_seq OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 53422)
-- Name: convencion_odontograma; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.convencion_odontograma (
    id integer DEFAULT nextval('bienestar_medico.convencion_odontograma_id_seq'::regclass) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(250),
    codigo_abreviacion character varying(20),
    numero_orden numeric(5,2),
    activo boolean NOT NULL,
    imagen character varying(20) NOT NULL,
    fecha_creacion timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.convencion_odontograma OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 53428)
-- Name: datos_emergencia_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.datos_emergencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.datos_emergencia_id_seq OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 53430)
-- Name: datos_emergencia; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.datos_emergencia (
    id integer DEFAULT nextval('bienestar_medico.datos_emergencia_id_seq'::regclass) NOT NULL,
    nombre text NOT NULL,
    parentesco character varying(200) NOT NULL,
    telefono character varying(200) NOT NULL,
    direccion character varying(200) NOT NULL,
    historia_clinica_id integer NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.datos_emergencia OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 53439)
-- Name: diagnostico_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.diagnostico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.diagnostico_id_seq OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 53441)
-- Name: diagnostico; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.diagnostico (
    id integer DEFAULT nextval('bienestar_medico.diagnostico_id_seq'::regclass) NOT NULL,
    nombre character varying(500) NOT NULL,
    descripcion character varying(2000),
    codigo_abreviacion character varying(20),
    numero_orden numeric(10,2),
    activo boolean NOT NULL,
    fecha_creacion timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.diagnostico OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 53450)
-- Name: especialidad_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.especialidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.especialidad_id_seq OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 53452)
-- Name: especialidad; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.especialidad (
    id integer DEFAULT nextval('bienestar_medico.especialidad_id_seq'::regclass) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(250),
    codigo_abreviacion character varying(20),
    numero_orden numeric(5,2),
    activo boolean NOT NULL,
    interna boolean NOT NULL,
    fecha_creacion timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.especialidad OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 53458)
-- Name: examen_dental_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.examen_dental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.examen_dental_id_seq OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 53460)
-- Name: examen_dental; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.examen_dental (
    id integer DEFAULT nextval('bienestar_medico.examen_dental_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    supernumerarios text NOT NULL,
    abrasion text NOT NULL,
    manchas text NOT NULL,
    patologia_pulpar text NOT NULL,
    placa_blanda text NOT NULL,
    placa_calcificada text NOT NULL,
    oclusion text NOT NULL,
    otros text NOT NULL,
    observaciones text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.examen_dental OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 53469)
-- Name: examen_estomatologico_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.examen_estomatologico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.examen_estomatologico_id_seq OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 53471)
-- Name: examen_estomatologico; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.examen_estomatologico (
    id integer DEFAULT nextval('bienestar_medico.examen_estomatologico_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    observaciones text NOT NULL,
    articulacion_temporo text NOT NULL,
    labios text NOT NULL,
    lengua text NOT NULL,
    paladar text NOT NULL,
    piso_boca text NOT NULL,
    carrillos text NOT NULL,
    glandulas_salivares text NOT NULL,
    maxilares text NOT NULL,
    senos_maxilares text NOT NULL,
    musculos_masticadores text NOT NULL,
    sistema_nervioso text NOT NULL,
    sistema_vascular text NOT NULL,
    sistema_linfatico text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.examen_estomatologico OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 53480)
-- Name: excusa_medica_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.excusa_medica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.excusa_medica_id_seq OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 53482)
-- Name: excusa_medica; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.excusa_medica (
    id integer DEFAULT nextval('bienestar_medico.excusa_medica_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    fecha_generado timestamp with time zone NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.excusa_medica OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 53488)
-- Name: historia_clinica_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.historia_clinica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.historia_clinica_id_seq OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 53490)
-- Name: historia_clinica; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.historia_clinica (
    id integer DEFAULT nextval('bienestar_medico.historia_clinica_id_seq'::regclass) NOT NULL,
    persona_id integer NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.historia_clinica OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 53496)
-- Name: hoja_historia_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.hoja_historia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.hoja_historia_id_seq OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 53498)
-- Name: hoja_historia; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.hoja_historia (
    id integer DEFAULT nextval('bienestar_medico.hoja_historia_id_seq'::regclass) NOT NULL,
    historia_clinica_id integer NOT NULL,
    fecha_consulta timestamp with time zone NOT NULL,
    motivo text NOT NULL,
    diagnostico_id integer NOT NULL,
    observacion text NOT NULL,
    evolucion text NOT NULL,
    especialidad_id integer NOT NULL,
    profesional_id integer NOT NULL,
    datos_persona_consulta json NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.hoja_historia OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 53507)
-- Name: limites_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.limites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.limites_id_seq OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 53509)
-- Name: limites; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.limites (
    id integer DEFAULT nextval('bienestar_medico.limites_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    difusos text NOT NULL,
    claros text NOT NULL,
    rigidos text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.limites OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 53518)
-- Name: odontograma_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.odontograma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.odontograma_id_seq OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 53520)
-- Name: odontograma; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.odontograma (
    id integer DEFAULT nextval('bienestar_medico.odontograma_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    diagrama json NOT NULL,
    observaciones text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.odontograma OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 53529)
-- Name: orden_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.orden_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.orden_id_seq OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 53531)
-- Name: orden; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.orden (
    id integer DEFAULT nextval('bienestar_medico.orden_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    observaciones text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.orden OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 53540)
-- Name: persona_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.persona_id_seq OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 53542)
-- Name: persona; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.persona (
    id integer DEFAULT nextval('bienestar_medico.persona_id_seq'::regclass) NOT NULL,
    primer_nombre character varying(50) NOT NULL,
    segundo_nombre character varying(50),
    primer_apellido character varying(50) NOT NULL,
    segundo_apellido character varying(50),
    tipo_identificacion character varying(20),
    numero_identificacion character varying(50) NOT NULL,
    fecha_nacimiento date,
    genero character varying(20),
    telefono character varying(200) NOT NULL,
    correo character varying(200) NOT NULL,
    eps character varying(200) NOT NULL,
    facultad_id integer NOT NULL,
    dependencia_id integer NOT NULL,
    estamento character varying(200) NOT NULL,
    codigo_estudiantil character varying(200),
    estado_condor character varying(200)
);


ALTER TABLE bienestar_medico.persona OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 53549)
-- Name: remision_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.remision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.remision_id_seq OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 53551)
-- Name: remision; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.remision (
    id integer DEFAULT nextval('bienestar_medico.remision_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    especialidad_id integer NOT NULL,
    observaciones text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.remision OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 53560)
-- Name: signos_vitales_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.signos_vitales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.signos_vitales_id_seq OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 53562)
-- Name: signos_vitales; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.signos_vitales (
    id integer DEFAULT nextval('bienestar_medico.signos_vitales_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    temperatura numeric(5,2),
    tension_sistolica integer,
    tension_diastolica integer,
    tension_media numeric(6,2),
    estatura numeric(6,2),
    peso numeric(6,2),
    imc numeric(6,2),
    saturacion integer,
    frecuencia_cardiaca integer,
    frecuencia_respiratoria integer,
    perimetro_abdominal numeric(6,2),
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.signos_vitales OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 53568)
-- Name: tipo_antecedente; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.tipo_antecedente (
    numero_orden numeric(5,2),
    nombre character varying(50) NOT NULL,
    id integer NOT NULL,
    fecha_creacion timestamp with time zone DEFAULT now() NOT NULL,
    descripcion character varying(250),
    codigo_abreviacion character varying(20),
    activo boolean NOT NULL,
    fecha_modificacion timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.tipo_antecedente OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 53573)
-- Name: tipo_antecedente_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.tipo_antecedente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bienestar_medico.tipo_antecedente_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 263
-- Name: tipo_antecedente_id_seq; Type: SEQUENCE OWNED BY; Schema: bienestar_medico; Owner: postgres
--

ALTER SEQUENCE bienestar_medico.tipo_antecedente_id_seq OWNED BY bienestar_medico.tipo_antecedente.id;


--
-- TOC entry 264 (class 1259 OID 53575)
-- Name: tipo_antecedente_psicologico_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.tipo_antecedente_psicologico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.tipo_antecedente_psicologico_id_seq OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 53577)
-- Name: tipo_antecedente_psicologico; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.tipo_antecedente_psicologico (
    id integer DEFAULT nextval('bienestar_medico.tipo_antecedente_psicologico_id_seq'::regclass) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(250),
    codigo_abreviacion character varying(20),
    numero_orden numeric(5,2),
    activo boolean NOT NULL,
    fecha_creacion timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.tipo_antecedente_psicologico OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 53583)
-- Name: valoracion_interpersonal_id_seq; Type: SEQUENCE; Schema: bienestar_medico; Owner: postgres
--

CREATE SEQUENCE bienestar_medico.valoracion_interpersonal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE bienestar_medico.valoracion_interpersonal_id_seq OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 53585)
-- Name: valoracion_interpersonal; Type: TABLE; Schema: bienestar_medico; Owner: postgres
--

CREATE TABLE bienestar_medico.valoracion_interpersonal (
    id integer DEFAULT nextval('bienestar_medico.valoracion_interpersonal_id_seq'::regclass) NOT NULL,
    hoja_historia_id integer NOT NULL,
    autoridad text NOT NULL,
    pares text NOT NULL,
    pareja text NOT NULL,
    relaciones boolean NOT NULL,
    satisfaccion text NOT NULL,
    proteccion text NOT NULL,
    orientacion text NOT NULL,
    judiciales text NOT NULL,
    economicos text NOT NULL,
    drogas text NOT NULL,
    fecha_creacion timestamp(6) with time zone DEFAULT now() NOT NULL,
    fecha_modificacion timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE bienestar_medico.valoracion_interpersonal OWNER TO postgres;
