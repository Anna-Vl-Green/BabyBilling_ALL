PGDMP  -    #                |            BRT    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32960    BRT    DATABASE     y   CREATE DATABASE "BRT" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "BRT";
                postgres    false            �           0    0    DATABASE "BRT"    COMMENT     �   COMMENT ON DATABASE "BRT" IS 'Содержит информацию об абонентах оператора “Ромашка”. ';
                   postgres    false    4789                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    33011    subscribers    TABLE     �  CREATE TABLE public.subscribers (
    id integer NOT NULL,
    msisdn character(11) NOT NULL,
    balance numeric(9,1) NOT NULL,
    balance_minutes smallint,
    balance_sms smallint,
    balance_kilobytes integer,
    tariff_id smallint NOT NULL,
    CONSTRAINT subscribers_balance_kilobytes_check CHECK ((balance_kilobytes >= 0)),
    CONSTRAINT subscribers_balance_minutes_check CHECK ((balance_minutes >= 0)),
    CONSTRAINT subscribers_balance_sms_check CHECK ((balance_sms >= 0))
);
    DROP TABLE public.subscribers;
       public         heap    pg_database_owner    false    4            �           0    0    TABLE subscribers    COMMENT     �   COMMENT ON TABLE public.subscribers IS 'Содержит информацию об абонентах оператора “Ромашка”';
          public          pg_database_owner    false    215            �           0    0    COLUMN subscribers.id    COMMENT     Z   COMMENT ON COLUMN public.subscribers.id IS 'Идентификатор абонента';
          public          pg_database_owner    false    215            �           0    0    COLUMN subscribers.msisdn    COMMENT     _   COMMENT ON COLUMN public.subscribers.msisdn IS 'Номер телефона абонента';
          public          pg_database_owner    false    215            �           0    0    COLUMN subscribers.balance    COMMENT     i   COMMENT ON COLUMN public.subscribers.balance IS 'Текущий баланс абонента (у.е.)';
          public          pg_database_owner    false    215            �           0    0 "   COLUMN subscribers.balance_minutes    COMMENT     e   COMMENT ON COLUMN public.subscribers.balance_minutes IS 'Остаток минут на счёте';
          public          pg_database_owner    false    215            �           0    0    COLUMN subscribers.balance_sms    COMMENT     ]   COMMENT ON COLUMN public.subscribers.balance_sms IS 'Остаток СМС на счёте';
          public          pg_database_owner    false    215            �           0    0 $   COLUMN subscribers.balance_kilobytes    COMMENT     m   COMMENT ON COLUMN public.subscribers.balance_kilobytes IS 'Остаток килобайт на счёте';
          public          pg_database_owner    false    215            �           0    0    COLUMN subscribers.tariff_id    COMMENT     ]   COMMENT ON COLUMN public.subscribers.tariff_id IS 'Идентификатор тарифа';
          public          pg_database_owner    false    215            �          0    33011    subscribers 
   TABLE DATA           v   COPY public.subscribers (id, msisdn, balance, balance_minutes, balance_sms, balance_kilobytes, tariff_id) FROM stdin;
    public          pg_database_owner    false    215   G                  2606    33020 "   subscribers subscribers_msisdn_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_msisdn_key UNIQUE (msisdn);
 L   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_msisdn_key;
       public            pg_database_owner    false    215                       2606    33018    subscribers subscribers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_pkey;
       public            pg_database_owner    false    215            �   X   x�e�� !Dѳc E�����Mf<���2&���l�f�]������]��.:Yр{?^���tC7{�xX�&4Y�Uy�������aq/�     