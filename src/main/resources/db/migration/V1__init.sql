--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-03-15 16:11:17

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
-- TOC entry 5005 (class 1262 OID 39046)
-- Name: Loja; Type: DATABASE; Schema: -; Owner: postgres
--

--CREATE DATABASE "Loja" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE "Loja_teste" OWNER TO postgres;

--\connect "Loja"

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 255 (class 1255 OID 47055)
-- Name: validachavepessoa(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validachavepessoa() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE existe integer;

BEGIN
	existe = (select count(1) from tb_pessoa_fisica where id = NEW.pessoa_id);
	if(existe <= 0) then
		existe = (select count(1) from tb_pessoa_juridica where id = NEW.pessoa_id);
	if(existe <= 0) then
		raise exception 'Não foi encontrado id ou pk da pessoa para realizar a associação';
		end if;
	end if;
RETURN new;
END;
$$;


ALTER FUNCTION public.validachavepessoa() OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 47070)
-- Name: validachavepessoa2(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validachavepessoa2() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE existe integer;

BEGIN
	existe = (select count(1) from tb_pessoa_fisica where id = NEW.pessoa_forn_id);
	if(existe <= 0) then
		existe = (select count(1) from tb_pessoa_juridica where id = NEW.pessoa_forn_id);
	if(existe <= 0) then
		raise exception 'Não foi encontrado id ou pk da pessoa para realizar a associação';
		end if;
	end if;
RETURN new;
END;
$$;


ALTER FUNCTION public.validachavepessoa2() OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 46954)
-- Name: seq_acesso; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_acesso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_acesso OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 46955)
-- Name: seq_avaliacao_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_avaliacao_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_avaliacao_produto OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 46956)
-- Name: seq_categoria_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_categoria_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_categoria_produto OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 46957)
-- Name: seq_conta_pagar; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_conta_pagar
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_conta_pagar OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 46958)
-- Name: seq_conta_receber; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_conta_receber
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_conta_receber OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 46959)
-- Name: seq_cup_desc; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_cup_desc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_cup_desc OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 46960)
-- Name: seq_endereco; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_endereco
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_endereco OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 46961)
-- Name: seq_forma_pagamento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_forma_pagamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_forma_pagamento OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 46962)
-- Name: seq_imagem_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_imagem_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_imagem_produto OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 46963)
-- Name: seq_item_venda_loja; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_item_venda_loja
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_item_venda_loja OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 46964)
-- Name: seq_marca_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_marca_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_marca_produto OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 46965)
-- Name: seq_nota_fiscal_compra; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_nota_fiscal_compra
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_nota_fiscal_compra OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 46966)
-- Name: seq_nota_fiscal_venda; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_nota_fiscal_venda
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_nota_fiscal_venda OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 46967)
-- Name: seq_nota_item_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_nota_item_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_nota_item_produto OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 46968)
-- Name: seq_pessoa; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_pessoa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_pessoa OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 46969)
-- Name: seq_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_produto OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 46970)
-- Name: seq_status_rastreio; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_status_rastreio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_status_rastreio OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 46971)
-- Name: seq_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_usuario OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 46972)
-- Name: seq_vd_cp_loja_virt; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_vd_cp_loja_virt
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_vd_cp_loja_virt OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 46818)
-- Name: tb_acesso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_acesso (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.tb_acesso OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 46823)
-- Name: tb_avaliacao_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_avaliacao_produto (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL,
    nota integer NOT NULL,
    pessoa_id bigint NOT NULL,
    produto_id bigint NOT NULL
);


ALTER TABLE public.tb_avaliacao_produto OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 46828)
-- Name: tb_categoria_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_categoria_produto (
    id bigint NOT NULL,
    nome_desc character varying(255) NOT NULL
);


