ALTER TABLE IF EXISTS public.tb_pessoa_fisica
    ADD COLUMN tipo_pessoa character varying(255) COLLATE pg_catalog."default" NOT NULL;

ALTER TABLE IF EXISTS public.tb_pessoa_juridica
    ADD COLUMN tipo_pessoa character varying(255) COLLATE pg_catalog."default" NOT NULL;