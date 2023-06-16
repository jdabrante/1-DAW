-- Inserción de datos

select * from city;

-- +---------+----------------------------+------------+---------------------+
-- | city_id | city                       | country_id | last_update         |
-- +---------+----------------------------+------------+---------------------+
-- |       1 | A Coruña (La Coruña)       |         87 | 2006-02-15 04:45:25 |
-- |       2 | Abha                       |         82 | 2006-02-15 04:45:25 |
-- |       3 | Abu Dhabi                  |        101 | 2006-02-15 04:45:25 |
-- |       4 | Acuña                      |         60 | 2006-02-15 04:45:25 |
-- |       5 | Adana                      |         97 | 2006-02-15 04:45:25 |
-- |       6 | Addis Abeba                |         31 | 2006-02-15 04:45:25 |
-- |       7 | Aden                       |        107 | 2006-02-15 04:45:25 |
-- |       8 | Adoni                      |         44 | 2006-02-15 04:45:25 |
-- |       9 | Ahmadnagar                 |         44 | 2006-02-15 04:45:25 |
-- |      10 | Akishima                   |         50 | 2006-02-15 04:45:25 |


select count(*) from city;

-- +----------+
-- | count(*) |
-- +----------+
-- |      600 |
-- +----------+

select * from country;

-- +------------+---------------------------------------+---------------------+
-- | country_id | country                               | last_update         |
-- +------------+---------------------------------------+---------------------+
-- |          1 | Afghanistan                           | 2006-02-15 04:44:00 |
-- |          2 | Algeria                               | 2006-02-15 04:44:00 |
-- |          3 | American Samoa                        | 2006-02-15 04:44:00 |
-- |          4 | Angola                                | 2006-02-15 04:44:00 |
-- |          5 | Anguilla                              | 2006-02-15 04:44:00 |
-- |          6 | Argentina                             | 2006-02-15 04:44:00 |
-- |          7 | Armenia                               | 2006-02-15 04:44:00 |
-- |          8 | Australia                             | 2006-02-15 04:44:00 |
-- |          9 | Austria                               | 2006-02-15 04:44:00 |
-- |         10 | Azerbaijan                            | 2006-02-15 04:44:00 |

select count(*) from country;

-- +----------+
-- | count(*) |
-- +----------+
-- |      109 |
-- +----------+

mysql> select * from address;

-- +------------+---------------------------------+----------+------------+---------+-------------+--------------+------------------------------------------------------+---------------------+
-- | address_id | address                         | address2 | district   | city_id | postal_code | phone        | location                                             | last_update         |
-- +------------+---------------------------------+----------+------------+---------+-------------+--------------+------------------------------------------------------+---------------------+
-- |          1 | 47 MySakila Drive               | NULL     | Alberta    |     300 |             |              | 0x0000000001010000003E0A325D63345CC0761FDB8D99D94840 | 2014-09-25 22:30:27 |
-- |          2 | 28 MySQL Boulevard              | NULL     | QLD        |     576 |             |              | 0x0000000001010000008E10D4DF812463404EE08C5022A23BC0 | 2014-09-25 22:30:09 |
-- |          3 | 23 Workhaven Lane               | NULL     | Alberta    |     300 |             | 14033335568  | 0x000000000101000000CDC4196863345CC01DEE7E7099D94840 | 2014-09-25 22:30:27 |
-- |          4 | 1411 Lillydale Drive            | NULL     | QLD        |     576 |             | 6172235589   | 0x0000000001010000005B0DE4341F26634042D6AE6422A23BC0 | 2014-09-25 22:30:09 |
-- |          5 | 1913 Hanoi Way                  |          | Nagasaki   |     463 | 35200       | 28303384290  | 0x00000000010100000028D1370E21376040ABB58BC45F944040 | 2014-09-25 22:31:53 |
-- |          6 | 1121 Loja Avenue                |          | California |     449 | 17886       | 838635286649 | 0x0000000001010000003C94579D8B525DC0E860472DDE0D4140 | 2014-09-25 22:34:01 |
-- |          7 | 692 Joliet Street               |          | Attika     |      38 | 83579       | 448477190408 | 0x000000000101000000076F59CF5AB737404105D1A45EFD4240 | 2014-09-25 22:31:07 |
-- |          8 | 1566 Inegl Manor                |          | Mandalay   |     349 | 53561       | 705814003527 | 0x00000000010100000006240626DCD857403C45B357C4753540 | 2014-09-25 22:32:18 |
-- |          9 | 53 Idfu Parkway                 |          | Nantou     |     361 | 42399       | 10655648674  | 0x0000000001010000001F813FFC7C2A5E40357A354069EA3740 | 2014-09-25 22:33:16 |
-- |         10 | 1795 Santiago de Compostela Way |          | Texas      |     295 | 18743       | 860452626434 | 0x00000000010100000050502F9D7BE058C0D0CF7932A4813B40 | 2014-09-25 22:33:55 |

