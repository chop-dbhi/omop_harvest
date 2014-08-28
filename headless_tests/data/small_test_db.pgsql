--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sheperd;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sheperd;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sheperd;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sheperd;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sheperd;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sheperd;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO sheperd;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO sheperd;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO sheperd;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO sheperd;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO sheperd;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO sheperd;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: avocado_datacategory; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_datacategory (
    id integer NOT NULL,
    name character varying(200),
    description text,
    keywords character varying(100),
    archived boolean NOT NULL,
    published boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    parent_id integer,
    _order double precision
);


ALTER TABLE public.avocado_datacategory OWNER TO sheperd;

--
-- Name: avocado_datacategory_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_datacategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_datacategory_id_seq OWNER TO sheperd;

--
-- Name: avocado_datacategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_datacategory_id_seq OWNED BY avocado_datacategory.id;


--
-- Name: avocado_dataconcept; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_dataconcept (
    id integer NOT NULL,
    name character varying(200),
    description text,
    keywords character varying(100),
    archived boolean NOT NULL,
    published boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name_plural character varying(200),
    category_id integer,
    group_id integer,
    _order double precision,
    formatter_name character varying(100),
    ident character varying(100),
    internal boolean NOT NULL,
    sortable boolean NOT NULL,
    queryable boolean NOT NULL,
    viewable boolean NOT NULL,
    type character varying(100)
);


ALTER TABLE public.avocado_dataconcept OWNER TO sheperd;

--
-- Name: avocado_dataconcept_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_dataconcept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_dataconcept_id_seq OWNER TO sheperd;

--
-- Name: avocado_dataconcept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_dataconcept_id_seq OWNED BY avocado_dataconcept.id;


