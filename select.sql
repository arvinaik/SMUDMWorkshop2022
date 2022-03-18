use dmworkshop;
select * from department;

select count(*) from department;
select count(DISTINCT StartDate) from department;

# Take note we can rename columns in the select query without altering the table
select count(DISTINCT StartDate) as countStartDate from department;