ALTER TABLE public.tb_categoria_produto OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 46833)
-- Name: tb_conta_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_conta_pagar (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL,
    dt_pagemnto date,
    dt_vencimento date NOT NULL,
    status character varying(255) NOT NULL,
    valor_desconto numeric(38,2),
    valor_total numeric(38,2) NOT NULL,
    pessoa_id bigint NOT NULL,
    pessoa_forn_id bigint NOT NULL,
    CONSTRAINT tb_conta_pagar_status_check CHECK (((status)::text = ANY ((ARRAY['COBRANCA'::character varying, 'VENCIDA'::character varying, 'ABERTA'::character varying, 'QUITADA'::character varying, 'ALUGUEL'::character varying, 'FUNCIONARIO'::character varying, 'RENEGOCIADA'::character varying])::text[])))
);


ALTER TABLE public.tb_conta_pagar OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 46841)
-- Name: tb_conta_receber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_conta_receber (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL,
    dt_pagemnto date,
    dt_vencimento date NOT NULL,
    status character varying(255) NOT NULL,
    valor_desconto numeric(38,2),
    valor_total numeric(38,2) NOT NULL,
    pessoa_id bigint NOT NULL,
    CONSTRAINT tb_conta_receber_status_check CHECK (((status)::text = ANY ((ARRAY['COBRANCA'::character varying, 'VENCIDA'::character varying, 'ABERTA'::character varying, 'QUITADA'::character varying])::text[])))
);


ALTER TABLE public.tb_conta_receber OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 46849)
-- Name: tb_cup_desc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_cup_desc (
    id bigint NOT NULL,
    cod_desc character varying(255) NOT NULL,
    data_validade_cupom date NOT NULL,
    valor_porcent_desc numeric(38,2),
    valor_real_desc numeric(38,2)
);


ALTER TABLE public.tb_cup_desc OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 46854)
-- Name: tb_endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_endereco (
    id bigint NOT NULL,
    bairro character varying(255) NOT NULL,
    cep character varying(255) NOT NULL,
    cidade character varying(255) NOT NULL,
    complemento character varying(255),
    numero character varying(255) NOT NULL,
    rua character varying(255) NOT NULL,
    tipo_endereco character varying(255) NOT NULL,
    uf character varying(255) NOT NULL,
    pessoa_id bigint NOT NULL,
    CONSTRAINT tb_endereco_tipo_endereco_check CHECK (((tipo_endereco)::text = ANY ((ARRAY['COBRANCA'::character varying, 'ENTREGA'::character varying])::text[])))
);


ALTER TABLE public.tb_endereco OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 46862)
-- Name: tb_forma_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_forma_pagamento (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.tb_forma_pagamento OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 46867)
-- Name: tb_imagem_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_imagem_produto (
    id bigint NOT NULL,
    imagem_miniatura text NOT NULL,
    imagem_original text NOT NULL,
    produto_id bigint NOT NULL
);


ALTER TABLE public.tb_imagem_produto OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 46874)
-- Name: tb_item_venda_loja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_item_venda_loja (
    id bigint NOT NULL,
    quantidade double precision NOT NULL,
    produto_id bigint NOT NULL,
    vd_cp_loja_virt_id bigint NOT NULL
);


ALTER TABLE public.tb_item_venda_loja OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 46879)
-- Name: tb_marca_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_marca_produto (
    id bigint NOT NULL,
    nome_desc character varying(255) NOT NULL
);


ALTER TABLE public.tb_marca_produto OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 46884)
-- Name: tb_nota_fiscal_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_nota_fiscal_compra (
    id bigint NOT NULL,
    descricao_obs character varying(255),
    dt_compra date NOT NULL,
    numero_nota character varying(255) NOT NULL,
    serie_nota character varying(255) NOT NULL,
    valor_desconto numeric(38,2),
    valor_icms numeric(38,2) NOT NULL,
    valor_total numeric(38,2) NOT NULL,
    conta_pagar_id bigint NOT NULL,
    pessoa_id bigint NOT NULL
);


