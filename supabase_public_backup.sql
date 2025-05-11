--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: enum__pages_v_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


--
-- Name: enum__pages_v_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_archive_relation_to AS ENUM (
    'products'
);


--
-- Name: enum__pages_v_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


--
-- Name: enum__pages_v_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum__pages_v_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


--
-- Name: enum__pages_v_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_appearance AS ENUM (
    'primary',
    'secondary'
);


--
-- Name: enum__pages_v_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum__pages_v_blocks_media_block_position; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_media_block_position AS ENUM (
    'default',
    'fullscreen'
);


--
-- Name: enum__pages_v_version_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


--
-- Name: enum__pages_v_version_hero_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum__pages_v_version_hero_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_version_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact',
    'customHero'
);


--
-- Name: enum__pages_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_version_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum__products_v_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


--
-- Name: enum__products_v_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_blocks_archive_relation_to AS ENUM (
    'products'
);


--
-- Name: enum__products_v_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


--
-- Name: enum__products_v_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum__products_v_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


--
-- Name: enum__products_v_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_blocks_cta_links_link_appearance AS ENUM (
    'primary',
    'secondary'
);


--
-- Name: enum__products_v_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum__products_v_blocks_media_block_position; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_blocks_media_block_position AS ENUM (
    'default',
    'fullscreen'
);


--
-- Name: enum__products_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__products_v_version_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_footer_nav_items_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_footer_nav_items_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_header_nav_items_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_header_nav_items_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_pages_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


--
-- Name: enum_pages_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_archive_relation_to AS ENUM (
    'products'
);


--
-- Name: enum_pages_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


--
-- Name: enum_pages_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_pages_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


--
-- Name: enum_pages_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_appearance AS ENUM (
    'primary',
    'secondary'
);


--
-- Name: enum_pages_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_pages_blocks_media_block_position; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_media_block_position AS ENUM (
    'default',
    'fullscreen'
);


--
-- Name: enum_pages_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_hero_links_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


--
-- Name: enum_pages_hero_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_pages_hero_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact',
    'customHero'
);


--
-- Name: enum_pages_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_products_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


--
-- Name: enum_products_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_blocks_archive_relation_to AS ENUM (
    'products'
);


--
-- Name: enum_products_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


--
-- Name: enum_products_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_products_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


--
-- Name: enum_products_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_blocks_cta_links_link_appearance AS ENUM (
    'primary',
    'secondary'
);


--
-- Name: enum_products_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_products_blocks_media_block_position; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_blocks_media_block_position AS ENUM (
    'default',
    'fullscreen'
);


--
-- Name: enum_products_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_products_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_redirects_to_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_redirects_to_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_users_roles; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_users_roles AS ENUM (
    'admin',
    'customer'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _pages_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v (
    id integer NOT NULL,
    version_title character varying,
    version_published_on timestamp(3) with time zone,
    version_hero_type public.enum__pages_v_version_hero_type,
    version_hero_rich_text jsonb,
    version_slug character varying,
    version_meta_title character varying,
    version_meta_description character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__pages_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean
);


--
-- Name: _pages_v_blocks_archive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    intro_content jsonb,
    "populateBy" public.enum__pages_v_blocks_archive_populate_by,
    "relationTo" public.enum__pages_v_blocks_archive_relation_to,
    "limit" numeric,
    populated_docs_total numeric,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_archive_id_seq OWNED BY public._pages_v_blocks_archive.id;


--
-- Name: _pages_v_blocks_content; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    invert_background boolean,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _pages_v_blocks_content_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    size public.enum__pages_v_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum__pages_v_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_blocks_content_columns_link_appearance,
    _uuid character varying
);


--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_content_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_content_columns_id_seq OWNED BY public._pages_v_blocks_content_columns.id;


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_content_id_seq OWNED BY public._pages_v_blocks_content.id;


--
-- Name: _pages_v_blocks_cta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    invert_background boolean,
    rich_text jsonb,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_cta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_cta_id_seq OWNED BY public._pages_v_blocks_cta.id;


--
-- Name: _pages_v_blocks_cta_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__pages_v_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_blocks_cta_links_link_appearance,
    _uuid character varying
);


--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_cta_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_cta_links_id_seq OWNED BY public._pages_v_blocks_cta_links.id;


--
-- Name: _pages_v_blocks_media_block; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    invert_background boolean,
    "position" public.enum__pages_v_blocks_media_block_position,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_media_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_media_block_id_seq OWNED BY public._pages_v_blocks_media_block.id;


--
-- Name: _pages_v_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_id_seq OWNED BY public._pages_v.id;


--
-- Name: _pages_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    media_id integer,
    categories_id integer,
    products_id integer
);


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_rels_id_seq OWNED BY public._pages_v_rels.id;


--
-- Name: _pages_v_version_hero_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_version_hero_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__pages_v_version_hero_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_version_hero_links_link_appearance,
    _uuid character varying
);


--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_version_hero_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_version_hero_links_id_seq OWNED BY public._pages_v_version_hero_links.id;


--
-- Name: _products_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._products_v (
    id integer NOT NULL,
    version_title character varying,
    version_published_on timestamp(3) with time zone,
    version_stripe_product_i_d character varying,
    version_price_j_s_o_n character varying,
    version_enable_paywall boolean,
    version_slug character varying,
    version_skip_sync boolean,
    version_meta_title character varying,
    version_meta_description character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__products_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean
);


--
-- Name: _products_v_blocks_archive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._products_v_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    intro_content jsonb,
    "populateBy" public.enum__products_v_blocks_archive_populate_by,
    "relationTo" public.enum__products_v_blocks_archive_relation_to,
    "limit" numeric,
    populated_docs_total numeric,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _products_v_blocks_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._products_v_blocks_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _products_v_blocks_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._products_v_blocks_archive_id_seq OWNED BY public._products_v_blocks_archive.id;


--
-- Name: _products_v_blocks_content; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._products_v_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    invert_background boolean,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _products_v_blocks_content_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._products_v_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    size public.enum__products_v_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum__products_v_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__products_v_blocks_content_columns_link_appearance,
    _uuid character varying
);


--
-- Name: _products_v_blocks_content_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._products_v_blocks_content_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _products_v_blocks_content_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._products_v_blocks_content_columns_id_seq OWNED BY public._products_v_blocks_content_columns.id;


--
-- Name: _products_v_blocks_content_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._products_v_blocks_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _products_v_blocks_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._products_v_blocks_content_id_seq OWNED BY public._products_v_blocks_content.id;


--
-- Name: _products_v_blocks_cta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._products_v_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    invert_background boolean,
    rich_text jsonb,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _products_v_blocks_cta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._products_v_blocks_cta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _products_v_blocks_cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._products_v_blocks_cta_id_seq OWNED BY public._products_v_blocks_cta.id;


--
-- Name: _products_v_blocks_cta_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._products_v_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__products_v_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__products_v_blocks_cta_links_link_appearance,
    _uuid character varying
);


--
-- Name: _products_v_blocks_cta_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._products_v_blocks_cta_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _products_v_blocks_cta_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._products_v_blocks_cta_links_id_seq OWNED BY public._products_v_blocks_cta_links.id;


--
-- Name: _products_v_blocks_media_block; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._products_v_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    invert_background boolean,
    "position" public.enum__products_v_blocks_media_block_position,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _products_v_blocks_media_block_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._products_v_blocks_media_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _products_v_blocks_media_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._products_v_blocks_media_block_id_seq OWNED BY public._products_v_blocks_media_block.id;


--
-- Name: _products_v_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._products_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _products_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._products_v_id_seq OWNED BY public._products_v.id;


--
-- Name: _products_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._products_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    products_id integer,
    pages_id integer,
    media_id integer,
    categories_id integer
);


--
-- Name: _products_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._products_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _products_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._products_v_rels_id_seq OWNED BY public._products_v_rels.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: categories_breadcrumbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories_breadcrumbs (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    url character varying,
    label character varying
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    media_id integer,
    categories_id integer
);


--
-- Name: categories_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_rels_id_seq OWNED BY public.categories_rels.id;


--
-- Name: footer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.footer (
    id integer NOT NULL,
    copyright character varying,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


--
-- Name: footer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.footer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.footer_id_seq OWNED BY public.footer.id;


--
-- Name: footer_nav_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.footer_nav_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_footer_nav_items_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying NOT NULL
);


--
-- Name: footer_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.footer_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    media_id integer
);


--
-- Name: footer_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.footer_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: footer_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.footer_rels_id_seq OWNED BY public.footer_rels.id;


--
-- Name: header; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.header (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


--
-- Name: header_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.header_id_seq OWNED BY public.header.id;


--
-- Name: header_nav_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.header_nav_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_header_nav_items_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying NOT NULL
);


--
-- Name: header_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.header_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    media_id integer
);


--
-- Name: header_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.header_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.header_rels_id_seq OWNED BY public.header_rels.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.media (
    id integer NOT NULL,
    alt character varying NOT NULL,
    caption jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric
);


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    stripe_payment_intent_i_d character varying,
    total numeric NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    price numeric,
    quantity numeric
);


--
-- Name: orders_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer,
    products_id integer
);


--
-- Name: orders_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_rels_id_seq OWNED BY public.orders_rels.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying,
    published_on timestamp(3) with time zone,
    hero_type public.enum_pages_hero_type,
    hero_rich_text jsonb,
    slug character varying,
    meta_title character varying,
    meta_description character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_pages_status
);


--
-- Name: pages_blocks_archive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    intro_content jsonb,
    "populateBy" public.enum_pages_blocks_archive_populate_by,
    "relationTo" public.enum_pages_blocks_archive_relation_to,
    "limit" numeric,
    populated_docs_total numeric,
    block_name character varying
);


--
-- Name: pages_blocks_content; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    invert_background boolean,
    block_name character varying
);


--
-- Name: pages_blocks_content_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    size public.enum_pages_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum_pages_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_blocks_content_columns_link_appearance
);


--
-- Name: pages_blocks_cta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    invert_background boolean,
    rich_text jsonb,
    block_name character varying
);


--
-- Name: pages_blocks_cta_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_pages_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_blocks_cta_links_link_appearance
);


--
-- Name: pages_blocks_media_block; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    invert_background boolean,
    "position" public.enum_pages_blocks_media_block_position,
    block_name character varying
);


--
-- Name: pages_hero_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_hero_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_pages_hero_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_hero_links_link_appearance
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    media_id integer,
    categories_id integer,
    products_id integer
);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_rels_id_seq OWNED BY public.pages_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    title character varying,
    published_on timestamp(3) with time zone,
    stripe_product_i_d character varying,
    price_j_s_o_n character varying,
    enable_paywall boolean,
    slug character varying,
    skip_sync boolean,
    meta_title character varying,
    meta_description character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_products_status
);


--
-- Name: products_blocks_archive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    intro_content jsonb,
    "populateBy" public.enum_products_blocks_archive_populate_by,
    "relationTo" public.enum_products_blocks_archive_relation_to,
    "limit" numeric,
    populated_docs_total numeric,
    block_name character varying
);


--
-- Name: products_blocks_content; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    invert_background boolean,
    block_name character varying
);


--
-- Name: products_blocks_content_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    size public.enum_products_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum_products_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_products_blocks_content_columns_link_appearance
);


--
-- Name: products_blocks_cta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    invert_background boolean,
    rich_text jsonb,
    block_name character varying
);


