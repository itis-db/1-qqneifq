
create table if not exists activitytype
(
    activitytypeid int not null
        constraint pk_activitytype
            primary key,
    name           text    not null,
    sysname        text    not null
);

create table if not exists activity
(
	activityid int not null
		constraint pk_activity
			primary key,
	activitytypeid int not null
		constraint fk_activitytype
			references activitytype(activitytypeid),
	code text not null,
	name text not null,
	parentid int
		constraint fk_ptactivity
			references activity(activityid)
);

create table if not exists subprogram
(
	subprogramid int not null
		constraint pk_programid
			primary key
		constraint fk_subprogram
			references activity(activityid),
	indexnum int not null
);

create table if not exists project
(
	projectid int not null
		constraint pk_project
			primary key
		constraint fk_project
			references activity(activityid),
	targetdescr text not null
);

create table if not exists program
(
	programid int not null
		constraint pk_program
			primary key
		constraint fk_program
			references activity(activityid),
	indexnum int not null,
	yearstart int not null,
	yearfinish int not null
);

create table if not exists point
(
	pointid int not null
		constraint pk_point
			primary key
		constraint fk_point
			references activity(activityid),
	plandate date not null,
	factdate date not null
);

create table if not exists area
(
	areaid int not null
		constraint pk_area
			primary key,
	name text not null
);

create table if not exists contract
(
	contractid int not null
		constraint pk_contract
			primary key
		constraint fk_contract
			references activity(activityid),
	areaid int not null
		constraint fk_contractarea
			references area(areaid)
);