ALTER TABLE public.tb_nota_fiscal_compra OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 46891)
-- Name: tb_nota_fiscal_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_nota_fiscal_venda (
    id bigint NOT NULL,
    numero character varying(255) NOT NULL,
    pdf text NOT NULL,
    serie character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    xml text NOT NULL,
    venda_compra_loja_vir_id bigint NOT NULL
);


ALTER TABLE public.tb_nota_fiscal_venda OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 46898)
-- Name: tb_nota_item_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_nota_item_produto (
    id bigint NOT NULL,
    quantidade double precision NOT NULL,
    nota_fiscal_compra_id bigint NOT NULL,
    produto_id bigint NOT NULL
);


ALTER TABLE public.tb_nota_item_produto OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 46903)
-- Name: tb_pessoa_fisica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_pessoa_fisica (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    telefone character varying(255) NOT NULL,
    cpf character varying(255) NOT NULL,
    dt_nacimento date NOT NULL
);


ALTER TABLE public.tb_pessoa_fisica OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 46910)
-- Name: tb_pessoa_juridica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_pessoa_juridica (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    telefone character varying(255) NOT NULL,
    categoria character varying(255),
    cnpj character varying(255) NOT NULL,
    insc_estadual character varying(255) NOT NULL,
    insc_municipal character varying(255),
    nome_fantasia character varying(255) NOT NULL,
    razao_social character varying(255) NOT NULL
);


ALTER TABLE public.tb_pessoa_juridica OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 46917)
-- Name: tb_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_produto (
    id bigint NOT NULL,
    alerta_qtd_estoque boolean,
    altura double precision NOT NULL,
    ativo boolean NOT NULL,
    descricao text NOT NULL,
    largura double precision NOT NULL,
    link_youtube character varying(255),
    nome character varying(255) NOT NULL,
    peso double precision NOT NULL,
    profundidade double precision NOT NULL,
    qtd_alerta_estoque integer,
    qtd_clique integer,
    qtd_estoque integer NOT NULL,
    tipo_unidade character varying(255) NOT NULL,
    valor_venda numeric(38,2) NOT NULL
);


ALTER TABLE public.tb_produto OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 46924)
-- Name: tb_status_rastreio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_status_rastreio (
    id bigint NOT NULL,
    centro_destribuicao character varying(255),
    cidade character varying(255),
    estado character varying(255),
    status character varying(255),
    venda_compra_loja_vir_id bigint NOT NULL
);


ALTER TABLE public.tb_status_rastreio OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 46931)
-- Name: tb_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuario (
    id bigint NOT NULL,
    dt_atual_senha date NOT NULL,
    login character varying(255) NOT NULL,
    senha character varying(255) NOT NULL,
    pessoa_id bigint NOT NULL
);


ALTER TABLE public.tb_usuario OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 46938)
-- Name: tb_usuario_acesso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuario_acesso (
    usuario_id bigint NOT NULL,
    acesso_id bigint NOT NULL
);


ALTER TABLE public.tb_usuario_acesso OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 46941)
-- Name: tb_vd_cp_loja_virt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_vd_cp_loja_virt (
    id bigint NOT NULL,
    dia_entrega integer NOT NULL,
    dt_entrega date NOT NULL,
    dt_venda date NOT NULL,
    valor_desconto numeric(38,2),
    valor_frete numeric(38,2) NOT NULL,
    valor_total numeric(38,2) NOT NULL,
    cupom_desc_id bigint,
    endereco_cobranca_id bigint NOT NULL,
    endereco_entrega_id bigint NOT NULL,
    forma_pagamento_id bigint NOT NULL,
    nota_fiscal_venda_id bigint NOT NULL,
    pessoa_id bigint NOT NULL
);


