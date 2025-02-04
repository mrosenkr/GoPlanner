-- migrate:up
create table Person (
    id integer primary key autoincrement,
    first_name varchar(50) not null,
    last_name varchar(100) not null
);

create table Day (
    id integer primary key,
    bitmask tinyint not null,
    name varchar(10) not null
);

insert into Day values (0, 1, 'Sunday');
insert into Day values (1, 2, 'Monday');
insert into Day values (2, 4, 'Tuesday');
insert into Day values (3, 8, 'Wednesday');
insert into Day values (4, 16, 'Thursday');
insert into Day values (5, 32, 'Friday');
insert into Day values (6, 64, 'Saturday');

create table Period (
    id integer primary key autoincrement,
    name varchar(50),
    start_date timestamp not null,
    end_date timestamp not null
);

create table Schedule (
    id integer primary key autoincrement,
    name varchar(50)
);

create table WeeklySchedule (
    id integer primary key autoincrement,
    name varchar(50),
    period_id integer not null,
    start_time timestamp not null,
    end_time timestamp not null,
    foreign key (period_id) references Period(id)
);

create table ScheduleBlock (
    id integer primary key autoincrement,
    name varchar(50) not null,
    days tinyint not null
);

create table ScheduleDetail (
    id integer primary key autoincrement,
    schedule_id integer not null,
    schedule_block_id integer not null,
    foreign key (schedule_id) references Schedule(id),
    foreign key (schedule_block_id) references ScheduleBlock(id)
);

create table TimeSlot (
    id integer primary key autoincrement,
    slot_date timestamp not null,
    start_time timestamp not null,
    end_time timestamp not null
);

-- migrate:down
drop table Person;
drop table Day;
drop table Period;
drop table Schedule;
drop table WeeklySchedule;
drop table ScheduleBlock;
drop table ScheduleDetail;
drop table TimeSlot;