select count(*) from address;

-- +----------+
-- | count(*) |
-- +----------+
-- |      603 |
-- +----------+

select * from customer;

-- +-------------+----------+------------+-----------+-------------------------------------+------------+--------+---------------------+---------------------+
-- | customer_id | store_id | first_name | last_name | email                               | address_id | active | create_date         | last_update         |
-- +-------------+----------+------------+-----------+-------------------------------------+------------+--------+---------------------+---------------------+
-- |           1 |        1 | MARY       | SMITH     | MARY.SMITH@sakilacustomer.org       |          5 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |           2 |        1 | PATRICIA   | JOHNSON   | PATRICIA.JOHNSON@sakilacustomer.org |          6 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |           3 |        1 | LINDA      | WILLIAMS  | LINDA.WILLIAMS@sakilacustomer.org   |          7 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |           4 |        2 | BARBARA    | JONES     | BARBARA.JONES@sakilacustomer.org    |          8 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |           5 |        1 | ELIZABETH  | BROWN     | ELIZABETH.BROWN@sakilacustomer.org  |          9 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |           6 |        2 | JENNIFER   | DAVIS     | JENNIFER.DAVIS@sakilacustomer.org   |         10 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |           7 |        1 | MARIA      | MILLER    | MARIA.MILLER@sakilacustomer.org     |         11 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |           8 |        2 | SUSAN      | WILSON    | SUSAN.WILSON@sakilacustomer.org     |         12 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |           9 |        2 | MARGARET   | MOORE     | MARGARET.MOORE@sakilacustomer.org   |         13 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |
-- |          10 |        1 | DOROTHY    | TAYLOR    | DOROTHY.TAYLOR@sakilacustomer.org   |         14 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 |

select count(*) from customer;

-- +----------+
-- | count(*) |
-- +----------+
-- |      599 |
-- +----------+

select count(*) from staff;

-- +----------+
-- | count(*) |
-- +----------+
-- |        2 |

select * from payment;

-- +------------+-------------+----------+-----------+--------+---------------------+---------------------+
-- | payment_id | customer_id | staff_id | rental_id | amount | payment_date        | last_update         |
-- +------------+-------------+----------+-----------+--------+---------------------+---------------------+
-- |          1 |           1 |        1 |        76 |   2.99 | 2005-05-25 11:30:37 | 2006-02-15 22:12:30 |
-- |          2 |           1 |        1 |       573 |   0.99 | 2005-05-28 10:35:23 | 2006-02-15 22:12:30 |
-- |          3 |           1 |        1 |      1185 |   5.99 | 2005-06-15 00:54:12 | 2006-02-15 22:12:30 |
-- |          4 |           1 |        2 |      1422 |   0.99 | 2005-06-15 18:02:53 | 2006-02-15 22:12:30 |
-- |          5 |           1 |        2 |      1476 |   9.99 | 2005-06-15 21:08:46 | 2006-02-15 22:12:30 |
-- |          6 |           1 |        1 |      1725 |   4.99 | 2005-06-16 15:18:57 | 2006-02-15 22:12:30 |
-- |          7 |           1 |        1 |      2308 |   4.99 | 2005-06-18 08:41:48 | 2006-02-15 22:12:30 |
-- |          8 |           1 |        2 |      2363 |   0.99 | 2005-06-18 13:33:59 | 2006-02-15 22:12:30 |
-- |          9 |           1 |        1 |      3284 |   3.99 | 2005-06-21 06:24:45 | 2006-02-15 22:12:30 |
-- |         10 |           1 |        2 |      4526 |   5.99 | 2005-07-08 03:17:05 | 2006-02-15 22:12:30 |

