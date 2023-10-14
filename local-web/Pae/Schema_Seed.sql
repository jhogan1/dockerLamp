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
VALUES (1, 1, 1, '09:45', 30, '2023-10-09 00:00:00', '2023-10-11 00:00:00'),
       (1, 1, 1, '09:30', 30, '2023-10-10 00:00:00', '2023-10-12 00:00:00');

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
VALUES (1, 1, '09:00', 30, '2023-01-01 00:00:00'),
       (1, 1, '09:00', 30, '2023-09-13 00:00:00');