ALTER TABLE public.tb_vd_cp_loja_virt OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 46818)
-- Dependencies: 215
-- Data for Name: tb_acesso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4961 (class 0 OID 46823)
-- Dependencies: 216
-- Data for Name: tb_avaliacao_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4962 (class 0 OID 46828)
-- Dependencies: 217
-- Data for Name: tb_categoria_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4963 (class 0 OID 46833)
-- Dependencies: 218
-- Data for Name: tb_conta_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4964 (class 0 OID 46841)
-- Dependencies: 219
-- Data for Name: tb_conta_receber; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4965 (class 0 OID 46849)
-- Dependencies: 220
-- Data for Name: tb_cup_desc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4966 (class 0 OID 46854)
-- Dependencies: 221
-- Data for Name: tb_endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4967 (class 0 OID 46862)
-- Dependencies: 222
-- Data for Name: tb_forma_pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4968 (class 0 OID 46867)
-- Dependencies: 223
-- Data for Name: tb_imagem_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4969 (class 0 OID 46874)
-- Dependencies: 224
-- Data for Name: tb_item_venda_loja; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4970 (class 0 OID 46879)
-- Dependencies: 225
-- Data for Name: tb_marca_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4971 (class 0 OID 46884)
-- Dependencies: 226
-- Data for Name: tb_nota_fiscal_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4972 (class 0 OID 46891)
-- Dependencies: 227
-- Data for Name: tb_nota_fiscal_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4973 (class 0 OID 46898)
-- Dependencies: 228
-- Data for Name: tb_nota_item_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4974 (class 0 OID 46903)
-- Dependencies: 229
-- Data for Name: tb_pessoa_fisica; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4975 (class 0 OID 46910)
-- Dependencies: 230
-- Data for Name: tb_pessoa_juridica; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4976 (class 0 OID 46917)
-- Dependencies: 231
-- Data for Name: tb_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4977 (class 0 OID 46924)
-- Dependencies: 232
-- Data for Name: tb_status_rastreio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4978 (class 0 OID 46931)
-- Dependencies: 233
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4979 (class 0 OID 46938)
-- Dependencies: 234
-- Data for Name: tb_usuario_acesso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4980 (class 0 OID 46941)
-- Dependencies: 235
-- Data for Name: tb_vd_cp_loja_virt; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 236
-- Name: seq_acesso; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_acesso', 1, false);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 237
-- Name: seq_avaliacao_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_avaliacao_produto', 1, false);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 238
-- Name: seq_categoria_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_categoria_produto', 1, false);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 239
-- Name: seq_conta_pagar; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_conta_pagar', 1, false);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 240
-- Name: seq_conta_receber; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_conta_receber', 1, false);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 241
-- Name: seq_cup_desc; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_cup_desc', 1, false);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 242
-- Name: seq_endereco; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_endereco', 1, false);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 243
-- Name: seq_forma_pagamento; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_forma_pagamento', 1, false);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 244
-- Name: seq_imagem_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_imagem_produto', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 245
-- Name: seq_item_venda_loja; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_item_venda_loja', 1, false);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 246
-- Name: seq_marca_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_marca_produto', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 247
-- Name: seq_nota_fiscal_compra; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_nota_fiscal_compra', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 248
-- Name: seq_nota_fiscal_venda; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_nota_fiscal_venda', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 249
-- Name: seq_nota_item_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_nota_item_produto', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 250
-- Name: seq_pessoa; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_pessoa', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 251
-- Name: seq_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_produto', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 252
-- Name: seq_status_rastreio; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_status_rastreio', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 253
-- Name: seq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_usuario', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 254
-- Name: seq_vd_cp_loja_virt; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_vd_cp_loja_virt', 1, false);


--
-- TOC entry 4738 (class 2606 OID 46822)
-- Name: tb_acesso tb_acesso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_acesso
    ADD CONSTRAINT tb_acesso_pkey PRIMARY KEY (id);


--
-- TOC entry 4740 (class 2606 OID 46827)
-- Name: tb_avaliacao_produto tb_avaliacao_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_avaliacao_produto
    ADD CONSTRAINT tb_avaliacao_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 46832)
