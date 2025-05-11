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
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: enum__pages_v_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


ALTER TYPE public.enum__pages_v_blocks_archive_populate_by OWNER TO postgres;

--
-- Name: enum__pages_v_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_blocks_archive_relation_to AS ENUM (
    'products'
);


ALTER TYPE public.enum__pages_v_blocks_archive_relation_to OWNER TO postgres;

--
-- Name: enum__pages_v_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_link_appearance OWNER TO postgres;

--
-- Name: enum__pages_v_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_link_type OWNER TO postgres;

--
-- Name: enum__pages_v_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


ALTER TYPE public.enum__pages_v_blocks_content_columns_size OWNER TO postgres;

--
-- Name: enum__pages_v_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_appearance AS ENUM (
    'primary',
    'secondary'
);


ALTER TYPE public.enum__pages_v_blocks_cta_links_link_appearance OWNER TO postgres;

--
-- Name: enum__pages_v_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_blocks_cta_links_link_type OWNER TO postgres;

--
-- Name: enum__pages_v_blocks_media_block_position; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_blocks_media_block_position AS ENUM (
    'default',
    'fullscreen'
);


ALTER TYPE public.enum__pages_v_blocks_media_block_position OWNER TO postgres;

--
-- Name: enum__pages_v_version_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


ALTER TYPE public.enum__pages_v_version_hero_links_link_appearance OWNER TO postgres;

--
-- Name: enum__pages_v_version_hero_links_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__pages_v_version_hero_links_link_type OWNER TO postgres;

--
-- Name: enum__pages_v_version_hero_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_version_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact',
    'customHero'
);


ALTER TYPE public.enum__pages_v_version_hero_type OWNER TO postgres;

--
-- Name: enum__pages_v_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__pages_v_version_status OWNER TO postgres;

--
-- Name: enum__products_v_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


ALTER TYPE public.enum__products_v_blocks_archive_populate_by OWNER TO postgres;

--
-- Name: enum__products_v_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_blocks_archive_relation_to AS ENUM (
    'products'
);


ALTER TYPE public.enum__products_v_blocks_archive_relation_to OWNER TO postgres;

--
-- Name: enum__products_v_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


ALTER TYPE public.enum__products_v_blocks_content_columns_link_appearance OWNER TO postgres;

--
-- Name: enum__products_v_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__products_v_blocks_content_columns_link_type OWNER TO postgres;

--
-- Name: enum__products_v_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


ALTER TYPE public.enum__products_v_blocks_content_columns_size OWNER TO postgres;

--
-- Name: enum__products_v_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_blocks_cta_links_link_appearance AS ENUM (
    'primary',
    'secondary'
);


ALTER TYPE public.enum__products_v_blocks_cta_links_link_appearance OWNER TO postgres;

--
-- Name: enum__products_v_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__products_v_blocks_cta_links_link_type OWNER TO postgres;

--
-- Name: enum__products_v_blocks_media_block_position; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_blocks_media_block_position AS ENUM (
    'default',
    'fullscreen'
);


ALTER TYPE public.enum__products_v_blocks_media_block_position OWNER TO postgres;

--
-- Name: enum__products_v_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__products_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__products_v_version_status OWNER TO postgres;

--
-- Name: enum_footer_nav_items_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_footer_nav_items_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_footer_nav_items_link_type OWNER TO postgres;

--
-- Name: enum_header_nav_items_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_header_nav_items_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_header_nav_items_link_type OWNER TO postgres;

--
-- Name: enum_pages_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


ALTER TYPE public.enum_pages_blocks_archive_populate_by OWNER TO postgres;

--
-- Name: enum_pages_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_blocks_archive_relation_to AS ENUM (
    'products'
);


ALTER TYPE public.enum_pages_blocks_archive_relation_to OWNER TO postgres;

--
-- Name: enum_pages_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


ALTER TYPE public.enum_pages_blocks_content_columns_link_appearance OWNER TO postgres;

--
-- Name: enum_pages_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_blocks_content_columns_link_type OWNER TO postgres;

--
-- Name: enum_pages_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


ALTER TYPE public.enum_pages_blocks_content_columns_size OWNER TO postgres;

--
-- Name: enum_pages_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_appearance AS ENUM (
    'primary',
    'secondary'
);


ALTER TYPE public.enum_pages_blocks_cta_links_link_appearance OWNER TO postgres;

--
-- Name: enum_pages_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_blocks_cta_links_link_type OWNER TO postgres;

--
-- Name: enum_pages_blocks_media_block_position; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_blocks_media_block_position AS ENUM (
    'default',
    'fullscreen'
);


ALTER TYPE public.enum_pages_blocks_media_block_position OWNER TO postgres;

--
-- Name: enum_pages_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_hero_links_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


ALTER TYPE public.enum_pages_hero_links_link_appearance OWNER TO postgres;

--
-- Name: enum_pages_hero_links_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_pages_hero_links_link_type OWNER TO postgres;

--
-- Name: enum_pages_hero_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact',
    'customHero'
);


ALTER TYPE public.enum_pages_hero_type OWNER TO postgres;

--
-- Name: enum_pages_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_pages_status OWNER TO postgres;

--
-- Name: enum_products_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


ALTER TYPE public.enum_products_blocks_archive_populate_by OWNER TO postgres;

--
-- Name: enum_products_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_blocks_archive_relation_to AS ENUM (
    'products'
);


ALTER TYPE public.enum_products_blocks_archive_relation_to OWNER TO postgres;

--
-- Name: enum_products_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'primary',
    'secondary'
);


ALTER TYPE public.enum_products_blocks_content_columns_link_appearance OWNER TO postgres;

--
-- Name: enum_products_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_products_blocks_content_columns_link_type OWNER TO postgres;

--
-- Name: enum_products_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


ALTER TYPE public.enum_products_blocks_content_columns_size OWNER TO postgres;

--
-- Name: enum_products_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_blocks_cta_links_link_appearance AS ENUM (
    'primary',
    'secondary'
);


ALTER TYPE public.enum_products_blocks_cta_links_link_appearance OWNER TO postgres;

--
-- Name: enum_products_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_products_blocks_cta_links_link_type OWNER TO postgres;

--
-- Name: enum_products_blocks_media_block_position; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_blocks_media_block_position AS ENUM (
    'default',
    'fullscreen'
);


ALTER TYPE public.enum_products_blocks_media_block_position OWNER TO postgres;

--
-- Name: enum_products_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_products_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_products_status OWNER TO postgres;

--
-- Name: enum_redirects_to_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_redirects_to_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_redirects_to_type OWNER TO postgres;

--
-- Name: enum_users_roles; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_roles AS ENUM (
    'admin',
    'customer'
);


ALTER TYPE public.enum_users_roles OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: _pages_v; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v OWNER TO postgres;

--
-- Name: _pages_v_blocks_archive; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v_blocks_archive OWNER TO postgres;

--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_blocks_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_archive_id_seq OWNER TO postgres;

--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_blocks_archive_id_seq OWNED BY public._pages_v_blocks_archive.id;


--
-- Name: _pages_v_blocks_content; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v_blocks_content OWNER TO postgres;

--
-- Name: _pages_v_blocks_content_columns; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v_blocks_content_columns OWNER TO postgres;

--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_blocks_content_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_content_columns_id_seq OWNER TO postgres;

--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_blocks_content_columns_id_seq OWNED BY public._pages_v_blocks_content_columns.id;


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_blocks_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_content_id_seq OWNER TO postgres;

--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_blocks_content_id_seq OWNED BY public._pages_v_blocks_content.id;


--
-- Name: _pages_v_blocks_cta; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v_blocks_cta OWNER TO postgres;

--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_blocks_cta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_cta_id_seq OWNER TO postgres;

--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_blocks_cta_id_seq OWNED BY public._pages_v_blocks_cta.id;


--
-- Name: _pages_v_blocks_cta_links; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v_blocks_cta_links OWNER TO postgres;

--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_blocks_cta_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_cta_links_id_seq OWNER TO postgres;

--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_blocks_cta_links_id_seq OWNED BY public._pages_v_blocks_cta_links.id;


--
-- Name: _pages_v_blocks_media_block; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v_blocks_media_block OWNER TO postgres;

--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_blocks_media_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_blocks_media_block_id_seq OWNER TO postgres;

--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_blocks_media_block_id_seq OWNED BY public._pages_v_blocks_media_block.id;


--
-- Name: _pages_v_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_id_seq OWNER TO postgres;

--
-- Name: _pages_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_id_seq OWNED BY public._pages_v.id;


--
-- Name: _pages_v_rels; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v_rels OWNER TO postgres;

--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_rels_id_seq OWNER TO postgres;

--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_rels_id_seq OWNED BY public._pages_v_rels.id;


--
-- Name: _pages_v_version_hero_links; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._pages_v_version_hero_links OWNER TO postgres;

--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_version_hero_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_version_hero_links_id_seq OWNER TO postgres;

--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_version_hero_links_id_seq OWNED BY public._pages_v_version_hero_links.id;


--
-- Name: _products_v; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._products_v OWNER TO postgres;

--
-- Name: _products_v_blocks_archive; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._products_v_blocks_archive OWNER TO postgres;

--
-- Name: _products_v_blocks_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._products_v_blocks_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._products_v_blocks_archive_id_seq OWNER TO postgres;

--
-- Name: _products_v_blocks_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._products_v_blocks_archive_id_seq OWNED BY public._products_v_blocks_archive.id;


