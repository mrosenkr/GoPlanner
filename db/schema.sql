CREATE TABLE IF NOT EXISTS "schema_migrations" (version varchar(128) primary key);
CREATE TABLE Person (
    id integer primary key autoincrement,
    first_name varchar(50) not null,
    last_name varchar(100) not null
);
CREATE TABLE Day (
    id integer primary key,
    bitmask tinyint not null,
    name varchar(10) not null
);
CREATE TABLE Period (
    id integer primary key autoincrement,
    name varchar(50),
    start_date timestamp not null,
    end_date timestamp not null
);
CREATE TABLE Schedule (
    id integer primary key autoincrement,
    name varchar(50)
);
CREATE TABLE WeeklySchedule (
    id integer primary key autoincrement,
    name varchar(50),
    period_id integer not null,
    start_time timestamp not null,
    end_time timestamp not null,
    foreign key (period_id) references Period(id)
);
CREATE TABLE ScheduleBlock (
    id integer primary key autoincrement,
    name varchar(50) not null,
    days tinyint not null
);
CREATE TABLE ScheduleDetail (
    id integer primary key autoincrement,
    schedule_id integer not null,
    schedule_block_id integer not null,
    foreign key (schedule_id) references Schedule(id),
    foreign key (schedule_block_id) references ScheduleBlock(id)
);
CREATE TABLE TimeSlot (
    id integer primary key autoincrement,
    slot_date timestamp not null,
    start_time timestamp not null,
    end_time timestamp not null
);
-- Dbmate schema migrations
INSERT INTO "schema_migrations" (version) VALUES
  ('20250130024425');
