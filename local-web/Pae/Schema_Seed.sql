drop schema sandbox;
create schema sandbox;
use
sandbox;

create table sp_trip
(
    id         int auto_increment
        primary key,
    factory    int null,
    line       int null,
    trip       int null,
    time       time     default (curtime()) null,
    lead_time  int null,
    valid_date datetime default CURRENT_TIMESTAMP null,
    valid_to   datetime default CURRENT_TIMESTAMP null
);

INSERT INTO sandbox.sp_trip (factory, line, trip, time, lead_time, valid_date, valid_to)
VALUES
    (1, 1, 1, '09:45', 30, '2023-10-09 00:00:00', '2023-10-11 00:00:00'),
    (1, 1, 1, '09:30', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00'),
    (1, 1, 2, '10:00', 30, '2023-10-12 00:00:00', '2023-10-14 00:00:00'),

    (1, 2, 1, '09:45', 30, '2023-10-09 00:00:00', '2023-10-11 00:00:00'),
    (1, 2, 1, '09:30', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00'),
    (1, 2, 2, '10:00', 30, '2023-10-12 00:00:00', '2023-10-14 00:00:00'),

    (1, 3, 1, '09:45', 30, '2023-10-09 00:00:00', '2023-10-11 00:00:00'),
    (1, 3, 1, '09:30', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00'),
    (1, 3, 3, '10:00', 30, '2023-10-12 00:00:00', '2023-10-14 00:00:00'),

    (2, 1, 1, '09:45', 30, '2023-10-09 00:00:00', '2023-10-11 00:00:00'),
    (2, 1, 1, '09:30', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00'),
    (3, 1, 2, '10:00', 30, '2023-10-12 00:00:00', '2023-10-14 00:00:00'),

    (2, 2, 1, '09:45', 30, '2023-10-09 00:00:00', '2023-10-11 00:00:00'),
    (2, 2, 1, '09:30', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00'),
    (3, 2, 2, '10:00', 30, '2023-10-12 00:00:00', '2023-10-14 00:00:00'),

    (2, 3, 1, '09:45', 30, '2023-10-09 00:00:00', '2023-10-11 00:00:00'),
    (2, 3, 1, '09:30', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00'),
    (3, 3, 3, '10:00', 30, '2023-10-12 00:00:00', '2023-10-14 00:00:00'),

    (3, 3, 3, '10:45', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00'),
    (2, 1, 1, '09:30', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00' );


create table std_trip
(
    id         int auto_increment
        primary key,
    factory    int null,
    trip       int null,
    time       time     default (curtime()) null,
    lead_time  int null,
    valid_date datetime default CURRENT_TIMESTAMP null
);

INSERT INTO sandbox.std_trip (factory, trip, time, lead_time, valid_date)
VALUES (1, 1, '09:00', 30, '2023-10-09 00:00:00'),
       (1, 1, '09:00', 30, '2023-10-10 00:00:00'),
       (1, 1, '11:00', 30, '2023-10-12 00:00:00'),

       (1, 2, '09:00', 30, '2023-10-09 00:00:00'),
       (1, 2, '09:00', 30, '2023-10-10 00:00:00'),
       (1, 2, '11:00', 30, '2023-10-12 00:00:00'),

       (1, 3, '09:00', 30, '2023-10-09 00:00:00'),
       (1, 3, '09:00', 30, '2023-10-10 00:00:00'),
       (1, 3, '11:00', 30, '2023-10-12 00:00:00'),

       (2, 2, '09:00', 30, '2023-10-09 00:00:00'),
       (2, 2, '09:00', 30, '2023-10-10 00:00:00'),
       (2, 2, '11:00', 30, '2023-10-12 00:00:00'),

       (2, 2, '09:30', 30, '2023-10-10 00:00:00'),
       (2, 1, '10:30', 30, '2023-10-10 00:00:00'),
       (3, 3, '11:00', 30, '2023-10-10 00:00:00');



SELECT DISTINCT
    *,
    2 as line
FROM (
SELECT
    st.factory,
    st.trip,
    st.time,
    st.valid_date
FROM std_trip as st
UNION
SELECT
    sp.factory,
    sp.trip,
    sp.time,
    sp.valid_date
FROM sp_trip as sp
WHERE
    sp.valid_to <= '2023-10-12 23:59:59'
    AND sp.line = 2
) as t1
WHERE
   t1.valid_date >= '2023-10-10 00:00:00'
   AND t1.valid_date <= '2023-10-12 23:59:59'
   AND t1.factory = 2;