select count(*) from payment;

-- +----------+
-- | count(*) |
-- +----------+
-- |    16044 |
-- +----------+

select * from rental;

-- +-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
-- | rental_id | rental_date         | inventory_id | customer_id | return_date         | staff_id | last_update         |
-- +-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
-- |         1 | 2005-05-24 22:53:30 |          367 |         130 | 2005-05-26 22:04:30 |        1 | 2006-02-15 21:30:53 |
-- |         2 | 2005-05-24 22:54:33 |         1525 |         459 | 2005-05-28 19:40:33 |        1 | 2006-02-15 21:30:53 |
-- |         3 | 2005-05-24 23:03:39 |         1711 |         408 | 2005-06-01 22:12:39 |        1 | 2006-02-15 21:30:53 |
-- |         4 | 2005-05-24 23:04:41 |         2452 |         333 | 2005-06-03 01:43:41 |        2 | 2006-02-15 21:30:53 |
-- |         5 | 2005-05-24 23:05:21 |         2079 |         222 | 2005-06-02 04:33:21 |        1 | 2006-02-15 21:30:53 |
-- |         6 | 2005-05-24 23:08:07 |         2792 |         549 | 2005-05-27 01:32:07 |        1 | 2006-02-15 21:30:53 |
-- |         7 | 2005-05-24 23:11:53 |         3995 |         269 | 2005-05-29 20:34:53 |        2 | 2006-02-15 21:30:53 |
-- |         8 | 2005-05-24 23:31:46 |         2346 |         239 | 2005-05-27 23:33:46 |        2 | 2006-02-15 21:30:53 |
-- |         9 | 2005-05-25 00:00:40 |         2580 |         126 | 2005-05-28 00:22:40 |        1 | 2006-02-15 21:30:53 |
-- |        10 | 2005-05-25 00:02:21 |         1824 |         399 | 2005-05-31 22:44:21 |        2 | 2006-02-15 21:30:53 |

select count(*) from rental;

-- +----------+
-- | count(*) |
-- +----------+
-- |    16044 |
-- +----------+

select * from film;

-- +---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
-- | film_id | title            | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
-- +---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
-- |       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
-- |       2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
-- |       3 | ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                      |         2006 |           1 |                 NULL |               7 |        2.99 |     50 |            18.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
-- |       4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
-- |       5 | AFRICAN EGG      | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                   | 2006-02-15 05:03:42 |
-- |       6 | AGENT TRUMAN     | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                   | 2006-02-15 05:03:42 |
-- |       7 | AIRPLANE SIERRA  | A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat                                     |         2006 |           1 |                 NULL |               6 |        4.99 |     62 |            28.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
-- |       8 | AIRPORT POLLOCK  | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                                         |         2006 |           1 |                 NULL |               6 |        4.99 |     54 |            15.99 | R      | Trailers                         | 2006-02-15 05:03:42 |
-- |       9 | ALABAMA DEVIL    | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat   |         2006 |           1 |                 NULL |               3 |        2.99 |    114 |            21.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
-- |      10 | ALADDIN CALENDAR | A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China                             |         2006 |           1 |                 NULL |               6 |        4.99 |     63 |            24.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |

select count(*) from film;

-- +----------+
-- | count(*) |
-- +----------+
-- |     1000 |
-- +----------+


select * from film_category;

