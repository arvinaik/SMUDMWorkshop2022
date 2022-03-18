use dmworkshop;


# Write a trigger to prevent us from deleting speeches given by Lee Hsien Loong
# Return Lee Hsien Loong's staffId
select * from p_staff inner join staff on staff.staffId = p_staff.staffId and staff.staffName = "Lee Hsien Loong";
select staff.staffId from p_staff inner join staff on staff.staffId = p_staff.staffId and staff.staffName = "Lee Hsien Loong";

DELIMITER $$
CREATE TRIGGER LeeDynasty BEFORE DELETE on speech for each row
	BEGIN
		DECLARE LeeId int;
        
        # 2 ways to set variable
        # select staff.staffId from p_staff inner join staff on staff.staffId = p_staff.staffId and staff.staffName = "Lee Hsien Loong" into LeeId;
        set LeeId = (select staff.staffId from p_staff inner join staff on staff.staffId = p_staff.staffId and staff.staffName = "Lee Hsien Loong");
        
        IF old.PRESENTER = LEEID then
			signal SQLSTATE '45000' Set Message_Text = "You cannot delete Lee";
		END IF;
	END $$
DElIMITER ;

select * from speech order by presenter;
# Try Deleting Lee Hsien Loong's Speech on How to Study for End Of Semester Examination
delete from speech where speech.presenter = 295 and speech.ContentAbst = "How to Study for End Of Semester Examinations";

DROP Trigger LeeDynasty;
    