--
-- Name: _products_v_blocks_content; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._products_v_blocks_content OWNER TO postgres;

--
-- Name: _products_v_blocks_content_columns; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._products_v_blocks_content_columns OWNER TO postgres;

--
-- Name: _products_v_blocks_content_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._products_v_blocks_content_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._products_v_blocks_content_columns_id_seq OWNER TO postgres;

--
-- Name: _products_v_blocks_content_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._products_v_blocks_content_columns_id_seq OWNED BY public._products_v_blocks_content_columns.id;


--
-- Name: _products_v_blocks_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._products_v_blocks_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._products_v_blocks_content_id_seq OWNER TO postgres;

--
-- Name: _products_v_blocks_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._products_v_blocks_content_id_seq OWNED BY public._products_v_blocks_content.id;


--
-- Name: _products_v_blocks_cta; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._products_v_blocks_cta OWNER TO postgres;

--
-- Name: _products_v_blocks_cta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._products_v_blocks_cta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._products_v_blocks_cta_id_seq OWNER TO postgres;

--
-- Name: _products_v_blocks_cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._products_v_blocks_cta_id_seq OWNED BY public._products_v_blocks_cta.id;


--
-- Name: _products_v_blocks_cta_links; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._products_v_blocks_cta_links OWNER TO postgres;

--
-- Name: _products_v_blocks_cta_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._products_v_blocks_cta_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._products_v_blocks_cta_links_id_seq OWNER TO postgres;

--
-- Name: _products_v_blocks_cta_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._products_v_blocks_cta_links_id_seq OWNED BY public._products_v_blocks_cta_links.id;


--
-- Name: _products_v_blocks_media_block; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._products_v_blocks_media_block OWNER TO postgres;

--
-- Name: _products_v_blocks_media_block_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._products_v_blocks_media_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._products_v_blocks_media_block_id_seq OWNER TO postgres;

--
-- Name: _products_v_blocks_media_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._products_v_blocks_media_block_id_seq OWNED BY public._products_v_blocks_media_block.id;


--
-- Name: _products_v_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._products_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._products_v_id_seq OWNER TO postgres;

--
-- Name: _products_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._products_v_id_seq OWNED BY public._products_v.id;


--
-- Name: _products_v_rels; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._products_v_rels OWNER TO postgres;

--
-- Name: _products_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._products_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._products_v_rels_id_seq OWNER TO postgres;

--
-- Name: _products_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._products_v_rels_id_seq OWNED BY public._products_v_rels.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_breadcrumbs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories_breadcrumbs (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    url character varying,
    label character varying
);


ALTER TABLE public.categories_breadcrumbs OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    media_id integer,
    categories_id integer
);


ALTER TABLE public.categories_rels OWNER TO postgres;

--
-- Name: categories_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_rels_id_seq OWNER TO postgres;

--
-- Name: categories_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_rels_id_seq OWNED BY public.categories_rels.id;


--
-- Name: footer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footer (
    id integer NOT NULL,
    copyright character varying,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.footer OWNER TO postgres;

--
-- Name: footer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.footer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footer_id_seq OWNER TO postgres;

--
-- Name: footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.footer_id_seq OWNED BY public.footer.id;


--
-- Name: footer_nav_items; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.footer_nav_items OWNER TO postgres;

--
-- Name: footer_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footer_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    media_id integer
);


ALTER TABLE public.footer_rels OWNER TO postgres;

--
-- Name: footer_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.footer_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footer_rels_id_seq OWNER TO postgres;

--
-- Name: footer_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.footer_rels_id_seq OWNED BY public.footer_rels.id;


--
-- Name: header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.header (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.header OWNER TO postgres;

--
-- Name: header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.header_id_seq OWNER TO postgres;

--
-- Name: header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.header_id_seq OWNED BY public.header.id;


--
-- Name: header_nav_items; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.header_nav_items OWNER TO postgres;

--
-- Name: header_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.header_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    media_id integer
);


ALTER TABLE public.header_rels OWNER TO postgres;

--
-- Name: header_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.header_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.header_rels_id_seq OWNER TO postgres;

--
-- Name: header_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.header_rels_id_seq OWNED BY public.header_rels.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    stripe_payment_intent_i_d character varying,
    total numeric NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    price numeric,
    quantity numeric
);


ALTER TABLE public.orders_items OWNER TO postgres;

--
-- Name: orders_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer,
    products_id integer
);


ALTER TABLE public.orders_rels OWNER TO postgres;

--
-- Name: orders_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_rels_id_seq OWNER TO postgres;

--
-- Name: orders_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_rels_id_seq OWNED BY public.orders_rels.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_blocks_archive; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pages_blocks_archive OWNER TO postgres;

--
-- Name: pages_blocks_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    invert_background boolean,
    block_name character varying
);


ALTER TABLE public.pages_blocks_content OWNER TO postgres;

--
-- Name: pages_blocks_content_columns; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pages_blocks_content_columns OWNER TO postgres;

--
-- Name: pages_blocks_cta; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pages_blocks_cta OWNER TO postgres;

--
-- Name: pages_blocks_cta_links; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pages_blocks_cta_links OWNER TO postgres;

--
-- Name: pages_blocks_media_block; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pages_blocks_media_block OWNER TO postgres;

--
-- Name: pages_hero_links; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pages_hero_links OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_rels; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pages_rels OWNER TO postgres;

--
-- Name: pages_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_rels_id_seq OWNER TO postgres;

--
-- Name: pages_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_rels_id_seq OWNED BY public.pages_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO postgres;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_migrations_id_seq OWNER TO postgres;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO postgres;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_id_seq OWNER TO postgres;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO postgres;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNER TO postgres;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_blocks_archive; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.products_blocks_archive OWNER TO postgres;

--
-- Name: products_blocks_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    invert_background boolean,
    block_name character varying
);


ALTER TABLE public.products_blocks_content OWNER TO postgres;

--
-- Name: products_blocks_content_columns; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.products_blocks_content_columns OWNER TO postgres;

--
-- Name: products_blocks_cta; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.products_blocks_cta OWNER TO postgres;

--
-- Name: products_blocks_cta_links; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.products_blocks_cta_links OWNER TO postgres;

--
-- Name: products_blocks_media_block; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.products_blocks_media_block OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_rels; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.products_rels OWNER TO postgres;

--
-- Name: products_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_rels_id_seq OWNER TO postgres;

--
-- Name: products_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_rels_id_seq OWNED BY public.products_rels.id;


--
-- Name: redirects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirects (
    id integer NOT NULL,
    "from" character varying NOT NULL,
    to_type public.enum_redirects_to_type,
    to_url character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.redirects OWNER TO postgres;

--
-- Name: redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.redirects_id_seq OWNER TO postgres;

--
-- Name: redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.redirects_id_seq OWNED BY public.redirects.id;


--
-- Name: redirects_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirects_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    products_id integer
);


ALTER TABLE public.redirects_rels OWNER TO postgres;

--
-- Name: redirects_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.redirects_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.redirects_rels_id_seq OWNER TO postgres;

--
-- Name: redirects_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.redirects_rels_id_seq OWNED BY public.redirects_rels.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: settings_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer
);


ALTER TABLE public.settings_rels OWNER TO postgres;

--
-- Name: settings_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_rels_id_seq OWNER TO postgres;

--
-- Name: settings_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_rels_id_seq OWNED BY public.settings_rels.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_cart_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    quantity numeric
);


ALTER TABLE public.users_cart_items OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    products_id integer
);


ALTER TABLE public.users_rels OWNER TO postgres;

--
-- Name: users_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_rels_id_seq OWNER TO postgres;

--
-- Name: users_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_rels_id_seq OWNED BY public.users_rels.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    "order" integer NOT NULL,
    parent_id integer NOT NULL,
    value public.enum_users_roles,
    id integer NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- Name: users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_roles_id_seq OWNER TO postgres;

--
-- Name: users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_roles_id_seq OWNED BY public.users_roles.id;


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: _pages_v id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v ALTER COLUMN id SET DEFAULT nextval('public._pages_v_id_seq'::regclass);


--
-- Name: _pages_v_blocks_archive id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_archive ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_archive_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_content ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content_columns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_columns_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_cta ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_links_id_seq'::regclass);


--
-- Name: _pages_v_blocks_media_block id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_media_block ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_media_block_id_seq'::regclass);


--
-- Name: _pages_v_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_rels ALTER COLUMN id SET DEFAULT nextval('public._pages_v_rels_id_seq'::regclass);


--
-- Name: _pages_v_version_hero_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_version_hero_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_hero_links_id_seq'::regclass);


--
-- Name: _products_v id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v ALTER COLUMN id SET DEFAULT nextval('public._products_v_id_seq'::regclass);


--
-- Name: _products_v_blocks_archive id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_archive ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_archive_id_seq'::regclass);


--
-- Name: _products_v_blocks_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_content ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_content_id_seq'::regclass);


--
-- Name: _products_v_blocks_content_columns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_content_columns ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_content_columns_id_seq'::regclass);


--
-- Name: _products_v_blocks_cta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_cta ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_cta_id_seq'::regclass);


--
-- Name: _products_v_blocks_cta_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_cta_links ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_cta_links_id_seq'::regclass);


--
-- Name: _products_v_blocks_media_block id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_media_block ALTER COLUMN id SET DEFAULT nextval('public._products_v_blocks_media_block_id_seq'::regclass);