-- Name: tb_categoria_produto tb_categoria_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_categoria_produto
    ADD CONSTRAINT tb_categoria_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4744 (class 2606 OID 46840)
-- Name: tb_conta_pagar tb_conta_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_conta_pagar
    ADD CONSTRAINT tb_conta_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 4746 (class 2606 OID 46848)
-- Name: tb_conta_receber tb_conta_receber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_conta_receber
    ADD CONSTRAINT tb_conta_receber_pkey PRIMARY KEY (id);


--
-- TOC entry 4748 (class 2606 OID 46853)
-- Name: tb_cup_desc tb_cup_desc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_cup_desc
    ADD CONSTRAINT tb_cup_desc_pkey PRIMARY KEY (id);


--
-- TOC entry 4750 (class 2606 OID 46861)
-- Name: tb_endereco tb_endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_endereco
    ADD CONSTRAINT tb_endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 46866)
-- Name: tb_forma_pagamento tb_forma_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_forma_pagamento
    ADD CONSTRAINT tb_forma_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 4754 (class 2606 OID 46873)
-- Name: tb_imagem_produto tb_imagem_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_imagem_produto
    ADD CONSTRAINT tb_imagem_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4756 (class 2606 OID 46878)
-- Name: tb_item_venda_loja tb_item_venda_loja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_item_venda_loja
    ADD CONSTRAINT tb_item_venda_loja_pkey PRIMARY KEY (id);


--
-- TOC entry 4758 (class 2606 OID 46883)
-- Name: tb_marca_produto tb_marca_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_marca_produto
    ADD CONSTRAINT tb_marca_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4760 (class 2606 OID 46890)
-- Name: tb_nota_fiscal_compra tb_nota_fiscal_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_compra
    ADD CONSTRAINT tb_nota_fiscal_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 4762 (class 2606 OID 46897)
-- Name: tb_nota_fiscal_venda tb_nota_fiscal_venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_venda
    ADD CONSTRAINT tb_nota_fiscal_venda_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 46902)
-- Name: tb_nota_item_produto tb_nota_item_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_item_produto
    ADD CONSTRAINT tb_nota_item_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 46909)
-- Name: tb_pessoa_fisica tb_pessoa_fisica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_pessoa_fisica
    ADD CONSTRAINT tb_pessoa_fisica_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 46916)
-- Name: tb_pessoa_juridica tb_pessoa_juridica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_pessoa_juridica
    ADD CONSTRAINT tb_pessoa_juridica_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 46923)
-- Name: tb_produto tb_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_produto
    ADD CONSTRAINT tb_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 46930)
-- Name: tb_status_rastreio tb_status_rastreio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_status_rastreio
    ADD CONSTRAINT tb_status_rastreio_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 46937)
-- Name: tb_usuario tb_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 46945)
-- Name: tb_vd_cp_loja_virt tb_vd_cp_loja_virt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT tb_vd_cp_loja_virt_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 46953)
-- Name: tb_vd_cp_loja_virt uk_44dmdjcdoj4few4sapi741mpe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT uk_44dmdjcdoj4few4sapi741mpe UNIQUE (nota_fiscal_venda_id);


--
-- TOC entry 4778 (class 2606 OID 46951)
-- Name: tb_usuario_acesso uk_51533qf8075g59l675rjfuf3s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario_acesso
    ADD CONSTRAINT uk_51533qf8075g59l675rjfuf3s UNIQUE (acesso_id);


--
-- TOC entry 4764 (class 2606 OID 46947)
-- Name: tb_nota_fiscal_venda uk_637whwqchwwe2owth1thl4ue6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_venda
    ADD CONSTRAINT uk_637whwqchwwe2owth1thl4ue6 UNIQUE (venda_compra_loja_vir_id);


--
-- TOC entry 4780 (class 2606 OID 46949)
-- Name: tb_usuario_acesso unique_acesso_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario_acesso
    ADD CONSTRAINT unique_acesso_user UNIQUE (usuario_id, acesso_id);


