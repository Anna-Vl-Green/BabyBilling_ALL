PGDMP  *    $                |            HRS    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32958    HRS    DATABASE     y   CREATE DATABASE "HRS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "HRS";
                pg_database_owner    false            �           0    0    DATABASE "HRS"    COMMENT     �   COMMENT ON DATABASE "HRS" IS 'Содержит информацию о тарифах оператора “Ромашка”.';
                   pg_database_owner    false    4786                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    32961    tariffs    TABLE     ~   CREATE TABLE public.tariffs (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    details jsonb NOT NULL
);
    DROP TABLE public.tariffs;
       public         heap    pg_database_owner    false    4            �           0    0    TABLE tariffs    COMMENT     �   COMMENT ON TABLE public.tariffs IS 'Содержит информацию о тарифах оператора “Ромашка”';
          public          pg_database_owner    false    215            �           0    0    COLUMN tariffs.id    COMMENT     R   COMMENT ON COLUMN public.tariffs.id IS 'Идентификатор тарифа';
          public          pg_database_owner    false    215            �           0    0    COLUMN tariffs.name    COMMENT     J   COMMENT ON COLUMN public.tariffs.name IS 'Название тарифа';
          public          pg_database_owner    false    215            �           0    0    COLUMN tariffs.details    COMMENT     �   COMMENT ON COLUMN public.tariffs.details IS 'JSON, содержащий детальную информацию о тарифе (количество предоставляемых минут, стоимость обслуживания и т.п.)';
          public          pg_database_owner    false    215            �          0    32961    tariffs 
   TABLE DATA           4   COPY public.tariffs (id, name, details) FROM stdin;
    public          pg_database_owner    false    215   Z                  2606    32967    tariffs HRS_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tariffs
    ADD CONSTRAINT "HRS_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tariffs DROP CONSTRAINT "HRS_pkey";
       public            pg_database_owner    false    215                       2606    32969    tariffs name 
   CONSTRAINT     G   ALTER TABLE ONLY public.tariffs
    ADD CONSTRAINT name UNIQUE (name);
 6   ALTER TABLE ONLY public.tariffs DROP CONSTRAINT name;
       public            pg_database_owner    false    215            �           0    0    CONSTRAINT name ON tariffs    COMMENT     Q   COMMENT ON CONSTRAINT name ON public.tariffs IS 'Название тарифа';
          public          pg_database_owner    false    4636            �   �   x�34�0���.6^l���®8���J*R���2��s3�ҝ�K�t��sJA�:
�U���&�V�_Z����H#=S��jT�eh�ya��}�\�
�@���{/v_؉���JKR�s�K�P,4EuWn~^IFN�[j*�5@kb���� �(k�     