-- +---------+-------------+---------------------+
-- | film_id | category_id | last_update         |
-- +---------+-------------+---------------------+
-- |       1 |           6 | 2006-02-15 05:07:09 |
-- |       2 |          11 | 2006-02-15 05:07:09 |
-- |       3 |           6 | 2006-02-15 05:07:09 |
-- |       4 |          11 | 2006-02-15 05:07:09 |
-- |       5 |           8 | 2006-02-15 05:07:09 |
-- |       6 |           9 | 2006-02-15 05:07:09 |
-- |       7 |           5 | 2006-02-15 05:07:09 |
-- |       8 |          11 | 2006-02-15 05:07:09 |
-- |       9 |          11 | 2006-02-15 05:07:09 |
-- |      10 |          15 | 2006-02-15 05:07:09 |

select count(*) from film_category;

-- +----------+
-- | count(*) |
-- +----------+
-- |     1000 |
-- +----------+

select * from language;

-- +-------------+----------+---------------------+
-- | language_id | name     | last_update         |
-- +-------------+----------+---------------------+
-- |           1 | English  | 2006-02-15 05:02:19 |
-- |           2 | Italian  | 2006-02-15 05:02:19 |
-- |           3 | Japanese | 2006-02-15 05:02:19 |
-- |           4 | Mandarin | 2006-02-15 05:02:19 |
-- |           5 | French   | 2006-02-15 05:02:19 |
-- |           6 | German   | 2006-02-15 05:02:19 |
-- +-------------+----------+---------------------+

select * from inventory;

-- +--------------+---------+----------+---------------------+
-- | inventory_id | film_id | store_id | last_update         |
-- +--------------+---------+----------+---------------------+
-- |            1 |       1 |        1 | 2006-02-15 05:09:17 |
-- |            2 |       1 |        1 | 2006-02-15 05:09:17 |
-- |            3 |       1 |        1 | 2006-02-15 05:09:17 |
-- |            4 |       1 |        1 | 2006-02-15 05:09:17 |
-- |            5 |       1 |        2 | 2006-02-15 05:09:17 |
-- |            6 |       1 |        2 | 2006-02-15 05:09:17 |
-- |            7 |       1 |        2 | 2006-02-15 05:09:17 |
-- |            8 |       1 |        2 | 2006-02-15 05:09:17 |
-- |            9 |       2 |        2 | 2006-02-15 05:09:17 |
-- |           10 |       2 |        2 | 2006-02-15 05:09:17 |

select count(*) from inventory;

-- +----------+
-- | count(*) |
-- +----------+
-- |     4581 |
-- +----------+

-- Consultas


-- Actores que tienen de primer nombre Scarlett.

select * from actor where first_name in ('Scarlett');

-- +----------+------------+-----------+---------------------+
-- | actor_id | first_name | last_name | last_update         |
-- +----------+------------+-----------+---------------------+
-- |       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
-- |      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
-- +----------+------------+-----------+---------------------+

-- Actores que tienen de apellido Johansson.

select * from actor where last_name in ('Johansson');

-- +----------+------------+-----------+---------------------+
-- | actor_id | first_name | last_name | last_update         |
-- +----------+------------+-----------+---------------------+
-- |        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
-- |       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
-- |      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
-- +----------+------------+-----------+---------------------+

-- Actores que contengan una O en su nombre.

select * from actor where first_name regexp 'O';

-- +----------+-------------+--------------+---------------------+
-- | actor_id | first_name  | last_name    | last_update         |
-- +----------+-------------+--------------+---------------------+
-- |        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
-- |        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
-- |        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
-- |       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
-- |       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
-- |       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
-- |       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
-- |       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
-- |       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
-- |       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
-- |       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
-- |       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
-- |       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
-- |       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
-- |       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
-- |       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
-- |       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
-- |      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
-- |      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
-- |      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
-- |      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
-- |      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
-- |      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
-- |      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
-- |      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
-- |      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
-- |      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
-- |      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
-- |      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
-- |      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
-- |      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
-- |      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
-- |      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
-- |      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
-- |      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
-- |      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
-- +----------+-------------+--------------+---------------------+

select count(*) from actor where first_name regexp 'O';

-- +----------+
-- | count(*) |
-- +----------+
-- |       36 |
-- +----------+

-- Actores que contengan una O en su nombre y en una A en su apellido.

select * from actor where first_name regexp 'O' and last_name regexp 'A';