--
-- Name: products_blocks_cta_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_products_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_products_blocks_cta_links_link_appearance
);


--
-- Name: products_blocks_media_block; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    invert_background boolean,
    "position" public.enum_products_blocks_media_block_position,
    block_name character varying
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    media_id integer,
    categories_id integer,
    products_id integer
);


--
-- Name: products_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_rels_id_seq OWNED BY public.products_rels.id;


--
-- Name: redirects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.redirects (
    id integer NOT NULL,
    "from" character varying NOT NULL,
    to_type public.enum_redirects_to_type,
    to_url character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.redirects_id_seq OWNED BY public.redirects.id;


--
-- Name: redirects_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.redirects_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    products_id integer
);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.redirects_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.redirects_rels_id_seq OWNED BY public.redirects_rels.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: settings_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer
);


--
-- Name: settings_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.settings_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.settings_rels_id_seq OWNED BY public.settings_rels.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    stripe_customer_i_d character varying,
    skip_sync boolean,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric,
    lock_until timestamp(3) with time zone
);


--
-- Name: users_cart_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_cart_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    quantity numeric
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    products_id integer
);


--
-- Name: users_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_rels_id_seq OWNED BY public.users_rels.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_roles (
    "order" integer NOT NULL,
    parent_id integer NOT NULL,
    value public.enum_users_roles,
    id integer NOT NULL
);


--
-- Name: users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_roles_id_seq OWNED BY public.users_roles.id;


--
-- Name: _pages_v id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v ALTER COLUMN id SET DEFAULT nextval('public._pages_v_id_seq'::regclass);


--
-- Name: _pages_v_blocks_archive id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_archive ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_archive_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content_columns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_columns_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_links_id_seq'::regclass);


--
-- Name: _pages_v_blocks_media_block id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_media_block ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_media_block_id_seq'::regclass);


--
-- Name: _pages_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels ALTER COLUMN id SET DEFAULT nextval('public._pages_v_rels_id_seq'::regclass);


--
-- Name: _pages_v_version_hero_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_version_hero_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_hero_links_id_seq'::regclass);


--
-- Name: _products_v id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v ALTER COLUMN id SET DEFAULT nextval('public._products_v_id_seq'::regclass);


--
-- Name: _products_v_blocks_archive id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_archive ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_archive_id_seq'::regclass);


--
-- Name: _products_v_blocks_content id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_content ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_content_id_seq'::regclass);


--
-- Name: _products_v_blocks_content_columns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_content_columns ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_content_columns_id_seq'::regclass);


--
-- Name: _products_v_blocks_cta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_cta ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_cta_id_seq'::regclass);


--
-- Name: _products_v_blocks_cta_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_cta_links ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_cta_links_id_seq'::regclass);


--
-- Name: _products_v_blocks_media_block id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_media_block ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_media_block_id_seq'::regclass);


--
-- Name: _products_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_rels ALTER COLUMN id SET DEFAULT nextval('public._products_v_rels_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categories_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_rels ALTER COLUMN id SET DEFAULT nextval('public.categories_rels_id_seq'::regclass);


--
-- Name: footer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer ALTER COLUMN id SET DEFAULT nextval('public.footer_id_seq'::regclass);


--
-- Name: footer_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_rels ALTER COLUMN id SET DEFAULT nextval('public.footer_rels_id_seq'::regclass);


--
-- Name: header id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header ALTER COLUMN id SET DEFAULT nextval('public.header_id_seq'::regclass);


--
-- Name: header_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_rels ALTER COLUMN id SET DEFAULT nextval('public.header_rels_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_rels ALTER COLUMN id SET DEFAULT nextval('public.orders_rels_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels ALTER COLUMN id SET DEFAULT nextval('public.pages_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_rels ALTER COLUMN id SET DEFAULT nextval('public.products_rels_id_seq'::regclass);


--
-- Name: redirects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects ALTER COLUMN id SET DEFAULT nextval('public.redirects_id_seq'::regclass);


--
-- Name: redirects_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels ALTER COLUMN id SET DEFAULT nextval('public.redirects_rels_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: settings_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings_rels ALTER COLUMN id SET DEFAULT nextval('public.settings_rels_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_rels ALTER COLUMN id SET DEFAULT nextval('public.users_rels_id_seq'::regclass);


--
-- Name: users_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles ALTER COLUMN id SET DEFAULT nextval('public.users_roles_id_seq'::regclass);


--
-- Data for Name: _pages_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v (id, version_title, version_published_on, version_hero_type, version_hero_rich_text, version_slug, version_meta_title, version_meta_description, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
3	Cart	2025-05-07 06:26:57.711+00	lowImpact	[{"type": "h1", "children": [{"text": "Cart"}]}, {"type": "p", "children": [{"text": "This cart saves to local storage so you can continue shopping later. Once you authenticate with Payload, your cart will sync to your user profile so you can continue shopping from any device. This hero and the content below the cart are completely dynamic and "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}]}]	cart	Cart	Your cart will sync to your user profile so you can continue shopping from any device.	2025-05-07 06:26:59.241+00	2025-05-07 06:26:57.078+00	published	2025-05-07 06:26:57.078+00	2025-05-07 06:26:57.078+00	t
2	Home	2025-05-07 06:26:45.944+00	highImpact	[{"type": "h1", "children": [{"text": "Payload E-Commerce Store"}]}, {"type": "large-body", "children": [{"text": "Welcome to your store! "}, {"url": "/admin", "type": "link", "children": [{"text": "Visit the admin dashboard"}], "linkType": "custom"}, {"text": " to begin managing this site's content. The code for this template is completely open-source and can be found "}, {"url": "https://github.com/payloadcms/payload/tree/main/templates/ecommerce", "type": "link", "newTab": true, "children": [{"text": "here"}], "linkType": "custom"}, {"text": "."}]}]	home	Payload E-Commerce Template	An open-source e-commerce store built with Payload and Next.js.	2025-05-07 06:26:48.682+00	2025-05-07 06:26:45.307+00	published	2025-05-07 06:26:45.307+00	2025-05-07 06:26:45.307+00	f
1	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "h1", "children": [{"text": "All products"}]}, {"type": "p", "children": [{"text": "This page displays all or some of the products of your store ranging from goods and services to digital assets and gated content. Each product is complete with a dynamic page layout builder for a completely custom shopping experience that is under your full control."}]}]	products	Shop all products	Shop everything from goods and services to digital assets and gated content.	2025-05-07 06:26:40.537+00	2025-05-07 06:26:38.58+00	published	2025-05-07 06:26:38.58+00	2025-05-07 06:26:38.58+00	f
6	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "large-body", "children": [{"bold": true, "text": "Welcome to Kikky Art Studio"}, {"text": "\\n\\nYour creative partner in transforming spaces and expressions. We specialize in canvas paintings, tattoo artistry, tattoo supplies, and painting shop décor. Whether you're looking to enhance your space or express your identity through ink, Kikky Art Studio brings bold ideas to life with style and precision.\\n\\n"}]}]	home	Payload E-Commerce Template	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:11:35.195+00	2025-05-08 00:10:27.463+00	published	2025-05-08 00:11:32.516+00	2025-05-08 00:11:32.516+00	f
7	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}, {"text": "\\n\\nYour creative partner in transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:27:57.799+00	2025-05-08 00:11:32.516+00	published	2025-05-08 00:27:55.16+00	2025-05-08 00:27:55.16+00	f
8	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}, {"text": "\\n\\nYour creative partner in transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:31:17.484+00	2025-05-08 00:27:55.16+00	published	2025-05-08 00:31:14.208+00	2025-05-08 00:31:14.208+00	f
9	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:32:18.757+00	2025-05-08 00:31:14.208+00	draft	2025-05-08 00:32:19.61+00	2025-05-08 00:32:19.61+00	f
10	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:32:34.305+00	2025-05-08 00:32:19.61+00	published	2025-05-08 00:32:31.445+00	2025-05-08 00:32:31.445+00	f
5	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "large-body", "children": [{"bold": true, "text": "Welcome to Kikky Art Studio"}, {"text": "\\n\\nYour creative partner in transforming spaces and expressions. We specialize in canvas paintings, tattoo artistry, tattoo supplies, and painting shop décor. Whether you're looking to enhance your space or express your identity through ink, Kikky Art Studio brings bold ideas to life with style and precision.\\n\\n"}]}]	home	Payload E-Commerce Template	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:10:30.133+00	2025-05-07 23:50:24.31+00	published	2025-05-08 00:10:27.463+00	2025-05-08 00:10:27.463+00	f
11	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:33:50.777+00	2025-05-08 00:32:31.445+00	published	2025-05-08 00:33:47.873+00	2025-05-08 00:33:47.873+00	f
12	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:36:02.966+00	2025-05-08 00:33:47.873+00	published	2025-05-08 00:36:00.394+00	2025-05-08 00:36:00.394+00	t
4	Home	2025-05-07 06:26:45.944+00	mediumImpact	[{"type": "h1", "children": [{"text": "Payload E-Commerce Store"}]}, {"type": "large-body", "children": [{"text": "Welcome to your store! "}, {"url": "/admin", "type": "link", "children": [{"text": "Visit the admin dashboard"}], "linkType": "custom"}, {"text": " to begin managing this site's content. The code for this template is completely open-source and can be found "}, {"url": "https://github.com/payloadcms/payload/tree/main/templates/ecommerce", "type": "link", "newTab": true, "children": [{"text": "here"}], "linkType": "custom"}, {"text": "."}]}]	home	Payload E-Commerce Template	An open-source e-commerce store built with Payload and Next.js.	2025-05-07 23:50:27.025+00	2025-05-07 06:26:45.307+00	published	2025-05-07 23:50:24.31+00	2025-05-07 23:50:24.31+00	f
16	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:17:57.544+00	2025-05-08 13:16:55.957+00	published	2025-05-08 13:17:55.676+00	2025-05-08 13:17:55.676+00	t
15	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:16:57.848+00	2025-05-08 13:06:40.041+00	published	2025-05-08 13:16:55.957+00	2025-05-08 13:16:55.957+00	f
14	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:13:03.418+00	2025-05-08 13:06:40.041+00	published	2025-05-08 13:12:59.367+00	2025-05-08 13:12:59.367+00	f
13	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": ""}]}]	products	Shop all products	Shop everything from goods and services to digital assets and gated content.	2025-05-08 13:06:42.18+00	2025-05-07 06:26:38.58+00	published	2025-05-08 13:06:40.041+00	2025-05-08 13:06:40.041+00	f
\.