--
-- TOC entry 4801 (class 2620 OID 47056)
-- Name: tb_avaliacao_produto validachavepessoaavaliaçãoproduto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validachavepessoaavaliaçãoproduto" BEFORE UPDATE ON public.tb_avaliacao_produto FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4802 (class 2620 OID 47057)
-- Name: tb_avaliacao_produto validachavepessoaavaliaçãoproduto2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validachavepessoaavaliaçãoproduto2" BEFORE INSERT ON public.tb_avaliacao_produto FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4803 (class 2620 OID 47058)
-- Name: tb_conta_pagar validachavepessoacontapagar; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoacontapagar BEFORE UPDATE ON public.tb_conta_pagar FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4804 (class 2620 OID 47059)
-- Name: tb_conta_pagar validachavepessoacontapagar2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoacontapagar2 BEFORE INSERT ON public.tb_conta_pagar FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4805 (class 2620 OID 47071)
-- Name: tb_conta_pagar validachavepessoacontapagarpessoafornid; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoacontapagarpessoafornid BEFORE UPDATE ON public.tb_conta_pagar FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa2();


--
-- TOC entry 4806 (class 2620 OID 47072)
-- Name: tb_conta_pagar validachavepessoacontapagarpessoafornid2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoacontapagarpessoafornid2 BEFORE INSERT ON public.tb_conta_pagar FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa2();


--
-- TOC entry 4807 (class 2620 OID 47060)
-- Name: tb_conta_receber validachavepessoacontareceber; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoacontareceber BEFORE UPDATE ON public.tb_conta_receber FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4808 (class 2620 OID 47061)
-- Name: tb_conta_receber validachavepessoacontareceber2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoacontareceber2 BEFORE INSERT ON public.tb_conta_receber FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4809 (class 2620 OID 47062)
-- Name: tb_endereco validachavepessoaendereco; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoaendereco BEFORE UPDATE ON public.tb_endereco FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4810 (class 2620 OID 47063)
-- Name: tb_endereco validachavepessoaendereco2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoaendereco2 BEFORE INSERT ON public.tb_endereco FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4811 (class 2620 OID 47064)
-- Name: tb_nota_fiscal_compra validachavepessoanotafiscalcompra; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoanotafiscalcompra BEFORE UPDATE ON public.tb_nota_fiscal_compra FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4812 (class 2620 OID 47065)
-- Name: tb_nota_fiscal_compra validachavepessoanotafiscalcompra2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoanotafiscalcompra2 BEFORE INSERT ON public.tb_nota_fiscal_compra FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4813 (class 2620 OID 47066)
-- Name: tb_usuario validachavepessoausuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoausuario BEFORE UPDATE ON public.tb_usuario FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4814 (class 2620 OID 47067)
-- Name: tb_usuario validachavepessoausuario2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoausuario2 BEFORE INSERT ON public.tb_usuario FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4815 (class 2620 OID 47068)
-- Name: tb_vd_cp_loja_virt validachavepessoavendacompralojavirtual; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoavendacompralojavirtual BEFORE UPDATE ON public.tb_vd_cp_loja_virt FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4816 (class 2620 OID 47069)
-- Name: tb_vd_cp_loja_virt validachavepessoavendacompralojavirtual2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validachavepessoavendacompralojavirtual2 BEFORE INSERT ON public.tb_vd_cp_loja_virt FOR EACH ROW EXECUTE FUNCTION public.validachavepessoa();


--
-- TOC entry 4794 (class 2606 OID 47018)
-- Name: tb_usuario_acesso acesso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario_acesso
    ADD CONSTRAINT acesso_fk FOREIGN KEY (acesso_id) REFERENCES public.tb_acesso(id);