-- +----------+------------+--------------+---------------------+
-- | actor_id | first_name | last_name    | last_update         |
-- +----------+------------+--------------+---------------------+
-- |        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
-- |        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
-- |       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
-- |       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
-- |       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
-- |       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
-- |       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
-- |       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
-- |       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
-- |      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
-- |      115 | HARRISON   | BALE         | 2006-02-15 04:34:33 |
-- |      137 | MORGAN     | WILLIAMS     | 2006-02-15 04:34:33 |
-- |      172 | GROUCHO    | WILLIAMS     | 2006-02-15 04:34:33 |
-- |      176 | JON        | CHASE        | 2006-02-15 04:34:33 |
-- |      188 | ROCK       | DUKAKIS      | 2006-02-15 04:34:33 |
-- |      192 | JOHN       | SUVARI       | 2006-02-15 04:34:33 |
-- +----------+------------+--------------+---------------------+

-- Actores que contengan dos O en su nombre y en una A en su apellido.

select * from actor where first_name regexp '.*o{1}.*o{1}' and last_name regexp '[A]{1}';

-- +----------+------------+-----------+---------------------+
-- | actor_id | first_name | last_name | last_update         |
-- +----------+------------+-----------+---------------------+
-- |       28 | WOODY      | HOFFMAN   | 2006-02-15 04:34:33 |
-- |       78 | GROUCHO    | SINATRA   | 2006-02-15 04:34:33 |
-- |      172 | GROUCHO    | WILLIAMS  | 2006-02-15 04:34:33 |
-- +----------+------------+-----------+---------------------+

-- Actores donde su tercera letra sea B.

select * from actor where first_name regexp '..b.*';

-- +----------+------------+-----------+---------------------+
-- | actor_id | first_name | last_name | last_update         |
-- +----------+------------+-----------+---------------------+
-- |       15 | CUBA       | OLIVIER   | 2006-02-15 04:34:33 |
-- |       19 | BOB        | FAWCETT   | 2006-02-15 04:34:33 |
-- |      118 | CUBA       | ALLEN     | 2006-02-15 04:34:33 |
-- |      125 | ALBERT     | NOLTE     | 2006-02-15 04:34:33 |
-- |      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
-- |      182 | DEBBIE     | AKROYD    | 2006-02-15 04:34:33 |
-- |      189 | CUBA       | BIRCH     | 2006-02-15 04:34:33 |
-- +----------+------------+-----------+---------------------+

-- Ciudades que empiezan por a.

select count(*) from city where city regexp '^a';

-- +----------+
-- | count(*) |
-- +----------+
-- |       43 |
-- +----------+


-- Ciudades que acaban por s.


select count(*) from city where city regexp 's$';
-- +----------+
-- | count(*) |
-- +----------+
-- |       31 |
-- +----------+

-- Ciudades del country 61.

select * from city where country_id = 61;

-- +---------+----------+------------+---------------------+
-- | city_id | city     | country_id | last_update         |
-- +---------+----------+------------+---------------------+
-- |     115 | Chisinau |         61 | 2006-02-15 04:45:25 |
-- +---------+----------+------------+---------------------+

-- Ciudades del country Spain.

mysql> select city from city as c join country as co on c.country_id=co.country_id where co.country = 'Spain';

-- +-------------------------+
-- | city                    |
-- +-------------------------+
-- | A Coruña (La Coruña)    |
-- | Donostia-San Sebastián  |
-- | Gijón                   |
-- | Ourense (Orense)        |
-- | Santiago de Compostela  |
-- +-------------------------+

-- Ciudades con nombres compuestos.

select * from city where city regexp '[:space:]' limit 10;

