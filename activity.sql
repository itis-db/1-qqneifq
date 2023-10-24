with recursive hierarchy as
(
	select a.activityid, a.activitytypeid, a.code, a.name, a.parentid, 0 as hlevel
	from activity a 
	union all
	select r.activityid, r.activitytypeid, r.code, r.name, r.parentid, h.hlevel +1
	from activity r
	join hierarchy h on h.parentid = r.activityid
)
select * from hierarchy
order by hlevel;