--
-- Name: avocado_dataconcept_sites; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_dataconcept_sites (
    id integer NOT NULL,
    dataconcept_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.avocado_dataconcept_sites OWNER TO sheperd;

--
-- Name: avocado_dataconcept_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_dataconcept_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_dataconcept_sites_id_seq OWNER TO sheperd;

--
-- Name: avocado_dataconcept_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_dataconcept_sites_id_seq OWNED BY avocado_dataconcept_sites.id;


--
-- Name: avocado_dataconceptfield; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_dataconceptfield (
    id integer NOT NULL,
    field_id integer NOT NULL,
    concept_id integer NOT NULL,
    name character varying(100),
    name_plural character varying(100),
    _order double precision,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.avocado_dataconceptfield OWNER TO sheperd;

--
-- Name: avocado_dataconceptfield_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_dataconceptfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_dataconceptfield_id_seq OWNER TO sheperd;

--
-- Name: avocado_dataconceptfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_dataconceptfield_id_seq OWNED BY avocado_dataconceptfield.id;


--
-- Name: avocado_datacontext; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_datacontext (
    id integer NOT NULL,
    name character varying(200),
    description text,
    keywords character varying(100),
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    json text,
    session boolean NOT NULL,
    _count integer,
    user_id integer,
    session_key character varying(40),
    template boolean NOT NULL,
    "default" boolean NOT NULL,
    accessed timestamp with time zone NOT NULL,
    parent_id integer,
    tree character varying(100)
);


ALTER TABLE public.avocado_datacontext OWNER TO sheperd;

--
-- Name: avocado_datacontext_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_datacontext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_datacontext_id_seq OWNER TO sheperd;

--
-- Name: avocado_datacontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_datacontext_id_seq OWNED BY avocado_datacontext.id;


--
-- Name: avocado_datafield; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_datafield (
    id integer NOT NULL,
    name character varying(200),
    description text,
    keywords character varying(100),
    archived boolean NOT NULL,
    published boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name_plural character varying(200),
    app_name character varying(200) NOT NULL,
    model_name character varying(200) NOT NULL,
    field_name character varying(200) NOT NULL,
    unit character varying(30),
    unit_plural character varying(40),
    category_id integer,
    enumerable boolean NOT NULL,
    translator character varying(100),
    group_id integer,
    _order double precision,
    internal boolean NOT NULL,
    data_version integer NOT NULL,
    label_field_name character varying(200),
    search_field_name character varying(200),
    order_field_name character varying(200),
    code_field_name character varying(200),
    type character varying(100)
);


ALTER TABLE public.avocado_datafield OWNER TO sheperd;

--
-- Name: avocado_datafield_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_datafield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_datafield_id_seq OWNER TO sheperd;

--
-- Name: avocado_datafield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_datafield_id_seq OWNED BY avocado_datafield.id;


--
-- Name: avocado_datafield_sites; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_datafield_sites (
    id integer NOT NULL,
    datafield_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.avocado_datafield_sites OWNER TO sheperd;

--
-- Name: avocado_datafield_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_datafield_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_datafield_sites_id_seq OWNER TO sheperd;

--
-- Name: avocado_datafield_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_datafield_sites_id_seq OWNED BY avocado_datafield_sites.id;


--
-- Name: avocado_dataquery; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_dataquery (
    id integer NOT NULL,
    name character varying(200),
    description text,
    keywords character varying(100),
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    context_json text,
    view_json text,
    session boolean NOT NULL,
    template boolean NOT NULL,
    "default" boolean NOT NULL,
    user_id integer,
    session_key character varying(40),
    accessed timestamp with time zone NOT NULL,
    distinct_count integer,
    record_count integer,
    parent_id integer,
    public boolean NOT NULL,
    tree character varying(100)
);


ALTER TABLE public.avocado_dataquery OWNER TO sheperd;

--
-- Name: avocado_dataquery_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_dataquery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_dataquery_id_seq OWNER TO sheperd;

--
-- Name: avocado_dataquery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_dataquery_id_seq OWNED BY avocado_dataquery.id;


--
-- Name: avocado_dataquery_shared_users; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_dataquery_shared_users (
    id integer NOT NULL,
    dataquery_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.avocado_dataquery_shared_users OWNER TO sheperd;

--
-- Name: avocado_dataquery_shared_users_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_dataquery_shared_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_dataquery_shared_users_id_seq OWNER TO sheperd;

--
-- Name: avocado_dataquery_shared_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_dataquery_shared_users_id_seq OWNED BY avocado_dataquery_shared_users.id;


--
-- Name: avocado_dataview; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_dataview (
    id integer NOT NULL,
    name character varying(200),
    description text,
    keywords character varying(100),
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    json text,
    session boolean NOT NULL,
    user_id integer,
    session_key character varying(40),
    template boolean NOT NULL,
    "default" boolean NOT NULL,
    accessed timestamp with time zone NOT NULL,
    parent_id integer
);


ALTER TABLE public.avocado_dataview OWNER TO sheperd;

--
-- Name: avocado_dataview_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_dataview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_dataview_id_seq OWNER TO sheperd;

--
-- Name: avocado_dataview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_dataview_id_seq OWNED BY avocado_dataview.id;


--
-- Name: avocado_log; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_log (
    id integer NOT NULL,
    content_type_id integer,
    object_id integer,
    event character varying(200) NOT NULL,
    data text,
    user_id integer,
    session_key character varying(40),
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT avocado_log_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.avocado_log OWNER TO sheperd;

--
-- Name: avocado_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_log_id_seq OWNER TO sheperd;

--
-- Name: avocado_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_log_id_seq OWNED BY avocado_log.id;


--
-- Name: avocado_revision; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE avocado_revision (
    id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    data text,
    user_id integer,
    session_key character varying(40),
    "timestamp" timestamp with time zone NOT NULL,
    deleted boolean NOT NULL,
    changes text,
    CONSTRAINT avocado_revision_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.avocado_revision OWNER TO sheperd;

--
-- Name: avocado_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE avocado_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avocado_revision_id_seq OWNER TO sheperd;

--
-- Name: avocado_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE avocado_revision_id_seq OWNED BY avocado_revision.id;


--
-- Name: care_site; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE care_site (
    care_site_id integer NOT NULL,
    location_id integer,
    organization_id integer,
    place_of_service_concept_id integer,
    care_site_source_value character varying(50),
    place_of_service_source_value character varying(50)
);


ALTER TABLE public.care_site OWNER TO sheperd;

--
-- Name: TABLE care_site; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE care_site IS 'Information about the site of care.';


--
-- Name: COLUMN care_site.care_site_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN care_site.care_site_id IS 'A system-generated unique identifier for each care site. A care site is the place where the provider delivered the healthcare to the person.';


--
-- Name: COLUMN care_site.location_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN care_site.location_id IS 'A foreign key to the geographic location in the location table, where the detailed address information is stored.';


--
-- Name: COLUMN care_site.organization_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN care_site.organization_id IS 'A foreign key to the organization in the organization table, where the detailed information is stored.';


--
-- Name: COLUMN care_site.place_of_service_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN care_site.place_of_service_concept_id IS 'A foreign key to the predefined concept identifier in the vocabulary reflecting the place of service.';


--
-- Name: COLUMN care_site.care_site_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN care_site.care_site_source_value IS 'The identifier for the care site as it appears in the source data, stored here for reference.';


--
-- Name: COLUMN care_site.place_of_service_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN care_site.place_of_service_source_value IS 'The source code for the place of service as it appears in the source data, stored here for reference.';


--
-- Name: care_site_location; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE care_site_location (
    location_id integer,
    address_1 character varying(50),
    address_2 character varying(50),
    city character varying(50),
    state character(2),
    zip character varying(9),
    county character varying(20),
    location_source_value character varying(50)
);


ALTER TABLE public.care_site_location OWNER TO sheperd;

--
-- Name: care_site_pos; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE care_site_pos (
    concept_id integer,
    concept_name character varying(256),
    concept_level integer,
    concept_class character varying(60),
    vocabulary_id integer,
    concept_code character varying(40),
    valid_start_date timestamp with time zone,
    valid_end_date timestamp with time zone,
    invalid_reason character(1)
);


ALTER TABLE public.care_site_pos OWNER TO sheperd;

--
-- Name: cohort; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE cohort (
    cohort_id integer NOT NULL,
    cohort_concept_id integer NOT NULL,
    cohort_start_date timestamp with time zone NOT NULL,
    cohort_end_date timestamp with time zone,
    subject_id integer NOT NULL,
    stop_reason character varying(20)
);


ALTER TABLE public.cohort OWNER TO sheperd;

--
-- Name: TABLE cohort; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE cohort IS 'Person, provider or visit cohorts.';


--
-- Name: COLUMN cohort.cohort_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN cohort.cohort_id IS 'A system-generated unique identifier for each cohort record.';


--
-- Name: COLUMN cohort.cohort_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN cohort.cohort_concept_id IS 'A foreign key to a standard cohort concept identifier in the vocabulary. Cohort concepts identify the cohorts: whether they are defined through persons, providers or visits, or any combination thereof.';


--
-- Name: COLUMN cohort.cohort_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN cohort.cohort_start_date IS 'The date when the cohort definition criteria for the person, provider or visit first match.';


--
-- Name: COLUMN cohort.cohort_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN cohort.cohort_end_date IS 'The date when the cohort definition criteria for the person, provider or visit no longer match or the cohort membership was terminated.';


--
-- Name: COLUMN cohort.subject_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN cohort.subject_id IS 'A foreign key to the subject in the cohort. These could be referring to records in the person, provider, visit occurrence table.';


--
-- Name: COLUMN cohort.stop_reason; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN cohort.stop_reason IS 'The reason for the end of a cohort membership other than defined by the cohort definition criteria as it appears in the source data.';


--
-- Name: concept; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE concept (
    concept_id integer NOT NULL,
    concept_name character varying(256) NOT NULL,
    concept_level integer NOT NULL,
    concept_class character varying(60) NOT NULL,
    vocabulary_id integer NOT NULL,
    concept_code character varying(40) NOT NULL,
    valid_start_date timestamp with time zone NOT NULL,
    valid_end_date timestamp with time zone DEFAULT '2099-12-31 00:00:00-05'::timestamp with time zone NOT NULL,
    invalid_reason character(1),
    CONSTRAINT concept_invalid_reason_check CHECK ((invalid_reason = ANY (ARRAY['D'::bpchar, 'U'::bpchar]))),
    CONSTRAINT concept_invalid_reason_check1 CHECK ((invalid_reason = ANY (ARRAY['D'::bpchar, 'U'::bpchar])))
);


ALTER TABLE public.concept OWNER TO sheperd;

--
-- Name: TABLE concept; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE concept IS 'A list of all valid terminology concepts across domains and their attributes. Concepts are derived from existing standards.';


--
-- Name: COLUMN concept.concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.concept_id IS 'A system-generated identifier to uniquely identify each concept across all concept types.';


--
-- Name: COLUMN concept.concept_name; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.concept_name IS 'An unambiguous, meaningful and descriptive name for the concept.';


--
-- Name: COLUMN concept.concept_level; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.concept_level IS 'The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).';


--
-- Name: COLUMN concept.concept_class; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.concept_class IS 'The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are ''Clinical Drug'', ''Ingredient'', ''Clinical Finding'' etc.';


--
-- Name: COLUMN concept.vocabulary_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.vocabulary_id IS 'A foreign key to the vocabulary table indicating from which source the concept has been adapted.';


--
-- Name: COLUMN concept.concept_code; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.concept_code IS 'The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.';


--
-- Name: COLUMN concept.valid_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.valid_start_date IS 'The date when the was first recorded.';


--
-- Name: COLUMN concept.valid_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.valid_end_date IS 'The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.';


--
-- Name: COLUMN concept.invalid_reason; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept.invalid_reason IS 'Concepts that are replaced with a new concept are designated "Updated" (U) and concepts that are removed without replacement are "Deprecated" (D).';


--
-- Name: concept_ancestor; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE concept_ancestor (
    ancestry_id integer NOT NULL,
    ancestor_concept_id integer NOT NULL,
    descendant_concept_id integer NOT NULL,
    max_levels_of_separation integer,
    min_levels_of_separation integer
);


ALTER TABLE public.concept_ancestor OWNER TO sheperd;

--
-- Name: TABLE concept_ancestor; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE concept_ancestor IS 'A specialized table containing only hierarchical relationship between concepts that may span several generations.';


--
-- Name: COLUMN concept_ancestor.ancestry_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_ancestor.ancestry_id IS 'CBMi added single serial unique identifer for records in the concept_ancestor table.';


--
-- Name: COLUMN concept_ancestor.ancestor_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_ancestor.ancestor_concept_id IS 'A foreign key to the concept code in the concept table for the higher-level concept that forms the ancestor in the relationship.';


--
-- Name: COLUMN concept_ancestor.descendant_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_ancestor.descendant_concept_id IS 'A foreign key to the concept code in the concept table for the lower-level concept that forms the descendant in the relationship.';


--
-- Name: COLUMN concept_ancestor.max_levels_of_separation; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_ancestor.max_levels_of_separation IS 'The maximum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an optional attribute that is used to simplify hierarchic analysis. ';


--
-- Name: COLUMN concept_ancestor.min_levels_of_separation; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_ancestor.min_levels_of_separation IS 'The minimum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an optional attribute that is used to simplify hierarchic analysis.';


--
-- Name: concept_ancestor_ancestry_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE concept_ancestor_ancestry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concept_ancestor_ancestry_id_seq OWNER TO sheperd;

--
-- Name: concept_ancestor_ancestry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE concept_ancestor_ancestry_id_seq OWNED BY concept_ancestor.ancestry_id;


--
-- Name: concept_relationship; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE concept_relationship (
    concept_relationship_id integer NOT NULL,
    concept_id_1 integer NOT NULL,
    concept_id_2 integer NOT NULL,
    relationship_id integer NOT NULL,
    valid_start_date timestamp with time zone NOT NULL,
    valid_end_date timestamp with time zone DEFAULT '2099-12-31 00:00:00-05'::timestamp with time zone NOT NULL,
    invalid_reason character(1),
    CONSTRAINT concept_relationship_invalid_reason_check CHECK ((invalid_reason = ANY (ARRAY['D'::bpchar, 'U'::bpchar]))),
    CONSTRAINT concept_relationship_invalid_reason_check1 CHECK ((invalid_reason = ANY (ARRAY['D'::bpchar, 'U'::bpchar])))
);


ALTER TABLE public.concept_relationship OWNER TO sheperd;

--
-- Name: TABLE concept_relationship; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE concept_relationship IS 'A list of relationship between concepts. Some of these relationships are generic (e.g. ''Subsumes'' relationship), others are domain-specific.';


--
-- Name: COLUMN concept_relationship.concept_relationship_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_relationship.concept_relationship_id IS 'CBMi added single serial unique identifer for records in the concept_relationship table.';


--
-- Name: COLUMN concept_relationship.concept_id_1; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_relationship.concept_id_1 IS 'A foreign key to the concept in the concept table associated with the relationship. Relationships are directional, and this field represents the source concept designation.';


--
-- Name: COLUMN concept_relationship.concept_id_2; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_relationship.concept_id_2 IS 'A foreign key to the concept in the concept table associated with the relationship. Relationships are directional, and this field represents the destination concept designation.';


--
-- Name: COLUMN concept_relationship.relationship_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_relationship.relationship_id IS 'The type of relationship as defined in the relationship table.';


--
-- Name: COLUMN concept_relationship.valid_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_relationship.valid_start_date IS 'The date when the the relationship was first recorded.';


--
-- Name: COLUMN concept_relationship.valid_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_relationship.valid_end_date IS 'The date when the relationship became invalid because it was deleted or superseded (updated) by a new relationship. Default value is 31-Dec-2099.';


--
-- Name: COLUMN concept_relationship.invalid_reason; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_relationship.invalid_reason IS 'Reason the relationship was invalidated. Possible values are D (deleted), U (replaced with an update) or NULL when valid_end_date has the default value.';


--
-- Name: concept_relationship_concept_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE concept_relationship_concept_relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concept_relationship_concept_relationship_id_seq OWNER TO sheperd;

--
-- Name: concept_relationship_concept_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE concept_relationship_concept_relationship_id_seq OWNED BY concept_relationship.concept_relationship_id;


--
-- Name: concept_synonym; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE concept_synonym (
    concept_synonym_id integer NOT NULL,
    concept_id integer NOT NULL,
    concept_synonym_name character varying(1000) NOT NULL
);


ALTER TABLE public.concept_synonym OWNER TO sheperd;

--
-- Name: TABLE concept_synonym; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE concept_synonym IS 'A table with synonyms for concepts that have more than one valid name or description.';


--
-- Name: COLUMN concept_synonym.concept_synonym_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_synonym.concept_synonym_id IS 'A system-generated unique identifier for each concept synonym.';


--
-- Name: COLUMN concept_synonym.concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_synonym.concept_id IS 'A foreign key to the concept in the concept table. ';


--
-- Name: COLUMN concept_synonym.concept_synonym_name; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN concept_synonym.concept_synonym_name IS 'The alternative name for the concept.';


--
-- Name: condition_era; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE condition_era (
    condition_era_id integer NOT NULL,
    person_id integer NOT NULL,
    condition_concept_id integer NOT NULL,
    condition_era_start_date timestamp with time zone NOT NULL,
    condition_era_end_date timestamp with time zone NOT NULL,
    condition_type_concept_id integer NOT NULL,
    condition_occurrence_count numeric(4,0)
);


ALTER TABLE public.condition_era OWNER TO sheperd;

--
-- Name: TABLE condition_era; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE condition_era IS 'A diagnoses or conditions that over a period of time.';


--
-- Name: COLUMN condition_era.condition_era_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_era.condition_era_id IS 'A system-generated unique identifier for each condition era.';


--
-- Name: COLUMN condition_era.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_era.person_id IS 'A foreign key identifier to the person who is experiencing the condition during the condition era. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN condition_era.condition_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_era.condition_concept_id IS 'A foreign key that refers to a standard condition concept identifier in the vocabulary. ';


--
-- Name: COLUMN condition_era.condition_era_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_era.condition_era_start_date IS 'The start date for the condition era constructed from the individual instances of condition occurrences. It is the start date of the very first chronologically recorded instance of the condition.';


--
-- Name: COLUMN condition_era.condition_era_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_era.condition_era_end_date IS 'The end date for the condition era constructed from the individual instances of condition occurrences. It is the end date of the final continuously recorded instance of the condition.';


--
-- Name: COLUMN condition_era.condition_type_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_era.condition_type_concept_id IS ' A foreign key to the predefined concept identifier in the vocabulary reflecting the parameters used to construct the condition era. For a detailed current listing of condition types see Appendix B: Condition Type Concepts.';


--
-- Name: COLUMN condition_era.condition_occurrence_count; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_era.condition_occurrence_count IS 'The number of individual condition occurrences used to construct the condition era.';


--
-- Name: condition_occurrence; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE condition_occurrence (
    condition_occurrence_id integer NOT NULL,
    person_id integer NOT NULL,
    condition_concept_id integer NOT NULL,
    condition_start_date timestamp with time zone NOT NULL,
    condition_end_date timestamp with time zone,
    condition_type_concept_id integer NOT NULL,
    stop_reason character varying(20),
    associated_provider_id integer,
    visit_occurrence_id integer,
    condition_source_value character varying(50)
);


ALTER TABLE public.condition_occurrence OWNER TO sheperd;

--
-- Name: TABLE condition_occurrence; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE condition_occurrence IS 'A diagnosis or condition that has been recorded about a person at a certain time.';


--
-- Name: COLUMN condition_occurrence.condition_occurrence_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.condition_occurrence_id IS 'A system-generated unique identifier for each condition occurrence event.';


--
-- Name: COLUMN condition_occurrence.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.person_id IS 'A foreign key identifier to the person who is experiencing the condition. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN condition_occurrence.condition_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.condition_concept_id IS 'A foreign key that refers to a standard condition concept identifier in the vocabulary.';


--
-- Name: COLUMN condition_occurrence.condition_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.condition_start_date IS 'The date when the instance of the condition is recorded.';


--
-- Name: COLUMN condition_occurrence.condition_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.condition_end_date IS 'The date when the instance of the condition is last recorded.';


--
-- Name: COLUMN condition_occurrence.condition_type_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.condition_type_concept_id IS 'A foreign key to the predefined concept identifier in the vocabulary reflecting the source data from which the condition was recorded, the level of standardization, and the type of occurrence. Conditions are defined as primary or secondary diagnoses, problem lists and person statuses. For a detailed current listing of condition types see Appendix B: Condition Type Concepts.';


--
-- Name: COLUMN condition_occurrence.stop_reason; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.stop_reason IS 'The reason, if available, that the condition was no longer recorded, as indicated in the source data. Valid values include discharged, resolved, etc.';


--
-- Name: COLUMN condition_occurrence.associated_provider_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.associated_provider_id IS 'A foreign key to the provider in the provider table who was responsible for determining (diagnosing) the condition.';


--
-- Name: COLUMN condition_occurrence.visit_occurrence_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.visit_occurrence_id IS 'A foreign key to the visit in the visit table during which the condition was determined (diagnosed).';


--
-- Name: COLUMN condition_occurrence.condition_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN condition_occurrence.condition_source_value IS 'The source code for the condition as it appears in the source data. This code is mapped to a standard condition concept in the vocabulary and the original code is stored here for reference. Condition source codes are typically ICD-9-CM diagnosis codes from medical claims or discharge status/disposition codes from EHRs.';


--
-- Name: death; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE death (
    person_death_id integer NOT NULL,
    person_id integer NOT NULL,
    death_date timestamp with time zone NOT NULL,
    death_type_concept_id integer NOT NULL,
    cause_of_death_concept_id integer,
    cause_of_death_source_value character varying(50)
);


ALTER TABLE public.death OWNER TO sheperd;

--
-- Name: TABLE death; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE death IS 'Time and cause of death of the person.';


--
-- Name: COLUMN death.person_death_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN death.person_death_id IS 'CBMi added single serial unique identifer for records in the omop_death table.';


--
-- Name: COLUMN death.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN death.person_id IS 'System-generated foreign key identifier to the deceased person. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN death.death_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN death.death_date IS 'The date the person deceased. If the precise date including day or month is not known or not allowed, December is used as the default month, and the last day of the month the default day.';


--
-- Name: COLUMN death.death_type_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN death.death_type_concept_id IS 'A foreign key referring to the predefined concept identifier in the vocabulary reflecting how the death was represented in the source data.';


--
-- Name: COLUMN death.cause_of_death_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN death.cause_of_death_concept_id IS 'A foreign key referring to a standard concept identifier in the vocabulary for conditions.';


--
-- Name: COLUMN death.cause_of_death_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN death.cause_of_death_source_value IS 'The source code for the cause of death as it appears in the source data. This code is mapped to a standard concept in the vocabulary and the original code is stored here for reference.';


--
-- Name: death_person_death_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE death_person_death_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.death_person_death_id_seq OWNER TO sheperd;

--
-- Name: death_person_death_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE death_person_death_id_seq OWNED BY death.person_death_id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO sheperd;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sheperd;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sheperd;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sheperd;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sheperd;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO sheperd;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO sheperd;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: drug_approval; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE drug_approval (
    ingredient_concept_id integer NOT NULL,
    approval_date timestamp with time zone NOT NULL,
    approved_by character varying(20) DEFAULT 'FDA'::character varying NOT NULL
);


ALTER TABLE public.drug_approval OWNER TO sheperd;

--
-- Name: drug_cost; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE drug_cost (
    drug_cost_id integer NOT NULL,
    drug_exposure_id integer NOT NULL,
    paid_copay numeric(8,2),
    paid_coinsurance numeric(8,2),
    paid_toward_deductible numeric(8,2),
    paid_by_payer numeric(8,2),
    paid_by_coordination_benefits numeric(8,2),
    total_out_of_pocket numeric(8,2),
    total_paid numeric(8,2),
    ingredient_cost numeric(8,2),
    dispensing_fee numeric(8,2),
    average_wholesale_price numeric(8,2),
    payer_plan_period_id integer
);


ALTER TABLE public.drug_cost OWNER TO sheperd;

--
-- Name: TABLE drug_cost; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE drug_cost IS 'For each Drug Exposure record additional information about cost and payments.';


--
-- Name: COLUMN drug_cost.drug_cost_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.drug_cost_id IS 'A system-generated unique identifier for each drug cost record.';


--
-- Name: COLUMN drug_cost.drug_exposure_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.drug_exposure_id IS 'A foreign key identifier to the drug record for which cost data are recorded. ';


--
-- Name: COLUMN drug_cost.paid_copay; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.paid_copay IS 'The amount paid by the person as a fixed contribution to the expenses. Copay does not contribute to the out_of_pocket expenses.';


--
-- Name: COLUMN drug_cost.paid_coinsurance; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.paid_coinsurance IS 'The amount paid by the person as a joint assumption of risk. Typically, this is a percentage of the expenses defined by the payer plan (policy) after the person''s deductible is exceeded.';


--
-- Name: COLUMN drug_cost.paid_toward_deductible; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.paid_toward_deductible IS 'The amount paid by the person that is counted toward the deductible defined by the payer plan (policy).';


--
-- Name: COLUMN drug_cost.paid_by_payer; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.paid_by_payer IS 'The amount paid by the payer (insurer). If there is more than one payer, several drug_cost records indicate that fact.';


--
-- Name: COLUMN drug_cost.paid_by_coordination_benefits; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.paid_by_coordination_benefits IS 'The amount paid by a secondary payer through the coordination of benefits.';


--
-- Name: COLUMN drug_cost.total_out_of_pocket; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.total_out_of_pocket IS 'The total amount paid by the person as a share of the expenses, excluding the copay.';


--
-- Name: COLUMN drug_cost.total_paid; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.total_paid IS 'The total amount paid for the expenses of drug exposure.';


--
-- Name: COLUMN drug_cost.ingredient_cost; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.ingredient_cost IS 'The portion of the drug expenses due to the cost charged by the manufacturer for the drug, typically a percentage of the Average Wholesale Price.';


--
-- Name: COLUMN drug_cost.dispensing_fee; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.dispensing_fee IS 'The portion of the drug expenses due to the dispensing fee charged by the pharmacy, typically a fixed amount.';


--
-- Name: COLUMN drug_cost.average_wholesale_price; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.average_wholesale_price IS 'List price of a drug set by the manufacturer.';


--
-- Name: COLUMN drug_cost.payer_plan_period_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_cost.payer_plan_period_id IS 'A foreign key to the payer_plan_period table, where the details of the payer, plan and family are stored.';


--
-- Name: drug_era; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE drug_era (
    drug_era_id integer NOT NULL,
    person_id integer NOT NULL,
    drug_concept_id integer NOT NULL,
    drug_era_start_date timestamp with time zone NOT NULL,
    drug_era_end_date timestamp with time zone NOT NULL,
    drug_type_concept_id integer NOT NULL,
    drug_exposure_count numeric(4,0)
);


ALTER TABLE public.drug_era OWNER TO sheperd;

--
-- Name: TABLE drug_era; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE drug_era IS 'Association between a person and a drug over a specific time period.';


--
-- Name: COLUMN drug_era.drug_era_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_era.drug_era_id IS 'A system-generated unique identifier for each drug era.';


--
-- Name: COLUMN drug_era.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_era.person_id IS 'A foreign key identifier to the person who is subjected to the drug during the drug era. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN drug_era.drug_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_era.drug_concept_id IS 'A foreign key that refers to a standard concept identifier in the vocabulary for the drug concept.';


--
-- Name: COLUMN drug_era.drug_era_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_era.drug_era_start_date IS 'The start date for the drug era constructed from the individual instances of drug exposures. It is the start date of the very first chronologically recorded instance of utilization of a drug.';


--
-- Name: COLUMN drug_era.drug_era_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_era.drug_era_end_date IS 'The end date for the drug era constructed from the individual instance of drug exposures. It is the end date of the final continuously recorded instance of utilization of a drug.';


--
-- Name: COLUMN drug_era.drug_type_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_era.drug_type_concept_id IS ' A foreign key to the predefined concept identifier in the vocabulary reflecting the parameters used to construct the drug era. For a detailed current listing of drug types see Appendix A: Drug Type Codes.';


--
-- Name: COLUMN drug_era.drug_exposure_count; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_era.drug_exposure_count IS 'The number of individual drug exposure occurrences used to construct the drug era.';


--
-- Name: drug_exposure; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE drug_exposure (
    drug_exposure_id integer NOT NULL,
    person_id integer NOT NULL,
    drug_concept_id integer NOT NULL,
    drug_exposure_start_date timestamp with time zone NOT NULL,
    drug_exposure_end_date timestamp with time zone,
    drug_type_concept_id integer NOT NULL,
    stop_reason character varying(20),
    refills numeric(3,0),
    quantity numeric(4,0),
    days_supply numeric(4,0),
    sig character varying(500),
    prescribing_provider_id integer,
    visit_occurrence_id integer,
    relevant_condition_concept_id integer,
    drug_source_value character varying(50)
);


ALTER TABLE public.drug_exposure OWNER TO sheperd;

--
-- Name: TABLE drug_exposure; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE drug_exposure IS 'Association between a person and a drug at a specific time.';


--
-- Name: COLUMN drug_exposure.drug_exposure_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.drug_exposure_id IS 'A system-generated unique identifier for each drug utilization event.';


--
-- Name: COLUMN drug_exposure.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.person_id IS 'System-generated foreign key identifier for the person who is subjected to the drug. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN drug_exposure.drug_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.drug_concept_id IS 'A foreign key that refers to a standard concept identifier in the vocabulary for the drug concept.';


--
-- Name: COLUMN drug_exposure.drug_exposure_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.drug_exposure_start_date IS 'The start date for the current instance of drug utilization. Valid entries include a start date of a prescription, the date a prescription was filled, or the date on which a drug administration procedure was recorded.';


--
-- Name: COLUMN drug_exposure.drug_exposure_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.drug_exposure_end_date IS 'The end date for the current instance of drug utilization. It is not available from all sources.';


--
-- Name: COLUMN drug_exposure.drug_type_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.drug_type_concept_id IS ' A foreign key to the predefined concept identifier in the vocabulary reflecting the type of drug exposure recorded. It indicates how the drug exposure was represented in the source data: as medication history, filled prescriptions, etc. For a detailed current listing of drug types see Appendix A: Drug Type Codes';


--
-- Name: COLUMN drug_exposure.stop_reason; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.stop_reason IS 'The reason the medication was stopped, where available. Reasons include regimen completed, changed, removed, etc.';


--
-- Name: COLUMN drug_exposure.refills; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.refills IS 'The number of refills after the initial prescription. The initial prescription is not counted. Values start with 0.';


--
-- Name: COLUMN drug_exposure.quantity; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.quantity IS 'The quantity of drug as recorded in the original prescription or dispensing record.';


--
-- Name: COLUMN drug_exposure.days_supply; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.days_supply IS 'The number of days of supply of the medication as recorded in the original prescription or dispensing record.';


--
-- Name: COLUMN drug_exposure.sig; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.sig IS 'The directions ("signetur") on the drug prescription as recorded in the original prescription (and printed on the container) or dispensing record.';


--
-- Name: COLUMN drug_exposure.visit_occurrence_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.visit_occurrence_id IS 'A foreign key to the visit in the visit table during which the drug exposure initiated.';


--
-- Name: COLUMN drug_exposure.relevant_condition_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.relevant_condition_concept_id IS 'A foreign key to the predefined concept identifier in the vocabulary reflecting the condition that was the cause for initiation of the drug exposure. Note that this is not a direct reference to a specific condition record in the condition table, but rather a condition concept in the vocabulary.';


--
-- Name: COLUMN drug_exposure.drug_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_exposure.drug_source_value IS 'The source code for the drug as it appears in the source data. This code is mapped to a standard drug concept in the vocabulary and the original code is stored here for reference.';


--
-- Name: drug_strength; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE drug_strength (
    drug_strength_id integer NOT NULL,
    drug_concept_id integer NOT NULL,
    ingredient_concept_id integer NOT NULL,
    amount_value numeric(50,0),
    amount_unit character varying(60),
    concentration_value numeric(50,0),
    concentration_enum_unit character varying(60),
    concentration_denom_unit character varying(60),
    valid_start_date timestamp with time zone NOT NULL,
    valid_end_date timestamp with time zone NOT NULL,
    invalid_reason character varying(1)
);


ALTER TABLE public.drug_strength OWNER TO sheperd;

--
-- Name: COLUMN drug_strength.drug_strength_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN drug_strength.drug_strength_id IS 'CBMi added single serial unique identifer for records in the drug_strength table.';


--
-- Name: drug_strength_drug_strength_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE drug_strength_drug_strength_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drug_strength_drug_strength_id_seq OWNER TO sheperd;

--
-- Name: drug_strength_drug_strength_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE drug_strength_drug_strength_id_seq OWNED BY drug_strength.drug_strength_id;


--
-- Name: ethnicity; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE ethnicity (
    concept_id integer,
    concept_name character varying(256),
    concept_level integer,
    concept_class character varying(60),
    vocabulary_id integer,
    concept_code character varying(40),
    valid_start_date timestamp with time zone,
    valid_end_date timestamp with time zone,
    invalid_reason character(1)
);


ALTER TABLE public.ethnicity OWNER TO sheperd;

--
-- Name: gender; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE gender (
    concept_id integer,
    concept_name character varying(256),
    concept_level integer,
    concept_class character varying(60),
    vocabulary_id integer,
    concept_code character varying(40),
    valid_start_date timestamp with time zone,
    valid_end_date timestamp with time zone,
    invalid_reason character(1)
);


ALTER TABLE public.gender OWNER TO sheperd;

--
-- Name: location; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE location (
    location_id integer NOT NULL,
    address_1 character varying(50),
    address_2 character varying(50),
    city character varying(50),
    state character(2),
    zip character varying(9),
    county character varying(20),
    location_source_value character varying(50)
);


ALTER TABLE public.location OWNER TO sheperd;

--
-- Name: TABLE location; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE location IS 'Physical addresses.';


--
-- Name: COLUMN location.location_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN location.location_id IS 'A system-generated unique identifier for each geographic location.';


--
-- Name: COLUMN location.address_1; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN location.address_1 IS 'The address field 1, typically used for the street address, as it appears in the source data.';


--
-- Name: COLUMN location.address_2; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN location.address_2 IS 'The address field 2, typically used for additional detail such as buildings, suites, floors, as it appears in the source data.';


--
-- Name: COLUMN location.city; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN location.city IS 'The city field as it appears in the source data.';


--
-- Name: COLUMN location.state; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN location.state IS 'The state field as it appears in the source data.';


--
-- Name: COLUMN location.zip; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN location.zip IS 'The zip code. For US addresses, valid zip codes can be 3, 5 or 9 digits long, depending on the source data.';


--
-- Name: COLUMN location.county; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN location.county IS 'The county. The county information is necessary because not all zip codes fall into one and the same county.';


--
-- Name: COLUMN location.location_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN location.location_source_value IS 'The verbatim information that is used to uniquely identify the location as it appears in the source data.';


--
-- Name: observation; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE observation (
    observation_id integer NOT NULL,
    person_id integer NOT NULL,
    observation_concept_id integer NOT NULL,
    observation_date date NOT NULL,
    observation_time time with time zone,
    value_as_number numeric(14,3),
    value_as_string character varying(60),
    value_as_concept_id integer,
    unit_concept_id integer,
    range_low numeric(14,3),
    range_high numeric(14,3),
    observation_type_concept_id integer NOT NULL,
    associated_provider_id integer NOT NULL,
    visit_occurrence_id integer,
    relevant_condition_concept_id integer,
    observation_source_value character varying(50),
    units_source_value character varying(50)
);


ALTER TABLE public.observation OWNER TO sheperd;

--
-- Name: TABLE observation; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE observation IS 'Symptoms, clinical observations, lab tests etc. about the person.';


--
-- Name: COLUMN observation.observation_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.observation_id IS 'A system-generated unique identifier for each observation.';


--
-- Name: COLUMN observation.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.person_id IS 'A foreign key identifier to the person about whom the observation was recorded. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN observation.observation_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.observation_concept_id IS 'A foreign key to the standard observation concept identifier in the vocabulary. ';


--
-- Name: COLUMN observation.observation_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.observation_date IS 'The date of the observation';


--
-- Name: COLUMN observation.observation_time; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.observation_time IS 'The time of the observation';


--
-- Name: COLUMN observation.value_as_number; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.value_as_number IS 'The observation result stored as a number. This is applicable to observations where the result is expressed as a numeric value.';


--
-- Name: COLUMN observation.value_as_string; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.value_as_string IS 'The observation result stored as a string. This is applicable to observations where the result is expressed as verbatim text, such as in radiology or pathology report';


--
-- Name: COLUMN observation.value_as_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.value_as_concept_id IS 'A foreign key to an observation result stored as a concept identifier. This is applicable to observations where the result can be expressed as a standard concept from the vocabulary (e.g., positive/negative, present/absent, low/high, etc.).';


--
-- Name: COLUMN observation.unit_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.unit_concept_id IS 'A foreign key to a standard concept identifier of measurement units in the vocabulary.';


--
-- Name: COLUMN observation.range_low; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.range_low IS 'The lower limit of the normal range of the observation. It is not applicable if the observation results are non-numeric or categorical, and must be in the same units of measure as the observation value.';


--
-- Name: COLUMN observation.range_high; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.range_high IS 'The upper limit of the normal range of the observation. It is not applicable if the observation results are non-numeric or categorical, and must be in the same units of measure as the observation value.';


--
-- Name: COLUMN observation.observation_type_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.observation_type_concept_id IS 'A foreign key to the predefined concept identifier in the vocabulary reflecting the type of the observation.';


--
-- Name: COLUMN observation.associated_provider_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.associated_provider_id IS 'A foreign key to the provider in the provider table who was responsible for making the observation.';


--
-- Name: COLUMN observation.visit_occurrence_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.visit_occurrence_id IS 'A foreign key to the visit in the visit table during which the observation was recorded.';


--
-- Name: COLUMN observation.relevant_condition_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.relevant_condition_concept_id IS 'A foreign key to the predefined concept identifier in the vocabulary reflecting the condition that was associated with the observation. Note that this is not a direct reference to a specific condition record in the condition table, but rather a condition concept in the vocabulary.';


--
-- Name: COLUMN observation.observation_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.observation_source_value IS 'The observation code as it appears in the source data. This code is mapped to a standard concept in the vocabulary and the original code is stored here for reference.';


--
-- Name: COLUMN observation.units_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation.units_source_value IS 'The source code for the unit as it appears in the source data. This code is mapped to a standard unit concept in the vocabulary and the original code is stored here for reference. ';


--
-- Name: observation_period; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE observation_period (
    observation_period_id integer NOT NULL,
    person_id integer NOT NULL,
    observation_period_start_date timestamp with time zone NOT NULL,
    observation_period_end_date timestamp with time zone NOT NULL
);


ALTER TABLE public.observation_period OWNER TO sheperd;

--
-- Name: TABLE observation_period; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE observation_period IS 'Time intervals at which health care information may be available.';


--
-- Name: COLUMN observation_period.observation_period_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation_period.observation_period_id IS 'A system-generated unique identifier for each observation period.';


--
-- Name: COLUMN observation_period.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation_period.person_id IS 'A foreign key identifier to the person for whom the observation period is defined. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN observation_period.observation_period_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation_period.observation_period_start_date IS 'The start date of the observation period for which data are available from the data source.';


--
-- Name: COLUMN observation_period.observation_period_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN observation_period.observation_period_end_date IS 'The end date of the observation period for which data are available from the data source.';


--
-- Name: organization; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE organization (
    organization_id integer NOT NULL,
    place_of_service_concept_id integer,
    location_id integer,
    organization_source_value character varying(50),
    place_of_service_source_value character varying(50)
);


ALTER TABLE public.organization OWNER TO sheperd;

--
-- Name: TABLE organization; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE organization IS 'Information about health care organizations. ';


--
-- Name: COLUMN organization.organization_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN organization.organization_id IS 'A system-generated unique identifier for each organization. Here, an organization is defined as a collection of one or more care sites that share a single EHR database.';


--
-- Name: COLUMN organization.place_of_service_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN organization.place_of_service_concept_id IS 'A foreign key that refers to a place of service concept identifier in the vocabulary.';


--
-- Name: COLUMN organization.location_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN organization.location_id IS 'A foreign key to the geographic location of the administrative offices in the location table, where the detailed address information is stored.';


--
-- Name: COLUMN organization.organization_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN organization.organization_source_value IS 'The identifier for the organization in the source data is stored here for reference.';


--
-- Name: COLUMN organization.place_of_service_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN organization.place_of_service_source_value IS 'The source code for the place of service as it appears in the source data is stored here for reference.';


--
-- Name: payer_plan_period; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE payer_plan_period (
    payer_plan_period_id integer NOT NULL,
    person_id integer NOT NULL,
    payer_plan_period_start_date timestamp with time zone NOT NULL,
    payer_plan_period_end_date timestamp with time zone NOT NULL,
    payer_source_value character varying(50),
    plan_source_value character varying(50),
    family_source_value character varying(50)
);


ALTER TABLE public.payer_plan_period OWNER TO sheperd;

--
-- Name: TABLE payer_plan_period; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE payer_plan_period IS 'Information about the coverage plan of the payer.';


--
-- Name: COLUMN payer_plan_period.payer_plan_period_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN payer_plan_period.payer_plan_period_id IS 'A system-generated identifier for each unique combination of payer, plan, family code and time span';


--
-- Name: COLUMN payer_plan_period.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN payer_plan_period.person_id IS 'A foreign key identifier to the person covered by the payer. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN payer_plan_period.payer_plan_period_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN payer_plan_period.payer_plan_period_start_date IS 'The start date of the payer plan period.';


--
-- Name: COLUMN payer_plan_period.payer_plan_period_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN payer_plan_period.payer_plan_period_end_date IS 'The end date of the payer plan period defined for the person.';


--
-- Name: COLUMN payer_plan_period.payer_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN payer_plan_period.payer_source_value IS 'The source code for the payer as it appears in the source data.';


--
-- Name: COLUMN payer_plan_period.plan_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN payer_plan_period.plan_source_value IS 'The source code for the person''s coverage plan as it appears in the source data.';


--
-- Name: COLUMN payer_plan_period.family_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN payer_plan_period.family_source_value IS 'The source code for the person''s family as it appears in the source data.';


--
-- Name: person; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE person (
    person_id integer NOT NULL,
    gender_concept_id integer NOT NULL,
    year_of_birth numeric(4,0) NOT NULL,
    month_of_birth numeric(2,0),
    day_of_birth numeric(2,0),
    race_concept_id integer,
    ethnicity_concept_id integer,
    location_id integer,
    provider_id integer,
    care_site_id integer,
    person_source_value character varying(50),
    gender_source_value character varying(50),
    race_source_value character varying(50),
    ethnicity_source_value character varying(50)
);


ALTER TABLE public.person OWNER TO sheperd;

--
-- Name: TABLE person; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE person IS 'Demographic information about a Person (patient).';


--
-- Name: COLUMN person.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.person_id IS 'System-generated identifier to uniquely identify each PERSON.';


--
-- Name: COLUMN person.gender_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.gender_concept_id IS 'Foreign key that refers to the standard Concept Code in the Dictionary for the Gender of the Person.';


--
-- Name: COLUMN person.year_of_birth; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.year_of_birth IS 'The year of birth of the Person. For data sources with date of birth, only the year is extracted. For data sources where the year of birth is not available, the approximate year of birth is derived based on any age group categorization available.';


--
-- Name: COLUMN person.month_of_birth; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.month_of_birth IS 'The month of birth of the person. For data sources that provide the precise date of birth, the month is extracted and stored in this field.';


--
-- Name: COLUMN person.day_of_birth; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.day_of_birth IS 'The day of the month of birth of the person. For data sources that provide the precise date of birth, the day is extracted and stored in this field.';


--
-- Name: COLUMN person.race_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.race_concept_id IS 'A foreign key that refers to a standard concept identifier in the vocabulary for the race of the person.';


--
-- Name: COLUMN person.ethnicity_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.ethnicity_concept_id IS 'A foreign key that refers to the standard concept identifier in the vocabulary for the ethnicity of the person.';


--
-- Name: COLUMN person.location_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.location_id IS 'A foreign key to the place of residency for the person in the location table, where the detailed address information is stored.';


--
-- Name: COLUMN person.provider_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.provider_id IS 'A foreign key to the primary care provider the person is seeing in the provider table.';


--
-- Name: COLUMN person.care_site_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.care_site_id IS 'A foreign key to the primary care site in the care site table, where the details of the care site are stored.';


--
-- Name: COLUMN person.person_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.person_source_value IS 'An encrypted key derived from the person identifier in the source data. This is necessary when a drug safety issue requires a link back to the person data at the source dataset. No value with any medical or demographic significance must be stored.
';


--
-- Name: COLUMN person.gender_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.gender_source_value IS 'The source code for the gender of the person as it appears in the source data. The person gender is mapped to a standard gender concept in the vocabulary and the corresponding concept identifier is, stored here for reference.';


--
-- Name: COLUMN person.race_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.race_source_value IS 'The source code for the race of the person as it appears in the source data. The person race is mapped to a standard race concept in the vocabulary and the original code is, stored here for reference.';


--
-- Name: COLUMN person.ethnicity_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN person.ethnicity_source_value IS 'The source code for the ethnicity of the person as it appears in the source data. The person ethnicity is mapped to a standard ethnicity concept in the vocabulary and the original code is, stored here for reference.';


--
-- Name: person_location; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE person_location (
    location_id integer,
    address_1 character varying(50),
    address_2 character varying(50),
    city character varying(50),
    state character(2),
    zip character varying(9),
    county character varying(20),
    location_source_value character varying(50)
);


ALTER TABLE public.person_location OWNER TO sheperd;

--
-- Name: procedure_cost; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE procedure_cost (
    procedure_cost_id integer NOT NULL,
    procedure_occurrence_id integer NOT NULL,
    paid_copay numeric(8,2),
    paid_coinsurance numeric(8,2),
    paid_toward_deductible numeric(8,2),
    paid_by_payer numeric(8,2),
    paid_by_coordination_benefits numeric(8,2),
    total_out_of_pocket numeric(8,2),
    total_paid numeric(8,2),
    disease_class_concept_id integer,
    revenue_code_concept_id integer,
    payer_plan_period_id integer,
    disease_class_source_value character varying(50),
    revenue_code_source_value character varying(50)
);


ALTER TABLE public.procedure_cost OWNER TO sheperd;

--
-- Name: TABLE procedure_cost; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE procedure_cost IS 'For each Procedure additional information about cost and payments.';


--
-- Name: COLUMN procedure_cost.procedure_cost_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.procedure_cost_id IS 'A system-generated unique identifier for each procedure cost record.';


--
-- Name: COLUMN procedure_cost.procedure_occurrence_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.procedure_occurrence_id IS 'A foreign key identifier to the procedure record for which cost data are recorded. ';


--
-- Name: COLUMN procedure_cost.paid_copay; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.paid_copay IS 'The amount paid by the person as a fixed contribution to the expenses. Copay does not contribute to the out_of_pocket expenses.';


--
-- Name: COLUMN procedure_cost.paid_coinsurance; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.paid_coinsurance IS 'The amount paid by the person as a joint assumption of risk. Typically, this is a percentage of the expenses defined by the payer plan (policy) after the person''s deductible is exceeded.';


--
-- Name: COLUMN procedure_cost.paid_toward_deductible; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.paid_toward_deductible IS 'The amount paid by the person that is counted toward the deductible defined by the payer plan (policy).';


--
-- Name: COLUMN procedure_cost.paid_by_payer; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.paid_by_payer IS 'The amount paid by the payer (insurer). If there is more than one payer, several procedure_cost records indicate that fact.';


--
-- Name: COLUMN procedure_cost.paid_by_coordination_benefits; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.paid_by_coordination_benefits IS 'The amount paid by a secondary payer through the coordination of benefits.';


--
-- Name: COLUMN procedure_cost.total_out_of_pocket; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.total_out_of_pocket IS 'The total amount paid by the person as a share of the expenses, excluding the copay.';


--
-- Name: COLUMN procedure_cost.total_paid; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.total_paid IS 'The total amount paid for the expenses of the procedure.';


--
-- Name: COLUMN procedure_cost.disease_class_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.disease_class_concept_id IS 'A foreign key referring to a standard concept identifier in the vocabulary for disease classes, such as DRGs and APCs.';


--
-- Name: COLUMN procedure_cost.revenue_code_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.revenue_code_concept_id IS 'A foreign key referring to a standard concept identifier in the vocabulary for revenue codes.';


--
-- Name: COLUMN procedure_cost.payer_plan_period_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.payer_plan_period_id IS 'A foreign key to the payer_plan_period table, where the details of the payer, plan and family are stored.';


--
-- Name: COLUMN procedure_cost.disease_class_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.disease_class_source_value IS 'The source code for the disease class as it appears in the source data is stored here for reference.';


--
-- Name: COLUMN procedure_cost.revenue_code_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_cost.revenue_code_source_value IS 'The source code for the revenue code as it appears in the source data is stored here for reference.';


--
-- Name: procedure_occurrence; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE procedure_occurrence (
    procedure_occurrence_id integer NOT NULL,
    person_id integer NOT NULL,
    procedure_concept_id integer NOT NULL,
    procedure_date timestamp with time zone NOT NULL,
    procedure_type_concept_id integer NOT NULL,
    associated_provider_id integer,
    visit_occurrence_id integer,
    relevant_condition_concept_id integer,
    procedure_source_value character varying(50)
);


ALTER TABLE public.procedure_occurrence OWNER TO sheperd;

--
-- Name: TABLE procedure_occurrence; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE procedure_occurrence IS 'Procedures carried out on the person.';


--
-- Name: COLUMN procedure_occurrence.procedure_occurrence_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.procedure_occurrence_id IS 'A system-generated unique identifier for each procedure occurrence.';


--
-- Name: COLUMN procedure_occurrence.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.person_id IS 'A foreign key identifier to the person who is subjected to the procedure. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN procedure_occurrence.procedure_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.procedure_concept_id IS 'A foreign key that refers to a standard procedure concept identifier in the vocabulary. ';


--
-- Name: COLUMN procedure_occurrence.procedure_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.procedure_date IS 'The date on which the procedure was performed.';


--
-- Name: COLUMN procedure_occurrence.procedure_type_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.procedure_type_concept_id IS 'A foreign key to the predefined concept identifier in the vocabulary reflecting the type of the procedure. For a detailed current listing of procedure types see Appendix C: Procedure Type Concepts.';


--
-- Name: COLUMN procedure_occurrence.associated_provider_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.associated_provider_id IS 'A foreign key to the provider in the provider table who was responsible for carrying out the procedure.';


--
-- Name: COLUMN procedure_occurrence.visit_occurrence_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.visit_occurrence_id IS 'A foreign key to the visit in the visit table during which the procedure was carried out.';


--
-- Name: COLUMN procedure_occurrence.relevant_condition_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.relevant_condition_concept_id IS 'A foreign key to the predefined concept identifier in the vocabulary reflecting the condition that was the cause for initiation of the procedure. Note that this is not a direct reference to a specific condition record in the condition table, but rather a condition concept in the vocabulary.';


--
-- Name: COLUMN procedure_occurrence.procedure_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN procedure_occurrence.procedure_source_value IS 'The source code for the procedure as it appears in the source data. This code is mapped to a standard procedure concept in the vocabulary and the original code is stored here for reference. Procedure source codes are typically ICD-9-Proc, CPT-4 or HCPCS codes.';


--
-- Name: provider; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE provider (
    provider_id integer NOT NULL,
    npi character varying(20),
    dea character varying(20),
    specialty_concept_id integer,
    care_site_id integer,
    provider_source_value character varying(50) NOT NULL,
    specialty_source_value character varying(50)
);


ALTER TABLE public.provider OWNER TO sheperd;

--
-- Name: TABLE provider; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE provider IS 'Information about health care providers.';


--
-- Name: COLUMN provider.provider_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN provider.provider_id IS 'A system-generated unique identifier for each provider.';


--
-- Name: COLUMN provider.npi; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN provider.npi IS 'The National Provider Identifier (NPI) of the provider.';


--
-- Name: COLUMN provider.dea; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN provider.dea IS 'The Drug Enforcement Administration (DEA) number of the provider.';


--
-- Name: COLUMN provider.specialty_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN provider.specialty_concept_id IS 'A foreign key to a standard provider''s specialty concept identifier in the vocabulary.';


--
-- Name: COLUMN provider.care_site_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN provider.care_site_id IS 'A foreign key to the main care site where the provider is practicing.';


--
-- Name: COLUMN provider.provider_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN provider.provider_source_value IS 'The identifier used for the provider in the source data. Information that is used to uniquely identify the provider as it appears in the source data is stored here for reference.';


--
-- Name: COLUMN provider.specialty_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN provider.specialty_source_value IS 'The source code for the provider specialty as it appears in the source data is stored here for reference.';


--
-- Name: provider_specialty; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW provider_specialty AS
 SELECT DISTINCT concept.concept_id,
    concept.concept_name,
    concept.concept_level,
    concept.concept_class,
    concept.vocabulary_id,
    concept.concept_code,
    concept.valid_start_date,
    concept.valid_end_date,
    concept.invalid_reason
   FROM (concept
   JOIN provider ON ((concept.concept_id = provider.specialty_concept_id)))
  WITH NO DATA;


ALTER TABLE public.provider_specialty OWNER TO sheperd;

--
-- Name: race; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE race (
    concept_id integer,
    concept_name character varying(256),
    concept_level integer,
    concept_class character varying(60),
    vocabulary_id integer,
    concept_code character varying(40),
    valid_start_date timestamp with time zone,
    valid_end_date timestamp with time zone,
    invalid_reason character(1)
);


ALTER TABLE public.race OWNER TO sheperd;

--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    verified boolean NOT NULL,
    activated boolean NOT NULL,
    moderated boolean NOT NULL,
    moderator_id integer,
    moderation_time timestamp with time zone
);


ALTER TABLE public.registration_registrationprofile OWNER TO sheperd;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_registrationprofile_id_seq OWNER TO sheperd;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


--
-- Name: relationship; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE relationship (
    relationship_id integer NOT NULL,
    relationship_name character varying(256) NOT NULL,
    is_hierarchical integer NOT NULL,
    defines_ancestry integer DEFAULT 1 NOT NULL,
    reverse_relationship integer
);


ALTER TABLE public.relationship OWNER TO sheperd;

--
-- Name: TABLE relationship; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE relationship IS 'A list of relationship between concepts. Some of these relationships are generic (e.g. "Subsumes" relationship), others are domain-specific.';


--
-- Name: COLUMN relationship.relationship_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN relationship.relationship_id IS 'The type of relationship captured by the relationship record.';


--
-- Name: COLUMN relationship.relationship_name; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN relationship.relationship_name IS 'The text that describes the relationship type.';


--
-- Name: COLUMN relationship.is_hierarchical; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN relationship.is_hierarchical IS 'Defines whether a relationship defines concepts into classes or hierarchies. Values are Y for hierarchical relationship or NULL if not';


--
-- Name: COLUMN relationship.defines_ancestry; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN relationship.defines_ancestry IS 'Defines whether a hierarchical relationship contributes to the concept_ancestor table. These are subsets of the hierarchical relationships. Valid values are Y or NULL.';


--
-- Name: COLUMN relationship.reverse_relationship; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN relationship.reverse_relationship IS 'Relationship ID of the reverse relationship to this one. Corresponding records of reverse relationships have their concept_id_1 and concept_id_2 swapped.';


--
-- Name: serrano_apitoken; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE serrano_apitoken (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(32) NOT NULL,
    revoked boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.serrano_apitoken OWNER TO sheperd;

--
-- Name: serrano_apitoken_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE serrano_apitoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.serrano_apitoken_id_seq OWNER TO sheperd;

--
-- Name: serrano_apitoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE serrano_apitoken_id_seq OWNED BY serrano_apitoken.id;


--
-- Name: source_to_concept_map; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE source_to_concept_map (
    source_to_concept_map_id integer NOT NULL,
    source_code character varying(40) NOT NULL,
    source_vocabulary_id integer NOT NULL,
    source_code_description character varying(256),
    target_concept_id integer NOT NULL,
    target_vocabulary_id integer NOT NULL,
    mapping_type character varying(20),
    primary_map character(1),
    valid_start_date timestamp with time zone NOT NULL,
    valid_end_date timestamp with time zone DEFAULT '2099-12-31 00:00:00-05'::timestamp with time zone NOT NULL,
    invalid_reason character(1),
    CONSTRAINT source_to_concept_map_invalid_reason_check CHECK ((invalid_reason = ANY (ARRAY['D'::bpchar, 'U'::bpchar]))),
    CONSTRAINT source_to_concept_map_invalid_reason_check1 CHECK ((invalid_reason = ANY (ARRAY['D'::bpchar, 'U'::bpchar]))),
    CONSTRAINT source_to_concept_map_primary_map_check CHECK ((primary_map = 'Y'::bpchar)),
    CONSTRAINT source_to_concept_map_primary_map_check1 CHECK ((primary_map = 'Y'::bpchar))
);


ALTER TABLE public.source_to_concept_map OWNER TO sheperd;

--
-- Name: TABLE source_to_concept_map; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE source_to_concept_map IS 'A map between commonly used terminologies and the CDM Standard Vocabulary. For example, drugs are often recorded as NDC, while the Standard Vocabulary for drugs is RxNorm.';


--
-- Name: COLUMN source_to_concept_map.source_to_concept_map_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.source_to_concept_map_id IS 'CBMi added single serial unique identifer for records in the source_to_concept_map table.';


--
-- Name: COLUMN source_to_concept_map.source_code; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.source_code IS 'The source code being translated into a standard concept.';


--
-- Name: COLUMN source_to_concept_map.source_vocabulary_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.source_vocabulary_id IS 'A foreign key to the vocabulary table defining the vocabulary of the source code that is being mapped to the standard vocabulary.';


--
-- Name: COLUMN source_to_concept_map.source_code_description; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.source_code_description IS 'An optional description for the source code. This is included as a convenience to compare the description of the source code to the name of the concept.';


--
-- Name: COLUMN source_to_concept_map.target_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.target_concept_id IS 'A foreign key to the concept to which the source code is being mapped.';


--
-- Name: COLUMN source_to_concept_map.target_vocabulary_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.target_vocabulary_id IS 'A foreign key to the vocabulary table defining the vocabulary of the target concept.';


--
-- Name: COLUMN source_to_concept_map.mapping_type; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.mapping_type IS 'A string identifying the observational data element being translated. Examples include ''DRUG'', ''CONDITION'', ''PROCEDURE'', ''PROCEDURE DRUG'' etc. It is important to pick the appropriate mapping record when the same source code is being mapped to different concepts in different contexts. As an example a procedure code for drug administration can be mapped to a procedure concept or a drug concept.';


--
-- Name: COLUMN source_to_concept_map.primary_map; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.primary_map IS 'A boolean value identifying the primary mapping relationship for those sets where the source_code, the source_concept_type_id and the mapping type is identical (one-to-many mappings). The ETL will only consider the primary map. Permitted values are Y and null.';


--
-- Name: COLUMN source_to_concept_map.valid_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.valid_start_date IS 'The date when the mapping instance was first recorded.';


--
-- Name: COLUMN source_to_concept_map.valid_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.valid_end_date IS 'The date when the mapping instance became invalid because it was deleted or superseded (updated) by a new relationship. Default value is 31-Dec-2099.';


--
-- Name: COLUMN source_to_concept_map.invalid_reason; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN source_to_concept_map.invalid_reason IS 'Reason the mapping instance was invalidated. Possible values are D (deleted), U (replaced with an update) or NULL when valid_end_date has the default value.';


--
-- Name: source_to_concept_map_source_to_concept_map_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE source_to_concept_map_source_to_concept_map_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_to_concept_map_source_to_concept_map_id_seq OWNER TO sheperd;

--
-- Name: source_to_concept_map_source_to_concept_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE source_to_concept_map_source_to_concept_map_id_seq OWNED BY source_to_concept_map.source_to_concept_map_id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO sheperd;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: sheperd
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO sheperd;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sheperd
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: visit_occurrence; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE visit_occurrence (
    visit_occurrence_id integer NOT NULL,
    person_id integer NOT NULL,
    visit_start_date timestamp with time zone NOT NULL,
    visit_end_date timestamp with time zone NOT NULL,
    place_of_service_concept_id integer NOT NULL,
    care_site_id integer,
    place_of_service_source_value character varying(50)
);


ALTER TABLE public.visit_occurrence OWNER TO sheperd;

--
-- Name: TABLE visit_occurrence; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE visit_occurrence IS 'Visits for health care services of the person.';


--
-- Name: COLUMN visit_occurrence.visit_occurrence_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN visit_occurrence.visit_occurrence_id IS 'A system-generated unique identifier for each person''s visit or encounter at a healthcare provider.';


--
-- Name: COLUMN visit_occurrence.person_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN visit_occurrence.person_id IS 'A foreign key identifier to the person for whom the visit is recorded. The demographic details of that person are stored in the person table.';


--
-- Name: COLUMN visit_occurrence.visit_start_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN visit_occurrence.visit_start_date IS 'The start date of the visit.';


--
-- Name: COLUMN visit_occurrence.visit_end_date; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN visit_occurrence.visit_end_date IS 'The end date of the visit. If this is a one-day visit the end date should match the start date.';


--
-- Name: COLUMN visit_occurrence.place_of_service_concept_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN visit_occurrence.place_of_service_concept_id IS 'A foreign key that refers to a place of service concept identifier in the vocabulary.';


--
-- Name: COLUMN visit_occurrence.care_site_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN visit_occurrence.care_site_id IS 'A foreign key to the care site in the care site table that was visited.';


--
-- Name: COLUMN visit_occurrence.place_of_service_source_value; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN visit_occurrence.place_of_service_source_value IS 'The source code used to reflect the type or source of the visit in the source data. Valid entries include office visits, hospital admissions, etc. These source codes can also be type-of service codes and activity type codes.';


--
-- Name: visit_condition; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_condition AS
 SELECT DISTINCT condition_occurrence.condition_occurrence_id,
    condition_occurrence.person_id,
    condition_occurrence.condition_concept_id,
    condition_occurrence.condition_start_date,
    condition_occurrence.condition_end_date,
    condition_occurrence.condition_type_concept_id,
    condition_occurrence.stop_reason,
    condition_occurrence.associated_provider_id,
    condition_occurrence.visit_occurrence_id,
    condition_occurrence.condition_source_value
   FROM (condition_occurrence
   JOIN visit_occurrence ON ((condition_occurrence.visit_occurrence_id = visit_occurrence.visit_occurrence_id)))
  WITH NO DATA;


ALTER TABLE public.visit_condition OWNER TO sheperd;

--
-- Name: visit_condition1; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE visit_condition1 (
    condition_occurrence_id integer,
    person_id integer,
    condition_concept_id integer,
    condition_start_date timestamp with time zone,
    condition_end_date timestamp with time zone,
    condition_type_concept_id integer,
    stop_reason character varying(20),
    associated_provider_id integer,
    visit_occurrence_id integer,
    condition_source_value character varying(50)
);


ALTER TABLE public.visit_condition1 OWNER TO sheperd;

--
-- Name: visit_condition_concept; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_condition_concept AS
 SELECT DISTINCT concept.concept_id,
    concept.concept_name,
    concept.concept_level,
    concept.concept_class,
    concept.vocabulary_id,
    concept.concept_code,
    concept.valid_start_date,
    concept.valid_end_date,
    concept.invalid_reason
   FROM (concept
   JOIN visit_condition ON ((concept.concept_id = visit_condition.condition_concept_id)))
  WITH NO DATA;


ALTER TABLE public.visit_condition_concept OWNER TO sheperd;

--
-- Name: visit_condition_type; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_condition_type AS
 SELECT DISTINCT concept.concept_id,
    concept.concept_name,
    concept.concept_level,
    concept.concept_class,
    concept.vocabulary_id,
    concept.concept_code,
    concept.valid_start_date,
    concept.valid_end_date,
    concept.invalid_reason
   FROM (concept
   JOIN visit_condition ON ((concept.concept_id = visit_condition.condition_type_concept_id)))
  WITH NO DATA;


ALTER TABLE public.visit_condition_type OWNER TO sheperd;

--
-- Name: visit_drug; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_drug AS
 SELECT DISTINCT drug_exposure.drug_exposure_id,
    drug_exposure.person_id,
    drug_exposure.drug_concept_id,
    drug_exposure.drug_exposure_start_date,
    drug_exposure.drug_exposure_end_date,
    drug_exposure.drug_type_concept_id,
    drug_exposure.stop_reason,
    drug_exposure.refills,
    drug_exposure.quantity,
    drug_exposure.days_supply,
    drug_exposure.sig,
    drug_exposure.prescribing_provider_id,
    drug_exposure.visit_occurrence_id,
    drug_exposure.relevant_condition_concept_id,
    drug_exposure.drug_source_value
   FROM (drug_exposure
   JOIN visit_occurrence ON ((drug_exposure.visit_occurrence_id = visit_occurrence.visit_occurrence_id)))
  WITH NO DATA;


ALTER TABLE public.visit_drug OWNER TO sheperd;

--
-- Name: visit_drug_concept; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_drug_concept AS
 SELECT DISTINCT concept.concept_id,
    concept.concept_name,
    concept.concept_level,
    concept.concept_class,
    concept.vocabulary_id,
    concept.concept_code,
    concept.valid_start_date,
    concept.valid_end_date,
    concept.invalid_reason
   FROM (concept
   JOIN visit_drug ON ((concept.concept_id = visit_drug.drug_concept_id)))
  WITH NO DATA;


ALTER TABLE public.visit_drug_concept OWNER TO sheperd;

--
-- Name: visit_drug_type; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_drug_type AS
 SELECT DISTINCT concept.concept_id,
    concept.concept_name,
    concept.concept_level,
    concept.concept_class,
    concept.vocabulary_id,
    concept.concept_code,
    concept.valid_start_date,
    concept.valid_end_date,
    concept.invalid_reason
   FROM (concept
   JOIN visit_drug ON ((concept.concept_id = visit_drug.drug_type_concept_id)))
  WITH NO DATA;


ALTER TABLE public.visit_drug_type OWNER TO sheperd;

--
-- Name: visit_procedure; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_procedure AS
 SELECT DISTINCT procedure_occurrence.procedure_occurrence_id,
    procedure_occurrence.person_id,
    procedure_occurrence.procedure_concept_id,
    procedure_occurrence.procedure_date,
    procedure_occurrence.procedure_type_concept_id,
    procedure_occurrence.associated_provider_id,
    procedure_occurrence.visit_occurrence_id,
    procedure_occurrence.relevant_condition_concept_id,
    procedure_occurrence.procedure_source_value
   FROM (procedure_occurrence
   JOIN visit_occurrence ON ((procedure_occurrence.visit_occurrence_id = visit_occurrence.visit_occurrence_id)))
  WITH NO DATA;


ALTER TABLE public.visit_procedure OWNER TO sheperd;

--
-- Name: visit_procedure_concept; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_procedure_concept AS
 SELECT DISTINCT concept.concept_id,
    concept.concept_name,
    concept.concept_level,
    concept.concept_class,
    concept.vocabulary_id,
    concept.concept_code,
    concept.valid_start_date,
    concept.valid_end_date,
    concept.invalid_reason
   FROM (concept
   JOIN visit_procedure ON ((concept.concept_id = visit_procedure.procedure_concept_id)))
  WITH NO DATA;


ALTER TABLE public.visit_procedure_concept OWNER TO sheperd;

--
-- Name: visit_procedure_type; Type: MATERIALIZED VIEW; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE MATERIALIZED VIEW visit_procedure_type AS
 SELECT DISTINCT concept.concept_id,
    concept.concept_name,
    concept.concept_level,
    concept.concept_class,
    concept.vocabulary_id,
    concept.concept_code,
    concept.valid_start_date,
    concept.valid_end_date,
    concept.invalid_reason
   FROM (concept
   JOIN visit_procedure ON ((concept.concept_id = visit_procedure.procedure_type_concept_id)))
  WITH NO DATA;


ALTER TABLE public.visit_procedure_type OWNER TO sheperd;

--
-- Name: vocabulary; Type: TABLE; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE TABLE vocabulary (
    vocabulary_id integer NOT NULL,
    vocabulary_name character varying(256) NOT NULL
);


ALTER TABLE public.vocabulary OWNER TO sheperd;

--
-- Name: TABLE vocabulary; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON TABLE vocabulary IS 'A combination of terminologies and classifications that belong to a vocabulary domain.';


--
-- Name: COLUMN vocabulary.vocabulary_id; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN vocabulary.vocabulary_id IS 'Unique identifier for each of the vocabulary sources used in the observational analysis.';


--
-- Name: COLUMN vocabulary.vocabulary_name; Type: COMMENT; Schema: public; Owner: sheperd
--

COMMENT ON COLUMN vocabulary.vocabulary_name IS 'Elaborative name for each of the vocabulary sources.';


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datacategory ALTER COLUMN id SET DEFAULT nextval('avocado_datacategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconcept ALTER COLUMN id SET DEFAULT nextval('avocado_dataconcept_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconcept_sites ALTER COLUMN id SET DEFAULT nextval('avocado_dataconcept_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconceptfield ALTER COLUMN id SET DEFAULT nextval('avocado_dataconceptfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datacontext ALTER COLUMN id SET DEFAULT nextval('avocado_datacontext_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datafield ALTER COLUMN id SET DEFAULT nextval('avocado_datafield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datafield_sites ALTER COLUMN id SET DEFAULT nextval('avocado_datafield_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataquery ALTER COLUMN id SET DEFAULT nextval('avocado_dataquery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataquery_shared_users ALTER COLUMN id SET DEFAULT nextval('avocado_dataquery_shared_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataview ALTER COLUMN id SET DEFAULT nextval('avocado_dataview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_log ALTER COLUMN id SET DEFAULT nextval('avocado_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_revision ALTER COLUMN id SET DEFAULT nextval('avocado_revision_id_seq'::regclass);


--
-- Name: ancestry_id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept_ancestor ALTER COLUMN ancestry_id SET DEFAULT nextval('concept_ancestor_ancestry_id_seq'::regclass);


--
-- Name: concept_relationship_id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept_relationship ALTER COLUMN concept_relationship_id SET DEFAULT nextval('concept_relationship_concept_relationship_id_seq'::regclass);


--
-- Name: person_death_id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY death ALTER COLUMN person_death_id SET DEFAULT nextval('death_person_death_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: drug_strength_id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY drug_strength ALTER COLUMN drug_strength_id SET DEFAULT nextval('drug_strength_drug_strength_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY serrano_apitoken ALTER COLUMN id SET DEFAULT nextval('serrano_apitoken_id_seq'::regclass);


--
-- Name: source_to_concept_map_id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY source_to_concept_map ALTER COLUMN source_to_concept_map_id SET DEFAULT nextval('source_to_concept_map_source_to_concept_map_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add migration history	1	add_migrationhistory
2	Can change migration history	1	change_migrationhistory
3	Can delete migration history	1	delete_migrationhistory
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add site	8	add_site
23	Can change site	8	change_site
24	Can delete site	8	delete_site
25	Can add revision	9	add_revision
26	Can change revision	9	change_revision
27	Can delete revision	9	delete_revision
28	Can add data category	10	add_datacategory
29	Can change data category	10	change_datacategory
30	Can delete data category	10	delete_datacategory
31	Can add data field	11	add_datafield
32	Can change data field	11	change_datafield
33	Can delete data field	11	delete_datafield
34	Can view datafield	11	view_datafield
35	Can add data concept	12	add_dataconcept
36	Can change data concept	12	change_dataconcept
37	Can delete data concept	12	delete_dataconcept
38	Can view dataconcept	12	view_dataconcept
39	Can add data concept field	13	add_dataconceptfield
40	Can change data concept field	13	change_dataconceptfield
41	Can delete data concept field	13	delete_dataconceptfield
42	Can add data context	14	add_datacontext
43	Can change data context	14	change_datacontext
44	Can delete data context	14	delete_datacontext
45	Can add data view	15	add_dataview
46	Can change data view	15	change_dataview
47	Can delete data view	15	delete_dataview
48	Can add data query	16	add_dataquery
49	Can change data query	16	change_dataquery
50	Can delete data query	16	delete_dataquery
51	Can add API Token	17	add_apitoken
52	Can change API Token	17	change_apitoken
53	Can delete API Token	17	delete_apitoken
54	Can add registration profile	18	add_registrationprofile
55	Can change registration profile	18	change_registrationprofile
56	Can delete registration profile	18	delete_registrationprofile
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('auth_permission_id_seq', 24, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$10000$FT0mAG1MCMa2$D16ATVGIn86vTu2F21hNCkEYNNIYiVqmdiwMy8Ifsx4=	2014-08-15 18:12:52.972532-04	t	user002			test@dfd.com	t	t	2014-08-15 17:04:15.444352-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: avocado_datacategory; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_datacategory (id, name, description, keywords, archived, published, created, modified, parent_id, _order) FROM stdin;
1	Person			f	t	2014-06-24 11:40:04.479-04	2014-06-24 12:03:10.718-04	\N	1
2	Care Site	Care sites associated with person records directly through the person.care_site_id foreign key.		f	t	2014-06-24 12:01:21.369-04	2014-06-24 13:55:06.299-04	\N	3
3	Organization			f	t	2014-06-24 12:01:39.845-04	2014-06-24 12:03:10.708-04	\N	4
4	Provider			f	t	2014-06-24 12:01:53.041-04	2014-06-24 12:03:10.713-04	\N	2
\.


--
-- Name: avocado_datacategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_datacategory_id_seq', 1, false);


--
-- Data for Name: avocado_dataconcept; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_dataconcept (id, name, description, keywords, archived, published, created, modified, name_plural, category_id, group_id, _order, formatter_name, ident, internal, sortable, queryable, viewable, type) FROM stdin;
1	Person ID	Arbitrary unique integer identifiers for persons in the system.		f	t	2014-06-24 10:02:58.632-04	2014-06-24 14:03:07.233-04	Person IDs	1	\N	0.100000000000000006	\N		f	t	t	t	
2	Year of Birth	Birth year of a person, after date-shifting by a random number of days between 0 and 364.	birth, born, age	f	t	2014-06-24 10:02:58.646-04	2014-06-24 12:09:05.66-04	Years of Birth	1	\N	2	\N		f	t	t	t	
3	Month of Birth	Birth month of a person, after date-shifting by a random number of days between 0 and 364.	birth, born, age	f	t	2014-06-24 10:02:58.653-04	2014-06-24 12:08:55.777-04	Months of Birth	1	\N	3	\N		f	t	t	t	
4	Day of Birth	Birth day of the month of a person, after date shifting by a random number of days between 0 and 364.	birth, born, age	f	t	2014-06-24 10:02:58.66-04	2014-06-24 12:12:46.311-04	Days of Birth	1	\N	4	\N		f	t	t	t	
5	Person Person Source Value	\N	\N	f	f	2014-06-24 10:03:01.663-04	2014-06-24 10:03:01.663-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
6	Source Gender	Gender values as recorded in the source dataset.	gender, sex, source	f	t	2014-06-24 10:03:01.67-04	2014-06-24 12:18:00.174-04	Source Genders	1	\N	7	\N		f	t	t	t	
7	Source Race	Race values as recorded in the source dataset.	race, ethnicity, source	f	t	2014-06-24 10:03:01.678-04	2014-06-24 12:18:11.756-04	Source Races	1	\N	8	\N		f	t	t	t	
8	Source Ethnicity	Ethnicity values as recorded in the source dataset.	ethnicity, race, source	f	t	2014-06-24 10:03:01.686-04	2014-06-24 12:20:43.526-04	Source Ethnicities	1	\N	9	\N		f	t	t	t	
12	Person Location Location Id	\N	\N	f	f	2014-06-24 10:03:01.722-04	2014-06-24 10:03:01.722-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
13	Person Location Address 1	\N	\N	f	f	2014-06-24 10:03:01.732-04	2014-06-24 10:03:01.732-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
14	Person Location Address 2	\N	\N	f	f	2014-06-24 10:03:01.741-04	2014-06-24 10:03:01.741-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
15	Person Location City	\N	\N	f	f	2014-06-24 10:03:01.749-04	2014-06-24 10:03:01.749-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
16	Person Location State	\N	\N	f	f	2014-06-24 10:03:01.756-04	2014-06-24 10:03:01.756-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
17	Person Location Zip	\N	\N	f	f	2014-06-24 10:03:01.764-04	2014-06-24 11:39:23.372-04	\N	\N	\N	\N	\N	\N	f	t	t	t	
18	Person Location County	\N	\N	f	f	2014-06-24 10:03:01.771-04	2014-06-24 10:03:01.771-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
19	Person Location Location Source Value	\N	\N	f	f	2014-06-24 10:03:01.778-04	2014-06-24 10:03:01.779-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
20	Provider ID	Arbitrary unique integer identifiers for providers in the system.	provider	f	t	2014-06-24 10:03:01.786-04	2014-06-24 14:02:54.327-04	Provider IDs	4	\N	1	\N		f	t	t	t	
21	Provider Npi	\N	\N	f	f	2014-06-24 10:03:01.793-04	2014-06-24 10:03:01.793-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
22	Provider Dea	\N	\N	f	f	2014-06-24 10:03:01.801-04	2014-06-24 10:03:01.801-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
23	Provider Care Site Id	\N	\N	f	f	2014-06-24 10:03:01.809-04	2014-06-24 10:03:01.809-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
24	Provider Provider Source Value	\N	\N	f	f	2014-06-24 10:03:01.816-04	2014-06-24 10:03:01.816-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
25	Provider Specialty Source Value	\N	\N	f	f	2014-06-24 10:03:01.824-04	2014-06-24 10:03:01.824-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
28	Source Name	Care site names as recorded in the source dataset.		f	t	2014-06-24 10:03:01.848-04	2014-06-24 12:21:05.295-04	Source Names	2	\N	1	\N		f	t	t	t	
29	Care Site Place Of Service Source Value	\N	\N	f	f	2014-06-24 10:03:01.856-04	2014-06-24 10:17:16.214-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
31	Care Site Location Address 1	\N	\N	f	f	2014-06-24 10:03:01.873-04	2014-06-24 10:03:01.873-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
32	Care Site Location Address 2	\N	\N	f	f	2014-06-24 10:03:01.882-04	2014-06-24 10:03:01.882-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
33	Care Site Location City	\N	\N	f	f	2014-06-24 10:03:01.889-04	2014-06-24 10:03:01.889-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
34	Care Site Location State	\N	\N	f	f	2014-06-24 10:03:01.897-04	2014-06-24 10:03:01.897-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
35	Zip Code	Zip codes of care site locations.		f	t	2014-06-24 10:03:01.904-04	2014-06-24 12:21:35.068-04	Zip Codes	2	\N	2	\N		f	t	t	t	
36	Care Site Location County	\N	\N	f	f	2014-06-24 10:03:01.911-04	2014-06-24 10:03:01.911-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
37	Care Site Location Location Source Value	\N	\N	f	f	2014-06-24 10:03:01.919-04	2014-06-24 10:17:16.197-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
39	Organization Place Of Service Concept Id	\N	\N	f	f	2014-06-24 10:03:01.934-04	2014-06-24 10:03:01.934-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
41	Source Name	Organization names as recorded in the source dataset.		f	t	2014-06-24 10:03:01.948-04	2014-06-24 12:22:16.17-04	Source Names	3	\N	1	\N		f	t	t	t	
42	Organization Place Of Service Source Value	\N	\N	f	f	2014-06-24 10:03:01.955-04	2014-06-24 10:03:01.956-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
44	Visit Visit Occurrence Id	\N	\N	f	f	2014-06-24 10:03:01.97-04	2014-06-24 10:03:01.971-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
45	Visit Visit Start Date	\N	\N	f	f	2014-06-24 10:03:01.978-04	2014-06-24 10:03:01.978-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
46	Visit Visit End Date	\N	\N	f	f	2014-06-24 10:03:01.985-04	2014-06-24 10:03:01.985-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
47	Visit Place Of Service Concept Id	\N	\N	f	f	2014-06-24 10:03:01.992-04	2014-06-24 10:03:01.992-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
48	Visit Care Site Id	\N	\N	f	f	2014-06-24 10:03:01.999-04	2014-06-24 10:03:01.999-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
49	Visit Place Of Service Source Value	\N	\N	f	f	2014-06-24 10:03:02.006-04	2014-06-24 10:03:02.007-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
50	Visit Condition Condition Occurrence Id	\N	\N	f	f	2014-06-24 10:03:02.014-04	2014-06-24 10:03:02.014-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
51	Visit Condition Person Id	\N	\N	f	f	2014-06-24 10:03:02.021-04	2014-06-24 10:03:02.021-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
52	Visit Condition Condition Start Date	\N	\N	f	f	2014-06-24 10:03:02.028-04	2014-06-24 10:03:02.028-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
53	Visit Condition Condition End Date	\N	\N	f	f	2014-06-24 10:03:02.035-04	2014-06-24 10:03:02.035-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
54	Visit Condition Stop Reason	\N	\N	f	f	2014-06-24 10:03:02.042-04	2014-06-24 10:03:02.042-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
55	Visit Condition Associated Provider Id	\N	\N	f	f	2014-06-24 10:03:02.052-04	2014-06-24 10:03:02.052-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
56	Visit Condition Condition Source Value	\N	\N	f	f	2014-06-24 10:03:02.062-04	2014-06-24 10:03:02.062-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
59	Visit Procedure Procedure Occurrence Id	\N	\N	f	f	2014-06-24 10:03:02.087-04	2014-06-24 10:03:02.087-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
60	Visit Procedure Person Id	\N	\N	f	f	2014-06-24 10:03:02.097-04	2014-06-24 10:03:02.097-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
61	Visit Procedure Procedure Date	\N	\N	f	f	2014-06-24 10:03:02.105-04	2014-06-24 10:03:02.105-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
62	Visit Procedure Associated Provider Id	\N	\N	f	f	2014-06-24 10:03:02.112-04	2014-06-24 10:03:02.112-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
63	Visit Procedure Relevant Condition Concept Id	\N	\N	f	f	2014-06-24 10:03:02.12-04	2014-06-24 10:03:02.12-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
64	Visit Procedure Procedure Source Value	\N	\N	f	f	2014-06-24 10:03:02.127-04	2014-06-24 10:03:02.127-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
67	Visit Drug Drug Exposure Id	\N	\N	f	f	2014-06-24 10:03:02.149-04	2014-06-24 10:03:02.149-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
68	Visit Drug Person Id	\N	\N	f	f	2014-06-24 10:03:02.159-04	2014-06-24 10:03:02.159-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
69	Visit Drug Drug Exposure Start Date	\N	\N	f	f	2014-06-24 10:03:02.176-04	2014-06-24 10:03:02.176-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
70	Visit Drug Drug Exposure End Date	\N	\N	f	f	2014-06-24 10:03:02.184-04	2014-06-24 10:03:02.184-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
71	Visit Drug Stop Reason	\N	\N	f	f	2014-06-24 10:03:02.192-04	2014-06-24 10:03:02.192-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
72	Visit Drug Refills	\N	\N	f	f	2014-06-24 10:03:02.199-04	2014-06-24 10:03:02.199-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
73	Visit Drug Quantity	\N	\N	f	f	2014-06-24 10:03:02.209-04	2014-06-24 10:03:02.209-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
74	Visit Drug Days Supply	\N	\N	f	f	2014-06-24 10:03:02.218-04	2014-06-24 10:03:02.218-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
75	Visit Drug Sig	\N	\N	f	f	2014-06-24 10:03:02.225-04	2014-06-24 10:03:02.225-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
76	Visit Drug Prescribing Provider Id	\N	\N	f	f	2014-06-24 10:03:02.234-04	2014-06-24 10:03:02.234-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
77	Visit Drug Relevant Condition Concept Id	\N	\N	f	f	2014-06-24 10:03:02.242-04	2014-06-24 10:03:02.242-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
78	Visit Drug Drug Source Value	\N	\N	f	f	2014-06-24 10:03:02.249-04	2014-06-24 10:03:02.249-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
81	Care Site Care Site Id	\N	\N	f	f	2014-06-24 10:06:45.548-04	2014-06-24 10:06:45.548-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
82	Care Site Location Location Id	\N	\N	f	f	2014-06-24 10:06:45.601-04	2014-06-24 10:06:45.601-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
83	Organization Organization Id	\N	\N	f	f	2014-06-24 10:06:45.679-04	2014-06-24 10:06:45.679-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
84	Organization Location Id	\N	\N	f	f	2014-06-24 10:06:45.696-04	2014-06-24 10:06:45.696-04	\N	\N	\N	\N	\N	\N	f	t	t	t	\N
85	Gender	Concept name of gender concepts associated with person records.	gender, sex	f	t	2014-06-24 11:51:35.332-04	2014-06-24 12:15:34.308-04	Genders	1	\N	1	\N		f	t	t	t	
86	Gender Concept Level	\N	\N	f	f	2014-06-24 11:51:35.346-04	2014-06-24 11:51:35.346-04	Gender Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
87	Gender Concept Class	\N	\N	f	f	2014-06-24 11:51:35.358-04	2014-06-24 11:51:35.358-04	Gender Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
88	Gender Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.369-04	2014-06-24 11:51:35.369-04	Gender Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
89	Gender Concept Code	\N	\N	f	f	2014-06-24 11:51:35.381-04	2014-06-24 11:51:35.381-04	Gender Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
90	Gender Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.391-04	2014-06-24 11:51:35.391-04	Gender Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
91	Gender Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.401-04	2014-06-24 11:51:35.401-04	Gender Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
92	Gender Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.412-04	2014-06-24 11:51:35.412-04	Gender Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
93	Race	Concept name of race concepts associated with person records.	race, ethnicity	f	t	2014-06-24 11:51:35.426-04	2014-06-24 12:15:49.432-04	Races	1	\N	5	\N		f	t	t	t	
94	Race Concept Level	\N	\N	f	f	2014-06-24 11:51:35.435-04	2014-06-24 11:51:35.435-04	Race Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
95	Race Concept Class	\N	\N	f	f	2014-06-24 11:51:35.446-04	2014-06-24 11:51:35.446-04	Race Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
96	Race Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.457-04	2014-06-24 11:51:35.457-04	Race Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
97	Race Concept Code	\N	\N	f	f	2014-06-24 11:51:35.472-04	2014-06-24 11:51:35.472-04	Race Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
98	Race Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.483-04	2014-06-24 11:51:35.483-04	Race Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
99	Race Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.493-04	2014-06-24 11:51:35.493-04	Race Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
100	Race Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.504-04	2014-06-24 11:51:35.504-04	Race Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
101	Ethnicity	Concept name of ethnicity concepts associated with person records.	ethnicity, race	f	t	2014-06-24 11:51:35.517-04	2014-06-24 12:16:02.591-04	Ethnicities	1	\N	6	\N		f	t	t	t	
102	Ethnicity Concept Level	\N	\N	f	f	2014-06-24 11:51:35.528-04	2014-06-24 11:51:35.528-04	Ethnicity Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
103	Ethnicity Concept Class	\N	\N	f	f	2014-06-24 11:51:35.539-04	2014-06-24 11:51:35.539-04	Ethnicity Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
104	Ethnicity Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.552-04	2014-06-24 11:51:35.552-04	Ethnicity Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
105	Ethnicity Concept Code	\N	\N	f	f	2014-06-24 11:51:35.564-04	2014-06-24 11:51:35.564-04	Ethnicity Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
106	Ethnicity Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.575-04	2014-06-24 11:51:35.575-04	Ethnicity Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
107	Ethnicity Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.584-04	2014-06-24 11:51:35.584-04	Ethnicity Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
108	Ethnicity Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.594-04	2014-06-24 11:51:35.594-04	Ethnicity Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
109	Provider Specialty Concept Name	\N	\N	f	f	2014-06-24 11:51:35.655-04	2014-06-24 11:51:35.655-04	Provider Specialty Concept Names	\N	\N	\N	\N	\N	f	t	t	t	\N
110	Provider Specialty Concept Level	\N	\N	f	f	2014-06-24 11:51:35.663-04	2014-06-24 11:51:35.663-04	Provider Specialty Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
111	Provider Specialty Concept Class	\N	\N	f	f	2014-06-24 11:51:35.675-04	2014-06-24 11:51:35.675-04	Provider Specialty Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
112	Provider Specialty Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.684-04	2014-06-24 11:51:35.684-04	Provider Specialty Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
113	Provider Specialty Concept Code	\N	\N	f	f	2014-06-24 11:51:35.696-04	2014-06-24 11:51:35.696-04	Provider Specialty Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
114	Provider Specialty Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.709-04	2014-06-24 11:51:35.709-04	Provider Specialty Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
115	Provider Specialty Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.717-04	2014-06-24 11:51:35.717-04	Provider Specialty Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
116	Provider Specialty Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.729-04	2014-06-24 11:51:35.729-04	Provider Specialty Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
117	Care Site Pos Concept Name	\N	\N	f	f	2014-06-24 11:51:35.785-04	2014-06-24 11:51:35.785-04	Care Site Pos Concept Names	\N	\N	\N	\N	\N	f	t	t	t	\N
118	Care Site Pos Concept Level	\N	\N	f	f	2014-06-24 11:51:35.796-04	2014-06-24 11:51:35.796-04	Care Site Pos Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
119	Care Site Pos Concept Class	\N	\N	f	f	2014-06-24 11:51:35.806-04	2014-06-24 11:51:35.806-04	Care Site Pos Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
120	Care Site Pos Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.816-04	2014-06-24 11:51:35.816-04	Care Site Pos Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
121	Care Site Pos Concept Code	\N	\N	f	f	2014-06-24 11:51:35.829-04	2014-06-24 11:51:35.829-04	Care Site Pos Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
122	Care Site Pos Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.842-04	2014-06-24 11:51:35.842-04	Care Site Pos Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
123	Care Site Pos Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.851-04	2014-06-24 11:51:35.851-04	Care Site Pos Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
124	Care Site Pos Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.862-04	2014-06-24 11:51:35.862-04	Care Site Pos Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
125	Visit Condition Concept Concept Name	\N	\N	f	f	2014-06-24 11:51:35.915-04	2014-06-24 11:51:35.915-04	Visit Condition Concept Concept Names	\N	\N	\N	\N	\N	f	t	t	t	\N
126	Visit Condition Concept Concept Level	\N	\N	f	f	2014-06-24 11:51:35.926-04	2014-06-24 11:51:35.926-04	Visit Condition Concept Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
127	Visit Condition Concept Concept Class	\N	\N	f	f	2014-06-24 11:51:35.936-04	2014-06-24 11:51:35.937-04	Visit Condition Concept Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
128	Visit Condition Concept Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.954-04	2014-06-24 11:51:35.954-04	Visit Condition Concept Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
129	Visit Condition Concept Concept Code	\N	\N	f	f	2014-06-24 11:51:35.98-04	2014-06-24 11:51:35.98-04	Visit Condition Concept Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
130	Visit Condition Concept Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.99-04	2014-06-24 11:51:35.99-04	Visit Condition Concept Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
131	Visit Condition Concept Valid End Date	\N	\N	f	f	2014-06-24 11:51:36-04	2014-06-24 11:51:36-04	Visit Condition Concept Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
132	Visit Condition Concept Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.01-04	2014-06-24 11:51:36.01-04	Visit Condition Concept Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
133	Visit Condition Type Concept Name	\N	\N	f	f	2014-06-24 11:51:36.025-04	2014-06-24 11:51:36.025-04	Visit Condition Type Concept Names	\N	\N	\N	\N	\N	f	t	t	t	\N
134	Visit Condition Type Concept Level	\N	\N	f	f	2014-06-24 11:51:36.035-04	2014-06-24 11:51:36.035-04	Visit Condition Type Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
135	Visit Condition Type Concept Class	\N	\N	f	f	2014-06-24 11:51:36.046-04	2014-06-24 11:51:36.046-04	Visit Condition Type Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
136	Visit Condition Type Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.06-04	2014-06-24 11:51:36.06-04	Visit Condition Type Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
137	Visit Condition Type Concept Code	\N	\N	f	f	2014-06-24 11:51:36.072-04	2014-06-24 11:51:36.073-04	Visit Condition Type Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
138	Visit Condition Type Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.082-04	2014-06-24 11:51:36.083-04	Visit Condition Type Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
139	Visit Condition Type Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.092-04	2014-06-24 11:51:36.092-04	Visit Condition Type Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
140	Visit Condition Type Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.103-04	2014-06-24 11:51:36.103-04	Visit Condition Type Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
141	Visit Procedure Concept Concept Name	\N	\N	f	f	2014-06-24 11:51:36.135-04	2014-06-24 11:51:36.135-04	Visit Procedure Concept Concept Names	\N	\N	\N	\N	\N	f	t	t	t	\N
142	Visit Procedure Concept Concept Level	\N	\N	f	f	2014-06-24 11:51:36.145-04	2014-06-24 11:51:36.145-04	Visit Procedure Concept Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
143	Visit Procedure Concept Concept Class	\N	\N	f	f	2014-06-24 11:51:36.171-04	2014-06-24 11:51:36.171-04	Visit Procedure Concept Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
144	Visit Procedure Concept Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.181-04	2014-06-24 11:51:36.181-04	Visit Procedure Concept Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
145	Visit Procedure Concept Concept Code	\N	\N	f	f	2014-06-24 11:51:36.192-04	2014-06-24 11:51:36.192-04	Visit Procedure Concept Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
146	Visit Procedure Concept Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.203-04	2014-06-24 11:51:36.203-04	Visit Procedure Concept Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
147	Visit Procedure Concept Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.214-04	2014-06-24 11:51:36.214-04	Visit Procedure Concept Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
148	Visit Procedure Concept Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.225-04	2014-06-24 11:51:36.225-04	Visit Procedure Concept Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
149	Visit Procedure Type Concept Name	\N	\N	f	f	2014-06-24 11:51:36.239-04	2014-06-24 11:51:36.239-04	Visit Procedure Type Concept Names	\N	\N	\N	\N	\N	f	t	t	t	\N
150	Visit Procedure Type Concept Level	\N	\N	f	f	2014-06-24 11:51:36.249-04	2014-06-24 11:51:36.249-04	Visit Procedure Type Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
151	Visit Procedure Type Concept Class	\N	\N	f	f	2014-06-24 11:51:36.259-04	2014-06-24 11:51:36.259-04	Visit Procedure Type Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
152	Visit Procedure Type Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.269-04	2014-06-24 11:51:36.269-04	Visit Procedure Type Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
153	Visit Procedure Type Concept Code	\N	\N	f	f	2014-06-24 11:51:36.282-04	2014-06-24 11:51:36.282-04	Visit Procedure Type Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
154	Visit Procedure Type Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.293-04	2014-06-24 11:51:36.293-04	Visit Procedure Type Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
155	Visit Procedure Type Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.303-04	2014-06-24 11:51:36.303-04	Visit Procedure Type Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
156	Visit Procedure Type Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.314-04	2014-06-24 11:51:36.314-04	Visit Procedure Type Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
157	Visit Drug Concept Concept Name	\N	\N	f	f	2014-06-24 11:51:36.364-04	2014-06-24 11:51:36.364-04	Visit Drug Concept Concept Names	\N	\N	\N	\N	\N	f	t	t	t	\N
158	Visit Drug Concept Concept Level	\N	\N	f	f	2014-06-24 11:51:36.378-04	2014-06-24 11:51:36.378-04	Visit Drug Concept Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
159	Visit Drug Concept Concept Class	\N	\N	f	f	2014-06-24 11:51:36.388-04	2014-06-24 11:51:36.388-04	Visit Drug Concept Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
160	Visit Drug Concept Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.398-04	2014-06-24 11:51:36.398-04	Visit Drug Concept Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
161	Visit Drug Concept Concept Code	\N	\N	f	f	2014-06-24 11:51:36.409-04	2014-06-24 11:51:36.409-04	Visit Drug Concept Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
162	Visit Drug Concept Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.417-04	2014-06-24 11:51:36.417-04	Visit Drug Concept Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
163	Visit Drug Concept Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.43-04	2014-06-24 11:51:36.43-04	Visit Drug Concept Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
164	Visit Drug Concept Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.441-04	2014-06-24 11:51:36.441-04	Visit Drug Concept Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
165	Visit Drug Type Concept Name	\N	\N	f	f	2014-06-24 11:51:36.456-04	2014-06-24 11:51:36.456-04	Visit Drug Type Concept Names	\N	\N	\N	\N	\N	f	t	t	t	\N
166	Visit Drug Type Concept Level	\N	\N	f	f	2014-06-24 11:51:36.467-04	2014-06-24 11:51:36.467-04	Visit Drug Type Concept Levels	\N	\N	\N	\N	\N	f	t	t	t	\N
167	Visit Drug Type Concept Class	\N	\N	f	f	2014-06-24 11:51:36.483-04	2014-06-24 11:51:36.483-04	Visit Drug Type Concept Class	\N	\N	\N	\N	\N	f	t	t	t	\N
168	Visit Drug Type Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.496-04	2014-06-24 11:51:36.496-04	Visit Drug Type Vocabulary Ids	\N	\N	\N	\N	\N	f	t	t	t	\N
169	Visit Drug Type Concept Code	\N	\N	f	f	2014-06-24 11:51:36.512-04	2014-06-24 11:51:36.512-04	Visit Drug Type Concept Codes	\N	\N	\N	\N	\N	f	t	t	t	\N
170	Visit Drug Type Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.523-04	2014-06-24 11:51:36.523-04	Visit Drug Type Valid Start Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
171	Visit Drug Type Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.533-04	2014-06-24 11:51:36.533-04	Visit Drug Type Valid End Dates	\N	\N	\N	\N	\N	f	t	t	t	\N
172	Visit Drug Type Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.544-04	2014-06-24 11:51:36.544-04	Visit Drug Type Invalid Reasons	\N	\N	\N	\N	\N	f	t	t	t	\N
\.


--
-- Name: avocado_dataconcept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_dataconcept_id_seq', 1, false);


--
-- Data for Name: avocado_dataconcept_sites; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_dataconcept_sites (id, dataconcept_id, site_id) FROM stdin;
\.


--
-- Name: avocado_dataconcept_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_dataconcept_sites_id_seq', 1, false);


--
-- Data for Name: avocado_dataconceptfield; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_dataconceptfield (id, field_id, concept_id, name, name_plural, _order, created, modified) FROM stdin;
1	1	1	\N	\N	\N	2014-06-24 10:02:58.637-04	2014-06-24 10:02:58.637-04
2	2	2	\N	\N	\N	2014-06-24 10:02:58.647-04	2014-06-24 10:02:58.647-04
3	3	3	\N	\N	\N	2014-06-24 10:02:58.654-04	2014-06-24 10:02:58.654-04
4	4	4	\N	\N	\N	2014-06-24 10:02:58.661-04	2014-06-24 10:02:58.662-04
5	5	5	\N	\N	\N	2014-06-24 10:03:01.664-04	2014-06-24 10:03:01.664-04
6	6	6	\N	\N	\N	2014-06-24 10:03:01.672-04	2014-06-24 10:03:01.672-04
7	7	7	\N	\N	\N	2014-06-24 10:03:01.679-04	2014-06-24 10:03:01.679-04
8	8	8	\N	\N	\N	2014-06-24 10:03:01.687-04	2014-06-24 10:03:01.687-04
12	12	12	\N	\N	\N	2014-06-24 10:03:01.724-04	2014-06-24 10:03:01.724-04
13	13	13	\N	\N	\N	2014-06-24 10:03:01.733-04	2014-06-24 10:03:01.733-04
14	14	14	\N	\N	\N	2014-06-24 10:03:01.742-04	2014-06-24 10:03:01.742-04
15	15	15	\N	\N	\N	2014-06-24 10:03:01.75-04	2014-06-24 10:03:01.75-04
16	16	16	\N	\N	\N	2014-06-24 10:03:01.757-04	2014-06-24 10:03:01.757-04
17	17	17	\N	\N	\N	2014-06-24 10:03:01.765-04	2014-06-24 10:03:01.765-04
18	18	18	\N	\N	\N	2014-06-24 10:03:01.772-04	2014-06-24 10:03:01.772-04
19	19	19	\N	\N	\N	2014-06-24 10:03:01.779-04	2014-06-24 10:03:01.779-04
20	20	20	\N	\N	\N	2014-06-24 10:03:01.787-04	2014-06-24 10:03:01.787-04
21	21	21	\N	\N	\N	2014-06-24 10:03:01.794-04	2014-06-24 10:03:01.794-04
22	22	22	\N	\N	\N	2014-06-24 10:03:01.802-04	2014-06-24 10:03:01.802-04
23	23	23	\N	\N	\N	2014-06-24 10:03:01.81-04	2014-06-24 10:03:01.81-04
24	24	24	\N	\N	\N	2014-06-24 10:03:01.817-04	2014-06-24 10:03:01.817-04
25	25	25	\N	\N	\N	2014-06-24 10:03:01.825-04	2014-06-24 10:03:01.825-04
28	28	28	\N	\N	\N	2014-06-24 10:03:01.849-04	2014-06-24 10:03:01.849-04
29	29	29	\N	\N	\N	2014-06-24 10:03:01.857-04	2014-06-24 10:03:01.857-04
31	31	31	\N	\N	\N	2014-06-24 10:03:01.875-04	2014-06-24 10:03:01.875-04
32	32	32	\N	\N	\N	2014-06-24 10:03:01.883-04	2014-06-24 10:03:01.883-04
33	33	33	\N	\N	\N	2014-06-24 10:03:01.89-04	2014-06-24 10:03:01.89-04
34	34	34	\N	\N	\N	2014-06-24 10:03:01.898-04	2014-06-24 10:03:01.898-04
35	35	35	\N	\N	\N	2014-06-24 10:03:01.905-04	2014-06-24 10:03:01.905-04
36	36	36	\N	\N	\N	2014-06-24 10:03:01.912-04	2014-06-24 10:03:01.912-04
37	37	37	\N	\N	\N	2014-06-24 10:03:01.92-04	2014-06-24 10:03:01.92-04
39	39	39	\N	\N	\N	2014-06-24 10:03:01.935-04	2014-06-24 10:03:01.935-04
41	41	41	\N	\N	\N	2014-06-24 10:03:01.949-04	2014-06-24 10:03:01.949-04
42	42	42	\N	\N	\N	2014-06-24 10:03:01.957-04	2014-06-24 10:03:01.957-04
44	44	44	\N	\N	\N	2014-06-24 10:03:01.972-04	2014-06-24 10:03:01.972-04
45	45	45	\N	\N	\N	2014-06-24 10:03:01.979-04	2014-06-24 10:03:01.979-04
46	46	46	\N	\N	\N	2014-06-24 10:03:01.986-04	2014-06-24 10:03:01.986-04
47	47	47	\N	\N	\N	2014-06-24 10:03:01.993-04	2014-06-24 10:03:01.993-04
48	48	48	\N	\N	\N	2014-06-24 10:03:02-04	2014-06-24 10:03:02-04
49	49	49	\N	\N	\N	2014-06-24 10:03:02.007-04	2014-06-24 10:03:02.008-04
50	50	50	\N	\N	\N	2014-06-24 10:03:02.015-04	2014-06-24 10:03:02.015-04
51	51	51	\N	\N	\N	2014-06-24 10:03:02.022-04	2014-06-24 10:03:02.022-04
52	52	52	\N	\N	\N	2014-06-24 10:03:02.029-04	2014-06-24 10:03:02.029-04
53	53	53	\N	\N	\N	2014-06-24 10:03:02.036-04	2014-06-24 10:03:02.036-04
54	54	54	\N	\N	\N	2014-06-24 10:03:02.043-04	2014-06-24 10:03:02.043-04
55	55	55	\N	\N	\N	2014-06-24 10:03:02.054-04	2014-06-24 10:03:02.054-04
56	56	56	\N	\N	\N	2014-06-24 10:03:02.063-04	2014-06-24 10:03:02.063-04
59	59	59	\N	\N	\N	2014-06-24 10:03:02.088-04	2014-06-24 10:03:02.088-04
60	60	60	\N	\N	\N	2014-06-24 10:03:02.098-04	2014-06-24 10:03:02.098-04
61	61	61	\N	\N	\N	2014-06-24 10:03:02.106-04	2014-06-24 10:03:02.106-04
62	62	62	\N	\N	\N	2014-06-24 10:03:02.113-04	2014-06-24 10:03:02.113-04
63	63	63	\N	\N	\N	2014-06-24 10:03:02.121-04	2014-06-24 10:03:02.121-04
64	64	64	\N	\N	\N	2014-06-24 10:03:02.128-04	2014-06-24 10:03:02.128-04
67	67	67	\N	\N	\N	2014-06-24 10:03:02.151-04	2014-06-24 10:03:02.151-04
68	68	68	\N	\N	\N	2014-06-24 10:03:02.169-04	2014-06-24 10:03:02.169-04
69	69	69	\N	\N	\N	2014-06-24 10:03:02.177-04	2014-06-24 10:03:02.177-04
70	70	70	\N	\N	\N	2014-06-24 10:03:02.185-04	2014-06-24 10:03:02.185-04
71	71	71	\N	\N	\N	2014-06-24 10:03:02.193-04	2014-06-24 10:03:02.193-04
72	72	72	\N	\N	\N	2014-06-24 10:03:02.2-04	2014-06-24 10:03:02.2-04
73	73	73	\N	\N	\N	2014-06-24 10:03:02.21-04	2014-06-24 10:03:02.21-04
74	74	74	\N	\N	\N	2014-06-24 10:03:02.219-04	2014-06-24 10:03:02.219-04
75	75	75	\N	\N	\N	2014-06-24 10:03:02.226-04	2014-06-24 10:03:02.226-04
76	76	76	\N	\N	\N	2014-06-24 10:03:02.235-04	2014-06-24 10:03:02.235-04
77	77	77	\N	\N	\N	2014-06-24 10:03:02.243-04	2014-06-24 10:03:02.243-04
78	78	78	\N	\N	\N	2014-06-24 10:03:02.25-04	2014-06-24 10:03:02.25-04
81	27	81	\N	\N	\N	2014-06-24 10:06:45.55-04	2014-06-24 10:06:45.55-04
82	30	82	\N	\N	\N	2014-06-24 10:06:45.603-04	2014-06-24 10:06:45.603-04
83	38	83	\N	\N	\N	2014-06-24 10:06:45.68-04	2014-06-24 10:06:45.68-04
84	40	84	\N	\N	\N	2014-06-24 10:06:45.697-04	2014-06-24 10:06:45.697-04
85	81	85	\N	\N	\N	2014-06-24 11:51:35.333-04	2014-06-24 11:51:35.333-04
86	82	86	\N	\N	\N	2014-06-24 11:51:35.347-04	2014-06-24 11:51:35.347-04
87	83	87	\N	\N	\N	2014-06-24 11:51:35.361-04	2014-06-24 11:51:35.361-04
88	84	88	\N	\N	\N	2014-06-24 11:51:35.371-04	2014-06-24 11:51:35.371-04
89	85	89	\N	\N	\N	2014-06-24 11:51:35.382-04	2014-06-24 11:51:35.382-04
90	86	90	\N	\N	\N	2014-06-24 11:51:35.392-04	2014-06-24 11:51:35.392-04
91	87	91	\N	\N	\N	2014-06-24 11:51:35.402-04	2014-06-24 11:51:35.402-04
92	88	92	\N	\N	\N	2014-06-24 11:51:35.413-04	2014-06-24 11:51:35.413-04
93	89	93	\N	\N	\N	2014-06-24 11:51:35.427-04	2014-06-24 11:51:35.427-04
94	90	94	\N	\N	\N	2014-06-24 11:51:35.436-04	2014-06-24 11:51:35.436-04
95	91	95	\N	\N	\N	2014-06-24 11:51:35.448-04	2014-06-24 11:51:35.448-04
96	92	96	\N	\N	\N	2014-06-24 11:51:35.46-04	2014-06-24 11:51:35.46-04
97	93	97	\N	\N	\N	2014-06-24 11:51:35.473-04	2014-06-24 11:51:35.473-04
98	94	98	\N	\N	\N	2014-06-24 11:51:35.484-04	2014-06-24 11:51:35.484-04
99	95	99	\N	\N	\N	2014-06-24 11:51:35.494-04	2014-06-24 11:51:35.494-04
100	96	100	\N	\N	\N	2014-06-24 11:51:35.505-04	2014-06-24 11:51:35.505-04
101	97	101	\N	\N	\N	2014-06-24 11:51:35.518-04	2014-06-24 11:51:35.518-04
102	98	102	\N	\N	\N	2014-06-24 11:51:35.529-04	2014-06-24 11:51:35.53-04
103	99	103	\N	\N	\N	2014-06-24 11:51:35.54-04	2014-06-24 11:51:35.54-04
104	100	104	\N	\N	\N	2014-06-24 11:51:35.553-04	2014-06-24 11:51:35.553-04
105	101	105	\N	\N	\N	2014-06-24 11:51:35.565-04	2014-06-24 11:51:35.565-04
106	102	106	\N	\N	\N	2014-06-24 11:51:35.576-04	2014-06-24 11:51:35.576-04
107	103	107	\N	\N	\N	2014-06-24 11:51:35.585-04	2014-06-24 11:51:35.585-04
108	104	108	\N	\N	\N	2014-06-24 11:51:35.595-04	2014-06-24 11:51:35.595-04
109	105	109	\N	\N	\N	2014-06-24 11:51:35.656-04	2014-06-24 11:51:35.656-04
110	106	110	\N	\N	\N	2014-06-24 11:51:35.664-04	2014-06-24 11:51:35.664-04
111	107	111	\N	\N	\N	2014-06-24 11:51:35.676-04	2014-06-24 11:51:35.676-04
112	108	112	\N	\N	\N	2014-06-24 11:51:35.685-04	2014-06-24 11:51:35.685-04
113	109	113	\N	\N	\N	2014-06-24 11:51:35.698-04	2014-06-24 11:51:35.698-04
114	110	114	\N	\N	\N	2014-06-24 11:51:35.71-04	2014-06-24 11:51:35.71-04
115	111	115	\N	\N	\N	2014-06-24 11:51:35.719-04	2014-06-24 11:51:35.719-04
116	112	116	\N	\N	\N	2014-06-24 11:51:35.731-04	2014-06-24 11:51:35.731-04
117	113	117	\N	\N	\N	2014-06-24 11:51:35.787-04	2014-06-24 11:51:35.787-04
118	114	118	\N	\N	\N	2014-06-24 11:51:35.797-04	2014-06-24 11:51:35.797-04
119	115	119	\N	\N	\N	2014-06-24 11:51:35.808-04	2014-06-24 11:51:35.808-04
120	116	120	\N	\N	\N	2014-06-24 11:51:35.817-04	2014-06-24 11:51:35.817-04
121	117	121	\N	\N	\N	2014-06-24 11:51:35.831-04	2014-06-24 11:51:35.831-04
122	118	122	\N	\N	\N	2014-06-24 11:51:35.843-04	2014-06-24 11:51:35.843-04
123	119	123	\N	\N	\N	2014-06-24 11:51:35.853-04	2014-06-24 11:51:35.853-04
124	120	124	\N	\N	\N	2014-06-24 11:51:35.864-04	2014-06-24 11:51:35.864-04
125	121	125	\N	\N	\N	2014-06-24 11:51:35.916-04	2014-06-24 11:51:35.916-04
126	122	126	\N	\N	\N	2014-06-24 11:51:35.927-04	2014-06-24 11:51:35.927-04
127	123	127	\N	\N	\N	2014-06-24 11:51:35.94-04	2014-06-24 11:51:35.94-04
128	124	128	\N	\N	\N	2014-06-24 11:51:35.956-04	2014-06-24 11:51:35.957-04
129	125	129	\N	\N	\N	2014-06-24 11:51:35.981-04	2014-06-24 11:51:35.981-04
130	126	130	\N	\N	\N	2014-06-24 11:51:35.991-04	2014-06-24 11:51:35.991-04
131	127	131	\N	\N	\N	2014-06-24 11:51:36.001-04	2014-06-24 11:51:36.001-04
132	128	132	\N	\N	\N	2014-06-24 11:51:36.011-04	2014-06-24 11:51:36.011-04
133	129	133	\N	\N	\N	2014-06-24 11:51:36.026-04	2014-06-24 11:51:36.026-04
134	130	134	\N	\N	\N	2014-06-24 11:51:36.036-04	2014-06-24 11:51:36.036-04
135	131	135	\N	\N	\N	2014-06-24 11:51:36.048-04	2014-06-24 11:51:36.048-04
136	132	136	\N	\N	\N	2014-06-24 11:51:36.061-04	2014-06-24 11:51:36.061-04
137	133	137	\N	\N	\N	2014-06-24 11:51:36.074-04	2014-06-24 11:51:36.074-04
138	134	138	\N	\N	\N	2014-06-24 11:51:36.084-04	2014-06-24 11:51:36.084-04
139	135	139	\N	\N	\N	2014-06-24 11:51:36.093-04	2014-06-24 11:51:36.093-04
140	136	140	\N	\N	\N	2014-06-24 11:51:36.105-04	2014-06-24 11:51:36.105-04
141	137	141	\N	\N	\N	2014-06-24 11:51:36.136-04	2014-06-24 11:51:36.136-04
142	138	142	\N	\N	\N	2014-06-24 11:51:36.147-04	2014-06-24 11:51:36.147-04
143	139	143	\N	\N	\N	2014-06-24 11:51:36.172-04	2014-06-24 11:51:36.172-04
144	140	144	\N	\N	\N	2014-06-24 11:51:36.183-04	2014-06-24 11:51:36.183-04
145	141	145	\N	\N	\N	2014-06-24 11:51:36.193-04	2014-06-24 11:51:36.193-04
146	142	146	\N	\N	\N	2014-06-24 11:51:36.205-04	2014-06-24 11:51:36.205-04
147	143	147	\N	\N	\N	2014-06-24 11:51:36.215-04	2014-06-24 11:51:36.215-04
148	144	148	\N	\N	\N	2014-06-24 11:51:36.226-04	2014-06-24 11:51:36.226-04
149	145	149	\N	\N	\N	2014-06-24 11:51:36.241-04	2014-06-24 11:51:36.241-04
150	146	150	\N	\N	\N	2014-06-24 11:51:36.25-04	2014-06-24 11:51:36.25-04
151	147	151	\N	\N	\N	2014-06-24 11:51:36.26-04	2014-06-24 11:51:36.26-04
152	148	152	\N	\N	\N	2014-06-24 11:51:36.271-04	2014-06-24 11:51:36.271-04
153	149	153	\N	\N	\N	2014-06-24 11:51:36.283-04	2014-06-24 11:51:36.283-04
154	150	154	\N	\N	\N	2014-06-24 11:51:36.294-04	2014-06-24 11:51:36.294-04
155	151	155	\N	\N	\N	2014-06-24 11:51:36.305-04	2014-06-24 11:51:36.305-04
156	152	156	\N	\N	\N	2014-06-24 11:51:36.315-04	2014-06-24 11:51:36.315-04
157	153	157	\N	\N	\N	2014-06-24 11:51:36.367-04	2014-06-24 11:51:36.367-04
158	154	158	\N	\N	\N	2014-06-24 11:51:36.38-04	2014-06-24 11:51:36.38-04
159	155	159	\N	\N	\N	2014-06-24 11:51:36.39-04	2014-06-24 11:51:36.39-04
160	156	160	\N	\N	\N	2014-06-24 11:51:36.399-04	2014-06-24 11:51:36.399-04
161	157	161	\N	\N	\N	2014-06-24 11:51:36.41-04	2014-06-24 11:51:36.41-04
162	158	162	\N	\N	\N	2014-06-24 11:51:36.419-04	2014-06-24 11:51:36.419-04
163	159	163	\N	\N	\N	2014-06-24 11:51:36.431-04	2014-06-24 11:51:36.431-04
164	160	164	\N	\N	\N	2014-06-24 11:51:36.442-04	2014-06-24 11:51:36.442-04
165	161	165	\N	\N	\N	2014-06-24 11:51:36.458-04	2014-06-24 11:51:36.458-04
166	162	166	\N	\N	\N	2014-06-24 11:51:36.469-04	2014-06-24 11:51:36.469-04
167	163	167	\N	\N	\N	2014-06-24 11:51:36.484-04	2014-06-24 11:51:36.484-04
168	164	168	\N	\N	\N	2014-06-24 11:51:36.498-04	2014-06-24 11:51:36.498-04
169	165	169	\N	\N	\N	2014-06-24 11:51:36.513-04	2014-06-24 11:51:36.513-04
170	166	170	\N	\N	\N	2014-06-24 11:51:36.524-04	2014-06-24 11:51:36.524-04
171	167	171	\N	\N	\N	2014-06-24 11:51:36.534-04	2014-06-24 11:51:36.534-04
172	168	172	\N	\N	\N	2014-06-24 11:51:36.546-04	2014-06-24 11:51:36.546-04
\.


--
-- Name: avocado_dataconceptfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_dataconceptfield_id_seq', 1, false);


--
-- Data for Name: avocado_datacontext; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_datacontext (id, name, description, keywords, created, modified, json, session, _count, user_id, session_key, template, "default", accessed, parent_id, tree) FROM stdin;
\.


--
-- Name: avocado_datacontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_datacontext_id_seq', 1, false);


--
-- Data for Name: avocado_datafield; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_datafield (id, name, description, keywords, archived, published, created, modified, name_plural, app_name, model_name, field_name, unit, unit_plural, category_id, enumerable, translator, group_id, _order, internal, data_version, label_field_name, search_field_name, order_field_name, code_field_name, type) FROM stdin;
1	Person Id			f	t	2014-06-24 10:02:58.611-04	2014-06-24 14:38:08.654-04		omop_harvest	person	person_id			\N	f	\N	\N	\N	f	1					string
2	Person Year Of Birth	\N	\N	f	t	2014-06-24 10:02:58.642-04	2014-06-24 11:38:47.046-04	\N	omop_harvest	person	year_of_birth	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	
3	Person Month Of Birth	\N	\N	f	t	2014-06-24 10:02:58.65-04	2014-06-24 13:58:44.494-04	\N	omop_harvest	person	month_of_birth	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	
4	Person Day Of Birth	\N	\N	f	t	2014-06-24 10:02:58.658-04	2014-06-24 13:58:44.488-04	\N	omop_harvest	person	day_of_birth	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	
5	Person Person Source Value	\N	\N	f	f	2014-06-24 10:03:01.659-04	2014-06-24 10:06:39.069-04	\N	omop_harvest	person	person_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
6	Person Gender Source Value	\N	\N	f	t	2014-06-24 10:03:01.667-04	2014-06-24 11:38:47.021-04	\N	omop_harvest	person	gender_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	
7	Person Race Source Value	\N	\N	f	t	2014-06-24 10:03:01.675-04	2014-06-24 11:38:47.04-04	\N	omop_harvest	person	race_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	
8	Person Ethnicity Source Value	\N	\N	f	t	2014-06-24 10:03:01.683-04	2014-06-24 11:38:47.014-04	\N	omop_harvest	person	ethnicity_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	
12	Person Location Location Id	\N	\N	f	f	2014-06-24 10:03:01.718-04	2014-06-24 10:06:44.953-04	\N	omop_harvest	personlocation	location_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
13	Person Location Address 1	\N	\N	f	f	2014-06-24 10:03:01.728-04	2014-06-24 10:06:44.986-04	\N	omop_harvest	personlocation	address_1	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
14	Person Location Address 2	\N	\N	f	f	2014-06-24 10:03:01.737-04	2014-06-24 10:06:44.998-04	\N	omop_harvest	personlocation	address_2	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
15	Person Location City	\N	\N	f	f	2014-06-24 10:03:01.745-04	2014-06-24 10:06:45.008-04	\N	omop_harvest	personlocation	city	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
16	Person Location State	\N	\N	f	f	2014-06-24 10:03:01.753-04	2014-06-24 10:06:45.021-04	\N	omop_harvest	personlocation	state	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
17	Person Location Zip	\N	\N	f	f	2014-06-24 10:03:01.761-04	2014-06-24 11:39:46.249-04	\N	omop_harvest	personlocation	zip	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	
18	Person Location County	\N	\N	f	f	2014-06-24 10:03:01.768-04	2014-06-24 10:06:45.149-04	\N	omop_harvest	personlocation	county	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
19	Person Location Location Source Value	\N	\N	f	f	2014-06-24 10:03:01.776-04	2014-06-24 10:06:45.273-04	\N	omop_harvest	personlocation	location_source_value	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
20	Provider Id			f	t	2014-06-24 10:03:01.783-04	2014-06-24 14:38:17.091-04		omop_harvest	provider	provider_id			\N	f	\N	\N	\N	f	1					string
21	Provider Npi	\N	\N	f	f	2014-06-24 10:03:01.79-04	2014-06-24 10:06:45.369-04	\N	omop_harvest	provider	npi	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
22	Provider Dea	\N	\N	f	f	2014-06-24 10:03:01.798-04	2014-06-24 10:06:45.386-04	\N	omop_harvest	provider	dea	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
23	Provider Care Site Id	\N	\N	f	f	2014-06-24 10:03:01.806-04	2014-06-24 10:06:45.393-04	\N	omop_harvest	provider	care_site_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
24	Provider Provider Source Value	\N	\N	f	f	2014-06-24 10:03:01.813-04	2014-06-24 10:06:45.518-04	\N	omop_harvest	provider	provider_source_value	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
25	Provider Specialty Source Value	\N	\N	f	f	2014-06-24 10:03:01.821-04	2014-06-24 10:06:45.53-04	\N	omop_harvest	provider	specialty_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
27	Care Site Care Site Id	\N	\N	f	f	2014-06-24 10:03:01.837-04	2014-06-24 10:06:45.543-04	\N	omop_harvest	caresite	care_site_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
28	Care Site Source Value			f	t	2014-06-24 10:03:01.845-04	2014-06-24 13:58:44.479-04		omop_harvest	caresite	care_site_source_value			\N	f	\N	\N	\N	f	1					
29	Care Site Place Of Service Source Value	\N	\N	f	f	2014-06-24 10:03:01.853-04	2014-06-24 10:06:45.591-04	\N	omop_harvest	caresite	place_of_service_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
30	Care Site Location Location Id	\N	\N	f	f	2014-06-24 10:03:01.86-04	2014-06-24 10:06:45.597-04	\N	omop_harvest	caresitelocation	location_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
31	Care Site Location Address 1	\N	\N	f	f	2014-06-24 10:03:01.869-04	2014-06-24 10:06:45.609-04	\N	omop_harvest	caresitelocation	address_1	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
32	Care Site Location Address 2	\N	\N	f	f	2014-06-24 10:03:01.878-04	2014-06-24 10:06:45.618-04	\N	omop_harvest	caresitelocation	address_2	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
33	Care Site Location City	\N	\N	f	f	2014-06-24 10:03:01.886-04	2014-06-24 10:06:45.628-04	\N	omop_harvest	caresitelocation	city	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
34	Care Site Location State	\N	\N	f	f	2014-06-24 10:03:01.894-04	2014-06-24 10:06:45.637-04	\N	omop_harvest	caresitelocation	state	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
35	Care Site Location Zip	\N	\N	f	t	2014-06-24 10:03:01.901-04	2014-06-24 11:38:46.995-04	\N	omop_harvest	caresitelocation	zip	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	
36	Care Site Location County	\N	\N	f	f	2014-06-24 10:03:01.908-04	2014-06-24 10:06:45.656-04	\N	omop_harvest	caresitelocation	county	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
37	Care Site Location Location Source Value	\N	\N	f	f	2014-06-24 10:03:01.916-04	2014-06-24 10:06:45.666-04	\N	omop_harvest	caresitelocation	location_source_value	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
38	Organization Organization Id	\N	\N	f	f	2014-06-24 10:03:01.923-04	2014-06-24 10:06:45.674-04	\N	omop_harvest	organization	organization_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
39	Organization Place Of Service Concept Id	\N	\N	f	f	2014-06-24 10:03:01.931-04	2014-06-24 10:06:45.685-04	\N	omop_harvest	organization	place_of_service_concept_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
40	Organization Location Id	\N	\N	f	f	2014-06-24 10:03:01.938-04	2014-06-24 10:06:45.692-04	\N	omop_harvest	organization	location_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
41	Organization Source Value			f	t	2014-06-24 10:03:01.945-04	2014-06-24 13:53:21.848-04		omop_harvest	organization	organization_source_value			\N	t	\N	\N	\N	f	1					
42	Organization Place Of Service Source Value	\N	\N	f	f	2014-06-24 10:03:01.953-04	2014-06-24 10:06:45.715-04	\N	omop_harvest	organization	place_of_service_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
44	Visit Visit Occurrence Id	\N	\N	f	f	2014-06-24 10:03:01.968-04	2014-06-24 10:06:45.729-04	\N	omop_harvest	visit	visit_occurrence_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
45	Visit Visit Start Date	\N	\N	f	f	2014-06-24 10:03:01.975-04	2014-06-24 10:06:45.735-04	\N	omop_harvest	visit	visit_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
46	Visit Visit End Date	\N	\N	f	f	2014-06-24 10:03:01.982-04	2014-06-24 10:06:45.743-04	\N	omop_harvest	visit	visit_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
47	Visit Place Of Service Concept Id	\N	\N	f	f	2014-06-24 10:03:01.989-04	2014-06-24 10:06:45.751-04	\N	omop_harvest	visit	place_of_service_concept_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
48	Visit Care Site Id	\N	\N	f	f	2014-06-24 10:03:01.996-04	2014-06-24 10:06:45.76-04	\N	omop_harvest	visit	care_site_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
49	Visit Place Of Service Source Value	\N	\N	f	f	2014-06-24 10:03:02.004-04	2014-06-24 10:06:45.77-04	\N	omop_harvest	visit	place_of_service_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
50	Visit Condition Condition Occurrence Id	\N	\N	f	f	2014-06-24 10:03:02.011-04	2014-06-24 10:06:45.778-04	\N	omop_harvest	visitcondition	condition_occurrence_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
51	Visit Condition Person Id	\N	\N	f	f	2014-06-24 10:03:02.018-04	2014-06-24 10:06:45.785-04	\N	omop_harvest	visitcondition	person_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
52	Visit Condition Condition Start Date	\N	\N	f	f	2014-06-24 10:03:02.025-04	2014-06-24 10:06:45.791-04	\N	omop_harvest	visitcondition	condition_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
53	Visit Condition Condition End Date	\N	\N	f	f	2014-06-24 10:03:02.032-04	2014-06-24 10:06:45.797-04	\N	omop_harvest	visitcondition	condition_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
54	Visit Condition Stop Reason	\N	\N	f	f	2014-06-24 10:03:02.039-04	2014-06-24 10:06:45.811-04	\N	omop_harvest	visitcondition	stop_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
55	Visit Condition Associated Provider Id	\N	\N	f	f	2014-06-24 10:03:02.047-04	2014-06-24 10:06:45.818-04	\N	omop_harvest	visitcondition	associated_provider_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
56	Visit Condition Condition Source Value	\N	\N	f	f	2014-06-24 10:03:02.058-04	2014-06-24 10:06:45.828-04	\N	omop_harvest	visitcondition	condition_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
59	Visit Procedure Procedure Occurrence Id	\N	\N	f	f	2014-06-24 10:03:02.083-04	2014-06-24 10:06:45.849-04	\N	omop_harvest	visitprocedure	procedure_occurrence_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
60	Visit Procedure Person Id	\N	\N	f	f	2014-06-24 10:03:02.092-04	2014-06-24 10:06:45.857-04	\N	omop_harvest	visitprocedure	person_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
61	Visit Procedure Procedure Date	\N	\N	f	f	2014-06-24 10:03:02.102-04	2014-06-24 10:06:45.865-04	\N	omop_harvest	visitprocedure	procedure_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
62	Visit Procedure Associated Provider Id	\N	\N	f	f	2014-06-24 10:03:02.109-04	2014-06-24 10:06:45.873-04	\N	omop_harvest	visitprocedure	associated_provider_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
63	Visit Procedure Relevant Condition Concept Id	\N	\N	f	f	2014-06-24 10:03:02.117-04	2014-06-24 10:06:45.881-04	\N	omop_harvest	visitprocedure	relevant_condition_concept_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
64	Visit Procedure Procedure Source Value	\N	\N	f	f	2014-06-24 10:03:02.124-04	2014-06-24 10:06:45.89-04	\N	omop_harvest	visitprocedure	procedure_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
67	Visit Drug Drug Exposure Id	\N	\N	f	f	2014-06-24 10:03:02.146-04	2014-06-24 10:06:45.911-04	\N	omop_harvest	visitdrug	drug_exposure_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
68	Visit Drug Person Id	\N	\N	f	f	2014-06-24 10:03:02.155-04	2014-06-24 10:06:45.917-04	\N	omop_harvest	visitdrug	person_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
69	Visit Drug Drug Exposure Start Date	\N	\N	f	f	2014-06-24 10:03:02.173-04	2014-06-24 10:06:45.925-04	\N	omop_harvest	visitdrug	drug_exposure_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
70	Visit Drug Drug Exposure End Date	\N	\N	f	f	2014-06-24 10:03:02.181-04	2014-06-24 10:06:45.934-04	\N	omop_harvest	visitdrug	drug_exposure_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
71	Visit Drug Stop Reason	\N	\N	f	f	2014-06-24 10:03:02.189-04	2014-06-24 10:06:45.946-04	\N	omop_harvest	visitdrug	stop_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
72	Visit Drug Refills	\N	\N	f	f	2014-06-24 10:03:02.196-04	2014-06-24 10:06:45.954-04	\N	omop_harvest	visitdrug	refills	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
73	Visit Drug Quantity	\N	\N	f	f	2014-06-24 10:03:02.204-04	2014-06-24 10:06:45.961-04	\N	omop_harvest	visitdrug	quantity	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
74	Visit Drug Days Supply	\N	\N	f	f	2014-06-24 10:03:02.214-04	2014-06-24 10:06:45.968-04	\N	omop_harvest	visitdrug	days_supply	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
75	Visit Drug Sig	\N	\N	f	f	2014-06-24 10:03:02.222-04	2014-06-24 10:06:45.975-04	\N	omop_harvest	visitdrug	sig	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
76	Visit Drug Prescribing Provider Id	\N	\N	f	f	2014-06-24 10:03:02.23-04	2014-06-24 10:06:45.983-04	\N	omop_harvest	visitdrug	prescribing_provider_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
77	Visit Drug Relevant Condition Concept Id	\N	\N	f	f	2014-06-24 10:03:02.239-04	2014-06-24 10:06:45.991-04	\N	omop_harvest	visitdrug	relevant_condition_concept_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
78	Visit Drug Drug Source Value	\N	\N	f	f	2014-06-24 10:03:02.246-04	2014-06-24 10:06:46-04	\N	omop_harvest	visitdrug	drug_source_value	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
81	Gender Concept Name			f	t	2014-06-24 11:51:35.325-04	2014-06-24 12:04:46.495-04		omop_harvest	gender	concept_name			\N	t	\N	\N	\N	f	1					
82	Gender Concept Level	\N	\N	f	f	2014-06-24 11:51:35.341-04	2014-06-24 11:51:35.341-04	\N	omop_harvest	gender	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
83	Gender Concept Class	\N	\N	f	f	2014-06-24 11:51:35.354-04	2014-06-24 11:51:35.354-04	\N	omop_harvest	gender	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
84	Gender Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.365-04	2014-06-24 11:51:35.365-04	\N	omop_harvest	gender	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
85	Gender Concept Code	\N	\N	f	f	2014-06-24 11:51:35.377-04	2014-06-24 11:51:35.378-04	\N	omop_harvest	gender	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
86	Gender Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.386-04	2014-06-24 11:51:35.386-04	\N	omop_harvest	gender	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
87	Gender Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.396-04	2014-06-24 11:51:35.396-04	\N	omop_harvest	gender	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
88	Gender Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.408-04	2014-06-24 11:51:35.408-04	\N	omop_harvest	gender	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
89	Race Concept Name	\N	\N	f	t	2014-06-24 11:51:35.422-04	2014-06-24 11:57:19.92-04	\N	omop_harvest	race	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	
90	Race Concept Level	\N	\N	f	f	2014-06-24 11:51:35.431-04	2014-06-24 11:51:35.431-04	\N	omop_harvest	race	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
91	Race Concept Class	\N	\N	f	f	2014-06-24 11:51:35.443-04	2014-06-24 11:51:35.443-04	\N	omop_harvest	race	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
92	Race Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.453-04	2014-06-24 11:51:35.453-04	\N	omop_harvest	race	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
93	Race Concept Code	\N	\N	f	f	2014-06-24 11:51:35.467-04	2014-06-24 11:51:35.467-04	\N	omop_harvest	race	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
94	Race Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.478-04	2014-06-24 11:51:35.478-04	\N	omop_harvest	race	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
95	Race Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.488-04	2014-06-24 11:51:35.488-04	\N	omop_harvest	race	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
96	Race Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.5-04	2014-06-24 11:51:35.5-04	\N	omop_harvest	race	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
97	Ethnicity Concept Name	\N	\N	f	t	2014-06-24 11:51:35.513-04	2014-06-24 11:57:19.9-04	\N	omop_harvest	ethnicity	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	
98	Ethnicity Concept Level	\N	\N	f	f	2014-06-24 11:51:35.524-04	2014-06-24 11:51:35.524-04	\N	omop_harvest	ethnicity	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
99	Ethnicity Concept Class	\N	\N	f	f	2014-06-24 11:51:35.535-04	2014-06-24 11:51:35.535-04	\N	omop_harvest	ethnicity	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
100	Ethnicity Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.546-04	2014-06-24 11:51:35.546-04	\N	omop_harvest	ethnicity	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
101	Ethnicity Concept Code	\N	\N	f	f	2014-06-24 11:51:35.56-04	2014-06-24 11:51:35.56-04	\N	omop_harvest	ethnicity	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
102	Ethnicity Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.571-04	2014-06-24 11:51:35.571-04	\N	omop_harvest	ethnicity	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
103	Ethnicity Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.58-04	2014-06-24 11:51:35.58-04	\N	omop_harvest	ethnicity	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
104	Ethnicity Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.591-04	2014-06-24 11:51:35.591-04	\N	omop_harvest	ethnicity	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
105	Provider Specialty Concept Name	\N	\N	f	f	2014-06-24 11:51:35.65-04	2014-06-24 11:51:35.65-04	\N	omop_harvest	providerspecialty	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
106	Provider Specialty Concept Level	\N	\N	f	f	2014-06-24 11:51:35.66-04	2014-06-24 11:51:35.66-04	\N	omop_harvest	providerspecialty	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
107	Provider Specialty Concept Class	\N	\N	f	f	2014-06-24 11:51:35.67-04	2014-06-24 11:51:35.67-04	\N	omop_harvest	providerspecialty	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
108	Provider Specialty Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.68-04	2014-06-24 11:51:35.68-04	\N	omop_harvest	providerspecialty	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
109	Provider Specialty Concept Code	\N	\N	f	f	2014-06-24 11:51:35.692-04	2014-06-24 11:51:35.692-04	\N	omop_harvest	providerspecialty	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
110	Provider Specialty Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.705-04	2014-06-24 11:51:35.705-04	\N	omop_harvest	providerspecialty	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
111	Provider Specialty Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.714-04	2014-06-24 11:51:35.714-04	\N	omop_harvest	providerspecialty	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
112	Provider Specialty Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.726-04	2014-06-24 11:51:35.726-04	\N	omop_harvest	providerspecialty	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
113	Care Site Pos Concept Name	\N	\N	f	f	2014-06-24 11:51:35.782-04	2014-06-24 11:51:35.782-04	\N	omop_harvest	caresitepos	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
114	Care Site Pos Concept Level	\N	\N	f	f	2014-06-24 11:51:35.792-04	2014-06-24 11:51:35.792-04	\N	omop_harvest	caresitepos	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
115	Care Site Pos Concept Class	\N	\N	f	f	2014-06-24 11:51:35.802-04	2014-06-24 11:51:35.802-04	\N	omop_harvest	caresitepos	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
116	Care Site Pos Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.811-04	2014-06-24 11:51:35.811-04	\N	omop_harvest	caresitepos	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
117	Care Site Pos Concept Code	\N	\N	f	f	2014-06-24 11:51:35.823-04	2014-06-24 11:51:35.823-04	\N	omop_harvest	caresitepos	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
118	Care Site Pos Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.836-04	2014-06-24 11:51:35.836-04	\N	omop_harvest	caresitepos	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
119	Care Site Pos Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.847-04	2014-06-24 11:51:35.847-04	\N	omop_harvest	caresitepos	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
120	Care Site Pos Invalid Reason	\N	\N	f	f	2014-06-24 11:51:35.858-04	2014-06-24 11:51:35.858-04	\N	omop_harvest	caresitepos	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
121	Visit Condition Concept Concept Name	\N	\N	f	f	2014-06-24 11:51:35.911-04	2014-06-24 11:51:35.911-04	\N	omop_harvest	visitconditionconcept	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
122	Visit Condition Concept Concept Level	\N	\N	f	f	2014-06-24 11:51:35.922-04	2014-06-24 11:51:35.922-04	\N	omop_harvest	visitconditionconcept	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
123	Visit Condition Concept Concept Class	\N	\N	f	f	2014-06-24 11:51:35.933-04	2014-06-24 11:51:35.933-04	\N	omop_harvest	visitconditionconcept	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
124	Visit Condition Concept Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:35.944-04	2014-06-24 11:51:35.944-04	\N	omop_harvest	visitconditionconcept	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
125	Visit Condition Concept Concept Code	\N	\N	f	f	2014-06-24 11:51:35.974-04	2014-06-24 11:51:35.974-04	\N	omop_harvest	visitconditionconcept	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
126	Visit Condition Concept Valid Start Date	\N	\N	f	f	2014-06-24 11:51:35.985-04	2014-06-24 11:51:35.985-04	\N	omop_harvest	visitconditionconcept	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
127	Visit Condition Concept Valid End Date	\N	\N	f	f	2014-06-24 11:51:35.996-04	2014-06-24 11:51:35.996-04	\N	omop_harvest	visitconditionconcept	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
128	Visit Condition Concept Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.007-04	2014-06-24 11:51:36.007-04	\N	omop_harvest	visitconditionconcept	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
129	Visit Condition Type Concept Name	\N	\N	f	f	2014-06-24 11:51:36.021-04	2014-06-24 11:51:36.021-04	\N	omop_harvest	visitconditiontype	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
130	Visit Condition Type Concept Level	\N	\N	f	f	2014-06-24 11:51:36.032-04	2014-06-24 11:51:36.032-04	\N	omop_harvest	visitconditiontype	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
131	Visit Condition Type Concept Class	\N	\N	f	f	2014-06-24 11:51:36.043-04	2014-06-24 11:51:36.043-04	\N	omop_harvest	visitconditiontype	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
132	Visit Condition Type Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.055-04	2014-06-24 11:51:36.055-04	\N	omop_harvest	visitconditiontype	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
133	Visit Condition Type Concept Code	\N	\N	f	f	2014-06-24 11:51:36.067-04	2014-06-24 11:51:36.067-04	\N	omop_harvest	visitconditiontype	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
134	Visit Condition Type Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.078-04	2014-06-24 11:51:36.078-04	\N	omop_harvest	visitconditiontype	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
135	Visit Condition Type Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.089-04	2014-06-24 11:51:36.089-04	\N	omop_harvest	visitconditiontype	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
136	Visit Condition Type Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.099-04	2014-06-24 11:51:36.099-04	\N	omop_harvest	visitconditiontype	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
137	Visit Procedure Concept Concept Name	\N	\N	f	f	2014-06-24 11:51:36.131-04	2014-06-24 11:51:36.131-04	\N	omop_harvest	visitprocedureconcept	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
138	Visit Procedure Concept Concept Level	\N	\N	f	f	2014-06-24 11:51:36.141-04	2014-06-24 11:51:36.141-04	\N	omop_harvest	visitprocedureconcept	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
139	Visit Procedure Concept Concept Class	\N	\N	f	f	2014-06-24 11:51:36.166-04	2014-06-24 11:51:36.166-04	\N	omop_harvest	visitprocedureconcept	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
140	Visit Procedure Concept Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.177-04	2014-06-24 11:51:36.177-04	\N	omop_harvest	visitprocedureconcept	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
141	Visit Procedure Concept Concept Code	\N	\N	f	f	2014-06-24 11:51:36.189-04	2014-06-24 11:51:36.189-04	\N	omop_harvest	visitprocedureconcept	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
142	Visit Procedure Concept Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.197-04	2014-06-24 11:51:36.197-04	\N	omop_harvest	visitprocedureconcept	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
143	Visit Procedure Concept Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.21-04	2014-06-24 11:51:36.21-04	\N	omop_harvest	visitprocedureconcept	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
144	Visit Procedure Concept Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.221-04	2014-06-24 11:51:36.221-04	\N	omop_harvest	visitprocedureconcept	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
145	Visit Procedure Type Concept Name	\N	\N	f	f	2014-06-24 11:51:36.235-04	2014-06-24 11:51:36.235-04	\N	omop_harvest	visitproceduretype	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
146	Visit Procedure Type Concept Level	\N	\N	f	f	2014-06-24 11:51:36.245-04	2014-06-24 11:51:36.245-04	\N	omop_harvest	visitproceduretype	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
147	Visit Procedure Type Concept Class	\N	\N	f	f	2014-06-24 11:51:36.255-04	2014-06-24 11:51:36.255-04	\N	omop_harvest	visitproceduretype	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
148	Visit Procedure Type Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.264-04	2014-06-24 11:51:36.264-04	\N	omop_harvest	visitproceduretype	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
149	Visit Procedure Type Concept Code	\N	\N	f	f	2014-06-24 11:51:36.277-04	2014-06-24 11:51:36.277-04	\N	omop_harvest	visitproceduretype	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
150	Visit Procedure Type Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.288-04	2014-06-24 11:51:36.288-04	\N	omop_harvest	visitproceduretype	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
151	Visit Procedure Type Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.299-04	2014-06-24 11:51:36.299-04	\N	omop_harvest	visitproceduretype	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
152	Visit Procedure Type Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.31-04	2014-06-24 11:51:36.31-04	\N	omop_harvest	visitproceduretype	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
153	Visit Drug Concept Concept Name	\N	\N	f	f	2014-06-24 11:51:36.359-04	2014-06-24 11:51:36.359-04	\N	omop_harvest	visitdrugconcept	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
154	Visit Drug Concept Concept Level	\N	\N	f	f	2014-06-24 11:51:36.373-04	2014-06-24 11:51:36.373-04	\N	omop_harvest	visitdrugconcept	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
155	Visit Drug Concept Concept Class	\N	\N	f	f	2014-06-24 11:51:36.385-04	2014-06-24 11:51:36.385-04	\N	omop_harvest	visitdrugconcept	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
156	Visit Drug Concept Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.394-04	2014-06-24 11:51:36.394-04	\N	omop_harvest	visitdrugconcept	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
157	Visit Drug Concept Concept Code	\N	\N	f	f	2014-06-24 11:51:36.405-04	2014-06-24 11:51:36.405-04	\N	omop_harvest	visitdrugconcept	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
158	Visit Drug Concept Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.414-04	2014-06-24 11:51:36.414-04	\N	omop_harvest	visitdrugconcept	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
159	Visit Drug Concept Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.425-04	2014-06-24 11:51:36.425-04	\N	omop_harvest	visitdrugconcept	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
160	Visit Drug Concept Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.436-04	2014-06-24 11:51:36.436-04	\N	omop_harvest	visitdrugconcept	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
161	Visit Drug Type Concept Name	\N	\N	f	f	2014-06-24 11:51:36.451-04	2014-06-24 11:51:36.451-04	\N	omop_harvest	visitdrugtype	concept_name	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
162	Visit Drug Type Concept Level	\N	\N	f	f	2014-06-24 11:51:36.463-04	2014-06-24 11:51:36.463-04	\N	omop_harvest	visitdrugtype	concept_level	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
163	Visit Drug Type Concept Class	\N	\N	f	f	2014-06-24 11:51:36.477-04	2014-06-24 11:51:36.477-04	\N	omop_harvest	visitdrugtype	concept_class	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
164	Visit Drug Type Vocabulary Id	\N	\N	f	f	2014-06-24 11:51:36.492-04	2014-06-24 11:51:36.492-04	\N	omop_harvest	visitdrugtype	vocabulary_id	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
165	Visit Drug Type Concept Code	\N	\N	f	f	2014-06-24 11:51:36.507-04	2014-06-24 11:51:36.507-04	\N	omop_harvest	visitdrugtype	concept_code	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
166	Visit Drug Type Valid Start Date	\N	\N	f	f	2014-06-24 11:51:36.518-04	2014-06-24 11:51:36.518-04	\N	omop_harvest	visitdrugtype	valid_start_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
167	Visit Drug Type Valid End Date	\N	\N	f	f	2014-06-24 11:51:36.529-04	2014-06-24 11:51:36.529-04	\N	omop_harvest	visitdrugtype	valid_end_date	\N	\N	\N	f	\N	\N	\N	f	1	\N	\N	\N	\N	\N
168	Visit Drug Type Invalid Reason	\N	\N	f	f	2014-06-24 11:51:36.54-04	2014-06-24 11:51:36.54-04	\N	omop_harvest	visitdrugtype	invalid_reason	\N	\N	\N	t	\N	\N	\N	f	1	\N	\N	\N	\N	\N
\.


--
-- Name: avocado_datafield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_datafield_id_seq', 1, false);


--
-- Data for Name: avocado_datafield_sites; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_datafield_sites (id, datafield_id, site_id) FROM stdin;
\.


--
-- Name: avocado_datafield_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_datafield_sites_id_seq', 1, false);


--
-- Data for Name: avocado_dataquery; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_dataquery (id, name, description, keywords, created, modified, context_json, view_json, session, template, "default", user_id, session_key, accessed, distinct_count, record_count, parent_id, public, tree) FROM stdin;
\.


--
-- Name: avocado_dataquery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_dataquery_id_seq', 1, false);


--
-- Data for Name: avocado_dataquery_shared_users; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_dataquery_shared_users (id, dataquery_id, user_id) FROM stdin;
\.


--
-- Name: avocado_dataquery_shared_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_dataquery_shared_users_id_seq', 1, false);


--
-- Data for Name: avocado_dataview; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_dataview (id, name, description, keywords, created, modified, json, session, user_id, session_key, template, "default", accessed, parent_id) FROM stdin;
\.


--
-- Name: avocado_dataview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_dataview_id_seq', 1, false);


--
-- Data for Name: avocado_log; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_log (id, content_type_id, object_id, event, data, user_id, session_key, "timestamp") FROM stdin;
1	12	1	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:40.803731-04
2	11	1	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:40.854974-04
3	12	85	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:41.713754-04
4	11	81	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:41.761935-04
5	11	81	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:41.790563-04
6	12	2	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:42.366684-04
7	11	2	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:42.413233-04
8	11	2	dist	{"clustered":false,"aware":false,"size":2}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:42.445164-04
9	12	3	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:42.880674-04
10	11	3	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:42.924579-04
11	11	3	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:42.946914-04
12	12	4	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:43.49738-04
13	11	4	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:43.537076-04
14	11	4	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:43.562133-04
15	12	93	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:43.878245-04
16	11	89	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:43.925372-04
17	11	89	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:43.941903-04
18	12	101	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:44.259661-04
19	11	97	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:44.309142-04
20	11	97	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:44.323758-04
21	12	6	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:44.75238-04
22	11	6	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:44.809009-04
23	11	6	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:44.822525-04
24	12	8	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:45.146657-04
25	11	8	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:45.20008-04
26	11	8	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:45.212333-04
27	12	7	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:45.762205-04
28	11	7	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:45.809618-04
29	11	7	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:45.831092-04
30	12	20	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:47.190744-04
31	11	20	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:47.242285-04
32	12	28	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:48.303395-04
33	12	35	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:48.810408-04
34	12	41	fields	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:50.393472-04
35	11	41	stats	\N	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:50.440101-04
36	11	41	dist	{"clustered":false,"aware":false,"size":0}	1	dn21docw13aybjuzpsuca50x0fwgiuu1	2014-08-15 17:05:50.455192-04
37	12	1	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:10.281414-04
38	11	1	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:10.330808-04
39	12	85	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:10.99348-04
40	11	81	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:11.032315-04
41	11	81	dist	{"clustered":false,"aware":false,"size":0}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:11.045043-04
42	12	2	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:12.573017-04
43	11	2	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:12.607904-04
44	11	2	dist	{"clustered":false,"aware":false,"size":2}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:12.633347-04
45	12	3	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:14.649455-04
46	11	3	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:14.685384-04
47	11	3	dist	{"clustered":false,"aware":false,"size":2}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:14.720441-04
48	12	4	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:15.669222-04
49	11	4	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:15.709421-04
50	11	4	dist	{"clustered":false,"aware":false,"size":2}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:15.739485-04
51	12	93	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:16.375717-04
52	11	89	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:16.418984-04
53	11	89	dist	{"clustered":false,"aware":false,"size":2}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:16.433034-04
54	12	101	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:17.046951-04
55	11	97	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:17.080483-04
56	11	97	dist	{"clustered":false,"aware":false,"size":2}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:17.102968-04
57	12	6	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:17.624625-04
58	11	6	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:17.664992-04
59	11	6	dist	{"clustered":false,"aware":false,"size":0}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:17.685744-04
60	12	7	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:18.275343-04
61	11	7	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:18.33716-04
62	11	7	dist	{"clustered":false,"aware":false,"size":0}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:18.340991-04
63	12	20	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:20.998-04
64	11	20	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:21.034358-04
65	12	28	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:22.773683-04
66	12	35	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:24.512-04
67	12	41	fields	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:26.107891-04
68	11	41	stats	\N	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:26.143191-04
69	11	41	dist	{"clustered":false,"aware":false,"size":1}	1	36tqnzsaneu2tpq1ywelb0igr7g7krpz	2014-08-15 17:54:26.162313-04
70	12	20	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:19.951276-04
71	11	20	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:19.999211-04
72	12	41	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:21.899452-04
73	11	41	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:21.948451-04
147	11	89	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:05.601875-04
74	11	41	dist	{"clustered":false,"aware":false,"size":1}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:21.974579-04
75	12	28	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:23.715951-04
76	12	35	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:24.500612-04
77	12	1	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:28.110462-04
78	11	1	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:28.15202-04
79	12	85	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:28.776374-04
80	11	81	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:28.814433-04
81	11	81	dist	{"clustered":false,"aware":false,"size":1}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:28.831798-04
82	12	2	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:29.335932-04
83	11	2	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:29.375381-04
84	11	2	dist	{"clustered":false,"aware":false,"size":2}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:29.404158-04
85	12	3	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:30.313812-04
86	11	3	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:30.352596-04
87	11	3	dist	{"clustered":false,"aware":false,"size":2}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:30.383535-04
88	12	4	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:32.250494-04
89	11	4	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:32.297008-04
90	11	4	dist	{"clustered":false,"aware":false,"size":2}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:32.315893-04
91	12	93	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:32.784513-04
92	11	89	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:32.821617-04
93	11	89	dist	{"clustered":false,"aware":false,"size":2}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:32.845126-04
94	12	101	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:33.528913-04
95	11	97	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:33.560318-04
96	11	97	dist	{"clustered":false,"aware":false,"size":2}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:33.577616-04
97	12	6	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:34.196368-04
98	11	6	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:34.230108-04
99	11	6	dist	{"clustered":false,"aware":false,"size":1}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:34.251933-04
100	12	7	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:34.805854-04
101	11	7	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:34.852654-04
102	11	7	dist	{"clustered":false,"aware":false,"size":2}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:34.867438-04
103	12	8	fields	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:35.854952-04
104	11	8	stats	\N	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:35.894752-04
105	11	8	dist	{"clustered":false,"aware":false,"size":2}	1	pye1pnmh0e55841mvdvhscxis21zslnd	2014-08-15 18:00:35.909399-04
106	12	35	fields	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:08:44.061484-04
107	12	28	fields	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:08:45.254693-04
108	12	41	fields	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:08:46.925753-04
109	11	41	stats	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:08:46.963814-04
110	11	41	dist	{"clustered":false,"aware":false,"size":1}	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:08:46.991789-04
111	12	20	fields	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:02.036019-04
112	11	20	stats	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:02.074924-04
113	12	7	fields	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:04.954484-04
114	11	7	stats	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:04.992214-04
115	11	7	dist	{"clustered":false,"aware":false,"size":2}	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:05.015233-04
116	12	6	fields	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:05.514145-04
117	11	6	stats	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:05.549455-04
118	11	6	dist	{"clustered":false,"aware":false,"size":1}	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:05.566331-04
119	12	8	fields	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:06.084684-04
120	11	8	stats	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:06.134018-04
121	11	8	dist	{"clustered":false,"aware":false,"size":2}	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:06.154383-04
122	12	101	fields	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:08.715769-04
123	11	97	stats	\N	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:08.753574-04
124	11	97	dist	{"clustered":false,"aware":false,"size":2}	1	rvmicdtj4pjq1s0c61gkdmbrs66cis50	2014-08-15 18:09:08.772661-04
125	12	28	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:12:55.183761-04
126	12	35	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:12:56.004293-04
127	12	41	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:12:59.299439-04
128	11	41	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:12:59.339066-04
129	11	41	dist	{"clustered":false,"aware":false,"size":1}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:12:59.381178-04
130	12	20	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:00.883269-04
131	11	20	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:00.921554-04
132	12	1	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:02.220522-04
133	11	1	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:02.263089-04
134	12	85	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:02.856689-04
135	11	81	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:02.898198-04
136	11	81	dist	{"clustered":false,"aware":false,"size":1}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:02.908055-04
137	12	2	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:03.933138-04
138	11	2	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:03.9728-04
139	11	2	dist	{"clustered":false,"aware":false,"size":2}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:04.004849-04
140	12	3	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:04.38688-04
141	11	3	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:04.426512-04
142	11	3	dist	{"clustered":false,"aware":false,"size":2}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:04.452932-04
143	12	4	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:04.969098-04
144	11	4	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:05.00711-04
145	11	4	dist	{"clustered":false,"aware":false,"size":2}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:05.043592-04
146	12	93	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:05.556934-04
148	11	89	dist	{"clustered":false,"aware":false,"size":2}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:05.625393-04
149	12	101	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:06.236538-04
150	11	97	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:06.272006-04
151	11	97	dist	{"clustered":false,"aware":false,"size":2}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:06.293319-04
152	12	6	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:06.7491-04
153	11	6	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:06.7889-04
154	11	6	dist	{"clustered":false,"aware":false,"size":1}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:06.803348-04
155	12	7	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:07.267786-04
156	11	7	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:07.305306-04
157	11	7	dist	{"clustered":false,"aware":false,"size":2}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:07.325908-04
158	12	8	fields	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:07.748879-04
159	11	8	stats	\N	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:07.78413-04
160	11	8	dist	{"clustered":false,"aware":false,"size":2}	1	lda5drqy38md3zg6izjzlk8z3cbiz7gg	2014-08-15 18:13:07.797453-04
\.


--
-- Name: avocado_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_log_id_seq', 160, true);


--
-- Data for Name: avocado_revision; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY avocado_revision (id, content_type_id, object_id, data, user_id, session_key, "timestamp", deleted, changes) FROM stdin;
\.


--
-- Name: avocado_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('avocado_revision_id_seq', 1, false);


--
-- Data for Name: care_site; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY care_site (care_site_id, location_id, organization_id, place_of_service_concept_id, care_site_source_value, place_of_service_source_value) FROM stdin;
1	1	1	\N	Jonny Practice	\N
\.


--
-- Data for Name: care_site_location; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY care_site_location (location_id, address_1, address_2, city, state, zip, county, location_source_value) FROM stdin;
1	winding way	\N	clementon	NJ	80321	\N	My Own practice
\.


--
-- Data for Name: care_site_pos; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY care_site_pos (concept_id, concept_name, concept_level, concept_class, vocabulary_id, concept_code, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
\.


--
-- Data for Name: cohort; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY cohort (cohort_id, cohort_concept_id, cohort_start_date, cohort_end_date, subject_id, stop_reason) FROM stdin;
\.


--
-- Data for Name: concept; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY concept (concept_id, concept_name, concept_level, concept_class, vocabulary_id, concept_code, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
42553443	WHEAT GERM OIL OINT,TOP	0	VA Product	28	MTHU011268	1970-01-01 00:00:00-05	2005-07-29 00:00:00-04	D
42553444	WILD CHERRY SYRUP	0	VA Product	28	MTHU011270	1970-01-01 00:00:00-05	2005-07-29 00:00:00-04	D
42553445	XENON (XE-133) 1000MIL/AMP GAS	0	VA Product	28	MTHU011272	1970-01-01 00:00:00-05	2005-07-29 00:00:00-04	D
42553446	XENON (XE-133) 380MIL GAS	0	VA Product	28	MTHU011274	1970-01-01 00:00:00-05	2005-07-29 00:00:00-04	D
42553447	XENON 5% GAS	0	VA Product	28	MTHU011276	1970-01-01 00:00:00-05	2005-07-29 00:00:00-04	D
\.


--
-- Data for Name: concept_ancestor; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY concept_ancestor (ancestry_id, ancestor_concept_id, descendant_concept_id, max_levels_of_separation, min_levels_of_separation) FROM stdin;
1	42553443	42553444	4	4
2	42553444	42553445	4	4
3	42553443	42553446	3	3
4	42553445	42553443	1	1
\.


--
-- Name: concept_ancestor_ancestry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('concept_ancestor_ancestry_id_seq', 4, true);


--
-- Data for Name: concept_relationship; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY concept_relationship (concept_relationship_id, concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
2	42553443	42553444	348	2012-10-01 00:00:00-04	2099-12-31 00:00:00-05	\N
3	42553444	42553445	348	2012-10-01 00:00:00-04	2099-12-31 00:00:00-05	\N
4	42553443	42553446	348	2012-10-01 00:00:00-04	2099-12-31 00:00:00-05	\N
5	42553445	42553446	348	2012-10-01 00:00:00-04	2099-12-31 00:00:00-05	\N
\.


--
-- Name: concept_relationship_concept_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('concept_relationship_concept_relationship_id_seq', 5, true);


--
-- Data for Name: concept_synonym; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY concept_synonym (concept_synonym_id, concept_id, concept_synonym_name) FROM stdin;
0	42553443	No matching concept
\.


--
-- Data for Name: condition_era; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY condition_era (condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_type_concept_id, condition_occurrence_count) FROM stdin;
\.


--
-- Data for Name: condition_occurrence; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY condition_occurrence (condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, associated_provider_id, visit_occurrence_id, condition_source_value) FROM stdin;
\.


--
-- Data for Name: death; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY death (person_death_id, person_id, death_date, death_type_concept_id, cause_of_death_concept_id, cause_of_death_source_value) FROM stdin;
\.


--
-- Name: death_person_death_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('death_person_death_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	migration history	south	migrationhistory
2	log entry	admin	logentry
3	permission	auth	permission
4	group	auth	group
5	user	auth	user
6	content type	contenttypes	contenttype
7	session	sessions	session
8	site	sites	site
9	revision	avocado	revision
10	data category	avocado	datacategory
11	data field	avocado	datafield
12	data concept	avocado	dataconcept
13	data concept field	avocado	dataconceptfield
14	data context	avocado	datacontext
15	data view	avocado	dataview
16	data query	avocado	dataquery
17	API Token	serrano	apitoken
18	registration profile	registration	registrationprofile
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('django_content_type_id_seq', 8, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('django_site_id_seq', 1, false);


--
-- Data for Name: drug_approval; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY drug_approval (ingredient_concept_id, approval_date, approved_by) FROM stdin;
40057225	1955-08-18 00:00:00-04	FDA
934075	1996-11-01 00:00:00-05	FDA
42800246	2012-05-01 00:00:00-04	FDA
909795	2005-08-19 00:00:00-04	FDA
\.


--
-- Data for Name: drug_cost; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY drug_cost (drug_cost_id, drug_exposure_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, ingredient_cost, dispensing_fee, average_wholesale_price, payer_plan_period_id) FROM stdin;
\.


--
-- Data for Name: drug_era; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY drug_era (drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_type_concept_id, drug_exposure_count) FROM stdin;
\.


--
-- Data for Name: drug_exposure; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY drug_exposure (drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, prescribing_provider_id, visit_occurrence_id, relevant_condition_concept_id, drug_source_value) FROM stdin;
\.


--
-- Data for Name: drug_strength; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY drug_strength (drug_strength_id, drug_concept_id, ingredient_concept_id, amount_value, amount_unit, concentration_value, concentration_enum_unit, concentration_denom_unit, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
1	19035821	19069022	8	mg	\N	\N	\N	1970-01-01 00:00:00-05	2099-12-31 00:00:00-05	\N
2	19035837	1351461	\N	\N	100	mg	ml	1970-01-01 00:00:00-05	2009-09-06 00:00:00-04	\N
3	19035864	19132972	\N	\N	150	mg	ml	1970-01-01 00:00:00-05	2099-12-31 00:00:00-05	\N
4	19035865	1163944	\N	\N	20	mg	ml	1970-01-01 00:00:00-05	2099-12-31 00:00:00-05	\N
\.


--
-- Name: drug_strength_drug_strength_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('drug_strength_drug_strength_id_seq', 4, true);


--
-- Data for Name: ethnicity; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY ethnicity (concept_id, concept_name, concept_level, concept_class, vocabulary_id, concept_code, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
1	Indian	\N	\N	\N	\N	\N	\N	\N
2	European	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY gender (concept_id, concept_name, concept_level, concept_class, vocabulary_id, concept_code, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
1	MALE	\N	\N	\N	\N	\N	\N	\N
2	FEMALE	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY location (location_id, address_1, address_2, city, state, zip, county, location_source_value) FROM stdin;
1	winding way	\N	clementon	NJ	09021	camden	My Own Store
\.


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY observation (observation_id, person_id, observation_concept_id, observation_date, observation_time, value_as_number, value_as_string, value_as_concept_id, unit_concept_id, range_low, range_high, observation_type_concept_id, associated_provider_id, visit_occurrence_id, relevant_condition_concept_id, observation_source_value, units_source_value) FROM stdin;
\.


--
-- Data for Name: observation_period; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY observation_period (observation_period_id, person_id, observation_period_start_date, observation_period_end_date) FROM stdin;
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY organization (organization_id, place_of_service_concept_id, location_id, organization_source_value, place_of_service_source_value) FROM stdin;
1	\N	1	Best Practice Care	\N
\.


--
-- Data for Name: payer_plan_period; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY payer_plan_period (payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_source_value, plan_source_value, family_source_value) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY person (person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, race_source_value, ethnicity_source_value) FROM stdin;
1	1	1990	1	12	1	1	1	1	1	Jonny Son	Male	Gulamgas	Goodness
2	1	1980	9	20	2	2	1	1	1	Jonny Chan	Male	Asian	WhitePerson?
\.


--
-- Data for Name: person_location; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY person_location (location_id, address_1, address_2, city, state, zip, county, location_source_value) FROM stdin;
1	winding way	\N	clementon	NJ	8021	\N	\N
\.


--
-- Data for Name: procedure_cost; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY procedure_cost (procedure_cost_id, procedure_occurrence_id, paid_copay, paid_coinsurance, paid_toward_deductible, paid_by_payer, paid_by_coordination_benefits, total_out_of_pocket, total_paid, disease_class_concept_id, revenue_code_concept_id, payer_plan_period_id, disease_class_source_value, revenue_code_source_value) FROM stdin;
\.


--
-- Data for Name: procedure_occurrence; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY procedure_occurrence (procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, associated_provider_id, visit_occurrence_id, relevant_condition_concept_id, procedure_source_value) FROM stdin;
\.


--
-- Data for Name: provider; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY provider (provider_id, npi, dea, specialty_concept_id, care_site_id, provider_source_value, specialty_source_value) FROM stdin;
1	\N	\N	\N	1	Jonny Appleseed	\N
\.


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY race (concept_id, concept_name, concept_level, concept_class, vocabulary_id, concept_code, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
1	Asian	\N	\N	\N	\N	\N	\N	\N
2	African American	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY registration_registrationprofile (id, user_id, activation_key, verified, activated, moderated, moderator_id, moderation_time) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 1, false);


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship) FROM stdin;
319	Multilex ingredient to drug class (OMOP)	0	0	320
320	Drug class to Multilex ingredient (OMOP)	0	1	\N
347	Concept replaced by	0	0	348
348	Concept replaces	0	0	\N
247	Indication/Contra-indication to SNOMED	0	0	248
248	SNOMED to Indication/Contra-indication	0	0	\N
297	NUCC to CMS Specialty (CMS)	1	0	298
298	CMS Specialty to NUCC (CMS)	0	1	\N
299	DRG to MS-DRG equivalent (CMS)	0	0	300
300	MS-DRG to DRG equivalent (CMS)	0	0	\N
301	DRG to MDC category (CMS)	1	0	302
302	MDC category to DRG (CMS)	0	1	\N
303	Visit category to Place of Service (OMOP)	1	1	304
304	Place of Service to Visit category (OMOP)	0	0	\N
305	VA Product to NDF-RT (NDF-RT)	0	0	306
306	NDF-RT to VA Product (NDF-RT)	0	0	\N
307	VA Product to RxNorm equivalent (NDF-RT)	0	0	308
308	RxNorm to VA Product equivalent (NDF-RT)	0	0	\N
1	Concept replaced by (LOINC)	0	0	135
2	Has precise ingredient (RxNorm)	1	0	136
3	Has tradename (RxNorm)	0	1	137
4	Has dose form (RxNorm)	1	0	138
5	Has form (RxNorm)	1	0	139
6	Has ingredient (RxNorm)	1	0	140
7	Constitutes (RxNorm)	1	1	141
8	Contains (RxNorm)	1	0	142
9	Reformulation of (RxNorm)	0	0	143
10	Subsumes	1	1	144
11	Has dose form (NDF-RT)	1	0	145
12	Induces (NDF-RT)	0	0	146
13	May diagnose (NDF-RT)	1	0	147
14	Has physiological effect (NDF-RT)	1	0	148
15	Has contraindicating physiological effect (NDF-RT)	1	0	149
16	Has ingredient (NDF-RT)	1	0	150
17	Has contraindicating chemical class (NDF-RT)	1	0	151
18	Has mechanism of action (NDF-RT)	1	0	152
19	Has contraindicating mechanism of action (NDF-RT)	1	0	153
20	Has pharmacokinetics (NDF-RT)	1	0	154
21	May treat (NDF-RT)	1	0	155
22	Contraindication to (NDF-RT)	1	0	156
23	May prevent (NDF-RT)	1	0	157
24	Has active metabolites (NDF-RT)	1	0	158
25	Has site of metabolism (NDF-RT)	1	0	159
26	Effect may be inhibited by (NDF-RT)	1	0	160
27	Has chemical structure (NDF-RT)	1	0	161
28	NDF-RT to RxNorm equivalent (RxNorm)	0	1	162
29	Has recipient category (SNOMED)	0	0	163
30	Has procedure site (SNOMED)	0	0	164
31	Has priority (SNOMED)	0	0	165
32	Has pathological process (SNOMED)	0	0	166
33	Has part of (SNOMED)	0	0	167
34	Has severity (SNOMED)	0	0	168
35	Has revision status (SNOMED)	0	0	169
36	Has access (SNOMED)	0	0	170
37	Has occurrence (SNOMED)	0	0	171
38	Has method (SNOMED)	0	0	172
39	Has laterality (SNOMED)	0	0	173
40	Has interprets (SNOMED)	0	0	174
41	Has indirect morphology (SNOMED)	0	0	175
42	Has indirect device (SNOMED)	0	0	176
43	Has specimen (SNOMED)	0	0	177
44	Has interpretation (SNOMED)	0	0	178
45	Has intent (SNOMED)	0	0	179
46	Has focus (SNOMED)	0	0	180
47	Has definitional manifestation (SNOMED)	0	0	181
48	Has active ingredient (SNOMED)	0	0	182
49	Has finding site (SNOMED)	0	0	183
50	Has episodicity (SNOMED)	0	0	184
51	Has direct substance (SNOMED)	0	0	185
52	Has direct morphology (SNOMED)	0	0	186
53	Has direct device (SNOMED)	0	0	187
54	Has component (SNOMED)	0	0	188
55	Has causative agent (SNOMED)	0	0	189
56	Has associated morphology (SNOMED)	0	0	190
57	Has associated finding (SNOMED)	0	0	191
58	Has measurement method (SNOMED)	0	0	192
59	Has property (SNOMED)	0	0	193
60	Has scale type (SNOMED)	0	0	194
61	Has time aspect (SNOMED)	0	0	195
62	Has specimen procedure (SNOMED)	0	0	196
63	Has specimen source identity (SNOMED)	0	0	197
64	Has specimen source morphology (SNOMED)	0	0	198
65	Has specimen source topography (SNOMED)	0	0	199
66	Has specimen substance (SNOMED)	0	0	200
67	Has due to (SNOMED)	0	0	201
68	Has subject relationship context (SNOMED)	0	0	202
69	Has dose form (SNOMED)	0	0	203
70	Occurs after (SNOMED)	0	0	204
71	Has associated procedure (SNOMED)	0	0	205
72	Has direct procedure site (SNOMED)	0	0	206
73	Has indirect procedure site (SNOMED)	0	0	207
74	Has procedure device (SNOMED)	0	0	208
75	Has procedure morphology (SNOMED)	0	0	209
76	Has finding context (SNOMED)	0	0	210
77	Has procedure context (SNOMED)	0	0	211
78	Has temporal context (SNOMED)	0	0	212
79	Associated with (SNOMED)	0	0	213
80	Has surgical approach (SNOMED)	0	0	214
81	Using device (SNOMED)	0	0	215
82	Using energy (SNOMED)	0	0	216
83	Using substance (SNOMED)	0	0	217
84	Using access device (SNOMED)	0	0	218
85	Has clinical course (SNOMED)	0	0	219
86	Has route of administration (SNOMED)	0	0	220
87	Using finding method (SNOMED)	0	0	221
88	Using finding informer (SNOMED)	0	0	222
89	ICD9CM to SNOMED category (OMOP)	0	1	223
90	ICD9CM to SNOMED equivalent (OMOP)	0	1	224
91	ICD9 procedure to SNOMED category (OMOP)	1	1	225
92	ICD9 procedure to SNOMED equivalent (OMOP)	0	0	226
93	CPT-4 to SNOMED category (OMOP)	1	0	227
94	CPT-4 to SNOMED equivalent (OMOP)	0	0	228
101	Obsolete	0	0	229
102	Obsolete	0	0	230
103	Obsolete	0	0	231
104	Obsolete	0	0	232
105	Obsolete	0	0	233
106	Obsolete	0	0	234
121	Obsolete	0	0	235
122	Obsolete	0	0	236
123	Obsolete	0	0	237
124	Obsolete	0	0	238
125	MedDRA to SNOMED equivalent (OMOP)	0	1	239
126	Has FDA-approved drug indication (FDB)	0	0	240
127	Has off-label drug indication (FDB)	0	0	241
128	Obsolete	0	0	242
129	Has drug contra-indication (FDB)	0	0	243
130	ETC to RxNorm (FDB)	0	1	244
131	ATC to RxNorm (FDB)	0	1	245
132	SMQ consists of MedDRA (MedDRA)	0	1	246
134	Obsolete	0	0	133
269	Clinical Drug, Branded Drug, Clinical Pack, Branded Pack -->Ingredient	0	0	270
275	Has therapeutic class (NDF)	0	1	276
277	Drug-drug interaction for (NDF)	0	0	278
279	Has pharmaceutical preparation (NDF)	0	0	280
281	Inferred drug class of (OMOP)	0	1	282
283	HCPCS to SNOMED procedure equivalent (OMOP)	0	0	284
284	SNOMED procedure HCPCS equivalent (OMOP)	0	0	\N
291	HOI contains SNOMED (OMOP)	1	1	292
292	SNOMED contained in HOI (OMOP)	0	0	\N
293	DOI contains RxNorm (OMOP)	1	1	294
294	RxNorm contained in DOI (OMOP)	0	0	\N
285	RxNorm to NDF-RT equivalent by concept_name (OMOP)	0	1	286
287	ETC to RxNorm equivalent by concept_name (OMOP)	0	1	288
289	ATC to RxNorm equivalent by concept_name (OMOP)	0	1	290
286	NDF-RT to RxNorm equivalent by concept_name (OMOP)	0	0	\N
288	RxNorm to ETC equivalent by concept_name (OMOP)	0	0	\N
290	RxNorm to ATC equivalent by concept_name (OMOP)	0	0	\N
295	HOI contains MedDRA (OMOP)	1	1	296
296	MedDRA contained in HOI (OMOP)	0	0	\N
282	Has inferred drug class (OMOP)	0	0	\N
135	Concept replaces (LOINC)	0	0	\N
136	Precise ingredient of (RxNorm)	0	0	\N
137	Tradename of (RxNorm)	0	0	\N
138	Dose form of (RxNorm)	0	0	\N
139	Form of (RxNorm)	0	0	\N
140	Ingredient of (RxNorm)	0	1	\N
141	Consists of (RxNorm)	0	0	\N
142	Is contained in (RxNorm)	0	1	\N
143	Reformulated in (RxNorm)	0	1	\N
144	Is a	0	0	\N
145	Dose form of (NDF-RT)	0	0	\N
146	Induced by (NDF-RT)	0	0	\N
147	Diagnosed through (NDF-RT)	0	0	\N
148	Physiological effect induced by (NDF-RT)	0	1	\N
149	Contraindicating physiological effect induced by (NDF-RT)	0	0	\N
150	Ingredient of (NDF-RT)	0	1	\N
151	Contraindicating chemical class of (NDF-RT)	0	0	\N
152	Mechanism of action of (NDF-RT)	0	1	\N
153	Contraindicating mechanism of action of (NDF-RT)	0	0	\N
154	Pharmacokinetics of (NDF-RT)	0	0	\N
155	May be treated by (NDF-RT)	0	1	\N
156	Contraindicated by (NDF-RT)	0	0	\N
157	May be prevented by (NDF-RT)	0	1	\N
158	Active metabolite of (NDF-RT)	0	0	\N
159	Site of metabolism of (NDF-RT)	0	0	\N
160	Inhibits effect (NDF-RT)	0	0	\N
161	Chemical structure of (NDF-RT)	0	1	\N
162	RxNorm to NDF-RT equivalent (RxNorm)	0	0	\N
163	Recipient category of (SNOMED)	0	0	\N
164	Procedure site of (SNOMED)	0	0	\N
165	Priority of (SNOMED)	0	0	\N
166	Pathological process of (SNOMED)	0	0	\N
167	Part of (SNOMED)	0	0	\N
168	Severity of (SNOMED)	0	0	\N
169	Revision status of (SNOMED)	0	0	\N
170	Access of (SNOMED)	0	0	\N
171	Occurrence of (SNOMED)	0	0	\N
172	Method of (SNOMED)	0	0	\N
173	Laterality of (SNOMED)	0	0	\N
174	Interprets of (SNOMED)	0	0	\N
175	Indirect morphology of (SNOMED)	0	0	\N
176	Indirect device of (SNOMED)	0	0	\N
177	Specimen of (SNOMED)	0	0	\N
178	Interpretation of (SNOMED)	0	0	\N
179	Intent of (SNOMED)	0	0	\N
180	Focus of (SNOMED)	0	0	\N
181	Definitional manifestation of (SNOMED)	0	0	\N
182	Active ingredient of (SNOMED)	0	0	\N
183	Finding site of (SNOMED)	0	0	\N
184	Episodicity of (SNOMED)	0	0	\N
185	Direct substance of (SNOMED)	0	0	\N
186	Direct morphology of (SNOMED)	0	0	\N
187	Direct device of (SNOMED)	0	0	\N
188	Component of (SNOMED)	0	0	\N
189	Causative agent of (SNOMED)	0	0	\N
190	Associated morphology of (SNOMED)	0	0	\N
191	Associated finding of (SNOMED)	0	0	\N
192	Measurement method of (SNOMED)	0	0	\N
193	Property of (SNOMED)	0	0	\N
194	Scale type of (SNOMED)	0	0	\N
195	Time aspect of (SNOMED)	0	0	\N
196	Specimen procedure of (SNOMED)	0	0	\N
197	Specimen source identity of (SNOMED)	0	0	\N
198	Specimen source morphology of (SNOMED)	0	0	\N
199	Specimen source topography of (SNOMED)	0	0	\N
200	Specimen substance of (SNOMED)	0	0	\N
201	Due to of (SNOMED)	0	0	\N
202	Subject relationship context of (SNOMED)	0	0	\N
203	Dose form of (SNOMED)	0	0	\N
204	Occurs before (SNOMED)	0	0	\N
205	Associated procedure of (SNOMED)	0	0	\N
206	Direct procedure site of (SNOMED)	0	0	\N
207	Indirect procedure site of (SNOMED)	0	0	\N
208	Procedure device of (SNOMED)	0	0	\N
209	Procedure morphology of (SNOMED)	0	0	\N
210	Finding context of (SNOMED)	0	0	\N
211	Procedure context of (SNOMED)	0	0	\N
212	Temporal context of (SNOMED)	0	0	\N
213	Associated with (SNOMED)	0	0	\N
214	Surgical approach of (SNOMED)	0	0	\N
215	Device used by (SNOMED)	0	0	\N
216	Energy used by (SNOMED)	0	0	\N
217	Substance used by (SNOMED)	0	0	\N
218	Access device used by (SNOMED)	0	0	\N
219	Has clinical course of (SNOMED)	0	0	\N
220	Route of administration of (SNOMED)	0	0	\N
221	Finding method of (SNOMED)	0	0	\N
222	Finding informer of (SNOMED)	0	0	\N
223	SNOMED category to ICD9CM (OMOP)	0	0	\N
224	SNOMED to ICD9CM equivalent (OMOP)	0	0	\N
225	SNOMED category to ICD9 procedure (OMOP)	0	0	\N
226	SNOMED to ICD9 procedure equivalent (OMOP)	0	1	\N
227	SNOMED category to CPT-4 (OMOP)	0	1	\N
228	SNOMED to CPT-4 equivalent (OMOP)	0	1	\N
229	Obsolete	0	0	\N
230	Obsolete	0	0	\N
231	Obsolete	0	0	\N
232	Obsolete	0	0	\N
233	Obsolete	0	0	\N
234	Obsolete	0	0	\N
235	Obsolete	0	0	\N
236	Obsolete	0	0	\N
237	Obsolete	0	0	\N
238	Obsolete	0	0	\N
239	SNOMED to MedDRA equivalent (OMOP)	0	0	\N
240	Is FDA-approved indication of (FDB)	0	1	\N
241	Is off-label indication of (FDB)	0	1	\N
242	Obsolete	0	0	\N
243	Is contra-indication of (FDB)	0	0	\N
244	RxNorm to ETC (FDB)	0	0	\N
245	RxNorm to ATC (FDB)	0	0	\N
246	MedDRA contained in SMQ (MedDRA)	0	0	\N
270	Reverse of 269 Clinical Drug'~ 'Branded Drug'~ 'Clinical Pack'~ 'Branded Pack' -->'Ingredient' 	0	0	\N
276	Therapeutic class of (NDF)	0	0	\N
278	Is involved in drug-drug interaction (NDF)	0	0	\N
280	Pharmaceutical preparation contained in (NDF)	0	1	\N
309	Concept replaced by (RxNorm)	0	0	310
310	Concept replaces (RxNorm)	0	0	\N
311	Concept replaced by (SNOMED)	0	0	312
312	Concept replaces (SNOMED)	0	0	\N
313	Concept replaced by (ICD-9-Procedure)	0	0	314
314	Concept replaces (ICD-9-Procedure)	0	0	\N
345	Concept replaced by (UCUM)	0	0	346
346	Concept replaces (UCUM)	0	0	\N
133	Obsolete	0	0	\N
315	Has ingredient (Multilex)	0	1	316
316	Ingredient of (Multilex)	0	0	\N
317	RxNorm to Multilex equivalent (OMOP)	0	1	318
318	Multilex to RxNorm equivalent (OMOP)	0	0	\N
321	Non-standard to Standard (OMOP)	0	0	322
322	Standard to Non-standard (OMOP)	0	0	\N
323	ICD-9-CM to SNOMED-CT (UMLS)	0	0	324
324	SNOMED-CT to ICD-9-CM (UMLS)	0	0	\N
325	ICD-9-CM to SNOMED-CT include child (OMOP)	0	0	326
326	SNOMED-CT to ICD-9-CM include child (OMOP)	0	0	\N
327	ICD-9-CM to SNOMED-CT exclude child (OMOP)	0	0	328
328	SNOMED-CT to ICD-9-CM exclude child (OMOP)	0	0	\N
329	ICD-9-CM to FDB Indication/Contraindication	0	0	330
330	FDB Indication/Contraindication to ICD-9-CM	0	0	\N
331	OXMIS to SNOMED-CT	0	0	332
332	SNOMED-CT to OXMIS	0	0	\N
333	CPT-4 to RxNorm	0	0	334
334	RxNorm to CPT-4	0	0	\N
342	Standard to Non-standard exclude child (OMOP)	0	0	\N
343	Non-standard to Standard draft (OMOP)	0	0	344
335	GPI to RxNorm	0	0	336
337	Multilex to RxNorm	0	0	338
336	RxNorm to GPI	0	0	\N
338	RxNorm to Multilex	0	0	\N
339	FDB Genseqno to RxNorm	0	0	340
340	RxNorm to FDB Genseqno	0	0	\N
341	Non-standard to Standard exclude child (OMOP)	0	0	342
344	Standard to Non-standard draft (OMOP)	0	0	\N
\.


--
-- Data for Name: serrano_apitoken; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY serrano_apitoken (id, user_id, token, revoked, created, modified) FROM stdin;
\.


--
-- Name: serrano_apitoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('serrano_apitoken_id_seq', 1, false);


--
-- Data for Name: source_to_concept_map; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY source_to_concept_map (source_to_concept_map_id, source_code, source_vocabulary_id, source_code_description, target_concept_id, target_vocabulary_id, mapping_type, primary_map, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
10	54738095016	9	Ribavirin 200 MG Oral Tablet	42553443	8	DRUG	Y	2008-02-01 00:00:00-05	2099-12-31 00:00:00-05	\N
11	185064401	9	Phentermine Hydrochloride 18.8 MG Oral Capsule	42553444	8	DRUG	Y	2009-01-05 00:00:00-05	2010-12-05 00:00:00-05	\N
12	185065430	9	Phentermine Hydrochloride 37.5 MG Oral Tablet	42553445	8	DRUG	Y	2009-01-05 00:00:00-05	2099-12-31 00:00:00-05	\N
13	51079030601	9	POLYETHYLENE GLYCOL 3350 142 MG/ML Oral Solution	42553446	8	DRUG	Y	2010-03-01 00:00:00-05	2099-12-31 00:00:00-05	\N
\.


--
-- Name: source_to_concept_map_source_to_concept_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('source_to_concept_map_source_to_concept_map_id_seq', 13, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	avocado	0001_initial	2014-08-15 17:04:17.856242-04
2	avocado	0002_auto__chg_field_dataview_name__chg_field_datafield_name__chg_field_dat	2014-08-15 17:04:18.089598-04
3	avocado	0003_auto__del_field_dataconcept_formatter__add_field_dataconcept_formatter	2014-08-15 17:04:18.132707-04
4	avocado	0004_rename_dataview_concepts_to_columns	2014-08-15 17:04:18.171684-04
5	avocado	0005_auto__add_field_datafield_internal__add_field_dataconcept_ident__add_f	2014-08-15 17:04:18.602414-04
6	avocado	0006_add_dataconcept_slugs	2014-08-15 17:04:18.642344-04
7	avocado	0007_auto__add_field_dataconcept_sortable	2014-08-15 17:04:18.850232-04
8	avocado	0008_auto__del_field_datafield_searchable	2014-08-15 17:04:18.904549-04
9	avocado	0009_auto__del_field_datafield_data_source	2014-08-15 17:04:18.93533-04
10	avocado	0010_auto__chg_field_datafield_field_name__chg_field_datafield_model_name__	2014-08-15 17:04:19.108803-04
11	avocado	0011_auto__add_field_dataview_template__add_field_dataview_default__add_fie	2014-08-15 17:04:19.658974-04
12	avocado	0012_auto__del_field_datacontext_composite	2014-08-15 17:04:19.710902-04
13	avocado	0013_auto__add_log	2014-08-15 17:04:19.94328-04
14	avocado	0014_auto__add_dataquery	2014-08-15 17:04:20.132792-04
15	avocado	0015_auto__add_field_dataconcept_queryable	2014-08-15 17:04:20.350381-04
16	avocado	0016_migrate_queryview_to_queryable	2014-08-15 17:04:20.404936-04
17	avocado	0017_auto__del_field_dataconcept_queryview	2014-08-15 17:04:20.454623-04
18	avocado	0018_auto__del_field_datafield_data_modified__add_field_datafield_data_vers	2014-08-15 17:04:20.685952-04
19	avocado	0019_auto__add_field_dataview_accessed__add_field_dataquery_accessed__add_f	2014-08-15 17:04:21.120622-04
20	avocado	0020_initialize_accessed_times	2014-08-15 17:04:21.177198-04
21	avocado	0021_auto	2014-08-15 17:04:21.419267-04
22	avocado	0022_auto__add_field_dataconcept_viewable	2014-08-15 17:04:21.680775-04
23	avocado	0023_set_viewable_from_formatter_name	2014-08-15 17:04:21.725623-04
24	avocado	0024_auto__add_revision	2014-08-15 17:04:21.987179-04
25	avocado	0025_auto__add_field_dataquery_distinct_count__add_field_dataquery_record_c	2014-08-15 17:04:22.087596-04
26	avocado	0026_auto__add_field_revision_changes	2014-08-15 17:04:22.135172-04
27	avocado	0027_auto__del_field_dataview_archived__del_field_dataview_published__del_f	2014-08-15 17:04:22.183302-04
28	avocado	0028_auto__del_field_dataview_count	2014-08-15 17:04:22.225887-04
29	avocado	0029_auto__add_field_dataview_parent__add_field_dataquery_parent__add_field	2014-08-15 17:04:22.387826-04
30	avocado	0030_auto__add_field_dataquery_public	2014-08-15 17:04:22.616637-04
31	avocado	0031_auto__add_field_dataquery_tree__add_field_datacontext_tree	2014-08-15 17:04:22.670458-04
32	avocado	0032_auto__add_field_datafield_label_field_name__add_field_datafield_search	2014-08-15 17:04:22.726171-04
33	avocado	0033_auto__add_field_dataconcept_type	2014-08-15 17:04:22.778302-04
34	avocado	0034_auto__add_field_datafield_type	2014-08-15 17:04:22.826266-04
35	omop_harvest	0001_avocado_metadata_migration	2014-08-15 17:04:26.507492-04
36	serrano	0001_initial	2014-08-15 17:04:26.774164-04
37	registration	0001_initial	2014-08-15 17:04:27.023683-04
38	registration	0002_auto__add_field_registrationprofile_verified	2014-08-15 17:04:27.149112-04
39	registration	0003_auto__add_field_registrationprofile_activated__add_field_registrationp	2014-08-15 17:04:27.483634-04
40	registration	0004_migrate_activated_flag	2014-08-15 17:04:27.529967-04
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sheperd
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 40, true);


--
-- Data for Name: visit_condition1; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY visit_condition1 (condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, condition_type_concept_id, stop_reason, associated_provider_id, visit_occurrence_id, condition_source_value) FROM stdin;
\.


--
-- Data for Name: visit_occurrence; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY visit_occurrence (visit_occurrence_id, person_id, visit_start_date, visit_end_date, place_of_service_concept_id, care_site_id, place_of_service_source_value) FROM stdin;
\.


--
-- Data for Name: vocabulary; Type: TABLE DATA; Schema: public; Owner: sheperd
--

COPY vocabulary (vocabulary_id, vocabulary_name) FROM stdin;
0	IMEDS Vocabulary v4.4 2014-04-11|
1	SNOMED-CT|
2	ICD-9-CM|
3	ICD-9-Procedure|
5	HCPCS|
6	LOINC|
7	NDF-RT|
8	RxNorm|
9	NDC|
10	GPI|
11	UCUM|
12	HL7 Administrative Sex|
13	CDC Race|
14	CMS Place of Service|
16	Multum|
17	Read|
18	OXMIS|
21	WHO ATC|
24	IMEDS Visit|
28	VA Product|
32	VA Class|
33	Cohort|
34	ICD-10-CM|
35	ICD-10-PCS|
36	IMEDS Drug Exposure Type|
37	IMEDS Condition Occurrence Type|
38	IMEDS Procedure Occurrence Type|
39	IMEDS Observation Type|
40	DRG|
41	MDC|
42	APC|
43	Revenue Code|
44	Ethnicity|
45	IMEDS Death Type|
46	NLM Mesh|
47	NUCC|
48	CMS Specialty|
49	LOINC Multidimensional Classification|
50	FDA SPL|
53	FDB Genseqno|
54	CCS|
55	OPCS-4|
56	Gemscript|
57	HES Specialty|
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: avocado_datacategory_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_datacategory
    ADD CONSTRAINT avocado_datacategory_pkey PRIMARY KEY (id);


--
-- Name: avocado_dataconcept_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_dataconcept
    ADD CONSTRAINT avocado_dataconcept_pkey PRIMARY KEY (id);


--
-- Name: avocado_dataconcept_sites_dataconcept_id_69a30a01cf955cf6_uniq; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_dataconcept_sites
    ADD CONSTRAINT avocado_dataconcept_sites_dataconcept_id_69a30a01cf955cf6_uniq UNIQUE (dataconcept_id, site_id);


--
-- Name: avocado_dataconcept_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_dataconcept_sites
    ADD CONSTRAINT avocado_dataconcept_sites_pkey PRIMARY KEY (id);


--
-- Name: avocado_dataconceptfield_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_dataconceptfield
    ADD CONSTRAINT avocado_dataconceptfield_pkey PRIMARY KEY (id);


--
-- Name: avocado_datacontext_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_datacontext
    ADD CONSTRAINT avocado_datacontext_pkey PRIMARY KEY (id);


--
-- Name: avocado_datafield_app_name_764dce1fb5413394_uniq; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_datafield
    ADD CONSTRAINT avocado_datafield_app_name_764dce1fb5413394_uniq UNIQUE (app_name, model_name, field_name);


--
-- Name: avocado_datafield_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_datafield
    ADD CONSTRAINT avocado_datafield_pkey PRIMARY KEY (id);


--
-- Name: avocado_datafield_sites_datafield_id_32222c6012370eca_uniq; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_datafield_sites
    ADD CONSTRAINT avocado_datafield_sites_datafield_id_32222c6012370eca_uniq UNIQUE (datafield_id, site_id);


--
-- Name: avocado_datafield_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_datafield_sites
    ADD CONSTRAINT avocado_datafield_sites_pkey PRIMARY KEY (id);


--
-- Name: avocado_dataquery_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_dataquery
    ADD CONSTRAINT avocado_dataquery_pkey PRIMARY KEY (id);


--
-- Name: avocado_dataquery_shared_use_dataquery_id_3264124606690391_uniq; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_dataquery_shared_users
    ADD CONSTRAINT avocado_dataquery_shared_use_dataquery_id_3264124606690391_uniq UNIQUE (dataquery_id, user_id);


--
-- Name: avocado_dataquery_shared_users_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_dataquery_shared_users
    ADD CONSTRAINT avocado_dataquery_shared_users_pkey PRIMARY KEY (id);


--
-- Name: avocado_dataview_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_dataview
    ADD CONSTRAINT avocado_dataview_pkey PRIMARY KEY (id);


--
-- Name: avocado_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_log
    ADD CONSTRAINT avocado_log_pkey PRIMARY KEY (id);


--
-- Name: avocado_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY avocado_revision
    ADD CONSTRAINT avocado_revision_pkey PRIMARY KEY (id);


--
-- Name: care_site_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY care_site
    ADD CONSTRAINT care_site_pkey PRIMARY KEY (care_site_id);


--
-- Name: cohort_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY cohort
    ADD CONSTRAINT cohort_pkey PRIMARY KEY (cohort_id);


--
-- Name: concept_ancestor_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY concept_ancestor
    ADD CONSTRAINT concept_ancestor_pkey PRIMARY KEY (ancestry_id);


--
-- Name: concept_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY concept
    ADD CONSTRAINT concept_pkey PRIMARY KEY (concept_id);


--
-- Name: concept_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY concept_relationship
    ADD CONSTRAINT concept_relationship_pkey PRIMARY KEY (concept_relationship_id);


--
-- Name: concept_synonym_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY concept_synonym
    ADD CONSTRAINT concept_synonym_pkey PRIMARY KEY (concept_synonym_id);


--
-- Name: condition_occurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY condition_occurrence
    ADD CONSTRAINT condition_occurrence_pkey PRIMARY KEY (condition_occurrence_id);


--
-- Name: death_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY death
    ADD CONSTRAINT death_pkey PRIMARY KEY (person_death_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: drug_approval_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY drug_approval
    ADD CONSTRAINT drug_approval_pkey PRIMARY KEY (ingredient_concept_id);


--
-- Name: drug_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY drug_cost
    ADD CONSTRAINT drug_cost_pkey PRIMARY KEY (drug_cost_id);


--
-- Name: drug_era_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY drug_era
    ADD CONSTRAINT drug_era_pkey PRIMARY KEY (drug_era_id);


--
-- Name: drug_exposure_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY drug_exposure
    ADD CONSTRAINT drug_exposure_pkey PRIMARY KEY (drug_exposure_id);


--
-- Name: drug_strength_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY drug_strength
    ADD CONSTRAINT drug_strength_pkey PRIMARY KEY (drug_strength_id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: observation_period_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY observation_period
    ADD CONSTRAINT observation_period_pkey PRIMARY KEY (observation_period_id);


--
-- Name: observation_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


--
-- Name: organization_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (organization_id);


--
-- Name: payer_plan_period_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY payer_plan_period
    ADD CONSTRAINT payer_plan_period_pkey PRIMARY KEY (payer_plan_period_id);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- Name: procedure_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY procedure_cost
    ADD CONSTRAINT procedure_cost_pkey PRIMARY KEY (procedure_cost_id);


--
-- Name: procedure_occurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY procedure_occurrence
    ADD CONSTRAINT procedure_occurrence_pkey PRIMARY KEY (procedure_occurrence_id);


--
-- Name: provider_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (provider_id);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY (relationship_id);


--
-- Name: serrano_apitoken_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY serrano_apitoken
    ADD CONSTRAINT serrano_apitoken_pkey PRIMARY KEY (id);


--
-- Name: source_to_concept_map_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY source_to_concept_map
    ADD CONSTRAINT source_to_concept_map_pkey PRIMARY KEY (source_to_concept_map_id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: unique_vocabulary_name; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY vocabulary
    ADD CONSTRAINT unique_vocabulary_name UNIQUE (vocabulary_name);


--
-- Name: visit_occurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY visit_occurrence
    ADD CONSTRAINT visit_occurrence_pkey PRIMARY KEY (visit_occurrence_id);


--
-- Name: vocabulary_pkey; Type: CONSTRAINT; Schema: public; Owner: sheperd; Tablespace: 
--

ALTER TABLE ONLY vocabulary
    ADD CONSTRAINT vocabulary_pkey PRIMARY KEY (vocabulary_id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: avocado_datacategory_parent_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_datacategory_parent_id ON avocado_datacategory USING btree (parent_id);


--
-- Name: avocado_dataconcept_category_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataconcept_category_id ON avocado_dataconcept USING btree (category_id);


--
-- Name: avocado_dataconcept_group_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataconcept_group_id ON avocado_dataconcept USING btree (group_id);


--
-- Name: avocado_dataconcept_sites_dataconcept_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataconcept_sites_dataconcept_id ON avocado_dataconcept_sites USING btree (dataconcept_id);


--
-- Name: avocado_dataconcept_sites_site_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataconcept_sites_site_id ON avocado_dataconcept_sites USING btree (site_id);


--
-- Name: avocado_dataconceptfield_concept_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataconceptfield_concept_id ON avocado_dataconceptfield USING btree (concept_id);


--
-- Name: avocado_dataconceptfield_field_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataconceptfield_field_id ON avocado_dataconceptfield USING btree (field_id);


--
-- Name: avocado_datacontext_parent_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_datacontext_parent_id ON avocado_datacontext USING btree (parent_id);


--
-- Name: avocado_datacontext_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_datacontext_user_id ON avocado_datacontext USING btree (user_id);


--
-- Name: avocado_datafield_category_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_datafield_category_id ON avocado_datafield USING btree (category_id);


--
-- Name: avocado_datafield_group_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_datafield_group_id ON avocado_datafield USING btree (group_id);


--
-- Name: avocado_datafield_sites_datafield_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_datafield_sites_datafield_id ON avocado_datafield_sites USING btree (datafield_id);


--
-- Name: avocado_datafield_sites_site_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_datafield_sites_site_id ON avocado_datafield_sites USING btree (site_id);


--
-- Name: avocado_dataquery_parent_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataquery_parent_id ON avocado_dataquery USING btree (parent_id);


--
-- Name: avocado_dataquery_shared_users_dataquery_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataquery_shared_users_dataquery_id ON avocado_dataquery_shared_users USING btree (dataquery_id);


--
-- Name: avocado_dataquery_shared_users_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataquery_shared_users_user_id ON avocado_dataquery_shared_users USING btree (user_id);


--
-- Name: avocado_dataquery_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataquery_user_id ON avocado_dataquery USING btree (user_id);


--
-- Name: avocado_dataview_parent_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataview_parent_id ON avocado_dataview USING btree (parent_id);


--
-- Name: avocado_dataview_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_dataview_user_id ON avocado_dataview USING btree (user_id);


--
-- Name: avocado_log_content_type_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_log_content_type_id ON avocado_log USING btree (content_type_id);


--
-- Name: avocado_log_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_log_user_id ON avocado_log USING btree (user_id);


--
-- Name: avocado_revision_content_type_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_revision_content_type_id ON avocado_revision USING btree (content_type_id);


--
-- Name: avocado_revision_object_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_revision_object_id ON avocado_revision USING btree (object_id);


--
-- Name: avocado_revision_timestamp; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_revision_timestamp ON avocado_revision USING btree ("timestamp");


--
-- Name: avocado_revision_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX avocado_revision_user_id ON avocado_revision USING btree (user_id);


--
-- Name: concept_ancestor_idx; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE UNIQUE INDEX concept_ancestor_idx ON concept_ancestor USING btree (ancestor_concept_id, descendant_concept_id);


--
-- Name: concept_relationship_idx; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE UNIQUE INDEX concept_relationship_idx ON concept_relationship USING btree (concept_id_1, concept_id_2, relationship_id);


--
-- Name: death_type_person_idx; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE UNIQUE INDEX death_type_person_idx ON death USING btree (person_id, death_type_concept_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: observation_period_person; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE UNIQUE INDEX observation_period_person ON observation_period USING btree (person_id, observation_period_start_date);


--
-- Name: observation_person_idx; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX observation_person_idx ON observation USING btree (person_id, observation_concept_id);


--
-- Name: organization_oraganization_pos; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX organization_oraganization_pos ON organization USING btree (organization_source_value, place_of_service_source_value);


--
-- Name: registration_registrationprofile_moderator_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX registration_registrationprofile_moderator_id ON registration_registrationprofile USING btree (moderator_id);


--
-- Name: serrano_apitoken_user_id; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX serrano_apitoken_user_id ON serrano_apitoken USING btree (user_id);


--
-- Name: source_to_concept_map_idx; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE UNIQUE INDEX source_to_concept_map_idx ON source_to_concept_map USING btree (source_vocabulary_id, target_concept_id, source_code, valid_end_date);


--
-- Name: source_to_concept_source_idx; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX source_to_concept_source_idx ON source_to_concept_map USING btree (source_code);


--
-- Name: visit_occurrence_person_date; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX visit_occurrence_person_date ON visit_occurrence USING btree (person_id, visit_start_date);


--
-- Name: visit_occurrence_peson_date; Type: INDEX; Schema: public; Owner: sheperd; Tablespace: 
--

CREATE INDEX visit_occurrence_peson_date ON visit_occurrence USING btree (person_id, visit_start_date);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: care_site_location_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY care_site
    ADD CONSTRAINT care_site_location_fk FOREIGN KEY (location_id) REFERENCES location(location_id);


--
-- Name: care_site_organization_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY care_site
    ADD CONSTRAINT care_site_organization_fk FOREIGN KEY (organization_id) REFERENCES organization(organization_id);


--
-- Name: category_id_refs_id_7f38f9a1; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datafield
    ADD CONSTRAINT category_id_refs_id_7f38f9a1 FOREIGN KEY (category_id) REFERENCES avocado_datacategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_id_refs_id_e90f8ec1; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconcept
    ADD CONSTRAINT category_id_refs_id_e90f8ec1 FOREIGN KEY (category_id) REFERENCES avocado_datacategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: concept_ancestor_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept_ancestor
    ADD CONSTRAINT concept_ancestor_fk FOREIGN KEY (ancestor_concept_id) REFERENCES concept(concept_id);


--
-- Name: concept_descendant_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept_ancestor
    ADD CONSTRAINT concept_descendant_fk FOREIGN KEY (descendant_concept_id) REFERENCES concept(concept_id);


--
-- Name: concept_id_refs_id_b2f080ef; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconceptfield
    ADD CONSTRAINT concept_id_refs_id_b2f080ef FOREIGN KEY (concept_id) REFERENCES avocado_dataconcept(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: concept_rel_child_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept_relationship
    ADD CONSTRAINT concept_rel_child_fk FOREIGN KEY (concept_id_2) REFERENCES concept(concept_id);


--
-- Name: concept_rel_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept_relationship
    ADD CONSTRAINT concept_rel_parent_fk FOREIGN KEY (concept_id_1) REFERENCES concept(concept_id);


--
-- Name: concept_rel_rel_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept_relationship
    ADD CONSTRAINT concept_rel_rel_type_fk FOREIGN KEY (relationship_id) REFERENCES relationship(relationship_id);


--
-- Name: concept_synonym_concept_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept_synonym
    ADD CONSTRAINT concept_synonym_concept_fk FOREIGN KEY (concept_id) REFERENCES concept(concept_id);


--
-- Name: concept_vocabulary_ref_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY concept
    ADD CONSTRAINT concept_vocabulary_ref_fk FOREIGN KEY (vocabulary_id) REFERENCES vocabulary(vocabulary_id);


--
-- Name: condition_era_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY condition_era
    ADD CONSTRAINT condition_era_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: condition_occurrence_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY condition_occurrence
    ADD CONSTRAINT condition_occurrence_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: condition_provider_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY condition_occurrence
    ADD CONSTRAINT condition_provider_fk FOREIGN KEY (associated_provider_id) REFERENCES provider(provider_id);


--
-- Name: condition_visit_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY condition_occurrence
    ADD CONSTRAINT condition_visit_fk FOREIGN KEY (visit_occurrence_id) REFERENCES visit_occurrence(visit_occurrence_id);


--
-- Name: content_type_id_refs_id_273311db; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_revision
    ADD CONSTRAINT content_type_id_refs_id_273311db FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_4331a805; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_log
    ADD CONSTRAINT content_type_id_refs_id_4331a805 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataconcept_id_refs_id_3b4b105f; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconcept_sites
    ADD CONSTRAINT dataconcept_id_refs_id_3b4b105f FOREIGN KEY (dataconcept_id) REFERENCES avocado_dataconcept(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: datafield_id_refs_id_17f31944; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datafield_sites
    ADD CONSTRAINT datafield_id_refs_id_17f31944 FOREIGN KEY (datafield_id) REFERENCES avocado_datafield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dataquery_id_refs_id_38ee987f; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataquery_shared_users
    ADD CONSTRAINT dataquery_id_refs_id_38ee987f FOREIGN KEY (dataquery_id) REFERENCES avocado_dataquery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: death_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY death
    ADD CONSTRAINT death_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: drug_cost_drug_exposure_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY drug_cost
    ADD CONSTRAINT drug_cost_drug_exposure_fk FOREIGN KEY (drug_exposure_id) REFERENCES drug_exposure(drug_exposure_id);


--
-- Name: drug_cost_payer_plan_period_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY drug_cost
    ADD CONSTRAINT drug_cost_payer_plan_period_fk FOREIGN KEY (payer_plan_period_id) REFERENCES payer_plan_period(payer_plan_period_id);


--
-- Name: drug_era_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY drug_era
    ADD CONSTRAINT drug_era_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: drug_exposure_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY drug_exposure
    ADD CONSTRAINT drug_exposure_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: drug_exposure_provider_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY drug_exposure
    ADD CONSTRAINT drug_exposure_provider_fk FOREIGN KEY (prescribing_provider_id) REFERENCES provider(provider_id);


--
-- Name: drug_visit_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY drug_exposure
    ADD CONSTRAINT drug_visit_fk FOREIGN KEY (visit_occurrence_id) REFERENCES visit_occurrence(visit_occurrence_id);


--
-- Name: field_id_refs_id_8197bbb0; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconceptfield
    ADD CONSTRAINT field_id_refs_id_8197bbb0 FOREIGN KEY (field_id) REFERENCES avocado_datafield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_4ff7235e; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconcept
    ADD CONSTRAINT group_id_refs_id_4ff7235e FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_d60cce2a; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datafield
    ADD CONSTRAINT group_id_refs_id_d60cce2a FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: moderator_id_refs_id_954d2985; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT moderator_id_refs_id_954d2985 FOREIGN KEY (moderator_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: observation_period_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY observation_period
    ADD CONSTRAINT observation_period_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: observation_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: observation_provider_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_provider_fk FOREIGN KEY (associated_provider_id) REFERENCES provider(provider_id);


--
-- Name: observation_visit_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_visit_fk FOREIGN KEY (visit_occurrence_id) REFERENCES visit_occurrence(visit_occurrence_id);


--
-- Name: organization_location_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY organization
    ADD CONSTRAINT organization_location_fk FOREIGN KEY (location_id) REFERENCES location(location_id);


--
-- Name: parent_id_refs_id_7b0232da; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datacategory
    ADD CONSTRAINT parent_id_refs_id_7b0232da FOREIGN KEY (parent_id) REFERENCES avocado_datacategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_893c5c6d; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datacontext
    ADD CONSTRAINT parent_id_refs_id_893c5c6d FOREIGN KEY (parent_id) REFERENCES avocado_datacontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_acb2f02b; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataview
    ADD CONSTRAINT parent_id_refs_id_acb2f02b FOREIGN KEY (parent_id) REFERENCES avocado_dataview(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_ff006c48; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataquery
    ADD CONSTRAINT parent_id_refs_id_ff006c48 FOREIGN KEY (parent_id) REFERENCES avocado_dataquery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payer_plan_period_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY payer_plan_period
    ADD CONSTRAINT payer_plan_period_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: person_care_site_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_care_site_fk FOREIGN KEY (care_site_id) REFERENCES care_site(care_site_id);


--
-- Name: person_location_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_location_fk FOREIGN KEY (location_id) REFERENCES location(location_id);


--
-- Name: person_provider_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_provider_fk FOREIGN KEY (provider_id) REFERENCES provider(provider_id);


--
-- Name: procedure_cost_payer_plan_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY procedure_cost
    ADD CONSTRAINT procedure_cost_payer_plan_fk FOREIGN KEY (payer_plan_period_id) REFERENCES payer_plan_period(payer_plan_period_id);


--
-- Name: procedure_cost_procedure_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY procedure_cost
    ADD CONSTRAINT procedure_cost_procedure_fk FOREIGN KEY (procedure_occurrence_id) REFERENCES procedure_occurrence(procedure_occurrence_id);


--
-- Name: procedure_occurrence_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY procedure_occurrence
    ADD CONSTRAINT procedure_occurrence_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: procedure_provider_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY procedure_occurrence
    ADD CONSTRAINT procedure_provider_fk FOREIGN KEY (associated_provider_id) REFERENCES provider(provider_id);


--
-- Name: procedure_visit_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY procedure_occurrence
    ADD CONSTRAINT procedure_visit_fk FOREIGN KEY (visit_occurrence_id) REFERENCES visit_occurrence(visit_occurrence_id);


--
-- Name: provider_care_site_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY provider
    ADD CONSTRAINT provider_care_site_fk FOREIGN KEY (care_site_id) REFERENCES care_site(care_site_id);


--
-- Name: site_id_refs_id_15a75858; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataconcept_sites
    ADD CONSTRAINT site_id_refs_id_15a75858 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_550bdd67; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datafield_sites
    ADD CONSTRAINT site_id_refs_id_550bdd67 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: source_to_concept_concept; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY source_to_concept_map
    ADD CONSTRAINT source_to_concept_concept FOREIGN KEY (target_concept_id) REFERENCES concept(concept_id);


--
-- Name: source_to_concept_source_vocab; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY source_to_concept_map
    ADD CONSTRAINT source_to_concept_source_vocab FOREIGN KEY (source_vocabulary_id) REFERENCES vocabulary(vocabulary_id);


--
-- Name: source_to_concept_target_vocab; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY source_to_concept_map
    ADD CONSTRAINT source_to_concept_target_vocab FOREIGN KEY (target_vocabulary_id) REFERENCES vocabulary(vocabulary_id);


--
-- Name: user_id_refs_id_06c6cf6f; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY serrano_apitoken
    ADD CONSTRAINT user_id_refs_id_06c6cf6f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_1ca4465a; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataquery
    ADD CONSTRAINT user_id_refs_id_1ca4465a FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_261f6b4b; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_revision
    ADD CONSTRAINT user_id_refs_id_261f6b4b FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_29e2db40; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataview
    ADD CONSTRAINT user_id_refs_id_29e2db40 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_71f2ecc4; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_datacontext
    ADD CONSTRAINT user_id_refs_id_71f2ecc4 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_951fcd15; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_log
    ADD CONSTRAINT user_id_refs_id_951fcd15 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_954d2985; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT user_id_refs_id_954d2985 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_9d08ee3d; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY avocado_dataquery_shared_users
    ADD CONSTRAINT user_id_refs_id_9d08ee3d FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: visit_occurrence_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: sheperd
--

ALTER TABLE ONLY visit_occurrence
    ADD CONSTRAINT visit_occurrence_person_fk FOREIGN KEY (person_id) REFERENCES person(person_id);


--
-- Name: visit_condition; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: sheperd
--

REFRESH MATERIALIZED VIEW visit_condition;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

