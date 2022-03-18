use dmworkshop;

select * from p_staff;
select * from staff;
select * from p_staff p, staff s;

select * from staff s inner join p_staff ps on s.staffId = ps.staffId;

# Note that there are as many rows in the join query as there are rows in the left table
select * from staff s left outer join p_staff ps on s.staffId = ps.staffId;

# Note that there are as many rows in the join query as there are rows in the right table
select * from staff s right outer join p_staff ps on s.staffId = ps.staffId;


# Take Note table1 left outer join table2 is the same as table 2 right outer join table 1;
select * from staff s left outer join p_staff ps on s.staffId = ps.staffId;
select * from p_staff ps right outer join staff s on s.staffId = ps.staffId;

# Joining 2 of the same table
select * from p_staff ps1 inner join p_staff ps2 on ps1.staffId = ps2.staffId;

# Not Equal Join
select * from p_staff ps1 inner join p_staff ps2 on ps1.staffID > ps2.staffId;

# Joining 2 unrelated columns
select * from speech;
select * from department;

select * from department d1 inner join speech sp on sp.PostDate = d1.StartDate;