-- +---------+-------------------------+------------+---------------------+
-- | city_id | city                    | country_id | last_update         |
-- +---------+-------------------------+------------+---------------------+
-- |       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
-- |       3 | Abu Dhabi               |        101 | 2006-02-15 04:45:25 |
-- |       6 | Addis Abeba             |         31 | 2006-02-15 04:45:25 |
-- |      18 | Allappuzha (Alleppey)   |         44 | 2006-02-15 04:45:25 |
-- |      20 | Almirante Brown         |          6 | 2006-02-15 04:45:25 |
-- |      25 | Angra dos Reis          |         15 | 2006-02-15 04:45:25 |
-- |      28 | Aparecida de Goiânia    |         15 | 2006-02-15 04:45:25 |
-- |      41 | Augusta-Richmond County |        103 | 2006-02-15 04:45:25 |
-- |      45 | Bahía Blanca            |          6 | 2006-02-15 04:45:25 |
-- |      53 | Bandar Seri Begawan     |         16 | 2006-02-15 04:45:25 |
-- +---------+-------------------------+------------+---------------------+

select count(*) from city where city regexp '[:space:]';

-- +----------+
-- | count(*) |
-- +----------+
-- |       92 |
-- +----------+

-- Películas con una duración entre 80 y 100.

select count(*) from film where length between 80 and 100;

-- +----------+
-- | count(*) |
-- +----------+
-- |      147 |
-- +----------+

-- Peliculas con un rental_rate entre 1 y 3.

select count(*) from film where rental_rate between 1 and 3;

-- +----------+
-- | count(*) |
-- +----------+
-- |      323 |
-- +----------+

-- Películas con un titulo de más de 12 letras.

select count(*) from film where length(title) > 12;

-- +----------+
-- | count(*) |
-- +----------+
-- |      691 |
-- +----------+

-- Peliculas con un rating de PG o G.

select count(*) from film where rating in ('PG','G');

-- +----------+
-- | count(*) |
-- +----------+
-- |      372 |
-- +----------+

-- Peliculas que no tengan un rating de NC-17.

select count(*) from film where rating not in ('NC-17');

-- +----------+
-- | count(*) |
-- +----------+
-- |      790 |
-- +----------+

-- Peliculas con un rating PG y duracion de más de 120.

select count(*) from film where rating in ('PG') and length > 120;

-- +----------+
-- | count(*) |
-- +----------+
-- |       82 |
-- +----------+

-- ¿Cuantos actores hay?

select count(distinct(actor_id)) from actor;

-- +---------------------------+
-- | count(distinct(actor_id)) |
-- +---------------------------+
-- |                       200 |
-- +---------------------------+

-- ¿Cuántas ciudades tiene el country Spain?

select count(*) from city as c join country as co on co.country_id = c.country_id where co.country in ('Spain');

-- +----------+
-- | count(*) |
-- +----------+
-- |        5 |
-- +----------+

-- ¿Cuántos countries hay que empiezan por a?

select count(*) from country where country regexp '^a';

-- +----------+
-- | count(*) |
-- +----------+
-- |       10 |
-- +----------+

-- Media de duración de peliculas con PG.


select avg(length) from film where rating in ('PG');

-- +-------------+
-- | avg(length) |
-- +-------------+
-- |    112.0052 |
-- +-------------+

-- Suma de rental_rate de todas las peliculas.

 select sum(rental_rate) from film;

-- +------------------+
-- | sum(rental_rate) |
-- +------------------+
-- |          2980.00 |
-- +------------------+

-- Pelicula con mayor duración.

select * from film where length = (select max(length) from film);
select count(*) from film where length = (select max(length) from film);
-- +----------+
-- | count(*) |
-- +----------+
-- |       10 |
-- +----------+

-- Película con menor duración.


select count(*) from film where length = (select min(length) from film);

-- +----------+
-- | count(*) |
-- +----------+
-- |        5 |
-- +----------+


select title from film where length = (select min(length) from film);

-- +---------------------+
-- | title               |
-- +---------------------+
-- | ALIEN CENTER        |
-- | IRON MOON           |
-- | KWAI HOMEWARD       |
-- | LABYRINTH LEAGUE    |
-- | RIDGEMONT SUBMARINE |
-- +---------------------+

-- Mostrar las ciudades del country Spain (multitabla).

select city from city as c join country as co on c.country_id = co.country_id where co.country in ('Spain');

-- +-------------------------+
-- | city                    |
-- +-------------------------+
-- | A Coruña (La Coruña)    |
-- | Donostia-San Sebastián  |
-- | Gijón                   |
-- | Ourense (Orense)        |
-- | Santiago de Compostela  |
-- +-------------------------+