--
-- TOC entry 4789 (class 2606 OID 46993)
-- Name: tb_nota_fiscal_compra conta_pagar_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_compra
    ADD CONSTRAINT conta_pagar_fk FOREIGN KEY (conta_pagar_id) REFERENCES public.tb_conta_pagar(id);


--
-- TOC entry 4796 (class 2606 OID 47028)
-- Name: tb_vd_cp_loja_virt cupom_desc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT cupom_desc_fk FOREIGN KEY (cupom_desc_id) REFERENCES public.tb_cup_desc(id);


--
-- TOC entry 4797 (class 2606 OID 47033)
-- Name: tb_vd_cp_loja_virt endereco_cobranca_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT endereco_cobranca_fk FOREIGN KEY (endereco_cobranca_id) REFERENCES public.tb_endereco(id);


--
-- TOC entry 4798 (class 2606 OID 47038)
-- Name: tb_vd_cp_loja_virt endereco_entrega_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT endereco_entrega_fk FOREIGN KEY (endereco_entrega_id) REFERENCES public.tb_endereco(id);


--
-- TOC entry 4799 (class 2606 OID 47043)
-- Name: tb_vd_cp_loja_virt forma_pagamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT forma_pagamento_fk FOREIGN KEY (forma_pagamento_id) REFERENCES public.tb_forma_pagamento(id);


--
-- TOC entry 4791 (class 2606 OID 47003)
-- Name: tb_nota_item_produto nota_fiscal_compra_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_item_produto
    ADD CONSTRAINT nota_fiscal_compra_fk FOREIGN KEY (nota_fiscal_compra_id) REFERENCES public.tb_nota_fiscal_compra(id);


--
-- TOC entry 4800 (class 2606 OID 47048)
-- Name: tb_vd_cp_loja_virt nota_fiscal_venda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vd_cp_loja_virt
    ADD CONSTRAINT nota_fiscal_venda_fk FOREIGN KEY (nota_fiscal_venda_id) REFERENCES public.tb_nota_fiscal_venda(id);


--
-- TOC entry 4785 (class 2606 OID 46973)
-- Name: tb_avaliacao_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_avaliacao_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.tb_produto(id);


--
-- TOC entry 4786 (class 2606 OID 46978)
-- Name: tb_imagem_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_imagem_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.tb_produto(id);


--
-- TOC entry 4787 (class 2606 OID 46983)
-- Name: tb_item_venda_loja produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_item_venda_loja
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.tb_produto(id);


--
-- TOC entry 4792 (class 2606 OID 47008)
-- Name: tb_nota_item_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_item_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.tb_produto(id);


--
-- TOC entry 4795 (class 2606 OID 47023)
-- Name: tb_usuario_acesso usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario_acesso
    ADD CONSTRAINT usuario_fk FOREIGN KEY (usuario_id) REFERENCES public.tb_usuario(id);


--
-- TOC entry 4788 (class 2606 OID 46988)
-- Name: tb_item_venda_loja vd_cp_loja_virt_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_item_venda_loja
    ADD CONSTRAINT vd_cp_loja_virt_fk FOREIGN KEY (vd_cp_loja_virt_id) REFERENCES public.tb_vd_cp_loja_virt(id);


--
-- TOC entry 4790 (class 2606 OID 46998)
-- Name: tb_nota_fiscal_venda venda_compra_loja_vir_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_nota_fiscal_venda
    ADD CONSTRAINT venda_compra_loja_vir_fk FOREIGN KEY (venda_compra_loja_vir_id) REFERENCES public.tb_vd_cp_loja_virt(id);


--
-- TOC entry 4793 (class 2606 OID 47013)
-- Name: tb_status_rastreio venda_compra_loja_vir_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_status_rastreio
    ADD CONSTRAINT venda_compra_loja_vir_fk FOREIGN KEY (venda_compra_loja_vir_id) REFERENCES public.tb_vd_cp_loja_virt(id);


-- Completed on 2024-03-15 16:11:18

--
-- PostgreSQL database dump complete
--

