-- gotovoe
insert into activitytype(
    	  activitytypeid
        ,name
        ,sysname
    )
    select d.*
    from (
    	values(1,'Программа','Program')
        ,(2,'Подпрограмма','SubProgram')
        ,(3,'Проект','Project')
        ,(4,'Контракт','Contract')
        ,(5,'КТ','Point')
    ) d(activitytypeid, name, sysname)
    where not exists(
    	select 1 from activitytype t
        where t.activitytypeid = d.activitytypeid
    );
	
-- activity	--
insert into activity (activityid, activitytypeid, code, name, parentid)
select d.*
from (values (1, 1, 'code1', 'name1', null),
             (2, 1, 'code2', 'name2', 1),
             (3, 2, 'code3', 'name3', 2),
             (4, 2, 'code4', 'name4', 3),
             (5, 3, 'code5', 'name5', 4)
	 )
d(activityid, activitytypeid, code, name, parentid)
where not exists
(
	select 1 from activity t where t.activityid = d.activityid
);

-- subprogram --
insert into subprogram (subprogramid, indexnum)
select d.*
from (values (1, 1),
             (2, 2),
             (3, 3)
	 )
d(subprogramid, indexnum)
where not exists
(
	select 1 from subprogram t where t.subprogramid = d.subprogramid
	
);

--  project --
insert into project  (projectid, targetdescr)
select d.*
from (values (1, 'descr1'),
             (2, 'descr2'),
             (3, 'descr3')
	 )
d(projectid, targetdescr)
where not exists
(
	select 1 from project t where t.projectid = d.projectid
);

-- point --
insert into point (pointid, plandate, factdate)
select d.*
from (values (1, TO_DATE('1010/10/10', 'yyyy/mm/dd'), TO_DATE('1111/01/01', 'yyyy/mm/dd')),
             (2, TO_DATE('2020/02/22', 'yyyy/mm/dd'), TO_DATE('2222/02/02', 'yyyy/mm/dd')),
             (3, TO_DATE('3030/03/30', 'yyyy/mm/dd'), TO_DATE('3333/03/03', 'yyyy/mm/dd'))
	 )
d(pointid, plandate, factdate)
where not exists
(
	select 1 from point t where t.pointid = d.pointid
);

-- area --
insert into area (areaid, name)
select d.*
from (values (1, 'area1'),
             (2, 'area2'),
             (3, 'area3')
	 )
d(areaid, name)
where not exists
(
	select 1 from area t where t.areaid = d.areaid
);

-- program --
insert into program (programid, indexnum, yearstart, yearfinish)
select d.*
from (values (1, 1, 1000, 1010),
             (2, 2, 2000, 2020),
             (3, 3, 3000, 3030)
	 )
d(programid, indexnum, yearstart, yearfinish)
where not exists
(
	select 1 from program t where t.programid = d.programid
);

-- contract
insert into contract (contractid, areaid)
select d.*
from (values (1, 1),
             (2, 2),
             (3, 3)
	 )
d(contractid, areaid)
where not exists
(
	select 1 from contract t where t.contractid = d.contractid
);
