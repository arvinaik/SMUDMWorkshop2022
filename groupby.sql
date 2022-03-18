use dmworkshop;

select * from staff;
select * from staff group by staffType;
# Take Note that staffname and email show up, but dont really make sense in a group by query
# What we see are just the first row of each staffType
select * from staff;

select staffType, count(distinct staffId) from staff group by staffType;

# Slide 35
select * from staff;

# This should not work
select * from staff group by staffType having sid = 296;

# Don't need to use the same aggregate function in having and select
select staffType as std, max(staffId) as maxStaffId from staff group by staffType having avg(staffId) > 300;