--
-- Data for Name: _pages_v_blocks_archive; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, _uuid, block_name) FROM stdin;
1	1	version.layout	1	[{"type": "h4", "children": [{"text": "All products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display docs on a page. It can be auto-populated by collection, filtered by category, and much more."}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
3	2	version.layout	2	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	4	version.layout	3	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	5	version.layout	4	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	6	version.layout	5	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	7	version.layout	6	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	8	version.layout	7	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	9	version.layout	8	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	10	version.layout	9	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	11	version.layout	10	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
3	12	version.layout	11	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	681afd25763e6d41b42832f0	Archive Block
1	13	version.layout	12	[{"type": "h4", "children": [{"text": "All products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display docs on a page. It can be auto-populated by collection, filtered by category, and much more."}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
1	14	version.layout	13	[{"type": "h4", "children": [{"text": "All products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display docs on a page. It can be auto-populated by collection, filtered by category, and much more."}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
1	15	version.layout	14	[{"type": "p", "children": [{"text": ""}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
1	16	version.layout	15	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector."}]}]	collection	products	10	\N	681afd1f763e6d41b42832ed	Archive Block
\.


--
-- Data for Name: _pages_v_blocks_content; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v_blocks_content (_order, _parent_id, _path, id, invert_background, _uuid, block_name) FROM stdin;
1	2	version.layout	1	\N	681afd25763e6d41b42832ee	Content Block
1	3	version.layout	2	\N	681afd31763e6d41b42832ff	\N
1	4	version.layout	3	\N	681afd25763e6d41b42832ee	Content Block
1	5	version.layout	4	\N	681afd25763e6d41b42832ee	Content Block
1	6	version.layout	5	\N	681afd25763e6d41b42832ee	Content Block
1	7	version.layout	6	\N	681afd25763e6d41b42832ee	Content Block
1	8	version.layout	7	\N	681afd25763e6d41b42832ee	Content Block
1	9	version.layout	8	\N	681afd25763e6d41b42832ee	Content Block
1	10	version.layout	9	\N	681afd25763e6d41b42832ee	Content Block
1	11	version.layout	10	\N	681afd25763e6d41b42832ee	Content Block
1	12	version.layout	11	\N	681afd25763e6d41b42832ee	Content Block
\.


--
-- Data for Name: _pages_v_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	1	1	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	1	2	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	1	3	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	1	4	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	1	5	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	1	6	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	1	7	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	1	8	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	1	9	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	1	10	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	2	11	twoThirds	[{"children": [{"text": "This is a custom layout building block configurable in the CMS—this can be anything you want. Related or suggested products, a blog post, video, etc."}]}]	\N	reference	\N			default	681afd31763e6d41b4283301
1	3	12	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	3	13	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	3	14	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	3	15	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	3	16	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	3	17	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	3	18	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	3	19	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	3	20	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	3	21	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	4	22	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	4	23	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	4	24	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	4	25	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	4	26	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	4	27	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	4	28	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	4	29	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	4	30	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	4	31	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	5	32	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	5	33	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	5	34	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	5	35	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	5	36	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	5	37	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	5	38	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	5	39	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	5	40	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	5	41	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	6	42	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	6	43	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	6	44	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	6	45	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	6	46	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	6	47	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	6	48	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	6	49	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	6	50	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	6	51	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	7	52	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	7	53	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	7	54	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	7	55	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	7	56	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	7	57	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	7	58	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	7	59	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	7	60	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	7	61	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	8	62	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	8	63	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	8	64	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	8	65	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	8	66	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	8	67	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	8	68	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	8	69	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	8	70	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	8	71	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	9	72	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	9	73	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	9	74	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	9	75	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	9	76	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	9	77	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	9	78	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	9	79	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	9	80	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	9	81	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	10	82	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	10	83	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	10	84	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	10	85	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	10	86	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	10	87	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	10	88	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	10	89	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	10	90	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	10	91	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
1	11	92	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default	681afd25763e6d41b42832f4
2	11	93	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832f5
3	11	94	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default	681afd25763e6d41b42832f6
4	11	95	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default	681afd25763e6d41b42832f7
5	11	96	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default	681afd25763e6d41b42832f8
6	11	97	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default	681afd25763e6d41b42832f9
7	11	98	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default	681afd25763e6d41b42832fa
8	11	99	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default	681afd25763e6d41b42832fb
9	11	100	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default	681afd25763e6d41b42832fc
10	11	101	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default	681afd25763e6d41b42832fd
\.


--
-- Data for Name: _pages_v_blocks_cta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, _uuid, block_name) FROM stdin;
4	2	version.layout	1	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
2	3	version.layout	2	\N	[{"type": "h4", "children": [{"text": "Continue shopping"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd31763e6d41b4283300	CTA
4	4	version.layout	3	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	5	version.layout	4	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	6	version.layout	5	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	7	version.layout	6	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	8	version.layout	7	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	9	version.layout	8	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	10	version.layout	9	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	11	version.layout	10	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
4	12	version.layout	11	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	681afd25763e6d41b42832f1	CTA
\.


--
-- Data for Name: _pages_v_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	1	1	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	2	2	reference	\N		Continue shopping	primary	681afd31763e6d41b4283302
1	3	3	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	4	4	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	5	5	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	6	6	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	7	7	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	8	8	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	9	9	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	10	10	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
1	11	11	reference	\N		Shop now	primary	681afd25763e6d41b42832fe
\.


--
-- Data for Name: _pages_v_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", _uuid, block_name) FROM stdin;
2	2	version.layout	1	\N	default	681afd25763e6d41b42832ef	Media Block
2	4	version.layout	2	\N	default	681afd25763e6d41b42832ef	Media Block
2	5	version.layout	3	\N	default	681afd25763e6d41b42832ef	Media Block
2	6	version.layout	4	\N	default	681afd25763e6d41b42832ef	Media Block
2	7	version.layout	5	\N	default	681afd25763e6d41b42832ef	Media Block
2	8	version.layout	6	\N	default	681afd25763e6d41b42832ef	Media Block
2	9	version.layout	7	\N	default	681afd25763e6d41b42832ef	Media Block
2	10	version.layout	8	\N	default	681afd25763e6d41b42832ef	Media Block
2	11	version.layout	9	\N	default	681afd25763e6d41b42832ef	Media Block
2	12	version.layout	10	\N	default	681afd25763e6d41b42832ef	Media Block
\.


--
-- Data for Name: _pages_v_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v_rels (id, "order", parent_id, path, pages_id, media_id, categories_id, products_id) FROM stdin;
1	\N	1	parent	1	\N	\N	\N
2	\N	2	parent	2	\N	\N	\N
3	\N	2	version.hero.links.0.link.reference	1	\N	\N	\N
4	\N	2	version.hero.media	\N	1	\N	\N
5	\N	2	version.layout.1.media	\N	2	\N	\N
6	\N	2	version.layout.3.links.0.link.reference	1	\N	\N	\N
7	\N	2	version.meta.image	\N	1	\N	\N
8	\N	3	parent	3	\N	\N	\N
9	\N	3	version.layout.1.links.0.link.reference	1	\N	\N	\N
10	\N	4	parent	2	\N	\N	\N
11	\N	4	version.hero.links.0.link.reference	1	\N	\N	\N
12	\N	4	version.hero.media	\N	1	\N	\N
13	\N	4	version.layout.1.media	\N	2	\N	\N
14	\N	4	version.layout.3.links.0.link.reference	1	\N	\N	\N
15	\N	4	version.meta.image	\N	1	\N	\N
16	\N	5	parent	2	\N	\N	\N
17	\N	5	version.hero.links.0.link.reference	1	\N	\N	\N
18	\N	5	version.hero.media	\N	8	\N	\N
19	\N	5	version.layout.1.media	\N	2	\N	\N
20	\N	5	version.layout.3.links.0.link.reference	1	\N	\N	\N
21	\N	5	version.meta.image	\N	1	\N	\N
22	\N	6	parent	2	\N	\N	\N
23	\N	6	version.hero.links.0.link.reference	1	\N	\N	\N
24	\N	6	version.hero.media	\N	8	\N	\N
25	\N	6	version.layout.1.media	\N	2	\N	\N
26	\N	6	version.layout.3.links.0.link.reference	1	\N	\N	\N
27	\N	7	parent	2	\N	\N	\N
28	\N	7	version.hero.links.0.link.reference	1	\N	\N	\N
29	\N	7	version.hero.media	\N	9	\N	\N
30	\N	7	version.layout.1.media	\N	2	\N	\N
31	\N	7	version.layout.3.links.0.link.reference	1	\N	\N	\N
32	\N	8	parent	2	\N	\N	\N
33	\N	8	version.hero.links.0.link.reference	1	\N	\N	\N
34	\N	8	version.hero.media	\N	10	\N	\N
35	\N	8	version.layout.1.media	\N	2	\N	\N
36	\N	8	version.layout.3.links.0.link.reference	1	\N	\N	\N
37	\N	9	parent	2	\N	\N	\N
38	\N	9	version.hero.links.0.link.reference	1	\N	\N	\N
39	\N	9	version.hero.media	\N	10	\N	\N
40	\N	9	version.layout.1.media	\N	2	\N	\N
41	\N	9	version.layout.3.links.0.link.reference	1	\N	\N	\N
42	\N	10	parent	2	\N	\N	\N
43	\N	10	version.hero.links.0.link.reference	1	\N	\N	\N
44	\N	10	version.hero.media	\N	10	\N	\N
45	\N	10	version.layout.1.media	\N	2	\N	\N
46	\N	10	version.layout.3.links.0.link.reference	1	\N	\N	\N
47	\N	11	parent	2	\N	\N	\N
48	\N	11	version.hero.links.0.link.reference	1	\N	\N	\N
49	\N	11	version.hero.media	\N	11	\N	\N
50	\N	11	version.layout.1.media	\N	2	\N	\N
51	\N	11	version.layout.3.links.0.link.reference	1	\N	\N	\N
52	\N	12	parent	2	\N	\N	\N
53	\N	12	version.hero.links.0.link.reference	1	\N	\N	\N
54	\N	12	version.hero.media	\N	13	\N	\N
55	\N	12	version.layout.1.media	\N	2	\N	\N
56	\N	12	version.layout.3.links.0.link.reference	1	\N	\N	\N
57	\N	13	parent	1	\N	\N	\N
58	\N	14	parent	1	\N	\N	\N
59	\N	15	parent	1	\N	\N	\N
60	\N	16	parent	1	\N	\N	\N
\.


--
-- Data for Name: _pages_v_version_hero_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._pages_v_version_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
1	2	1	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
2	2	2	custom	t	https://github.com/payloadcms/payload/tree/main/templates/ecommerce	View on GitHub	secondary	681afd25763e6d41b42832f3
1	4	3	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
2	4	4	custom	t	https://github.com/payloadcms/payload/tree/main/templates/ecommerce	View on GitHub	secondary	681afd25763e6d41b42832f3
1	5	5	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	6	6	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	7	7	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	8	8	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	9	9	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	10	10	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	11	11	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
1	12	12	reference	\N		Shop now	primary	681afd25763e6d41b42832f2
\.


--
-- Data for Name: _products_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._products_v (id, version_title, version_published_on, version_stripe_product_i_d, version_price_j_s_o_n, version_enable_paywall, version_slug, version_skip_sync, version_meta_title, version_meta_description, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
8	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	2025-05-08 13:35:36.155+00	\N	\N	\N	kikky-art-studio--hxh-gon-and-kilua	f	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	Stunning hand-painted canvas artwork featuring Gon Freecss and Killua Zoldyck from Hunter x Hunter. 	2025-05-08 13:35:37.108+00	2025-05-08 13:35:37.052+00	published	2025-05-08 13:35:37.052+00	2025-05-08 13:35:37.052+00	t
9	Transforming Scars Into Stunning Tattoo Art	2025-05-08 12:42:13.416+00	\N	\N	\N	transforming-scars-into-stunning-tattoo-art	f	Transforming Scars Into Stunning Tattoo Art-Kikky art	This expertly crafted cover-up tattoo seamlessly blends a detailed compass rose and a roman numeral timepiece to transform and conceal scars .	2025-05-08 13:36:09.889+00	2025-05-08 12:42:14.275+00	published	2025-05-08 13:36:07.962+00	2025-05-08 13:36:07.962+00	t
7	Transforming Scars Into Stunning Tattoo Art	2025-05-08 12:42:13.416+00	\N	\N	\N	transforming-scars-into-stunning-tattoo-art	f	Transforming Scars Into Stunning Tattoo Art-Kikky art	This expertly crafted cover-up tattoo seamlessly blends a detailed compass rose and a roman numeral timepiece to transform and conceal scars .	2025-05-08 12:42:14.459+00	2025-05-08 12:42:14.275+00	published	2025-05-08 12:42:14.275+00	2025-05-08 12:42:14.275+00	f
10	Urban Street Art Mural – Vibrant Cityscape on Container Wall	2025-05-08 13:41:29.185+00	\N	\N	\N	urban-street-art-mural--vibrant-cityscape-on-container-wall	f	Urban Street Art Mural – Vibrant Cityscape on Container Wall	Experience the essence of city nightlife through this captivating urban street art mural featuring a cityscape with glowing lights and  skyscrapers.	2025-05-08 13:41:30.119+00	2025-05-08 13:41:30.095+00	published	2025-05-08 13:41:30.095+00	2025-05-08 13:41:30.095+00	t
11	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	2025-05-08 13:45:29.495+00	\N	\N	\N	neon-glow-portrait---afrocentric-expressionism-on-canvas	f	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	Illuminate your space with this powerful Afrocentric portrait, painted in a unique blend of neon hues and expressive brushwork.	2025-05-08 13:45:30.839+00	2025-05-08 13:45:30.41+00	published	2025-05-08 13:45:30.41+00	2025-05-08 13:45:30.41+00	t
14	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 14:23:18.757+00	2025-05-08 13:48:28.57+00	published	2025-05-08 14:23:16.312+00	2025-05-08 14:23:16.312+00	t
12	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 13:48:28.616+00	2025-05-08 13:48:28.57+00	published	2025-05-08 13:48:28.57+00	2025-05-08 13:48:28.57+00	f
13	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 13:50:11.195+00	2025-05-08 13:48:28.57+00	published	2025-05-08 13:50:08.267+00	2025-05-08 13:50:08.267+00	f
\.


--
-- Data for Name: _products_v_blocks_archive; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._products_v_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, _uuid, block_name) FROM stdin;
\.


--
-- Data for Name: _products_v_blocks_content; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._products_v_blocks_content (_order, _parent_id, _path, id, invert_background, _uuid, block_name) FROM stdin;
1	7	version.layout	11	\N	681ca6a5aa58c90e08bcfdc9	\N
1	8	version.layout	12	\N	681cb328aa58c90e08bcfdca	\N
1	9	version.layout	13	\N	681ca6a5aa58c90e08bcfdc9	\N
1	10	version.layout	14	\N	681cb489aa58c90e08bcfdcc	\N
1	11	version.layout	15	\N	681cb579aa58c90e08bcfdcd	\N
1	12	version.layout	16	\N	681cb62baa58c90e08bcfdce	\N
1	13	version.layout	17	\N	681cb62baa58c90e08bcfdce	\N
\.


--
-- Data for Name: _products_v_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._products_v_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
\.


--
-- Data for Name: _products_v_blocks_cta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._products_v_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, _uuid, block_name) FROM stdin;
\.


--
-- Data for Name: _products_v_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._products_v_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
\.


--
-- Data for Name: _products_v_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._products_v_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", _uuid, block_name) FROM stdin;
\.


--
-- Data for Name: _products_v_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._products_v_rels (id, "order", parent_id, path, products_id, pages_id, media_id, categories_id) FROM stdin;
25	\N	7	parent	4	\N	\N	\N
26	\N	7	version.meta.image	\N	\N	31	\N
27	\N	8	parent	5	\N	\N	\N
28	1	8	version.categories	\N	\N	\N	4
29	\N	8	version.meta.image	\N	\N	32	\N
30	\N	9	parent	4	\N	\N	\N
31	1	9	version.categories	\N	\N	\N	5
32	\N	9	version.meta.image	\N	\N	31	\N
33	\N	10	parent	6	\N	\N	\N
34	1	10	version.categories	\N	\N	\N	4
35	\N	10	version.meta.image	\N	\N	33	\N
36	\N	11	parent	7	\N	\N	\N
37	1	11	version.categories	\N	\N	\N	4
38	\N	11	version.meta.image	\N	\N	34	\N
39	\N	12	parent	8	\N	\N	\N
40	1	12	version.categories	\N	\N	\N	5
41	\N	12	version.meta.image	\N	\N	35	\N
42	\N	13	parent	8	\N	\N	\N
43	1	13	version.categories	\N	\N	\N	5
44	1	13	version.relatedProducts	4	\N	\N	\N
45	\N	13	version.meta.image	\N	\N	35	\N
46	\N	14	parent	8	\N	\N	\N
47	1	14	version.categories	\N	\N	\N	5
48	1	14	version.relatedProducts	4	\N	\N	\N
49	\N	14	version.meta.image	\N	\N	35	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, title, updated_at, created_at) FROM stdin;
5	Tattoo collections	2025-05-08 01:14:42.152+00	2025-05-08 01:14:42.194+00
4	Canvas Art Collections	2025-05-08 07:25:59.527+00	2025-05-08 01:08:45.111+00
6	Tattoo Supplies & Tools	2025-05-08 14:05:35.486+00	2025-05-08 01:15:56.678+00
7	Client Services	2025-05-08 14:06:21.27+00	2025-05-08 07:09:56.56+00
\.


--
-- Data for Name: categories_breadcrumbs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories_breadcrumbs (_order, _parent_id, id, url, label) FROM stdin;
1	5	681c05821cf96e2dec30d50b	\N	Tattoo collections
1	4	681c5c876f745c142845619f	\N	Canvas Art Collections
1	6	681cba2faa58c90e08bcfdd2	\N	Tattoo Supplies & Tools
1	7	681cba5daa58c90e08bcfdd3	\N	Client Services
\.


--
-- Data for Name: categories_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories_rels (id, "order", parent_id, path, media_id, categories_id) FROM stdin;
8	\N	5	media	15	\N
9	\N	5	breadcrumbs.0.doc	\N	5
46	\N	4	media	28	\N
47	\N	4	breadcrumbs.0.doc	\N	4
58	\N	6	media	38	\N
59	\N	6	breadcrumbs.0.doc	\N	6
60	\N	7	media	39	\N
61	\N	7	breadcrumbs.0.doc	\N	7
\.


--
-- Data for Name: footer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.footer (id, copyright, updated_at, created_at) FROM stdin;
1	'© 2025 Kikky. All rights reserved.	2025-05-07 12:20:22.207+00	\N
\.


--
-- Data for Name: footer_nav_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.footer_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	681b4d4b26de9721ff73411b	custom	\N	https://www.instagram.com/kikky_tattoos?igsh=MWJ0Y21yZHZyczBydQ==	instagram
2	1	681b4de826de9721ff73411c	custom	\N	https://wa.link/n4bymb	WhatsApp link
\.


--
-- Data for Name: footer_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.footer_rels (id, "order", parent_id, path, pages_id, media_id) FROM stdin;
4	\N	1	navItems.0.link.icon	\N	6
5	\N	1	navItems.1.link.icon	\N	7
\.


--
-- Data for Name: header; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.header (id, updated_at, created_at) FROM stdin;
1	2025-05-07 11:17:52.484+00	\N
\.


--
-- Data for Name: header_nav_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.header_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	681b40f28ddda214d0fb664b	reference	\N	\N	Home
2	1	681afd3c763e6d41b4283303	reference	\N	\N	Shop
\.


--
-- Data for Name: header_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.header_rels (id, "order", parent_id, path, pages_id, media_id) FROM stdin;
2	\N	1	navItems.0.link.reference	2	\N
3	\N	1	navItems.1.link.reference	1	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.media (id, alt, caption, updated_at, created_at, url, filename, mime_type, filesize, width, height, focal_x, focal_y) FROM stdin;
1	Shirts	[{"children": [{"text": "Photo by "}, {"url": "https://unsplash.com/@henmankk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Keagan Henman"}], "linkType": "custom"}, {"text": " on "}, {"url": "https://unsplash.com/photos/Won79_9oUEk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Unsplash"}], "linkType": "custom"}, {"text": "."}]}]	2025-05-07 06:25:22.316+00	2025-05-07 06:25:22.316+00	\N	image-1.jpg	image/jpeg	93586	1920	1281	50	50
2	E-Book	[{"children": [{"text": "Photo by "}, {"url": "https://unsplash.com/@jamestarbotton?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "James Tarbotton"}], "linkType": "custom"}, {"text": " on "}, {"url": "https://unsplash.com/photos/PkyL3p9Kx8c?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Unsplash"}], "linkType": "custom"}, {"text": "."}]}]	2025-05-07 06:25:23.485+00	2025-05-07 06:25:23.485+00	\N	image-2.jpg	image/jpeg	349328	1920	1272	50	50
3	Online Course	[{"children": [{"text": "Photo by "}, {"url": "https://unsplash.com/@christinhumephoto?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Christin Hume"}], "linkType": "custom"}, {"text": " on "}, {"url": "https://unsplash.com/photos/Hcfwew744z4?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText", "type": "link", "newTab": true, "children": [{"text": "Unsplash"}], "linkType": "custom"}, {"text": "."}]}]	2025-05-07 06:25:24.592+00	2025-05-07 06:25:24.592+00	\N	image-3.jpg	image/jpeg	248185	1920	1280	50	50
4	Instagram	\N	2025-05-07 12:09:32.891+00	2025-05-07 12:09:32.891+00	\N	instagram.jpg	image/jpeg	81410	626	626	50	50
5	whats app	\N	2025-05-07 12:15:35.409+00	2025-05-07 12:15:35.409+00	\N	whatsapp.jpg	image/jpeg	22823	736	736	50	50
6	Instagram	\N	2025-05-07 12:20:01.164+00	2025-05-07 12:20:01.164+00	\N	instagram-removebg.png	image/png	154059	499	499	50	50
7	whats app	\N	2025-05-07 12:20:15.044+00	2025-05-07 12:20:15.044+00	\N	whatsapp-removebg.png	image/png	98633	500	500	50	50
8	kikky art	\N	2025-05-08 00:06:42.252+00	2025-05-08 00:06:42.252+00	\N	hero2.png	image/png	349753	831	587	50	50
9	kikky art	\N	2025-05-08 00:27:36.974+00	2025-05-08 00:27:36.974+00	\N	hero.jpg	image/jpeg	89887	736	904	50	50
10	kikky art	\N	2025-05-08 00:31:10.013+00	2025-05-08 00:31:10.013+00	\N	hero3.jpg	image/jpeg	66065	736	1050	50	50
11	kikky art	\N	2025-05-08 00:33:44.202+00	2025-05-08 00:33:44.202+00	\N	hero2.jpg	image/jpeg	125941	736	1104	50	50
12	kikky art	\N	2025-05-08 00:34:56.434+00	2025-05-08 00:34:56.434+00	\N	hero4.jpg	image/jpeg	45129	454	626	50	50
13	kikky art	\N	2025-05-08 00:35:56.113+00	2025-05-08 00:35:56.113+00	\N	hero5.jpg	image/jpeg	27326	400	640	50	50
14	Graffiti & Street-Inspired Canvases	\N	2025-05-08 01:08:31.959+00	2025-05-08 01:08:31.959+00	\N	camvas street style.png	image/png	418693	588	518	50	50
15	tattoo sessions	\N	2025-05-08 01:14:33.917+00	2025-05-08 01:14:33.917+00	\N	tattoo.png	image/png	225151	308	409	50	50
16	Tattoo Supplies & Tools	\N	2025-05-08 01:15:49.988+00	2025-05-08 01:15:49.988+00	\N	â¢ Wireless Tattoo Pen Cartridge _The kit includesâ¦.jpg	image/jpeg	79537	736	736	50	50
17	Tattoo Supplies & Tools	\N	2025-05-08 01:20:07.797+00	2025-05-08 01:20:07.797+00	\N	â¢ Wireless Tattoo Pen Cartridge _The kit includesâ¦-1.jpg	image/jpeg	79537	736	736	50	50
18	Tattoo Supplies & Tools	\N	2025-05-08 01:21:05.377+00	2025-05-08 01:21:05.377+00	\N	tattoo-1.png	image/png	225151	308	409	50	50
19	Tattoo Supplies & Tools	\N	2025-05-08 01:24:23.558+00	2025-05-08 01:23:19.599+00	http://localhost:3000/media/â¢ Wireless Tattoo Pen Cartridge _The kit includesâ¦-2.jpg	â¢ Wireless Tattoo Pen Cartridge _The kit includesâ¦-2.jpg	image/jpeg	31064	308	409	50	50
35	batman	\N	2025-05-08 13:46:41.84+00	2025-05-08 13:46:41.84+00	\N	half-sleeve.png	image/png	380418	470	589	50	50
20	Tattoo Supplies & Tools	\N	2025-05-08 01:27:35.859+00	2025-05-08 01:26:10.967+00	http://localhost:3000/media/New Cartridges Rotary Pen Tattoo Machine Powerâ¦.jpg	New Cartridges Rotary Pen Tattoo Machine Powerâ¦.jpg	image/jpeg	35498	308	409	50	50
21	Tattoo Supplies & Tools	\N	2025-05-08 01:28:38.469+00	2025-05-08 01:28:38.469+00	\N	New Cartridges Rotary Pen Tattoo Machine Powerâ¦-1.jpg	image/jpeg	34259	308	409	50	50
22	Graffiti & Street-Inspired Canvases	\N	2025-05-08 01:30:03.233+00	2025-05-08 01:30:03.233+00	\N	camvas street style-1.png	image/png	247445	308	409	50	50
23	Graffiti & Street-Inspired Canvases	\N	2025-05-08 01:37:47.7+00	2025-05-08 01:37:47.7+00	\N	street art.png	image/png	323756	588	587	50	50
24	Tattoo Supplies & Tools	\N	2025-05-08 01:43:37.457+00	2025-05-08 01:43:37.457+00	\N	New Cartridges Rotary Pen Tattoo Machine Powerâ¦-2.jpg	image/jpeg	49516	500	500	50	50
25	Client Services	\N	2025-05-08 07:09:47.111+00	2025-05-08 07:09:47.111+00	\N	New Cartridges Rotary Pen Tattoo Machine Powerâ¦-3.jpg	image/jpeg	49516	500	500	50	50
26	kikky art	\N	2025-05-08 07:11:32.04+00	2025-05-08 07:11:32.04+00	\N	New Cartridges Rotary Pen Tattoo Machine Powerâ¦-4.jpg	image/jpeg	34259	308	409	50	50
27	Graffiti & Street-Inspired Canvases	\N	2025-05-08 07:24:27.249+00	2025-05-08 07:24:27.249+00	\N	street-art.png	image/png	323756	588	587	50	50
28	Graffiti & Street-Inspired Canvases	\N	2025-05-08 07:25:55.658+00	2025-05-08 07:25:55.658+00	\N	street-art-1.png	image/png	323756	588	587	50	50
29	Tattoo Supplies & Tools	\N	2025-05-08 07:26:57.326+00	2025-05-08 07:26:57.326+00	\N	supplies.jpg	image/jpeg	49516	500	500	50	50
30	customer services	\N	2025-05-08 07:28:47.043+00	2025-05-08 07:28:47.043+00	\N	custom-services.jpg	image/jpeg	193616	736	1323	50	50
31	kikky art	\N	2025-05-08 12:41:54.105+00	2025-05-08 12:41:54.105+00	\N	cover-up.png	image/png	452613	472	591	50	50
32	HxH	\N	2025-05-08 13:21:51.22+00	2025-05-08 13:21:51.22+00	\N	canvas-hxh.png	image/png	394625	471	591	50	50
33	Graffiti & Street- Canvases	\N	2025-05-08 13:37:01.295+00	2025-05-08 13:37:01.295+00	\N	camvas street style-2.png	image/png	418693	588	518	50	50
34	kikky art	\N	2025-05-08 13:42:56.268+00	2025-05-08 13:42:56.268+00	\N	hero1.png	image/png	422883	587	585	50	50
36	tattoo sessions	\N	2025-05-08 13:58:42.012+00	2025-05-08 13:58:42.012+00	\N	Iâm ready to take on a few more projects!.jpg	image/jpeg	113943	736	1308	50	50
37	Tattoo Supplies & Tools	\N	2025-05-08 14:02:35.69+00	2025-05-08 14:02:35.69+00	\N	Tattoo Shops Near Me_ A Guide for Tattoo Enthusiasts & First-Time Seekers.jpg	image/jpeg	84190	736	981	50	50
38	Tattoo Supplies & Tools	\N	2025-05-08 14:05:21.381+00	2025-05-08 14:05:21.381+00	\N	supplie-tat.jpg	image/jpeg	84190	736	981	50	50
39	kikky art	\N	2025-05-08 14:06:17.997+00	2025-05-08 14:06:17.997+00	\N	client.jpg	image/jpeg	54846	736	689	50	50
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, stripe_payment_intent_i_d, total, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: orders_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders_items (_order, _parent_id, id, price, quantity) FROM stdin;
\.


--
-- Data for Name: orders_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders_rels (id, "order", parent_id, path, users_id, products_id) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages (id, title, published_on, hero_type, hero_rich_text, slug, meta_title, meta_description, updated_at, created_at, _status) FROM stdin;
3	Cart	2025-05-07 06:26:57.711+00	lowImpact	[{"type": "h1", "children": [{"text": "Cart"}]}, {"type": "p", "children": [{"text": "This cart saves to local storage so you can continue shopping later. Once you authenticate with Payload, your cart will sync to your user profile so you can continue shopping from any device. This hero and the content below the cart are completely dynamic and "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}]}]	cart	Cart	Your cart will sync to your user profile so you can continue shopping from any device.	2025-05-07 06:26:57.078+00	2025-05-07 06:26:57.078+00	published
1	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:17:55.51+00	2025-05-08 13:16:55.957+00	published
2	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:35:59.524+00	2025-05-08 00:33:47.873+00	published
\.


--
-- Data for Name: pages_blocks_archive; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, block_name) FROM stdin;
3	2	layout	681afd25763e6d41b42832f0	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	Archive Block
1	1	layout	681afd1f763e6d41b42832ed	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector."}]}]	collection	products	10	\N	Archive Block
\.


--
-- Data for Name: pages_blocks_content; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_blocks_content (_order, _parent_id, _path, id, invert_background, block_name) FROM stdin;
1	3	layout	681afd31763e6d41b42832ff	\N	\N
1	2	layout	681afd25763e6d41b42832ee	\N	Content Block
\.


--
-- Data for Name: pages_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	681afd31763e6d41b42832ff	681afd31763e6d41b4283301	twoThirds	[{"children": [{"text": "This is a custom layout building block configurable in the CMS—this can be anything you want. Related or suggested products, a blog post, video, etc."}]}]	\N	reference	\N			default
1	681afd25763e6d41b42832ee	681afd25763e6d41b42832f4	full	[{"type": "h2", "children": [{"text": "Core Features"}]}, {"children": [{"text": ""}]}]	\N	reference	\N	\N	\N	default
2	681afd25763e6d41b42832ee	681afd25763e6d41b42832f5	oneThird	[{"type": "h3", "children": [{"text": "Admin Dashboard"}]}, {"children": [{"text": "Manage this site's users, pages, products, and more from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default
3	681afd25763e6d41b42832ee	681afd25763e6d41b42832f6	oneThird	[{"type": "h3", "children": [{"text": "Authentication"}]}, {"children": [{"text": "User "}, {"url": "/login", "type": "link", "children": [{"text": "login"}], "linkType": "custom"}, {"text": " and "}, {"url": "/create-account", "type": "link", "children": [{"text": "create account"}], "linkType": "custom"}, {"text": " flows are complete with email verification and password reset."}]}]	f	reference	\N			default
4	681afd25763e6d41b42832ee	681afd25763e6d41b42832f7	oneThird	[{"type": "h3", "children": [{"text": "Customer Accounts"}]}, {"children": [{"text": "Customers can "}, {"url": "/account", "type": "link", "children": [{"text": "manage their account"}], "linkType": "custom"}, {"text": ", "}, {"url": "/orders", "type": "link", "children": [{"text": "view their order history"}], "linkType": "custom"}, {"text": ", and more without leaving the site."}]}]	f	reference	\N			default
5	681afd25763e6d41b42832ee	681afd25763e6d41b42832f8	oneThird	[{"type": "h3", "children": [{"text": "Paywall"}]}, {"children": [{"text": "Easily gate digital content behind a paywall or require users to be logged in to access it."}]}]	f	reference	\N			default
6	681afd25763e6d41b42832ee	681afd25763e6d41b42832f9	oneThird	[{"type": "h3", "children": [{"text": "Shopping Cart"}]}, {"children": [{"text": "Shopping carts persist between sessions, can be saved for later, and are accessible from any device."}]}]	f	reference	\N			default
7	681afd25763e6d41b42832ee	681afd25763e6d41b42832fa	oneThird	[{"type": "h3", "children": [{"text": "Checkout"}]}, {"children": [{"text": "Secure in-app checkout powered by Stripe means your customers never have to leave your site."}]}]	f	reference	\N			default
8	681afd25763e6d41b42832ee	681afd25763e6d41b42832fb	oneThird	[{"type": "h3", "children": [{"text": "Page Builder"}]}, {"children": [{"text": "Custom page builder allows you to create unique page and product layouts for any type of content."}]}]	f	reference	\N			default
9	681afd25763e6d41b42832ee	681afd25763e6d41b42832fc	oneThird	[{"type": "h3", "children": [{"text": "SEO"}]}, {"children": [{"text": "Editors have complete control over SEO data and site content directly from the "}, {"url": "/admin", "type": "link", "children": [{"text": "admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	f	reference	\N			default
10	681afd25763e6d41b42832ee	681afd25763e6d41b42832fd	oneThird	[{"type": "h3", "children": [{"text": "Dark Mode"}]}, {"children": [{"text": "Users will experience this site in their preferred color scheme, and each block can be inverted."}]}]	f	reference	\N			default
\.


--
-- Data for Name: pages_blocks_cta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, block_name) FROM stdin;
2	3	layout	681afd31763e6d41b4283300	\N	[{"type": "h4", "children": [{"text": "Continue shopping"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	CTA
4	2	layout	681afd25763e6d41b42832f1	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	CTA
\.


--
-- Data for Name: pages_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	681afd31763e6d41b4283300	681afd31763e6d41b4283302	reference	\N		Continue shopping	primary
1	681afd25763e6d41b42832f1	681afd25763e6d41b42832fe	reference	\N		Shop now	primary
\.


--
-- Data for Name: pages_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", block_name) FROM stdin;
2	2	layout	681afd25763e6d41b42832ef	\N	default	Media Block
\.


--
-- Data for Name: pages_hero_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	2	681afd25763e6d41b42832f2	reference	\N		Shop now	primary
\.


--
-- Data for Name: pages_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_rels (id, "order", parent_id, path, pages_id, media_id, categories_id, products_id) FROM stdin;
6	\N	3	layout.1.links.0.link.reference	1	\N	\N	\N
37	\N	2	hero.links.0.link.reference	1	\N	\N	\N
38	\N	2	hero.media	\N	13	\N	\N
39	\N	2	layout.1.media	\N	2	\N	\N
40	\N	2	layout.3.links.0.link.reference	1	\N	\N	\N
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2025-05-08 17:29:45.003+00	2025-05-06 18:22:31.031+00
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
3	collection-pages-2	{"fields": {"tabs-1": {"tabIndex": 0}, "hero.links": {"collapsed": []}}}	2025-05-07 23:49:27.702+00	2025-05-07 23:49:27.702+00
7	collection-pages-1	{"fields": {"tabs-1": {"tabIndex": 1}}}	2025-05-08 13:16:11.949+00	2025-05-08 13:16:11.949+00
5	collection-categories-4	{"fields": {"breadcrumbs": {"collapsed": []}}}	2025-05-08 01:38:09.841+00	2025-05-08 01:38:09.841+00
4	categories-list	{"columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "media"}, {"active": true, "accessor": "parent"}, {"active": false, "accessor": "breadcrumbs"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2025-05-08 00:54:13.914+00	2025-05-08 00:54:13.914+00
6	products-list	{"limit": "10", "columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "stripeProductID"}, {"active": true, "accessor": "_status"}, {"active": false, "accessor": "id"}, {"active": false, "accessor": "publishedOn"}, {"active": false, "accessor": "layout"}, {"active": false, "accessor": "priceJSON"}, {"active": false, "accessor": "enablePaywall"}, {"active": false, "accessor": "paywall"}, {"active": false, "accessor": "categories"}, {"active": false, "accessor": "relatedProducts"}, {"active": false, "accessor": "slug"}, {"active": false, "accessor": "skipSync"}, {"active": false, "accessor": "meta"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}]}	2025-05-08 11:59:29.267+00	2025-05-08 11:59:29.267+00
2	media-list	{"sort": null, "columns": [{"active": true, "accessor": "filename"}, {"active": true, "accessor": "id"}, {"active": true, "accessor": "alt"}, {"active": true, "accessor": "caption"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}, {"active": false, "accessor": "url"}, {"active": false, "accessor": "mimeType"}, {"active": false, "accessor": "filesize"}, {"active": false, "accessor": "width"}, {"active": false, "accessor": "height"}, {"active": false, "accessor": "focalX"}, {"active": false, "accessor": "focalY"}]}	2025-05-07 12:09:03.762+00	2025-05-07 12:09:03.762+00
1	pages-list	{"columns": [{"active": true, "accessor": "_select"}, {"active": true, "accessor": "title"}, {"active": true, "accessor": "slug"}, {"active": true, "accessor": "updatedAt"}, {"active": false, "accessor": "id"}, {"active": false, "accessor": "publishedOn"}, {"active": false, "accessor": "hero"}, {"active": false, "accessor": "layout"}, {"active": false, "accessor": "meta"}, {"active": false, "accessor": "createdAt"}, {"active": false, "accessor": "_status"}]}	2025-05-07 06:31:22.204+00	2025-05-07 06:31:22.204+00
8	collection-products-8	{"fields": {"layout": {"collapsed": ["681cb62baa58c90e08bcfdce"]}}}	2025-05-08 14:23:12.953+00	2025-05-08 14:23:12.953+00
9	collection-products-8	{"fields": {"layout": {"collapsed": []}}}	2025-05-08 14:23:13.075+00	2025-05-08 14:23:13.075+00
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
8	\N	3	user	1
23	\N	5	user	1
27	\N	2	user	1
38	\N	1	user	1
41	\N	7	user	1
49	\N	4	user	1
50	\N	6	user	1
51	\N	8	user	1
52	\N	9	user	1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, title, published_on, stripe_product_i_d, price_j_s_o_n, enable_paywall, slug, skip_sync, meta_title, meta_description, updated_at, created_at, _status) FROM stdin;
5	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	2025-05-08 13:35:36.155+00	\N	\N	\N	kikky-art-studio--hxh-gon-and-kilua	f	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	Stunning hand-painted canvas artwork featuring Gon Freecss and Killua Zoldyck from Hunter x Hunter. 	2025-05-08 13:35:37.052+00	2025-05-08 13:35:37.052+00	published
4	Transforming Scars Into Stunning Tattoo Art	2025-05-08 12:42:13.416+00	\N	\N	\N	transforming-scars-into-stunning-tattoo-art	f	Transforming Scars Into Stunning Tattoo Art-Kikky art	This expertly crafted cover-up tattoo seamlessly blends a detailed compass rose and a roman numeral timepiece to transform and conceal scars .	2025-05-08 13:36:07.853+00	2025-05-08 12:42:14.275+00	published
6	Urban Street Art Mural – Vibrant Cityscape on Container Wall	2025-05-08 13:41:29.185+00	\N	\N	\N	urban-street-art-mural--vibrant-cityscape-on-container-wall	f	Urban Street Art Mural – Vibrant Cityscape on Container Wall	Experience the essence of city nightlife through this captivating urban street art mural featuring a cityscape with glowing lights and  skyscrapers.	2025-05-08 13:41:30.095+00	2025-05-08 13:41:30.095+00	published
7	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	2025-05-08 13:45:29.495+00	\N	\N	\N	neon-glow-portrait---afrocentric-expressionism-on-canvas	f	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	Illuminate your space with this powerful Afrocentric portrait, painted in a unique blend of neon hues and expressive brushwork.	2025-05-08 13:45:30.41+00	2025-05-08 13:45:30.41+00	published
8	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 14:23:16.787+00	2025-05-08 13:48:28.57+00	published
\.


--
-- Data for Name: products_blocks_archive; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, block_name) FROM stdin;
\.


--
-- Data for Name: products_blocks_content; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blocks_content (_order, _parent_id, _path, id, invert_background, block_name) FROM stdin;
1	5	layout	681cb328aa58c90e08bcfdca	\N	\N
1	4	layout	681ca6a5aa58c90e08bcfdc9	\N	\N
1	6	layout	681cb489aa58c90e08bcfdcc	\N	\N
1	7	layout	681cb579aa58c90e08bcfdcd	\N	\N
\.


--
-- Data for Name: products_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
\.


--
-- Data for Name: products_blocks_cta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, block_name) FROM stdin;
\.


--
-- Data for Name: products_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
\.


--
-- Data for Name: products_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", block_name) FROM stdin;
\.


--
-- Data for Name: products_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_rels (id, "order", parent_id, path, pages_id, media_id, categories_id, products_id) FROM stdin;
20	1	5	categories	\N	\N	4	\N
21	\N	5	meta.image	\N	32	\N	\N
22	1	4	categories	\N	\N	5	\N
23	\N	4	meta.image	\N	31	\N	\N
24	1	6	categories	\N	\N	4	\N
25	\N	6	meta.image	\N	33	\N	\N
26	1	7	categories	\N	\N	4	\N
27	\N	7	meta.image	\N	34	\N	\N
33	1	8	categories	\N	\N	5	\N
34	1	8	relatedProducts	\N	\N	\N	4
35	\N	8	meta.image	\N	35	\N	\N
\.


--
-- Data for Name: redirects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.redirects (id, "from", to_type, to_url, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: redirects_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.redirects_rels (id, "order", parent_id, path, pages_id, products_id) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.settings (id, updated_at, created_at) FROM stdin;
1	2025-05-07 06:27:04.533+00	\N
\.


--
-- Data for Name: settings_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.settings_rels (id, "order", parent_id, path, pages_id) FROM stdin;
1	\N	1	productsPage	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, stripe_customer_i_d, skip_sync, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
1	kikkyart@gmail	\N	\N	2025-05-08 14:57:47.12+00	2025-05-07 06:23:11.263+00	kikkyart@gmail.com	\N	\N	126f62f9ad91b6574fb2ca25183c9d4f26b775e87eacfce010a09bc9fc22bea0	52b336d8a0fc3cda3acf309f85145f6a8a51ff0b5bccc343cc1f9aa1319d2f5601c6b499124711997b65f5fd3b8df39bf553520f8118d35574bbbdcd323123e1832410ba9a84c1ce9b36485da64439d6dfca7b20a495c813983010e7826615fe00ccf8cc8a60954613c489b1113bb8094f3e189bdf931e06865eaa23d434c0ea9cd66a4a126506780875249c567cf39f3ff6afd37a7dc632314fd2c716ee92e94871c563717d3bcbb0510ec4260f604a9b89f3f387f3aca3f4b09358697a0816bee5408555fa9bcae0c412b132b767bbcf64e03ecc968c25927d907ed7aa48672283cb0ea0f934f6bfb89be041069c5991ca306ad77f0080b12cfa2d9333646cc30d8109addd2ffc8b2f1f901723428fa42cec454e1978a948f1a60d9d5c10655fd32d8c32772a97ef843ff75c53545313852809abe8cc7b6217dc9a9be159655cb769ee287fe5f21c6586ea72f9f0ffc308249d7792307d2c7b8a8b46cdcc8c757ecba4e739f1e617dfa79cbbb7cc3fa1ee30bebe6b6d152f86e54294f6e6c1a6d789137f4754c833146cbd5dc0266f7e898f29a04876a8ce8316831b7c964e3ecfb13d5d6dee1078477f6c22ab418e58c5bb0d0e3d41e6f07a6e3c76622b6615c1dde5bc0e62db4d70cd4deaf99cf9e367d2e4eb543464fadba74d4c94ac71023ec8e226b9afb72137be92494f14a4f8301a64e0be866e2b5db487467d08e8	0	\N
\.


--
-- Data for Name: users_cart_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_cart_items (_order, _parent_id, id, quantity) FROM stdin;
1	1	681cc66b817a134814fea1e3	1
\.


--
-- Data for Name: users_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_rels (id, "order", parent_id, path, products_id) FROM stdin;
1	\N	1	cart.items.0.product	7
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_roles ("order", parent_id, value, id) FROM stdin;
1	1	customer	447
2	1	admin	448
\.


--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_blocks_archive_id_seq', 15, true);


--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_blocks_content_columns_id_seq', 101, true);


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_blocks_content_id_seq', 11, true);


--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_blocks_cta_id_seq', 11, true);


--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_blocks_cta_links_id_seq', 11, true);


--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_blocks_media_block_id_seq', 10, true);


--
-- Name: _pages_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_id_seq', 16, true);


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_rels_id_seq', 60, true);


--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._pages_v_version_hero_links_id_seq', 12, true);


--
-- Name: _products_v_blocks_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._products_v_blocks_archive_id_seq', 1, false);


--
-- Name: _products_v_blocks_content_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._products_v_blocks_content_columns_id_seq', 10, true);


--
-- Name: _products_v_blocks_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._products_v_blocks_content_id_seq', 17, true);


--
-- Name: _products_v_blocks_cta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._products_v_blocks_cta_id_seq', 1, false);


--
-- Name: _products_v_blocks_cta_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._products_v_blocks_cta_links_id_seq', 1, false);


--
-- Name: _products_v_blocks_media_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._products_v_blocks_media_block_id_seq', 1, false);


--
-- Name: _products_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._products_v_id_seq', 14, true);


--
-- Name: _products_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public._products_v_rels_id_seq', 49, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 7, true);


--
-- Name: categories_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_rels_id_seq', 61, true);


--
-- Name: footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.footer_id_seq', 1, true);


--
-- Name: footer_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.footer_rels_id_seq', 5, true);


--
-- Name: header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.header_id_seq', 1, true);


--
-- Name: header_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.header_rels_id_seq', 3, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.media_id_seq', 39, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: orders_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_rels_id_seq', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_id_seq', 3, true);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_rels_id_seq', 40, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 9, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 52, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: products_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_rels_id_seq', 35, true);


--
-- Name: redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.redirects_id_seq', 1, false);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.redirects_rels_id_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: settings_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.settings_rels_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: users_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_rels_id_seq', 1, true);


--
-- Name: users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_roles_id_seq', 448, true);


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: _pages_v _pages_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_rels _pages_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_archive _products_v_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_archive
    ADD CONSTRAINT _products_v_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_content_columns _products_v_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_content_columns
    ADD CONSTRAINT _products_v_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_content _products_v_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_content
    ADD CONSTRAINT _products_v_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_cta_links _products_v_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_cta_links
    ADD CONSTRAINT _products_v_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_cta _products_v_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_cta
    ADD CONSTRAINT _products_v_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_media_block _products_v_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_media_block
    ADD CONSTRAINT _products_v_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: _products_v _products_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v
    ADD CONSTRAINT _products_v_pkey PRIMARY KEY (id);


--
-- Name: _products_v_rels _products_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_pkey PRIMARY KEY (id);


--
-- Name: categories_breadcrumbs categories_breadcrumbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_rels categories_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_rels
    ADD CONSTRAINT categories_rels_pkey PRIMARY KEY (id);


--
-- Name: footer_nav_items footer_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_nav_items
    ADD CONSTRAINT footer_nav_items_pkey PRIMARY KEY (id);


--
-- Name: footer footer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer
    ADD CONSTRAINT footer_pkey PRIMARY KEY (id);


--
-- Name: footer_rels footer_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_pkey PRIMARY KEY (id);


--
-- Name: header_nav_items header_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_nav_items
    ADD CONSTRAINT header_nav_items_pkey PRIMARY KEY (id);


--
-- Name: header header_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_pkey PRIMARY KEY (id);


--
-- Name: header_rels header_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: orders_items orders_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_items
    ADD CONSTRAINT orders_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders_rels orders_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_rels
    ADD CONSTRAINT orders_rels_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_archive pages_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content pages_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta pages_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_media_block pages_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: pages_hero_links pages_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_rels pages_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_archive products_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_archive
    ADD CONSTRAINT products_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_content_columns products_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_content_columns
    ADD CONSTRAINT products_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_content products_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_content
    ADD CONSTRAINT products_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_cta_links products_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_cta_links
    ADD CONSTRAINT products_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_cta products_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_cta
    ADD CONSTRAINT products_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_media_block products_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_media_block
    ADD CONSTRAINT products_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_rels products_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_pkey PRIMARY KEY (id);


--
-- Name: redirects redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects
    ADD CONSTRAINT redirects_pkey PRIMARY KEY (id);


--
-- Name: redirects_rels redirects_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: settings_rels settings_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings_rels
    ADD CONSTRAINT settings_rels_pkey PRIMARY KEY (id);


--
-- Name: users_cart_items users_cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_cart_items
    ADD CONSTRAINT users_cart_items_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_rels users_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_rels
    ADD CONSTRAINT users_rels_pkey PRIMARY KEY (id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_archive_order_idx ON public._pages_v_blocks_archive USING btree (_order);


--
-- Name: _pages_v_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_archive_parent_id_idx ON public._pages_v_blocks_archive USING btree (_parent_id);


--
-- Name: _pages_v_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_archive_path_idx ON public._pages_v_blocks_archive USING btree (_path);


--
-- Name: _pages_v_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_columns_order_idx ON public._pages_v_blocks_content_columns USING btree (_order);


--
-- Name: _pages_v_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_columns_parent_id_idx ON public._pages_v_blocks_content_columns USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_order_idx ON public._pages_v_blocks_content USING btree (_order);


--
-- Name: _pages_v_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_parent_id_idx ON public._pages_v_blocks_content USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_path_idx ON public._pages_v_blocks_content USING btree (_path);


--
-- Name: _pages_v_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_links_order_idx ON public._pages_v_blocks_cta_links USING btree (_order);


--
-- Name: _pages_v_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_links_parent_id_idx ON public._pages_v_blocks_cta_links USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_order_idx ON public._pages_v_blocks_cta USING btree (_order);


--
-- Name: _pages_v_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_parent_id_idx ON public._pages_v_blocks_cta USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_path_idx ON public._pages_v_blocks_cta USING btree (_path);


--
-- Name: _pages_v_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_media_block_order_idx ON public._pages_v_blocks_media_block USING btree (_order);


--
-- Name: _pages_v_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_media_block_parent_id_idx ON public._pages_v_blocks_media_block USING btree (_parent_id);


--
-- Name: _pages_v_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_media_block_path_idx ON public._pages_v_blocks_media_block USING btree (_path);


--
-- Name: _pages_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_created_at_idx ON public._pages_v USING btree (created_at);


--
-- Name: _pages_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_latest_idx ON public._pages_v USING btree (latest);


--
-- Name: _pages_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_categories_id_idx ON public._pages_v_rels USING btree (categories_id);


--
-- Name: _pages_v_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_media_id_idx ON public._pages_v_rels USING btree (media_id);


--
-- Name: _pages_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_order_idx ON public._pages_v_rels USING btree ("order");


--
-- Name: _pages_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_pages_id_idx ON public._pages_v_rels USING btree (pages_id);


--
-- Name: _pages_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_parent_idx ON public._pages_v_rels USING btree (parent_id);


--
-- Name: _pages_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_path_idx ON public._pages_v_rels USING btree (path);


--
-- Name: _pages_v_rels_products_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_products_id_idx ON public._pages_v_rels USING btree (products_id);


--
-- Name: _pages_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_updated_at_idx ON public._pages_v USING btree (updated_at);


--
-- Name: _pages_v_version_hero_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_hero_links_order_idx ON public._pages_v_version_hero_links USING btree (_order);


--
-- Name: _pages_v_version_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_hero_links_parent_id_idx ON public._pages_v_version_hero_links USING btree (_parent_id);


--
-- Name: _pages_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_version__status_idx ON public._pages_v USING btree (version__status);


--
-- Name: _pages_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_version_created_at_idx ON public._pages_v USING btree (version_created_at);


--
-- Name: _pages_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_version_slug_idx ON public._pages_v USING btree (version_slug);


--
-- Name: _products_v_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_archive_order_idx ON public._products_v_blocks_archive USING btree (_order);


--
-- Name: _products_v_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_archive_parent_id_idx ON public._products_v_blocks_archive USING btree (_parent_id);


--
-- Name: _products_v_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_archive_path_idx ON public._products_v_blocks_archive USING btree (_path);


--
-- Name: _products_v_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_content_columns_order_idx ON public._products_v_blocks_content_columns USING btree (_order);


--
-- Name: _products_v_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_content_columns_parent_id_idx ON public._products_v_blocks_content_columns USING btree (_parent_id);


--
-- Name: _products_v_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_content_order_idx ON public._products_v_blocks_content USING btree (_order);


--
-- Name: _products_v_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_content_parent_id_idx ON public._products_v_blocks_content USING btree (_parent_id);


--
-- Name: _products_v_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_content_path_idx ON public._products_v_blocks_content USING btree (_path);


--
-- Name: _products_v_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_cta_links_order_idx ON public._products_v_blocks_cta_links USING btree (_order);


--
-- Name: _products_v_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_cta_links_parent_id_idx ON public._products_v_blocks_cta_links USING btree (_parent_id);


--
-- Name: _products_v_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_cta_order_idx ON public._products_v_blocks_cta USING btree (_order);


--
-- Name: _products_v_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_cta_parent_id_idx ON public._products_v_blocks_cta USING btree (_parent_id);


--
-- Name: _products_v_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_cta_path_idx ON public._products_v_blocks_cta USING btree (_path);


--
-- Name: _products_v_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_media_block_order_idx ON public._products_v_blocks_media_block USING btree (_order);


--
-- Name: _products_v_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_media_block_parent_id_idx ON public._products_v_blocks_media_block USING btree (_parent_id);


--
-- Name: _products_v_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_blocks_media_block_path_idx ON public._products_v_blocks_media_block USING btree (_path);


--
-- Name: _products_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_created_at_idx ON public._products_v USING btree (created_at);


--
-- Name: _products_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_latest_idx ON public._products_v USING btree (latest);


--
-- Name: _products_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_rels_categories_id_idx ON public._products_v_rels USING btree (categories_id);


--
-- Name: _products_v_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_rels_media_id_idx ON public._products_v_rels USING btree (media_id);


--
-- Name: _products_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_rels_order_idx ON public._products_v_rels USING btree ("order");


--
-- Name: _products_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_rels_pages_id_idx ON public._products_v_rels USING btree (pages_id);


--
-- Name: _products_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_rels_parent_idx ON public._products_v_rels USING btree (parent_id);


--
-- Name: _products_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_rels_path_idx ON public._products_v_rels USING btree (path);


--
-- Name: _products_v_rels_products_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_rels_products_id_idx ON public._products_v_rels USING btree (products_id);


--
-- Name: _products_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_updated_at_idx ON public._products_v USING btree (updated_at);


--
-- Name: _products_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_version_version__status_idx ON public._products_v USING btree (version__status);


--
-- Name: _products_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_version_version_created_at_idx ON public._products_v USING btree (version_created_at);


--
-- Name: _products_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _products_v_version_version_slug_idx ON public._products_v USING btree (version_slug);


--
-- Name: categories_breadcrumbs_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_breadcrumbs_order_idx ON public.categories_breadcrumbs USING btree (_order);


--
-- Name: categories_breadcrumbs_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_breadcrumbs_parent_id_idx ON public.categories_breadcrumbs USING btree (_parent_id);


--
-- Name: categories_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_created_at_idx ON public.categories USING btree (created_at);


--
-- Name: categories_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_rels_categories_id_idx ON public.categories_rels USING btree (categories_id);


--
-- Name: categories_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_rels_media_id_idx ON public.categories_rels USING btree (media_id);


--
-- Name: categories_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_rels_order_idx ON public.categories_rels USING btree ("order");


--
-- Name: categories_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_rels_parent_idx ON public.categories_rels USING btree (parent_id);


--
-- Name: categories_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_rels_path_idx ON public.categories_rels USING btree (path);


--
-- Name: footer_nav_items_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX footer_nav_items_order_idx ON public.footer_nav_items USING btree (_order);


--
-- Name: footer_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX footer_nav_items_parent_id_idx ON public.footer_nav_items USING btree (_parent_id);


--
-- Name: footer_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX footer_rels_media_id_idx ON public.footer_rels USING btree (media_id);


--
-- Name: footer_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX footer_rels_order_idx ON public.footer_rels USING btree ("order");


--
-- Name: footer_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX footer_rels_pages_id_idx ON public.footer_rels USING btree (pages_id);


--
-- Name: footer_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX footer_rels_parent_idx ON public.footer_rels USING btree (parent_id);


--
-- Name: footer_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX footer_rels_path_idx ON public.footer_rels USING btree (path);


--
-- Name: header_nav_items_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX header_nav_items_order_idx ON public.header_nav_items USING btree (_order);


--
-- Name: header_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX header_nav_items_parent_id_idx ON public.header_nav_items USING btree (_parent_id);


--
-- Name: header_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX header_rels_media_id_idx ON public.header_rels USING btree (media_id);


--
-- Name: header_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX header_rels_order_idx ON public.header_rels USING btree ("order");


--
-- Name: header_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX header_rels_pages_id_idx ON public.header_rels USING btree (pages_id);


--
-- Name: header_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX header_rels_parent_idx ON public.header_rels USING btree (parent_id);


--
-- Name: header_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX header_rels_path_idx ON public.header_rels USING btree (path);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: orders_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_created_at_idx ON public.orders USING btree (created_at);


--
-- Name: orders_items_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_items_order_idx ON public.orders_items USING btree (_order);


--
-- Name: orders_items_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_items_parent_id_idx ON public.orders_items USING btree (_parent_id);


--
-- Name: orders_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_rels_order_idx ON public.orders_rels USING btree ("order");


--
-- Name: orders_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_rels_parent_idx ON public.orders_rels USING btree (parent_id);


--
-- Name: orders_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_rels_path_idx ON public.orders_rels USING btree (path);


--
-- Name: orders_rels_products_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_rels_products_id_idx ON public.orders_rels USING btree (products_id);


--
-- Name: orders_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_rels_users_id_idx ON public.orders_rels USING btree (users_id);


--
-- Name: pages__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages__status_idx ON public.pages USING btree (_status);


--
-- Name: pages_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_archive_order_idx ON public.pages_blocks_archive USING btree (_order);


--
-- Name: pages_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_archive_parent_id_idx ON public.pages_blocks_archive USING btree (_parent_id);


--
-- Name: pages_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_archive_path_idx ON public.pages_blocks_archive USING btree (_path);


--
-- Name: pages_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_columns_order_idx ON public.pages_blocks_content_columns USING btree (_order);


--
-- Name: pages_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_columns_parent_id_idx ON public.pages_blocks_content_columns USING btree (_parent_id);


--
-- Name: pages_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_order_idx ON public.pages_blocks_content USING btree (_order);


--
-- Name: pages_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_parent_id_idx ON public.pages_blocks_content USING btree (_parent_id);


--
-- Name: pages_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_path_idx ON public.pages_blocks_content USING btree (_path);


--
-- Name: pages_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_links_order_idx ON public.pages_blocks_cta_links USING btree (_order);


--
-- Name: pages_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_links_parent_id_idx ON public.pages_blocks_cta_links USING btree (_parent_id);


--
-- Name: pages_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_order_idx ON public.pages_blocks_cta USING btree (_order);


--
-- Name: pages_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_parent_id_idx ON public.pages_blocks_cta USING btree (_parent_id);


--
-- Name: pages_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_path_idx ON public.pages_blocks_cta USING btree (_path);


--
-- Name: pages_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_media_block_order_idx ON public.pages_blocks_media_block USING btree (_order);


--
-- Name: pages_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_media_block_parent_id_idx ON public.pages_blocks_media_block USING btree (_parent_id);


--
-- Name: pages_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_media_block_path_idx ON public.pages_blocks_media_block USING btree (_path);


--
-- Name: pages_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_created_at_idx ON public.pages USING btree (created_at);


--
-- Name: pages_hero_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_hero_links_order_idx ON public.pages_hero_links USING btree (_order);


--
-- Name: pages_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_hero_links_parent_id_idx ON public.pages_hero_links USING btree (_parent_id);


--
-- Name: pages_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_categories_id_idx ON public.pages_rels USING btree (categories_id);


--
-- Name: pages_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_media_id_idx ON public.pages_rels USING btree (media_id);


--
-- Name: pages_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_order_idx ON public.pages_rels USING btree ("order");


--
-- Name: pages_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_pages_id_idx ON public.pages_rels USING btree (pages_id);


--
-- Name: pages_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_parent_idx ON public.pages_rels USING btree (parent_id);


--
-- Name: pages_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_path_idx ON public.pages_rels USING btree (path);


--
-- Name: pages_rels_products_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_products_id_idx ON public.pages_rels USING btree (products_id);


--
-- Name: pages_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_slug_idx ON public.pages USING btree (slug);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: products__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products__status_idx ON public.products USING btree (_status);


--
-- Name: products_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_archive_order_idx ON public.products_blocks_archive USING btree (_order);


--
-- Name: products_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_archive_parent_id_idx ON public.products_blocks_archive USING btree (_parent_id);


--
-- Name: products_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_archive_path_idx ON public.products_blocks_archive USING btree (_path);


--
-- Name: products_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_content_columns_order_idx ON public.products_blocks_content_columns USING btree (_order);


--
-- Name: products_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_content_columns_parent_id_idx ON public.products_blocks_content_columns USING btree (_parent_id);


--
-- Name: products_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_content_order_idx ON public.products_blocks_content USING btree (_order);


--
-- Name: products_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_content_parent_id_idx ON public.products_blocks_content USING btree (_parent_id);


--
-- Name: products_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_content_path_idx ON public.products_blocks_content USING btree (_path);


--
-- Name: products_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_cta_links_order_idx ON public.products_blocks_cta_links USING btree (_order);


--
-- Name: products_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_cta_links_parent_id_idx ON public.products_blocks_cta_links USING btree (_parent_id);


--
-- Name: products_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_cta_order_idx ON public.products_blocks_cta USING btree (_order);


--
-- Name: products_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_cta_parent_id_idx ON public.products_blocks_cta USING btree (_parent_id);


--
-- Name: products_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_cta_path_idx ON public.products_blocks_cta USING btree (_path);


--
-- Name: products_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_media_block_order_idx ON public.products_blocks_media_block USING btree (_order);


--
-- Name: products_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_media_block_parent_id_idx ON public.products_blocks_media_block USING btree (_parent_id);


--
-- Name: products_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blocks_media_block_path_idx ON public.products_blocks_media_block USING btree (_path);


--
-- Name: products_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_created_at_idx ON public.products USING btree (created_at);


--
-- Name: products_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_rels_categories_id_idx ON public.products_rels USING btree (categories_id);


--
-- Name: products_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_rels_media_id_idx ON public.products_rels USING btree (media_id);


--
-- Name: products_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_rels_order_idx ON public.products_rels USING btree ("order");


--
-- Name: products_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_rels_pages_id_idx ON public.products_rels USING btree (pages_id);


--
-- Name: products_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_rels_parent_idx ON public.products_rels USING btree (parent_id);


--
-- Name: products_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_rels_path_idx ON public.products_rels USING btree (path);


--
-- Name: products_rels_products_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_rels_products_id_idx ON public.products_rels USING btree (products_id);


--
-- Name: products_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_slug_idx ON public.products USING btree (slug);


--
-- Name: redirects_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_created_at_idx ON public.redirects USING btree (created_at);


--
-- Name: redirects_from_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_from_idx ON public.redirects USING btree ("from");


--
-- Name: redirects_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_order_idx ON public.redirects_rels USING btree ("order");


--
-- Name: redirects_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_pages_id_idx ON public.redirects_rels USING btree (pages_id);


--
-- Name: redirects_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_parent_idx ON public.redirects_rels USING btree (parent_id);


--
-- Name: redirects_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_path_idx ON public.redirects_rels USING btree (path);


--
-- Name: redirects_rels_products_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_products_id_idx ON public.redirects_rels USING btree (products_id);


--
-- Name: settings_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX settings_rels_order_idx ON public.settings_rels USING btree ("order");


--
-- Name: settings_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX settings_rels_pages_id_idx ON public.settings_rels USING btree (pages_id);


--
-- Name: settings_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX settings_rels_parent_idx ON public.settings_rels USING btree (parent_id);


--
-- Name: settings_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX settings_rels_path_idx ON public.settings_rels USING btree (path);


--
-- Name: users_cart_items_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_cart_items_order_idx ON public.users_cart_items USING btree (_order);


--
-- Name: users_cart_items_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_cart_items_parent_id_idx ON public.users_cart_items USING btree (_parent_id);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_rels_order_idx ON public.users_rels USING btree ("order");


--
-- Name: users_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_rels_parent_idx ON public.users_rels USING btree (parent_id);


--
-- Name: users_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_rels_path_idx ON public.users_rels USING btree (path);


--
-- Name: users_rels_products_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_rels_products_id_idx ON public.users_rels USING btree (products_id);


--
-- Name: users_roles_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_roles_order_idx ON public.users_roles USING btree ("order");


--
-- Name: users_roles_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_roles_parent_idx ON public.users_roles USING btree (parent_id);


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_content(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_archive _products_v_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_archive
    ADD CONSTRAINT _products_v_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_content_columns _products_v_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_content_columns
    ADD CONSTRAINT _products_v_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v_blocks_content(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_content _products_v_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_content
    ADD CONSTRAINT _products_v_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_cta_links _products_v_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_cta_links
    ADD CONSTRAINT _products_v_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_cta _products_v_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_cta
    ADD CONSTRAINT _products_v_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_media_block _products_v_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_blocks_media_block
    ADD CONSTRAINT _products_v_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: categories_breadcrumbs categories_breadcrumbs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories_rels categories_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_rels
    ADD CONSTRAINT categories_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories_rels categories_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_rels
    ADD CONSTRAINT categories_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: categories_rels categories_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_rels
    ADD CONSTRAINT categories_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: footer_nav_items footer_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_nav_items
    ADD CONSTRAINT footer_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: header_nav_items header_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_nav_items
    ADD CONSTRAINT header_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.header(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.header(id) ON DELETE CASCADE;


--
-- Name: orders_items orders_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_items
    ADD CONSTRAINT orders_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: orders_rels orders_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_rels
    ADD CONSTRAINT orders_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: orders_rels orders_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_rels
    ADD CONSTRAINT orders_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders_rels orders_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_rels
    ADD CONSTRAINT orders_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_archive pages_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_content(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content pages_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta pages_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_media_block pages_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_hero_links pages_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: products_blocks_archive products_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_archive
    ADD CONSTRAINT products_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_blocks_content_columns products_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_content_columns
    ADD CONSTRAINT products_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products_blocks_content(id) ON DELETE CASCADE;


--
-- Name: products_blocks_content products_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_content
    ADD CONSTRAINT products_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_blocks_cta_links products_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_cta_links
    ADD CONSTRAINT products_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: products_blocks_cta products_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_cta
    ADD CONSTRAINT products_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_blocks_media_block products_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blocks_media_block
    ADD CONSTRAINT products_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.redirects(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: settings_rels settings_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings_rels
    ADD CONSTRAINT settings_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: settings_rels settings_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings_rels
    ADD CONSTRAINT settings_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.settings(id) ON DELETE CASCADE;


--
-- Name: users_cart_items users_cart_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_cart_items
    ADD CONSTRAINT users_cart_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_rels users_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_rels
    ADD CONSTRAINT users_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_rels users_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_rels
    ADD CONSTRAINT users_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: users_roles users_roles_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_parent_fk FOREIGN KEY (parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

