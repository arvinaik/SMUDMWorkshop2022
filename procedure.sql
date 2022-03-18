use dmworkshop;

# Lets create a stored procedure that takes in a variable orderNum, and returns the speaker who presents at that order the most often

# All Speeches at a specified order number
select * from speech s where s.ordernum = 1;

# The number of times each presenter has presented first, ordered by the number of times they have presented in descending order
select s.ordernum, s.presenter, count(*) from speech s where s.ordernum = 1 group by presenter order by count(*) desc;

# The speaker who has presented first the most times
select s.ordernum, s.presenter, count(*) from speech s where s.ordernum = 1 group by presenter order by count(*) desc limit 1;

# Turn this into a procedure
DELIMITER $$
CREATE PROCEDURE MostPopularSpeaker(IN orderNum int, OUT speakerId int)
	BEGIN
    SET speakerId = (select s.presenter from speech s where s.ordernum = orderNum group by presenter order by count(*) desc limit 1);
END $$
DELIMITER ;

SET @speakerId = -1;

call MostPopularSpeaker(1, @speakerId);
select @speakerId;