-- Mostrar el nombre de la película y el nombre de los actores.

select f.title, a.first_name from film as f join film_actor as fa on f.film_id=fa.film_id join actor as a on a.actor_id = fa.actor_id;

-- Mostrar el nombre de la película y el de sus categorías.

select f.title, c.name from film as f join film_category as fc on f.film_id=fc.film_id join category as c on fc.category_id=c.category_id;

select count(*) from film as f join film_category as fc on f.film_id=fc.film_id joi
n category as c on fc.category_id=c.category_id;

-- +----------+
-- | count(*) |
-- +----------+
-- |     1000 |
-- +----------+

-- Mostrar el country, la ciudad y dirección de cada miembro del staff.

select s.staff_id,s.first_name,a.address,c.city,co.country from staff as s join address as a on s.address_id=a.address_id join city as c on c.city_id=a.city_id join country as co on c.country_id=co.country_id;

-- +----------+------------+----------------------+------------+-----------+
-- | staff_id | first_name | address              | city       | country   |
-- +----------+------------+----------------------+------------+-----------+
-- |        1 | Mike       | 23 Workhaven Lane    | Lethbridge | Canada    |
-- |        2 | Jon        | 1411 Lillydale Drive | Woodridge  | Australia |
-- +----------+------------+----------------------+------------+-----------+

-- Mostrar el country, la ciudad y dirección de cada customer.

select cu.customer_id,cu.first_name,a.address,c.city,co.country from customer as cu join address as a on cu.address_id=a.address_id join city as c on c.city_id=a.city_id join country as co on c.country_id=co.country_id;

-- +-------------+-------------+----------------------------------------+----------------------------+---------------------------------------+
-- | customer_id | first_name  | address                                | city                       | country                               |
-- +-------------+-------------+----------------------------------------+----------------------------+---------------------------------------+
-- |         218 | VERA        | 1168 Najafabad Parkway                 | Kabul                      | Afghanistan                           |
-- |         441 | MARIO       | 1924 Shimonoseki Drive                 | Batna                      | Algeria                               |
-- |          69 | JUDY        | 1031 Daugavpils Parkway                | Béchar                     | Algeria                               |
-- |         176 | JUNE        | 757 Rustenburg Avenue                  | Skikda                     | Algeria                               |
-- |         320 | ANTHONY     | 1892 Nabereznyje Telny Lane            | Tafuna                     | American Samoa                        |

mysql> select count(*) from customer as cu join address as a on cu.address_id=a.address_id join city as c on c.city_id=a.city_id join country as co on c.country_id=co.country_id;

-- +----------+
-- | count(*) |
-- +----------+
-- |      599 |
-- +----------+

-- Numero de películas de cada rating

mysql> select rating, count(*) from film group by rating;

-- +--------+----------+
-- | rating | count(*) |
-- +--------+----------+
-- | PG     |      194 |
-- | G      |      178 |
-- | NC-17  |      210 |
-- | PG-13  |      223 |
-- | R      |      195 |
-- +--------+----------+

-- Cuantas películas ha realizado el actor ED CHASE.

mysql> select a.actor_id, a.first_name, count(fa.film_id) from actor as a join film_actor as fa on a.actor_id=fa.actor_id where a.first_name in ('ED') and a.last_name in ('CHASE') GROUP BY a.actor_id;
-- +----------+------------+-------------------+
-- | actor_id | first_name | count(fa.film_id) |
-- +----------+------------+-------------------+
-- |        3 | ED         |                22 |
-- +----------+------------+-------------------+

-- Media de duración de las películas cada categoría.

mysql> select c.name,avg(f.length) from film as f join film_category as fc on f.film_id=fc.film_id join category as c on fc.category_id=c.category_id group by c.name;