--
-- Name: _products_v_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_rels ALTER COLUMN id SET DEFAULT nextval('public._products_v_rels_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categories_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_rels ALTER COLUMN id SET DEFAULT nextval('public.categories_rels_id_seq'::regclass);


--
-- Name: footer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer ALTER COLUMN id SET DEFAULT nextval('public.footer_id_seq'::regclass);


--
-- Name: footer_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_rels ALTER COLUMN id SET DEFAULT nextval('public.footer_rels_id_seq'::regclass);


--
-- Name: header id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header ALTER COLUMN id SET DEFAULT nextval('public.header_id_seq'::regclass);


--
-- Name: header_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_rels ALTER COLUMN id SET DEFAULT nextval('public.header_rels_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_rels ALTER COLUMN id SET DEFAULT nextval('public.orders_rels_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_rels ALTER COLUMN id SET DEFAULT nextval('public.pages_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_rels ALTER COLUMN id SET DEFAULT nextval('public.products_rels_id_seq'::regclass);


--
-- Name: redirects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirects ALTER COLUMN id SET DEFAULT nextval('public.redirects_id_seq'::regclass);


--
-- Name: redirects_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirects_rels ALTER COLUMN id SET DEFAULT nextval('public.redirects_rels_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: settings_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings_rels ALTER COLUMN id SET DEFAULT nextval('public.settings_rels_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_rels ALTER COLUMN id SET DEFAULT nextval('public.users_rels_id_seq'::regclass);


--
-- Name: users_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles ALTER COLUMN id SET DEFAULT nextval('public.users_roles_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: _pages_v; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _pages_v_blocks_archive; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _pages_v_blocks_content; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _pages_v_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _pages_v_blocks_cta; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _pages_v_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _pages_v_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _pages_v_rels; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _pages_v_version_hero_links; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _products_v; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _products_v_blocks_archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._products_v_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, _uuid, block_name) FROM stdin;
\.


--
-- Data for Name: _products_v_blocks_content; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: _products_v_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._products_v_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
\.


--
-- Data for Name: _products_v_blocks_cta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._products_v_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, _uuid, block_name) FROM stdin;
\.


--
-- Data for Name: _products_v_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._products_v_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance, _uuid) FROM stdin;
\.


--
-- Data for Name: _products_v_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._products_v_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", _uuid, block_name) FROM stdin;
\.


--
-- Data for Name: _products_v_rels; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, title, updated_at, created_at) FROM stdin;
5	Tattoo collections	2025-05-08 01:14:42.152+00	2025-05-08 01:14:42.194+00
4	Canvas Art Collections	2025-05-08 07:25:59.527+00	2025-05-08 01:08:45.111+00
6	Tattoo Supplies & Tools	2025-05-08 14:05:35.486+00	2025-05-08 01:15:56.678+00
7	Client Services	2025-05-08 14:06:21.27+00	2025-05-08 07:09:56.56+00
\.


--
-- Data for Name: categories_breadcrumbs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories_breadcrumbs (_order, _parent_id, id, url, label) FROM stdin;
1	5	681c05821cf96e2dec30d50b	\N	Tattoo collections
1	4	681c5c876f745c142845619f	\N	Canvas Art Collections
1	6	681cba2faa58c90e08bcfdd2	\N	Tattoo Supplies & Tools
1	7	681cba5daa58c90e08bcfdd3	\N	Client Services
\.


--
-- Data for Name: categories_rels; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: footer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footer (id, copyright, updated_at, created_at) FROM stdin;
1	'© 2025 Kikky. All rights reserved.	2025-05-07 12:20:22.207+00	\N
\.


--
-- Data for Name: footer_nav_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footer_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	681b4d4b26de9721ff73411b	custom	\N	https://www.instagram.com/kikky_tattoos?igsh=MWJ0Y21yZHZyczBydQ==	instagram
2	1	681b4de826de9721ff73411c	custom	\N	https://wa.link/n4bymb	WhatsApp link
\.


--
-- Data for Name: footer_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footer_rels (id, "order", parent_id, path, pages_id, media_id) FROM stdin;
4	\N	1	navItems.0.link.icon	\N	6
5	\N	1	navItems.1.link.icon	\N	7
\.


--
-- Data for Name: header; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.header (id, updated_at, created_at) FROM stdin;
1	2025-05-07 11:17:52.484+00	\N
\.


--
-- Data for Name: header_nav_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.header_nav_items (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label) FROM stdin;
1	1	681b40f28ddda214d0fb664b	reference	\N	\N	Home
2	1	681afd3c763e6d41b4283303	reference	\N	\N	Shop
\.


--
-- Data for Name: header_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.header_rels (id, "order", parent_id, path, pages_id, media_id) FROM stdin;
2	\N	1	navItems.0.link.reference	2	\N
3	\N	1	navItems.1.link.reference	1	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, stripe_payment_intent_i_d, total, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: orders_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_items (_order, _parent_id, id, price, quantity) FROM stdin;
\.


--
-- Data for Name: orders_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_rels (id, "order", parent_id, path, users_id, products_id) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, title, published_on, hero_type, hero_rich_text, slug, meta_title, meta_description, updated_at, created_at, _status) FROM stdin;
3	Cart	2025-05-07 06:26:57.711+00	lowImpact	[{"type": "h1", "children": [{"text": "Cart"}]}, {"type": "p", "children": [{"text": "This cart saves to local storage so you can continue shopping later. Once you authenticate with Payload, your cart will sync to your user profile so you can continue shopping from any device. This hero and the content below the cart are completely dynamic and "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}]}]	cart	Cart	Your cart will sync to your user profile so you can continue shopping from any device.	2025-05-07 06:26:57.078+00	2025-05-07 06:26:57.078+00	published
1	Products	2025-05-07 06:26:39.214+00	lowImpact	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector.\\n\\n"}]}]	products	Kikky art studio - Explore Our Art & Tattoo Essentials	From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces .	2025-05-08 13:17:55.51+00	2025-05-08 13:16:55.957+00	published
2	Home	2025-05-07 06:26:45.944+00	customHero	[{"type": "h3", "children": [{"bold": true, "text": "Welcome to "}]}, {"type": "large-body", "children": [{"bold": true, "text": "Kikky Art Studio"}]}, {"type": "large-body", "children": [{"text": "Your creative partner in "}]}, {"type": "large-body", "children": [{"text": "transforming spaces and expressions. \\n\\n"}]}]	home	My Store	An open-source e-commerce store built with Payload and Next.js.	2025-05-08 00:35:59.524+00	2025-05-08 00:33:47.873+00	published
\.


--
-- Data for Name: pages_blocks_archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, block_name) FROM stdin;
3	2	layout	681afd25763e6d41b42832f0	[{"type": "h4", "children": [{"text": "Recent Products"}]}, {"type": "p", "children": [{"text": "The products below are displayed in an \\"Archive\\" layout building block which is an extremely powerful way to display documents on a page. It can be auto-populated by collection or by category, or products can be individually selected. Pagination controls will automatically appear if the number of results exceeds the number of items per page."}]}]	collection	products	10	\N	Archive Block
1	1	layout	681afd1f763e6d41b42832ed	[{"type": "p", "children": [{"text": "From premium tattoo supplies to custom canvas paintings, Kikky Art Studio brings you quality tools and creative pieces designed to inspire every artist and collector."}]}]	collection	products	10	\N	Archive Block
\.


--
-- Data for Name: pages_blocks_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_blocks_content (_order, _parent_id, _path, id, invert_background, block_name) FROM stdin;
1	3	layout	681afd31763e6d41b42832ff	\N	\N
1	2	layout	681afd25763e6d41b42832ee	\N	Content Block
\.


