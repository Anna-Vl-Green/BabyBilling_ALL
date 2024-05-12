PGDMP  
    $                |            CDRg    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32959    CDRg    DATABASE     z   CREATE DATABASE "CDRg" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "CDRg";
                pg_database_owner    false            �           0    0    DATABASE "CDRg"    COMMENT     �   COMMENT ON DATABASE "CDRg" IS 'База данных сервиса “Генератор CDR”, содержащая информацию об абонентах и их звонках, генерируемых самим сервисом.';
                   pg_database_owner    false    4798            �            1259    33055    calls    TABLE     X  CREATE TABLE public.calls (
    id bigint NOT NULL,
    subscriber_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    contacted_subscriber_id integer NOT NULL,
    type integer NOT NULL,
    CONSTRAINT "calls.end_time" CHECK ((end_time >= start_time)) NO INHERIT
);
    DROP TABLE public.calls;
       public         heap    pg_database_owner    false            �           0    0    TABLE calls    COMMENT     k   COMMENT ON TABLE public.calls IS 'Хранит информацию о звонках абонентов';
          public          pg_database_owner    false    216            �           0    0    COLUMN calls.id    COMMENT     P   COMMENT ON COLUMN public.calls.id IS 'Идентификатор вызова';
          public          pg_database_owner    false    216            �           0    0    COLUMN calls.subscriber_id    COMMENT     _   COMMENT ON COLUMN public.calls.subscriber_id IS 'Идентификатор абонента';
          public          pg_database_owner    false    216            �           0    0    COLUMN calls.start_time    COMMENT     a   COMMENT ON COLUMN public.calls.start_time IS 'Дата и время начала вызова';
          public          pg_database_owner    false    216            �           0    0    COLUMN calls.end_time    COMMENT     e   COMMENT ON COLUMN public.calls.end_time IS 'Дата и время окончания вызова';
          public          pg_database_owner    false    216            �           0    0 $   COLUMN calls.contacted_subscriber_id    COMMENT     �   COMMENT ON COLUMN public.calls.contacted_subscriber_id IS 'Идентификатор абонента, с которым совершался вызов';
          public          pg_database_owner    false    216            �           0    0 $   CONSTRAINT "calls.end_time" ON calls    COMMENT     {   COMMENT ON CONSTRAINT "calls.end_time" ON public.calls IS 'Проверка соответствия таймкодов.';
          public          pg_database_owner    false    216            �            1259    33061    calls_id_seq    SEQUENCE     �   ALTER TABLE public.calls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          pg_database_owner    false    216            �            1259    33021    subscribers    TABLE     h   CREATE TABLE public.subscribers (
    id integer NOT NULL,
    msisdn character varying(15) NOT NULL
);
    DROP TABLE public.subscribers;
       public         heap    pg_database_owner    false            �           0    0    TABLE subscribers    COMMENT     j   COMMENT ON TABLE public.subscribers IS 'Хранит номера телефонов абонентов';
          public          pg_database_owner    false    215            �           0    0    COLUMN subscribers.id    COMMENT     Z   COMMENT ON COLUMN public.subscribers.id IS 'Идентификатор абонента';
          public          pg_database_owner    false    215            �           0    0    COLUMN subscribers.msisdn    COMMENT     _   COMMENT ON COLUMN public.subscribers.msisdn IS 'Номер телефона абонента';
          public          pg_database_owner    false    215            �          0    33055    calls 
   TABLE DATA           g   COPY public.calls (id, subscriber_id, start_time, end_time, contacted_subscriber_id, type) FROM stdin;
    public          pg_database_owner    false    216   �       �          0    33021    subscribers 
   TABLE DATA           1   COPY public.subscribers (id, msisdn) FROM stdin;
    public          pg_database_owner    false    215          �           0    0    calls_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.calls_id_seq', 1180, true);
          public          pg_database_owner    false    217            $           2606    33060    calls calls_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.calls DROP CONSTRAINT calls_pkey;
       public            pg_database_owner    false    216                        2606    33027 "   subscribers subscribers_msisdn_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_msisdn_key UNIQUE (msisdn);
 L   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_msisdn_key;
       public            pg_database_owner    false    215            "           2606    33025    subscribers subscribers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_pkey;
       public            pg_database_owner    false    215            %           2606    33067    calls contacted_subscriber_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.calls
    ADD CONSTRAINT contacted_subscriber_id FOREIGN KEY (contacted_subscriber_id) REFERENCES public.subscribers(id) NOT VALID;
 G   ALTER TABLE ONLY public.calls DROP CONSTRAINT contacted_subscriber_id;
       public          pg_database_owner    false    215    4642    216            &           2606    33062    calls subscriber_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.calls
    ADD CONSTRAINT subscriber_id FOREIGN KEY (subscriber_id) REFERENCES public.subscribers(id) NOT VALID;
 =   ALTER TABLE ONLY public.calls DROP CONSTRAINT subscriber_id;
       public          pg_database_owner    false    4642    216    215            �      x������ � �      �   {   x�%��1C�sTLf��ؽ��:�J���8�O�{�tL�5�'���y�Og��=M2sX�b׸fU����w�,���]z��C3}E�Q��u8�qh���J*���aI�!�p��;�� ���5�     