-- +-------------+---------------+
-- | name        | avg(f.length) |
-- +-------------+---------------+
-- | Action      |      111.6094 |
-- | Animation   |      111.0152 |
-- | Children    |      109.8000 |
-- | Classics    |      111.6667 |
-- | Comedy      |      115.8276 |
-- | Documentary |      108.7500 |
-- | Drama       |      120.8387 |
-- | Family      |      114.7826 |
-- | Foreign     |      121.6986 |
-- | Games       |      127.8361 |
-- | Horror      |      112.4821 |
-- | Music       |      113.6471 |
-- | New         |      111.1270 |
-- | Sci-Fi      |      108.1967 |
-- | Sports      |      128.2027 |
-- | Travel      |      113.3158 |
-- +-------------+---------------+

-- Vistas


-- 1

CREATE VIEW category_duration AS
SELECT c.name as Category,avg(f.length) as Length_Average from film as f join film_category as fc on f.film_id=fc.film_id join category as c on fc.category_id=c.category_id group by c.name;


mysql> select * from category_duration;
-- +-------------+----------------+
-- | Category    | Length_Average |
-- +-------------+----------------+
-- | Action      |       111.6094 |
-- | Animation   |       111.0152 |
-- | Children    |       109.8000 |
-- | Classics    |       111.6667 |
-- | Comedy      |       115.8276 |
-- | Documentary |       108.7500 |
-- | Drama       |       120.8387 |
-- | Family      |       114.7826 |
-- | Foreign     |       121.6986 |
-- | Games       |       127.8361 |
-- | Horror      |       112.4821 |
-- | Music       |       113.6471 |
-- | New         |       111.1270 |
-- | Sci-Fi      |       108.1967 |
-- | Sports      |       128.2027 |
-- | Travel      |       113.3158 |
-- +-------------+----------------+

-- 2

CREATE VIEW film_count_by_actor AS
SELECT a.actor_id, a.first_name, count(fa.film_id) from actor as a join film_actor as fa on a.actor_id=fa.actor_id group by a.actor_id;

-- +----------+------------+-------------------+
-- | actor_id | first_name | count(fa.film_id) |
-- +----------+------------+-------------------+
-- |        1 | PENELOPE   |                19 |
-- |        2 | NICK       |                25 |
-- |        3 | ED         |                22 |
-- |        4 | JENNIFER   |                22 |
-- |        5 | JOHNNY     |                29 |
-- |        6 | BETTE      |                20 |
-- |        7 | GRACE      |                30 |
-- |        8 | MATTHEW    |                20 |
-- |        9 | JOE        |                25 |
-- |       10 | CHRISTIAN  |                22 |


-- 3

CREATE VIEW customer_information AS
SELECT cu.customer_id,cu.first_name,a.address,c.city,co.country from customer as cu join address as a on cu.address_id=a.address_id join city as c on c.city_id=a.city_id join country as co on c.country_id=co.country_id;

-- mysql> select * from customer_information limit 10;
-- +-------------+------------+-------------------------------+-----------------+----------------+
-- | customer_id | first_name | address                       | city            | country        |
-- +-------------+------------+-------------------------------+-----------------+----------------+
-- |         218 | VERA       | 1168 Najafabad Parkway        | Kabul           | Afghanistan    |
-- |         441 | MARIO      | 1924 Shimonoseki Drive        | Batna           | Algeria        |
-- |          69 | JUDY       | 1031 Daugavpils Parkway       | Béchar          | Algeria        |
-- |         176 | JUNE       | 757 Rustenburg Avenue         | Skikda          | Algeria        |
-- |         320 | ANTHONY    | 1892 Nabereznyje Telny Lane   | Tafuna          | American Samoa |
-- |         528 | CLAUDE     | 486 Ondo Parkway              | Benguela        | Angola         |
-- |         383 | MARTIN     | 368 Hunuco Boulevard          | Namibe          | Angola         |
-- |         381 | BOBBY      | 1368 Maracabo Boulevard       | South Hill      | Anguilla       |
-- |         359 | WILLIE     | 1623 Kingstown Drive          | Almirante Brown | Argentina      |
-- |         560 | JORDAN     | 1229 Varanasi (Benares) Manor | Avellaneda      | Argentina      |
-- +-------------+------------+-------------------------------+-----------------+----------------+

-- 4

