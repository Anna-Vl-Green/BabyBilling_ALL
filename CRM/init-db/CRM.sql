PGDMP      $                |            CRM    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32957    CRM    DATABASE     y   CREATE DATABASE "CRM" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "CRM";
                pg_database_owner    false            �           0    0    DATABASE "CRM"    COMMENT     �   COMMENT ON DATABASE "CRM" IS 'База данных микросервиса CRM, в которой содержатся данные для аутентификации пользователя с ролью “Менеджер”.';
                   pg_database_owner    false    4823                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    32970    managers    TABLE     �   CREATE TABLE public.managers (
    id smallint NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(64) NOT NULL
);
    DROP TABLE public.managers;
       public         heap    pg_database_owner    false    5            �           0    0    TABLE managers    COMMENT     �   COMMENT ON TABLE public.managers IS 'База данных микросервиса CRM, в которой содержатся данные для аутентификации пользователя с ролью “Менеджер”.';
          public          pg_database_owner    false    216            �           0    0    COLUMN managers.id    COMMENT     Y   COMMENT ON COLUMN public.managers.id IS 'Идентификатор менеджера';
          public          pg_database_owner    false    216            �           0    0    COLUMN managers.username    COMMENT     O   COMMENT ON COLUMN public.managers.username IS 'Логин менеджера';
          public          pg_database_owner    false    216            �           0    0    COLUMN managers.password    COMMENT     �   COMMENT ON COLUMN public.managers.password IS 'Пароль менеджера (хранится в зашифрованном виде) ';
          public          pg_database_owner    false    216            �          0    32970    managers 
   TABLE DATA           :   COPY public.managers (id, username, password) FROM stdin;
    public          pg_database_owner    false    216          ?           2606    32974    managers CRM_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.managers
    ADD CONSTRAINT "CRM_pkey" PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.managers DROP CONSTRAINT "CRM_pkey";
       public            pg_database_owner    false    216            A           2606    32976    managers username 
   CONSTRAINT     P   ALTER TABLE ONLY public.managers
    ADD CONSTRAINT username UNIQUE (username);
 ;   ALTER TABLE ONLY public.managers DROP CONSTRAINT username;
       public            pg_database_owner    false    216            �   K   x�3��M�KLO-2��3��H	r�7/�2�Iq�Y�y{�Ed��s�$�9Ê��ˍ"
�C+ӹb���� ���     