use dmworkshop;

# Where clause

select * from p_staff;
select * from speech;

# Select a speech presented by a staff from p_staff
select * from speech s where s.Presenter in 
	(select staffId from p_staff);
    
# Select a speech presented by the p_staff with the lowest staffId
select * from speech s where s.Presenter = 
	(select min(staffId) from p_staff);
    
    
    
# Having clause

# Count the number of speeches from each presenter
select presenter, count(*) from speech group by presenter;

# Count the number of speeches from each presenter who has presented at least 30 times
select presenter, count(*) from speech group by presenter having count(*) > 30;

# Count the number of speeches from each presenter who has presented more than the average presenter
	# Count the number of speeches the average presenter has presented
    select count(*) / count(distinct presenter) as averageNumSpeeches from speech;
    
    # Put it together 
    select presenter, count(*) from speech group by presenter having count(*) > 
		(select count(*) / count(distinct presenter) as averageNumSpeeches from speech);
        
# From Clause

# Select speeches presented by p_staff
select * from speech inner join p_staff on speech.presenter = p_staff.staffId;

# Select only some columns from the joined table

# 2 Ways
# Through choosing columns from each table
select s.EventName, s.EventDate, s.Presenter, ps.staffId, ps.JoinDate from speech s inner join p_staff ps on s.presenter = ps.staffId;

# Through a From Clause Subquery
select t1.EventName, t1.EventDate, t1.Presenter, t1.staffId, t1.JoinDate from 
	(select * from speech inner join p_staff on speech.presenter = p_staff.staffId) as t1;

    