--
-- Data for Name: pages_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: pages_blocks_cta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, block_name) FROM stdin;
2	3	layout	681afd31763e6d41b4283300	\N	[{"type": "h4", "children": [{"text": "Continue shopping"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	CTA
4	2	layout	681afd25763e6d41b42832f1	\N	[{"type": "h4", "children": [{"text": "Shop now"}]}, {"children": [{"text": "This is a custom layout building block "}, {"url": "/admin", "type": "link", "children": [{"text": "configured in the admin dashboard"}], "linkType": "custom"}, {"text": "."}]}]	CTA
\.


--
-- Data for Name: pages_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	681afd31763e6d41b4283300	681afd31763e6d41b4283302	reference	\N		Continue shopping	primary
1	681afd25763e6d41b42832f1	681afd25763e6d41b42832fe	reference	\N		Shop now	primary
\.


--
-- Data for Name: pages_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", block_name) FROM stdin;
2	2	layout	681afd25763e6d41b42832ef	\N	default	Media Block
\.


--
-- Data for Name: pages_hero_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_hero_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
1	2	681afd25763e6d41b42832f2	reference	\N		Shop now	primary
\.


--
-- Data for Name: pages_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_rels (id, "order", parent_id, path, pages_id, media_id, categories_id, products_id) FROM stdin;
6	\N	3	layout.1.links.0.link.reference	1	\N	\N	\N
37	\N	2	hero.links.0.link.reference	1	\N	\N	\N
38	\N	2	hero.media	\N	13	\N	\N
39	\N	2	layout.1.media	\N	2	\N	\N
40	\N	2	layout.3.links.0.link.reference	1	\N	\N	\N
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2025-05-08 17:29:45.003+00	2025-05-06 18:22:31.031+00
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, published_on, stripe_product_i_d, price_j_s_o_n, enable_paywall, slug, skip_sync, meta_title, meta_description, updated_at, created_at, _status) FROM stdin;
5	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	2025-05-08 13:35:36.155+00	\N	\N	\N	kikky-art-studio--hxh-gon-and-kilua	f	Custom Canvas Art | Kikky Art Studio- HxH Gon and Kilua	Stunning hand-painted canvas artwork featuring Gon Freecss and Killua Zoldyck from Hunter x Hunter. 	2025-05-08 13:35:37.052+00	2025-05-08 13:35:37.052+00	published
4	Transforming Scars Into Stunning Tattoo Art	2025-05-08 12:42:13.416+00	\N	\N	\N	transforming-scars-into-stunning-tattoo-art	f	Transforming Scars Into Stunning Tattoo Art-Kikky art	This expertly crafted cover-up tattoo seamlessly blends a detailed compass rose and a roman numeral timepiece to transform and conceal scars .	2025-05-08 13:36:07.853+00	2025-05-08 12:42:14.275+00	published
6	Urban Street Art Mural – Vibrant Cityscape on Container Wall	2025-05-08 13:41:29.185+00	\N	\N	\N	urban-street-art-mural--vibrant-cityscape-on-container-wall	f	Urban Street Art Mural – Vibrant Cityscape on Container Wall	Experience the essence of city nightlife through this captivating urban street art mural featuring a cityscape with glowing lights and  skyscrapers.	2025-05-08 13:41:30.095+00	2025-05-08 13:41:30.095+00	published
7	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	2025-05-08 13:45:29.495+00	\N	\N	\N	neon-glow-portrait---afrocentric-expressionism-on-canvas	f	Neon Glow Portrait  – Afrocentric Expressionism on Canvas	Illuminate your space with this powerful Afrocentric portrait, painted in a unique blend of neon hues and expressive brushwork.	2025-05-08 13:45:30.41+00	2025-05-08 13:45:30.41+00	published
8	Batman Forearm Tattoo – Dark Knight Black Ink Design	2025-05-08 13:48:27.657+00	\N	\N	\N	batman-forearm-tattoo--dark-knight-black-ink-design	f	Batman Forearm Tattoo – Dark Knight Black Ink Design	Featuring detailed linework and bold shading, this black ink design brings the iconic Dark Knight to life with a fierce and artistic edge	2025-05-08 14:23:16.787+00	2025-05-08 13:48:28.57+00	published
\.


--
-- Data for Name: products_blocks_archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_blocks_archive (_order, _parent_id, _path, id, intro_content, "populateBy", "relationTo", "limit", populated_docs_total, block_name) FROM stdin;
\.


--
-- Data for Name: products_blocks_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_blocks_content (_order, _parent_id, _path, id, invert_background, block_name) FROM stdin;
1	5	layout	681cb328aa58c90e08bcfdca	\N	\N
1	4	layout	681ca6a5aa58c90e08bcfdc9	\N	\N
1	6	layout	681cb489aa58c90e08bcfdcc	\N	\N
1	7	layout	681cb579aa58c90e08bcfdcd	\N	\N
\.


--
-- Data for Name: products_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_blocks_content_columns (_order, _parent_id, id, size, rich_text, enable_link, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
\.


--
-- Data for Name: products_blocks_cta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_blocks_cta (_order, _parent_id, _path, id, invert_background, rich_text, block_name) FROM stdin;
\.


--
-- Data for Name: products_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_blocks_cta_links (_order, _parent_id, id, link_type, link_new_tab, link_url, link_label, link_appearance) FROM stdin;
\.


--
-- Data for Name: products_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_blocks_media_block (_order, _parent_id, _path, id, invert_background, "position", block_name) FROM stdin;
\.


--
-- Data for Name: products_rels; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: redirects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redirects (id, "from", to_type, to_url, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: redirects_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redirects_rels (id, "order", parent_id, path, pages_id, products_id) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, updated_at, created_at) FROM stdin;
1	2025-05-07 06:27:04.533+00	\N
\.


--
-- Data for Name: settings_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings_rels (id, "order", parent_id, path, pages_id) FROM stdin;
1	\N	1	productsPage	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, stripe_customer_i_d, skip_sync, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
1	kikkyart@gmail	\N	\N	2025-05-08 14:57:47.12+00	2025-05-07 06:23:11.263+00	kikkyart@gmail.com	\N	\N	126f62f9ad91b6574fb2ca25183c9d4f26b775e87eacfce010a09bc9fc22bea0	52b336d8a0fc3cda3acf309f85145f6a8a51ff0b5bccc343cc1f9aa1319d2f5601c6b499124711997b65f5fd3b8df39bf553520f8118d35574bbbdcd323123e1832410ba9a84c1ce9b36485da64439d6dfca7b20a495c813983010e7826615fe00ccf8cc8a60954613c489b1113bb8094f3e189bdf931e06865eaa23d434c0ea9cd66a4a126506780875249c567cf39f3ff6afd37a7dc632314fd2c716ee92e94871c563717d3bcbb0510ec4260f604a9b89f3f387f3aca3f4b09358697a0816bee5408555fa9bcae0c412b132b767bbcf64e03ecc968c25927d907ed7aa48672283cb0ea0f934f6bfb89be041069c5991ca306ad77f0080b12cfa2d9333646cc30d8109addd2ffc8b2f1f901723428fa42cec454e1978a948f1a60d9d5c10655fd32d8c32772a97ef843ff75c53545313852809abe8cc7b6217dc9a9be159655cb769ee287fe5f21c6586ea72f9f0ffc308249d7792307d2c7b8a8b46cdcc8c757ecba4e739f1e617dfa79cbbb7cc3fa1ee30bebe6b6d152f86e54294f6e6c1a6d789137f4754c833146cbd5dc0266f7e898f29a04876a8ce8316831b7c964e3ecfb13d5d6dee1078477f6c22ab418e58c5bb0d0e3d41e6f07a6e3c76622b6615c1dde5bc0e62db4d70cd4deaf99cf9e367d2e4eb543464fadba74d4c94ac71023ec8e226b9afb72137be92494f14a4f8301a64e0be866e2b5db487467d08e8	0	\N
\.


--
-- Data for Name: users_cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_cart_items (_order, _parent_id, id, quantity) FROM stdin;
1	1	681cc66b817a134814fea1e3	1
\.


--
-- Data for Name: users_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_rels (id, "order", parent_id, path, products_id) FROM stdin;
1	\N	1	cart.items.0.product	7
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_roles ("order", parent_id, value, id) FROM stdin;
1	1	customer	447
2	1	admin	448
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-05-06 10:04:24
20211116045059	2025-05-06 10:04:27
20211116050929	2025-05-06 10:04:29
20211116051442	2025-05-06 10:04:31
20211116212300	2025-05-06 10:04:34
20211116213355	2025-05-06 10:04:36
20211116213934	2025-05-06 10:04:38
20211116214523	2025-05-06 10:04:41
20211122062447	2025-05-06 10:04:43
20211124070109	2025-05-06 10:04:45
20211202204204	2025-05-06 10:04:47
20211202204605	2025-05-06 10:04:49
20211210212804	2025-05-06 10:04:56
20211228014915	2025-05-06 10:04:58
20220107221237	2025-05-06 10:05:00
20220228202821	2025-05-06 10:05:02
20220312004840	2025-05-06 10:05:04
20220603231003	2025-05-06 10:05:08
20220603232444	2025-05-06 10:05:10
20220615214548	2025-05-06 10:05:12
20220712093339	2025-05-06 10:05:14
20220908172859	2025-05-06 10:05:16
20220916233421	2025-05-06 10:05:19
20230119133233	2025-05-06 10:05:21
20230128025114	2025-05-06 10:05:24
20230128025212	2025-05-06 10:05:26
20230227211149	2025-05-06 10:05:28
20230228184745	2025-05-06 10:05:30
20230308225145	2025-05-06 10:05:32
20230328144023	2025-05-06 10:05:34
20231018144023	2025-05-06 10:05:36
20231204144023	2025-05-06 10:05:40
20231204144024	2025-05-06 10:05:42
20231204144025	2025-05-06 10:05:44
20240108234812	2025-05-06 10:05:46
20240109165339	2025-05-06 10:05:48
20240227174441	2025-05-06 10:05:52
20240311171622	2025-05-06 10:05:55
20240321100241	2025-05-06 10:05:59
20240401105812	2025-05-06 10:06:03
20240418121054	2025-05-06 10:06:04
20240523004032	2025-05-06 10:06:07
20240618124746	2025-05-06 10:06:09
20240801235015	2025-05-06 10:06:10
20240805133720	2025-05-06 10:06:11
20240827160934	2025-05-06 10:06:12
20240919163303	2025-05-06 10:06:14
20240919163305	2025-05-06 10:06:15
20241019105805	2025-05-06 10:06:16
20241030150047	2025-05-06 10:06:20
20241108114728	2025-05-06 10:06:21
20241121104152	2025-05-06 10:06:23
20241130184212	2025-05-06 10:06:24
20241220035512	2025-05-06 10:06:25
20241220123912	2025-05-06 10:06:26
20241224161212	2025-05-06 10:06:28
20250107150512	2025-05-06 10:06:29
20250110162412	2025-05-06 10:06:30
20250123174212	2025-05-06 10:06:32
20250128220012	2025-05-06 10:06:33
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-05-06 10:04:20.540144
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-05-06 10:04:20.545381
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-05-06 10:04:20.549027
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-05-06 10:04:20.569431
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-05-06 10:04:20.595927
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-05-06 10:04:20.600291
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-05-06 10:04:20.604796
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-05-06 10:04:20.609437
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-05-06 10:04:20.61343
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-05-06 10:04:20.617361
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-05-06 10:04:20.622481
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-05-06 10:04:20.62856
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-05-06 10:04:20.638985
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-05-06 10:04:20.643447
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-05-06 10:04:20.648009
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-05-06 10:04:20.682363
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-05-06 10:04:20.687642
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-05-06 10:04:20.694032
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-05-06 10:04:20.698826
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-05-06 10:04:20.70759
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-05-06 10:04:20.712076
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-05-06 10:04:20.724446
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-05-06 10:04:20.754762
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-05-06 10:04:20.782753
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-05-06 10:04:20.786971
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-05-06 10:04:20.791245
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_blocks_archive_id_seq', 15, true);


--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_blocks_content_columns_id_seq', 101, true);


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_blocks_content_id_seq', 11, true);


--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_blocks_cta_id_seq', 11, true);


--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_blocks_cta_links_id_seq', 11, true);


--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_blocks_media_block_id_seq', 10, true);


--
-- Name: _pages_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_id_seq', 16, true);


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_rels_id_seq', 60, true);


--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_version_hero_links_id_seq', 12, true);


--
-- Name: _products_v_blocks_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._products_v_blocks_archive_id_seq', 1, false);


--
-- Name: _products_v_blocks_content_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._products_v_blocks_content_columns_id_seq', 10, true);


--
-- Name: _products_v_blocks_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._products_v_blocks_content_id_seq', 17, true);


--
-- Name: _products_v_blocks_cta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._products_v_blocks_cta_id_seq', 1, false);


--
-- Name: _products_v_blocks_cta_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._products_v_blocks_cta_links_id_seq', 1, false);


--
-- Name: _products_v_blocks_media_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._products_v_blocks_media_block_id_seq', 1, false);


--
-- Name: _products_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._products_v_id_seq', 14, true);


--
-- Name: _products_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._products_v_rels_id_seq', 49, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 7, true);


--
-- Name: categories_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_rels_id_seq', 61, true);


--
-- Name: footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.footer_id_seq', 1, true);


--
-- Name: footer_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.footer_rels_id_seq', 5, true);


--
-- Name: header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.header_id_seq', 1, true);


--
-- Name: header_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.header_rels_id_seq', 3, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 39, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: orders_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_rels_id_seq', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 3, true);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_rels_id_seq', 40, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 9, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 52, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: products_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_rels_id_seq', 35, true);


--
-- Name: redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.redirects_id_seq', 1, false);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.redirects_rels_id_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: settings_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_rels_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: users_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_rels_id_seq', 1, true);


--
-- Name: users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_roles_id_seq', 448, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: _pages_v _pages_v_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_rels _pages_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_archive _products_v_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_archive
    ADD CONSTRAINT _products_v_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_content_columns _products_v_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_content_columns
    ADD CONSTRAINT _products_v_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_content _products_v_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_content
    ADD CONSTRAINT _products_v_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_cta_links _products_v_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_cta_links
    ADD CONSTRAINT _products_v_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_cta _products_v_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_cta
    ADD CONSTRAINT _products_v_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: _products_v_blocks_media_block _products_v_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_media_block
    ADD CONSTRAINT _products_v_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: _products_v _products_v_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v
    ADD CONSTRAINT _products_v_pkey PRIMARY KEY (id);


--
-- Name: _products_v_rels _products_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_pkey PRIMARY KEY (id);


--
-- Name: categories_breadcrumbs categories_breadcrumbs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_rels categories_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_rels
    ADD CONSTRAINT categories_rels_pkey PRIMARY KEY (id);


--
-- Name: footer_nav_items footer_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_nav_items
    ADD CONSTRAINT footer_nav_items_pkey PRIMARY KEY (id);


--
-- Name: footer footer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer
    ADD CONSTRAINT footer_pkey PRIMARY KEY (id);


--
-- Name: footer_rels footer_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_pkey PRIMARY KEY (id);


--
-- Name: header_nav_items header_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_nav_items
    ADD CONSTRAINT header_nav_items_pkey PRIMARY KEY (id);


--
-- Name: header header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_pkey PRIMARY KEY (id);


--
-- Name: header_rels header_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: orders_items orders_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_items
    ADD CONSTRAINT orders_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders_rels orders_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_rels
    ADD CONSTRAINT orders_rels_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_archive pages_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content pages_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta pages_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_media_block pages_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: pages_hero_links pages_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_rels pages_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_archive products_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_archive
    ADD CONSTRAINT products_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_content_columns products_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_content_columns
    ADD CONSTRAINT products_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_content products_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_content
    ADD CONSTRAINT products_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_cta_links products_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_cta_links
    ADD CONSTRAINT products_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_cta products_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_cta
    ADD CONSTRAINT products_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: products_blocks_media_block products_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_media_block
    ADD CONSTRAINT products_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_rels products_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_pkey PRIMARY KEY (id);


--
-- Name: redirects redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirects
    ADD CONSTRAINT redirects_pkey PRIMARY KEY (id);


--
-- Name: redirects_rels redirects_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: settings_rels settings_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings_rels
    ADD CONSTRAINT settings_rels_pkey PRIMARY KEY (id);


--
-- Name: users_cart_items users_cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_cart_items
    ADD CONSTRAINT users_cart_items_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_rels users_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_rels
    ADD CONSTRAINT users_rels_pkey PRIMARY KEY (id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: _pages_v_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_archive_order_idx ON public._pages_v_blocks_archive USING btree (_order);


--
-- Name: _pages_v_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_archive_parent_id_idx ON public._pages_v_blocks_archive USING btree (_parent_id);


--
-- Name: _pages_v_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_archive_path_idx ON public._pages_v_blocks_archive USING btree (_path);


--
-- Name: _pages_v_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_content_columns_order_idx ON public._pages_v_blocks_content_columns USING btree (_order);


--
-- Name: _pages_v_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_content_columns_parent_id_idx ON public._pages_v_blocks_content_columns USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_content_order_idx ON public._pages_v_blocks_content USING btree (_order);


--
-- Name: _pages_v_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_content_parent_id_idx ON public._pages_v_blocks_content USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_content_path_idx ON public._pages_v_blocks_content USING btree (_path);


--
-- Name: _pages_v_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_cta_links_order_idx ON public._pages_v_blocks_cta_links USING btree (_order);


--
-- Name: _pages_v_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_cta_links_parent_id_idx ON public._pages_v_blocks_cta_links USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_cta_order_idx ON public._pages_v_blocks_cta USING btree (_order);


--
-- Name: _pages_v_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_cta_parent_id_idx ON public._pages_v_blocks_cta USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_cta_path_idx ON public._pages_v_blocks_cta USING btree (_path);


--
-- Name: _pages_v_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_media_block_order_idx ON public._pages_v_blocks_media_block USING btree (_order);


--
-- Name: _pages_v_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_media_block_parent_id_idx ON public._pages_v_blocks_media_block USING btree (_parent_id);


--
-- Name: _pages_v_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_blocks_media_block_path_idx ON public._pages_v_blocks_media_block USING btree (_path);


--
-- Name: _pages_v_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_created_at_idx ON public._pages_v USING btree (created_at);


--
-- Name: _pages_v_latest_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_latest_idx ON public._pages_v USING btree (latest);


--
-- Name: _pages_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_rels_categories_id_idx ON public._pages_v_rels USING btree (categories_id);


--
-- Name: _pages_v_rels_media_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_rels_media_id_idx ON public._pages_v_rels USING btree (media_id);


--
-- Name: _pages_v_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_rels_order_idx ON public._pages_v_rels USING btree ("order");


--
-- Name: _pages_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_rels_pages_id_idx ON public._pages_v_rels USING btree (pages_id);


--
-- Name: _pages_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_rels_parent_idx ON public._pages_v_rels USING btree (parent_id);


--
-- Name: _pages_v_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_rels_path_idx ON public._pages_v_rels USING btree (path);


--
-- Name: _pages_v_rels_products_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_rels_products_id_idx ON public._pages_v_rels USING btree (products_id);


--
-- Name: _pages_v_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_updated_at_idx ON public._pages_v USING btree (updated_at);


--
-- Name: _pages_v_version_hero_links_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_hero_links_order_idx ON public._pages_v_version_hero_links USING btree (_order);


--
-- Name: _pages_v_version_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_hero_links_parent_id_idx ON public._pages_v_version_hero_links USING btree (_parent_id);


--
-- Name: _pages_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_version__status_idx ON public._pages_v USING btree (version__status);


--
-- Name: _pages_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_version_created_at_idx ON public._pages_v USING btree (version_created_at);


--
-- Name: _pages_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_version_slug_idx ON public._pages_v USING btree (version_slug);


--
-- Name: _products_v_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_archive_order_idx ON public._products_v_blocks_archive USING btree (_order);


--
-- Name: _products_v_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_archive_parent_id_idx ON public._products_v_blocks_archive USING btree (_parent_id);


--
-- Name: _products_v_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_archive_path_idx ON public._products_v_blocks_archive USING btree (_path);


--
-- Name: _products_v_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_content_columns_order_idx ON public._products_v_blocks_content_columns USING btree (_order);


--
-- Name: _products_v_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_content_columns_parent_id_idx ON public._products_v_blocks_content_columns USING btree (_parent_id);


--
-- Name: _products_v_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_content_order_idx ON public._products_v_blocks_content USING btree (_order);


--
-- Name: _products_v_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_content_parent_id_idx ON public._products_v_blocks_content USING btree (_parent_id);


--
-- Name: _products_v_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_content_path_idx ON public._products_v_blocks_content USING btree (_path);


--
-- Name: _products_v_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_cta_links_order_idx ON public._products_v_blocks_cta_links USING btree (_order);


--
-- Name: _products_v_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_cta_links_parent_id_idx ON public._products_v_blocks_cta_links USING btree (_parent_id);


--
-- Name: _products_v_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_cta_order_idx ON public._products_v_blocks_cta USING btree (_order);


--
-- Name: _products_v_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_cta_parent_id_idx ON public._products_v_blocks_cta USING btree (_parent_id);


--
-- Name: _products_v_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_cta_path_idx ON public._products_v_blocks_cta USING btree (_path);


--
-- Name: _products_v_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_media_block_order_idx ON public._products_v_blocks_media_block USING btree (_order);


--
-- Name: _products_v_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_media_block_parent_id_idx ON public._products_v_blocks_media_block USING btree (_parent_id);


--
-- Name: _products_v_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_blocks_media_block_path_idx ON public._products_v_blocks_media_block USING btree (_path);


--
-- Name: _products_v_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_created_at_idx ON public._products_v USING btree (created_at);


--
-- Name: _products_v_latest_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_latest_idx ON public._products_v USING btree (latest);


--
-- Name: _products_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_rels_categories_id_idx ON public._products_v_rels USING btree (categories_id);


--
-- Name: _products_v_rels_media_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_rels_media_id_idx ON public._products_v_rels USING btree (media_id);


--
-- Name: _products_v_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_rels_order_idx ON public._products_v_rels USING btree ("order");


--
-- Name: _products_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_rels_pages_id_idx ON public._products_v_rels USING btree (pages_id);


--
-- Name: _products_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_rels_parent_idx ON public._products_v_rels USING btree (parent_id);


--
-- Name: _products_v_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_rels_path_idx ON public._products_v_rels USING btree (path);


--
-- Name: _products_v_rels_products_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_rels_products_id_idx ON public._products_v_rels USING btree (products_id);


--
-- Name: _products_v_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_updated_at_idx ON public._products_v USING btree (updated_at);


--
-- Name: _products_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_version_version__status_idx ON public._products_v USING btree (version__status);


--
-- Name: _products_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_version_version_created_at_idx ON public._products_v USING btree (version_created_at);


--
-- Name: _products_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _products_v_version_version_slug_idx ON public._products_v USING btree (version_slug);


--
-- Name: categories_breadcrumbs_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_breadcrumbs_order_idx ON public.categories_breadcrumbs USING btree (_order);


--
-- Name: categories_breadcrumbs_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_breadcrumbs_parent_id_idx ON public.categories_breadcrumbs USING btree (_parent_id);


--
-- Name: categories_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_created_at_idx ON public.categories USING btree (created_at);


--
-- Name: categories_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_rels_categories_id_idx ON public.categories_rels USING btree (categories_id);


--
-- Name: categories_rels_media_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_rels_media_id_idx ON public.categories_rels USING btree (media_id);


--
-- Name: categories_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_rels_order_idx ON public.categories_rels USING btree ("order");


--
-- Name: categories_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_rels_parent_idx ON public.categories_rels USING btree (parent_id);


--
-- Name: categories_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_rels_path_idx ON public.categories_rels USING btree (path);


--
-- Name: footer_nav_items_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_nav_items_order_idx ON public.footer_nav_items USING btree (_order);


--
-- Name: footer_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_nav_items_parent_id_idx ON public.footer_nav_items USING btree (_parent_id);


--
-- Name: footer_rels_media_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_rels_media_id_idx ON public.footer_rels USING btree (media_id);


--
-- Name: footer_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_rels_order_idx ON public.footer_rels USING btree ("order");


--
-- Name: footer_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_rels_pages_id_idx ON public.footer_rels USING btree (pages_id);


--
-- Name: footer_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_rels_parent_idx ON public.footer_rels USING btree (parent_id);


--
-- Name: footer_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_rels_path_idx ON public.footer_rels USING btree (path);


--
-- Name: header_nav_items_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX header_nav_items_order_idx ON public.header_nav_items USING btree (_order);


--
-- Name: header_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX header_nav_items_parent_id_idx ON public.header_nav_items USING btree (_parent_id);


--
-- Name: header_rels_media_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX header_rels_media_id_idx ON public.header_rels USING btree (media_id);


--
-- Name: header_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX header_rels_order_idx ON public.header_rels USING btree ("order");


--
-- Name: header_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX header_rels_pages_id_idx ON public.header_rels USING btree (pages_id);


--
-- Name: header_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX header_rels_parent_idx ON public.header_rels USING btree (parent_id);


--
-- Name: header_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX header_rels_path_idx ON public.header_rels USING btree (path);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: orders_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_created_at_idx ON public.orders USING btree (created_at);


--
-- Name: orders_items_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_items_order_idx ON public.orders_items USING btree (_order);


--
-- Name: orders_items_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_items_parent_id_idx ON public.orders_items USING btree (_parent_id);


--
-- Name: orders_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_rels_order_idx ON public.orders_rels USING btree ("order");


--
-- Name: orders_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_rels_parent_idx ON public.orders_rels USING btree (parent_id);


--
-- Name: orders_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_rels_path_idx ON public.orders_rels USING btree (path);


--
-- Name: orders_rels_products_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_rels_products_id_idx ON public.orders_rels USING btree (products_id);


--
-- Name: orders_rels_users_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_rels_users_id_idx ON public.orders_rels USING btree (users_id);


--
-- Name: pages__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages__status_idx ON public.pages USING btree (_status);


--
-- Name: pages_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_archive_order_idx ON public.pages_blocks_archive USING btree (_order);


--
-- Name: pages_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_archive_parent_id_idx ON public.pages_blocks_archive USING btree (_parent_id);


--
-- Name: pages_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_archive_path_idx ON public.pages_blocks_archive USING btree (_path);


--
-- Name: pages_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_content_columns_order_idx ON public.pages_blocks_content_columns USING btree (_order);


--
-- Name: pages_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_content_columns_parent_id_idx ON public.pages_blocks_content_columns USING btree (_parent_id);


--
-- Name: pages_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_content_order_idx ON public.pages_blocks_content USING btree (_order);


--
-- Name: pages_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_content_parent_id_idx ON public.pages_blocks_content USING btree (_parent_id);


--
-- Name: pages_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_content_path_idx ON public.pages_blocks_content USING btree (_path);


--
-- Name: pages_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_cta_links_order_idx ON public.pages_blocks_cta_links USING btree (_order);


--
-- Name: pages_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_cta_links_parent_id_idx ON public.pages_blocks_cta_links USING btree (_parent_id);


--
-- Name: pages_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_cta_order_idx ON public.pages_blocks_cta USING btree (_order);


--
-- Name: pages_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_cta_parent_id_idx ON public.pages_blocks_cta USING btree (_parent_id);


--
-- Name: pages_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_cta_path_idx ON public.pages_blocks_cta USING btree (_path);


--
-- Name: pages_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_media_block_order_idx ON public.pages_blocks_media_block USING btree (_order);


--
-- Name: pages_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_media_block_parent_id_idx ON public.pages_blocks_media_block USING btree (_parent_id);


--
-- Name: pages_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_blocks_media_block_path_idx ON public.pages_blocks_media_block USING btree (_path);


--
-- Name: pages_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_created_at_idx ON public.pages USING btree (created_at);


--
-- Name: pages_hero_links_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_hero_links_order_idx ON public.pages_hero_links USING btree (_order);


--
-- Name: pages_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_hero_links_parent_id_idx ON public.pages_hero_links USING btree (_parent_id);


--
-- Name: pages_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_rels_categories_id_idx ON public.pages_rels USING btree (categories_id);


--
-- Name: pages_rels_media_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_rels_media_id_idx ON public.pages_rels USING btree (media_id);


--
-- Name: pages_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_rels_order_idx ON public.pages_rels USING btree ("order");


--
-- Name: pages_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_rels_pages_id_idx ON public.pages_rels USING btree (pages_id);


--
-- Name: pages_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_rels_parent_idx ON public.pages_rels USING btree (parent_id);


--
-- Name: pages_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_rels_path_idx ON public.pages_rels USING btree (path);


--
-- Name: pages_rels_products_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_rels_products_id_idx ON public.pages_rels USING btree (products_id);


--
-- Name: pages_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_slug_idx ON public.pages USING btree (slug);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: products__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products__status_idx ON public.products USING btree (_status);


--
-- Name: products_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_archive_order_idx ON public.products_blocks_archive USING btree (_order);


--
-- Name: products_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_archive_parent_id_idx ON public.products_blocks_archive USING btree (_parent_id);


--
-- Name: products_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_archive_path_idx ON public.products_blocks_archive USING btree (_path);


--
-- Name: products_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_content_columns_order_idx ON public.products_blocks_content_columns USING btree (_order);


--
-- Name: products_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_content_columns_parent_id_idx ON public.products_blocks_content_columns USING btree (_parent_id);


--
-- Name: products_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_content_order_idx ON public.products_blocks_content USING btree (_order);


--
-- Name: products_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_content_parent_id_idx ON public.products_blocks_content USING btree (_parent_id);


--
-- Name: products_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_content_path_idx ON public.products_blocks_content USING btree (_path);


--
-- Name: products_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_cta_links_order_idx ON public.products_blocks_cta_links USING btree (_order);


--
-- Name: products_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_cta_links_parent_id_idx ON public.products_blocks_cta_links USING btree (_parent_id);


--
-- Name: products_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_cta_order_idx ON public.products_blocks_cta USING btree (_order);


--
-- Name: products_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_cta_parent_id_idx ON public.products_blocks_cta USING btree (_parent_id);


--
-- Name: products_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_cta_path_idx ON public.products_blocks_cta USING btree (_path);


--
-- Name: products_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_media_block_order_idx ON public.products_blocks_media_block USING btree (_order);


--
-- Name: products_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_media_block_parent_id_idx ON public.products_blocks_media_block USING btree (_parent_id);


--
-- Name: products_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_blocks_media_block_path_idx ON public.products_blocks_media_block USING btree (_path);


--
-- Name: products_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_created_at_idx ON public.products USING btree (created_at);


--
-- Name: products_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_rels_categories_id_idx ON public.products_rels USING btree (categories_id);


--
-- Name: products_rels_media_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_rels_media_id_idx ON public.products_rels USING btree (media_id);


--
-- Name: products_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_rels_order_idx ON public.products_rels USING btree ("order");


--
-- Name: products_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_rels_pages_id_idx ON public.products_rels USING btree (pages_id);


--
-- Name: products_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_rels_parent_idx ON public.products_rels USING btree (parent_id);


--
-- Name: products_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_rels_path_idx ON public.products_rels USING btree (path);


--
-- Name: products_rels_products_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_rels_products_id_idx ON public.products_rels USING btree (products_id);


--
-- Name: products_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_slug_idx ON public.products USING btree (slug);


--
-- Name: redirects_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX redirects_created_at_idx ON public.redirects USING btree (created_at);


--
-- Name: redirects_from_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX redirects_from_idx ON public.redirects USING btree ("from");


--
-- Name: redirects_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX redirects_rels_order_idx ON public.redirects_rels USING btree ("order");


--
-- Name: redirects_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX redirects_rels_pages_id_idx ON public.redirects_rels USING btree (pages_id);


--
-- Name: redirects_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX redirects_rels_parent_idx ON public.redirects_rels USING btree (parent_id);


--
-- Name: redirects_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX redirects_rels_path_idx ON public.redirects_rels USING btree (path);


--
-- Name: redirects_rels_products_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX redirects_rels_products_id_idx ON public.redirects_rels USING btree (products_id);


--
-- Name: settings_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX settings_rels_order_idx ON public.settings_rels USING btree ("order");


--
-- Name: settings_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX settings_rels_pages_id_idx ON public.settings_rels USING btree (pages_id);


--
-- Name: settings_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX settings_rels_parent_idx ON public.settings_rels USING btree (parent_id);


--
-- Name: settings_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX settings_rels_path_idx ON public.settings_rels USING btree (path);


--
-- Name: users_cart_items_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_cart_items_order_idx ON public.users_cart_items USING btree (_order);


--
-- Name: users_cart_items_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_cart_items_parent_id_idx ON public.users_cart_items USING btree (_parent_id);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_rels_order_idx ON public.users_rels USING btree ("order");


--
-- Name: users_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_rels_parent_idx ON public.users_rels USING btree (parent_id);


--
-- Name: users_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_rels_path_idx ON public.users_rels USING btree (path);


--
-- Name: users_rels_products_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_rels_products_id_idx ON public.users_rels USING btree (products_id);


--
-- Name: users_roles_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_roles_order_idx ON public.users_roles USING btree ("order");


--
-- Name: users_roles_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_roles_parent_idx ON public.users_roles USING btree (parent_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_content(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_archive _products_v_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_archive
    ADD CONSTRAINT _products_v_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_content_columns _products_v_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_content_columns
    ADD CONSTRAINT _products_v_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v_blocks_content(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_content _products_v_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_content
    ADD CONSTRAINT _products_v_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_cta_links _products_v_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_cta_links
    ADD CONSTRAINT _products_v_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_cta _products_v_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_cta
    ADD CONSTRAINT _products_v_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_blocks_media_block _products_v_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_blocks_media_block
    ADD CONSTRAINT _products_v_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._products_v(id) ON DELETE CASCADE;


--
-- Name: _products_v_rels _products_v_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._products_v_rels
    ADD CONSTRAINT _products_v_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: categories_breadcrumbs categories_breadcrumbs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_breadcrumbs
    ADD CONSTRAINT categories_breadcrumbs_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories_rels categories_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_rels
    ADD CONSTRAINT categories_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories_rels categories_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_rels
    ADD CONSTRAINT categories_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: categories_rels categories_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_rels
    ADD CONSTRAINT categories_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: footer_nav_items footer_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_nav_items
    ADD CONSTRAINT footer_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_rels
    ADD CONSTRAINT footer_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: header_nav_items header_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_nav_items
    ADD CONSTRAINT header_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.header(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: header_rels header_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_rels
    ADD CONSTRAINT header_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.header(id) ON DELETE CASCADE;


--
-- Name: orders_items orders_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_items
    ADD CONSTRAINT orders_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: orders_rels orders_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_rels
    ADD CONSTRAINT orders_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: orders_rels orders_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_rels
    ADD CONSTRAINT orders_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders_rels orders_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_rels
    ADD CONSTRAINT orders_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_archive pages_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_content(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content pages_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta pages_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_media_block pages_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_hero_links pages_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: products_blocks_archive products_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_archive
    ADD CONSTRAINT products_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_blocks_content_columns products_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_content_columns
    ADD CONSTRAINT products_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products_blocks_content(id) ON DELETE CASCADE;


--
-- Name: products_blocks_content products_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_content
    ADD CONSTRAINT products_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_blocks_cta_links products_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_cta_links
    ADD CONSTRAINT products_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: products_blocks_cta products_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_cta
    ADD CONSTRAINT products_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_blocks_media_block products_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_blocks_media_block
    ADD CONSTRAINT products_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_rels products_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_rels
    ADD CONSTRAINT products_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.redirects(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: settings_rels settings_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings_rels
    ADD CONSTRAINT settings_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: settings_rels settings_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings_rels
    ADD CONSTRAINT settings_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.settings(id) ON DELETE CASCADE;


--
-- Name: users_cart_items users_cart_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_cart_items
    ADD CONSTRAINT users_cart_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_rels users_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_rels
    ADD CONSTRAINT users_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_rels users_rels_products_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_rels
    ADD CONSTRAINT users_rels_products_fk FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: users_roles users_roles_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_parent_fk FOREIGN KEY (parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.try_cast_double(inp text) FROM postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_decode(data text) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_encode(data bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE _pages_v; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v TO service_role;


--
-- Name: TABLE _pages_v_blocks_archive; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_archive TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_archive TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_archive TO service_role;


--
-- Name: SEQUENCE _pages_v_blocks_archive_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_blocks_archive_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_blocks_archive_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_blocks_archive_id_seq TO service_role;


--
-- Name: TABLE _pages_v_blocks_content; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_content TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_content TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_content TO service_role;


--
-- Name: TABLE _pages_v_blocks_content_columns; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_content_columns TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_content_columns TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_content_columns TO service_role;


--
-- Name: SEQUENCE _pages_v_blocks_content_columns_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_blocks_content_columns_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_blocks_content_columns_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_blocks_content_columns_id_seq TO service_role;


--
-- Name: SEQUENCE _pages_v_blocks_content_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_blocks_content_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_blocks_content_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_blocks_content_id_seq TO service_role;


--
-- Name: TABLE _pages_v_blocks_cta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_cta TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_cta TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_cta TO service_role;


--
-- Name: SEQUENCE _pages_v_blocks_cta_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_blocks_cta_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_blocks_cta_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_blocks_cta_id_seq TO service_role;


--
-- Name: TABLE _pages_v_blocks_cta_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_cta_links TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_cta_links TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_cta_links TO service_role;


--
-- Name: SEQUENCE _pages_v_blocks_cta_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_blocks_cta_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_blocks_cta_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_blocks_cta_links_id_seq TO service_role;


--
-- Name: TABLE _pages_v_blocks_media_block; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_media_block TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_media_block TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_blocks_media_block TO service_role;


--
-- Name: SEQUENCE _pages_v_blocks_media_block_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_blocks_media_block_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_blocks_media_block_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_blocks_media_block_id_seq TO service_role;


--
-- Name: SEQUENCE _pages_v_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_id_seq TO service_role;


--
-- Name: TABLE _pages_v_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_rels TO service_role;


--
-- Name: SEQUENCE _pages_v_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_rels_id_seq TO service_role;


--
-- Name: TABLE _pages_v_version_hero_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_version_hero_links TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_version_hero_links TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._pages_v_version_hero_links TO service_role;


--
-- Name: SEQUENCE _pages_v_version_hero_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._pages_v_version_hero_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public._pages_v_version_hero_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._pages_v_version_hero_links_id_seq TO service_role;


--
-- Name: TABLE _products_v; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v TO service_role;


--
-- Name: TABLE _products_v_blocks_archive; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_archive TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_archive TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_archive TO service_role;


--
-- Name: SEQUENCE _products_v_blocks_archive_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._products_v_blocks_archive_id_seq TO anon;
GRANT ALL ON SEQUENCE public._products_v_blocks_archive_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._products_v_blocks_archive_id_seq TO service_role;


--
-- Name: TABLE _products_v_blocks_content; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_content TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_content TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_content TO service_role;


--
-- Name: TABLE _products_v_blocks_content_columns; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_content_columns TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_content_columns TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_content_columns TO service_role;


--
-- Name: SEQUENCE _products_v_blocks_content_columns_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._products_v_blocks_content_columns_id_seq TO anon;
GRANT ALL ON SEQUENCE public._products_v_blocks_content_columns_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._products_v_blocks_content_columns_id_seq TO service_role;


--
-- Name: SEQUENCE _products_v_blocks_content_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._products_v_blocks_content_id_seq TO anon;
GRANT ALL ON SEQUENCE public._products_v_blocks_content_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._products_v_blocks_content_id_seq TO service_role;


--
-- Name: TABLE _products_v_blocks_cta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_cta TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_cta TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_cta TO service_role;


--
-- Name: SEQUENCE _products_v_blocks_cta_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._products_v_blocks_cta_id_seq TO anon;
GRANT ALL ON SEQUENCE public._products_v_blocks_cta_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._products_v_blocks_cta_id_seq TO service_role;


--
-- Name: TABLE _products_v_blocks_cta_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_cta_links TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_cta_links TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_cta_links TO service_role;


--
-- Name: SEQUENCE _products_v_blocks_cta_links_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._products_v_blocks_cta_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public._products_v_blocks_cta_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._products_v_blocks_cta_links_id_seq TO service_role;


--
-- Name: TABLE _products_v_blocks_media_block; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_media_block TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_media_block TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_blocks_media_block TO service_role;


--
-- Name: SEQUENCE _products_v_blocks_media_block_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._products_v_blocks_media_block_id_seq TO anon;
GRANT ALL ON SEQUENCE public._products_v_blocks_media_block_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._products_v_blocks_media_block_id_seq TO service_role;


--
-- Name: SEQUENCE _products_v_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._products_v_id_seq TO anon;
GRANT ALL ON SEQUENCE public._products_v_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._products_v_id_seq TO service_role;


--
-- Name: TABLE _products_v_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public._products_v_rels TO service_role;


--
-- Name: SEQUENCE _products_v_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public._products_v_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public._products_v_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public._products_v_rels_id_seq TO service_role;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories TO service_role;


--
-- Name: TABLE categories_breadcrumbs; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories_breadcrumbs TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories_breadcrumbs TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories_breadcrumbs TO service_role;


--
-- Name: SEQUENCE categories_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.categories_id_seq TO anon;
GRANT ALL ON SEQUENCE public.categories_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.categories_id_seq TO service_role;


--
-- Name: TABLE categories_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.categories_rels TO service_role;


--
-- Name: SEQUENCE categories_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.categories_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.categories_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.categories_rels_id_seq TO service_role;


--
-- Name: TABLE footer; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer TO service_role;


--
-- Name: SEQUENCE footer_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.footer_id_seq TO anon;
GRANT ALL ON SEQUENCE public.footer_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.footer_id_seq TO service_role;


--
-- Name: TABLE footer_nav_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer_nav_items TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer_nav_items TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer_nav_items TO service_role;


--
-- Name: TABLE footer_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.footer_rels TO service_role;


--
-- Name: SEQUENCE footer_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.footer_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.footer_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.footer_rels_id_seq TO service_role;


--
-- Name: TABLE header; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header TO service_role;


--
-- Name: SEQUENCE header_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.header_id_seq TO anon;
GRANT ALL ON SEQUENCE public.header_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.header_id_seq TO service_role;


--
-- Name: TABLE header_nav_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header_nav_items TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header_nav_items TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header_nav_items TO service_role;


--
-- Name: TABLE header_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.header_rels TO service_role;


--
-- Name: SEQUENCE header_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.header_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.header_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.header_rels_id_seq TO service_role;


--
-- Name: TABLE media; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.media TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.media TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.media TO service_role;


--
-- Name: SEQUENCE media_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.media_id_seq TO anon;
GRANT ALL ON SEQUENCE public.media_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.media_id_seq TO service_role;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders TO service_role;


--
-- Name: SEQUENCE orders_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.orders_id_seq TO anon;
GRANT ALL ON SEQUENCE public.orders_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.orders_id_seq TO service_role;


--
-- Name: TABLE orders_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders_items TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders_items TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders_items TO service_role;


--
-- Name: TABLE orders_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders_rels TO service_role;


--
-- Name: SEQUENCE orders_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.orders_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.orders_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.orders_rels_id_seq TO service_role;


--
-- Name: TABLE pages; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages TO service_role;


--
-- Name: TABLE pages_blocks_archive; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_archive TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_archive TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_archive TO service_role;


--
-- Name: TABLE pages_blocks_content; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_content TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_content TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_content TO service_role;


--
-- Name: TABLE pages_blocks_content_columns; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_content_columns TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_content_columns TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_content_columns TO service_role;


--
-- Name: TABLE pages_blocks_cta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_cta TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_cta TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_cta TO service_role;


--
-- Name: TABLE pages_blocks_cta_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_cta_links TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_cta_links TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_cta_links TO service_role;


--
-- Name: TABLE pages_blocks_media_block; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_media_block TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_media_block TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_blocks_media_block TO service_role;


--
-- Name: TABLE pages_hero_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_hero_links TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_hero_links TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_hero_links TO service_role;


--
-- Name: SEQUENCE pages_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pages_id_seq TO anon;
GRANT ALL ON SEQUENCE public.pages_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.pages_id_seq TO service_role;


--
-- Name: TABLE pages_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.pages_rels TO service_role;


--
-- Name: SEQUENCE pages_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pages_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.pages_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.pages_rels_id_seq TO service_role;


--
-- Name: TABLE payload_migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_migrations TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_migrations TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_migrations TO service_role;


--
-- Name: SEQUENCE payload_migrations_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.payload_migrations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.payload_migrations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.payload_migrations_id_seq TO service_role;


--
-- Name: TABLE payload_preferences; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_preferences TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_preferences TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_preferences TO service_role;


--
-- Name: SEQUENCE payload_preferences_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.payload_preferences_id_seq TO anon;
GRANT ALL ON SEQUENCE public.payload_preferences_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.payload_preferences_id_seq TO service_role;


--
-- Name: TABLE payload_preferences_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_preferences_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_preferences_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.payload_preferences_rels TO service_role;


--
-- Name: SEQUENCE payload_preferences_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.payload_preferences_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.payload_preferences_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.payload_preferences_rels_id_seq TO service_role;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products TO service_role;


--
-- Name: TABLE products_blocks_archive; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_archive TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_archive TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_archive TO service_role;


--
-- Name: TABLE products_blocks_content; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_content TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_content TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_content TO service_role;


--
-- Name: TABLE products_blocks_content_columns; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_content_columns TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_content_columns TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_content_columns TO service_role;


--
-- Name: TABLE products_blocks_cta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_cta TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_cta TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_cta TO service_role;


--
-- Name: TABLE products_blocks_cta_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_cta_links TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_cta_links TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_cta_links TO service_role;


--
-- Name: TABLE products_blocks_media_block; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_media_block TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_media_block TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_blocks_media_block TO service_role;


--
-- Name: SEQUENCE products_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.products_id_seq TO anon;
GRANT ALL ON SEQUENCE public.products_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.products_id_seq TO service_role;


--
-- Name: TABLE products_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.products_rels TO service_role;


--
-- Name: SEQUENCE products_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.products_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.products_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.products_rels_id_seq TO service_role;


--
-- Name: TABLE redirects; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.redirects TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.redirects TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.redirects TO service_role;


--
-- Name: SEQUENCE redirects_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.redirects_id_seq TO anon;
GRANT ALL ON SEQUENCE public.redirects_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.redirects_id_seq TO service_role;


--
-- Name: TABLE redirects_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.redirects_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.redirects_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.redirects_rels TO service_role;


--
-- Name: SEQUENCE redirects_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.redirects_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.redirects_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.redirects_rels_id_seq TO service_role;


--
-- Name: TABLE settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.settings TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.settings TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.settings TO service_role;


--
-- Name: SEQUENCE settings_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.settings_id_seq TO anon;
GRANT ALL ON SEQUENCE public.settings_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.settings_id_seq TO service_role;


--
-- Name: TABLE settings_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.settings_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.settings_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.settings_rels TO service_role;


--
-- Name: SEQUENCE settings_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.settings_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.settings_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.settings_rels_id_seq TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users TO service_role;


--
-- Name: TABLE users_cart_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_cart_items TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_cart_items TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_cart_items TO service_role;


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.users_id_seq TO service_role;


--
-- Name: TABLE users_rels; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_rels TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_rels TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_rels TO service_role;


--
-- Name: SEQUENCE users_rels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_rels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.users_rels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.users_rels_id_seq TO service_role;


--
-- Name: TABLE users_roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_roles TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_roles TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.users_roles TO service_role;


--
-- Name: SEQUENCE users_roles_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_roles_id_seq TO anon;
GRANT ALL ON SEQUENCE public.users_roles_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.users_roles_id_seq TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.messages TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

