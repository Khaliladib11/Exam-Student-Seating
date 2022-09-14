create procedure faculty_select_all
as
select fctid as 'Faculty ID', fctname as 'Faculty Name', concat(person.pfname,' ',person.plname) as 'Instrctor name'
from faculty, person
where faculty.pid = person.pid;
go

create procedure users_select_all
as
select person.pid as 'ID',CONCAT(pfname, plname) AS 'Name', username
from person, users, instructor
where person.pid = instructor.pid and person.pid = users.pid 
go

create procedure acadyear_select_all
as
select ayrid as 'Academic Year', smsid as 'Semester'
from semester
go

create procedure select_instructors_Fullname
as
select concat(person.pfname,' ',person.plname) as 'name',person.pid
from person, instructor 
where person.pid = instructor.pid;
go


create procedure faculty_insert
@fctid varchar(50), @fctname varchar(50), @pid int
as 
declare @cnt int;
set @cnt = (select count(*) from faculty, instructor where faculty.pid = instructor.pid and faculty.pid = @pid);
if(@cnt = 0)
begin
	insert into faculty (fctid, fctname, pid)
	values (@fctid, @fctname, @pid)
end
go

create procedure faculty_delete
@fctid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from departement where fctid = @fctid);
if (@cnt = 0) begin
	delete from faculty
	where fctid = @fctid;
end
return @cnt;
go

create procedure faculty_update
@fctid varchar(50), @fctname varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from faculty where fctid = @fctid);
if(@cnt = 1) begin
	update faculty
	set fctname = @fctname
	where fctid = @fctid;
end
return @cnt;
go


create procedure select_all_faculty
as
select faculty.fctid as 'ID', faculty.fctname as 'Faculty name'
from  faculty
go



create procedure select_departement_by_fctid
@fctid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from faculty where fctid = @fctid);
if(@cnt != 0) begin
	select departement.dptid as 'ID', departement.dptname as 'Name'
	from departement, faculty
	where departement.fctid = faculty.fctid and departement.fctid = @fctid;
end
return @cnt;
go

create procedure insert_departement
@fctid varchar(50), @dptname varchar(50), @dptid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from departement where departement.dptid = @dptid);
if(@cnt = 0) begin
	insert into departement(dptid,dptname,fctid)
	values(@dptid, @dptname, @fctid)
end
return @cnt;
go

create procedure delete_departement
 @dptid varchar(50)
as
declare @cnt int;
declare @cn int;
set @cnt = (select count(*) from departement where departement.dptid = @dptid);
set @cn = (select count(*) from departement, student where departement.dptid = @dptid and student.dptid = departement.dptid);
if(@cnt != 0) 
begin
	if(@cn = 0) 
	begin
		delete from departement
		where departement.dptid = @dptid;
	end
end
return @cnt;
go

create procedure departement_update
@dptid varchar(50), @deptname varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from departement where departement.dptid = @dptid);
if(@cnt = 1) begin
	update departement
	set departement.dptname = @deptname
	where departement.dptid = @dptid;
end

return @cnt;
go

create procedure insert_academicYear
@ayrid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from Academicyear where Academicyear.ayrid = @ayrid);
if(@cnt = 0) begin
	insert into Academicyear(ayrid)
	values(@ayrid);
	
end
return @cnt;
go


create procedure insert_FallSems
@ayrid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from Academicyear where Academicyear.ayrid = @ayrid);
if(@cnt = 1) begin
	insert into Semester(smsid,ayrid)
	values('Fall',@ayrid);
end
return @cnt;
go

create procedure insert_SpringSems
@ayrid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from Academicyear where Academicyear.ayrid = @ayrid);
if(@cnt = 1) begin
	insert into Semester(smsid,ayrid)
	values('Spring',@ayrid);
end
return @cnt;
go

create procedure check_username
@username varchar(50)
as
select count(*) from users where users.username = @username;
go

create procedure insert_new_person
@pid int, @pfname varchar(50), @plname varchar(50), @email varchar(50), @mobile varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from person where person.pid = @pid);
if(@cnt = 0) begin
	insert into person(pid, pfname, plname, mobile, email)
	values(@pid, @pfname, @plname, @mobile, @email);

end
return @cnt;
go



create procedure insert_new_user
@pid int, @username varchar(50), @password varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from person,users where person.pid = @pid and users.pid = person.pid);
if(@cnt = 0) begin
	insert into users(pid, username, password, rolename)
	values(@pid, @username, @password,'new user');
end
return @cnt;
go



create procedure select_all_users
as
select pid as 'ID', username, rolename as 'Role'
from users;
go


create procedure insert_into_instructor
@pid int
as
declare @cnt int;
set @cnt = (select count(*) from person,users where person.pid = @pid and users.pid = person.pid);
if(@cnt != 0) begin
	insert into instructor(pid)
	values(@pid);
end
return @cnt;
go


create procedure make_instructor
@pid int
as
declare @cnt int;
set @cnt = (select count(*) from person,users where person.pid = @pid and users.pid = person.pid);
if(@cnt != 0) begin
	update users
	set users.rolename = 'Instructor'
	where users.pid = @pid;
end
return @cnt;
go


create procedure get_id_by_username
@username varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from users where users.username = @username);
if(@cnt != 0) begin
	select users.pid
	from users
	where users.username = @username;
end
return @cnt;
go

create procedure remove_instructor
@pid int
as
declare @cnt int;
set @cnt = (select count(*) from person,users where person.pid = @pid and users.pid = person.pid);
if(@cnt != 0) begin
	delete from instructor
	where instructor.pid = @pid;
end
return @cnt;
go


create procedure make_instructor_user
@pid int
as
declare @cnt int;
set @cnt = (select count(*) from person,users where person.pid = @pid and users.pid = person.pid);
if(@cnt != 0) begin
	update users
	set users.rolename = 'new user'
	where users.pid = @pid;
end
return @cnt;
go

create procedure delete_user
@pid int
as
declare @cnt int;
set @cnt = (select count(*) from person,users where person.pid = @pid and users.pid = person.pid);
if(@cnt != 0) begin
	delete from users
	where users.pid = @pid;
end
return @cnt;
go

create procedure select_depratement_by_fctid
@fctid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from departement where departement.fctid = @fctid);
if(@cnt != 0) begin
	select departement.dptid as 'ID', departement.dptname as 'Name'
	from departement
	where departement.fctid = @fctid;
end
return @cnt;
go


create procedure select_student_in_faculty
@fctid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from departement where departement.fctid = @fctid);
if(@cnt != 0) begin
	select person.pid as 'ID', CONCAT(person.pfname,' ',person.plname) as 'Name', departement.dptname as 'Departement'
	from departement, student, person
	where departement.dptid = student.dptid and student.pid = person.pid and departement.fctid = @fctid;
end
return @cnt;
go


create procedure insert_new_std
@pid int, @dptid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from person where person.pid = @pid);
if(@cnt != 0) begin
	insert into student(pid, dptid)
	values(@pid, @dptid);
end
return @cnt;
go

create procedure std_update
@pid int, @pfname varchar(50), @plname varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from person, student where person.pid = student.pid and student.pid = @pid);
if(@cnt = 1) begin
	update person
	set person.pfname = @pfname, person.plname = @plname
	where pid = @pid;
end
return @cnt;
go

create procedure select_all_courses
as
select Course.cid as 'ID', Course.cname as 'Course Name'
from Course
go


create procedure insert_new_course
@cid varchar(50), @cname varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from course where course.cid = @cid);
if(@cnt = 0)begin
	insert into Course(cid, cname)
	values(@cid, @cname)
end
return @cnt
go

create procedure course_update
@cid varchar(50), @cname varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from course where course.cid = @cid);
if(@cnt = 1) begin
	update Course
	set cname = @cname
	where cid = @cid;
end
return @cnt;
go

create procedure select_max_exmID
as
select max(exam.exmid)
from exam
go


create procedure insert_new_exm
@exmId int, @examDate varchar(50), @startTime varchar(50), @endtime varchar(50), @duration varchar(50), @examType varchar(50), @cid varchar(50)
as
declare @cnt int;
set @cnt = (select exam.exmid from exam where exam.exmid = @exmId);
if(@cnt = 0)begin
	insert into exam(exmid, examDate, startTime, endTime, duration, examType, cid)
	values(@exmid, @examDate, @startTime, @endTime, @duration, @examType, @cid)
end
return @cnt
go

create procedure select_all_exm
as
select exam.examDate as 'date', exam.startTime as 'Start', exam.endTime as 'End', exam.examType as 'Type', exam.cid as 'CID'
from exam
go

create procedure select_hall_by_fctid
@fctid as varchar(20)
as
select hall.hid as 'ID', hall.nbOfSeats as 'Number of seats'
from hall
where hall.fctid = @fctid;
go

create procedure insert_new_hall
@hid varchar(50), @number int,@fctid varchar(20)
as
declare @cnt int;
set @cnt = (select count(hall.hid) exam from hall where hall.hid = @hid);
if(@cnt = 0)begin
	insert into hall(hid, nbOfSeats, fctid)
	values(@hid, @number, @fctid)
end
return @cnt
go


create procedure delete_hall
@hid varchar(50)
as
declare @cnt int;
set @cnt = (select count(hall.hid) exam from hall where hall.hid = @hid);
if(@cnt != 0) begin
	delete from hall
	where hall.hid = @hid;
end
return @cnt;
go

create procedure hall_update
@hid varchar(50), @number int
as
declare @cnt int;
set @cnt = (select count(hall.hid) exam from hall where hall.hid = @hid);
if(@cnt = 1) begin
	update hall
	set hall.nbOfSeats = @number
	where hid = @hid;
end
return @cnt;
go

create procedure register_new_course
@pid varchar(50), @cid varchar(50), @ayrid varchar(50), @smsid varchar(50)
as
declare @cnt1 int;
declare @cnt2 int;
set @cnt1 = (select count(student.pid) from student where student.pid = @pid);
set @cnt2 = (select count(Course.cid) from Course where Course.cid = @cid);
if(@cnt1 = 1)begin
	if(@cnt2 = 1)begin
		insert into Register(pid, cid, ayrid, smsid)
		values(@pid, @cid, @ayrid, @smsid)
	end
end
go


create procedure view_registered_course
@pid varchar(50), @ayrid varchar(50), @smsid varchar(50)
as
declare @cnt1 int;
set @cnt1 = (select count(student.pid) from student where student.pid = @pid);
if(@cnt1 = 1)begin
	select Register.cid as 'ID', Course.cname as 'Name'
	from Register, Course
	where Register.cid = Course.cid and Register.pid = @pid and Register.smsid = @smsid and Register.ayrid = @ayrid;
end
go

create procedure delete_registered_course
@pid varchar(50), @cid varchar(50), @ayrid varchar(50), @smsid varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from Register where Register.pid = @pid and Register.cid = @cid and Register.ayrid = @ayrid and Register.smsid = @smsid);
if(@cnt = 1)begin
	delete from Register
	where Register.pid = @pid and Register.cid = @cid and Register.ayrid = @ayrid and Register.smsid = @smsid;
end
go


create procedure select_number_of_student_in_course
@cid as varchar(50), @sms varchar(50), @aca varchar(50)
as
select count(*) 
from Register
where Register.cid = @cid and Register.smsid = @sms and Register.ayrid = @aca;
go

create procedure select_count_hall_by_fctid
@fctid as varchar(20)
as
select count(*)
from hall
where hall.fctid = @fctid;
go


create procedure get_exam_info_by_course_info
@cid varchar(50), @examType varchar(50)
as
select exam.examDate as 'Date', exam.startTime as 'Start', exam.endTime as 'End', exam.examType as 'Type'
from exam
where exam.cid = @cid and exam.examType = @examType;
go



create procedure check_hall
@hid varchar(50), @date varchar(50), @start varchar(50), @end varchar(50)
as
select count(*)
from seating, exam
where seating.exmid = exam.exmid and seating.hid = @hid and exam.examDate = @date and exam.startTime = @start and exam.endTime = @end;
go


create procedure select_student_register_in_course
@cid varchar(50), @sms varchar(50), @aca varchar(50) 
as
select Register.pid as 'ID'
from Register
where Register.ayrid = @aca and Register.smsid = @sms and Register.cid = @cid;
go

create procedure get_examid_by_course_info
@cid varchar(50), @examType varchar(50), @date varchar(50)
as
select exam.exmid as 'ID'
from exam
where exam.cid = @cid and exam.examType = @examType and exam.examDate = @date;
go

create procedure student_seating
@hid varchar(50), @pid int,@examid varchar(50)
as
	insert into seating(hid, exmid, pid)
	values(@hid, @examid, @pid);
go


create procedure select_hall_student_exam
@pid int, @sms varchar(50), @aca varchar(50), @examType varchar(50)
as
select seating.hid as 'Hall', exam.examDate as 'Date', exam.startTime as 'Start', exam.endTime as 'End', exam.duration as 'Duration'
from seating, exam
where seating.exmid = exam.exmid and seating.pid = @pid and exam.examType = @examType
 and seating.pid in 
 (select Register.pid
  from Register, Course
  where Register.cid = Course.cid
  and Register.smsid = @sms 
  and Register.ayrid = @aca);							
go

create procedure check_from_exam
@cid varchar(50), @examDate varchar(50), @examType varchar(50)
as
select count(*)
from exam as e
where e.cid = @cid and e.examDate = @examDate and e.examType = @examType;
go

create procedure exam_update
@cid varchar(50), @examDate varchar(50), @examType varchar(50), @start varchar(50), @end varchar(50)
as
declare @cnt int;
set @cnt = (select count(*) from exam as e where e.cid = @cid and e.examDate = @examDate and e.examType = @examType);
if(@cnt = 1) begin
	update exam
	set startTime = @start, endTime = @end
	where cid = @cid and examDate = @examDate and examType = @examType;
end
return @cnt
go


create procedure select_hall_student_exam
@pid int, @sms varchar(50), @aca varchar(50), @examType varchar(50)
as
select seating.hid as 'Hall', exam.examDate as 'Date', exam.startTime as 'Start', exam.endTime as 'End', exam.duration as 'Duration'
from seating, exam
where seating.exmid = exam.exmid and seating.pid = @pid and exam.examType = @examType
 and seating.pid in 
 (select Register.pid
  from Register, Course
  where Register.cid = Course.cid
  and Register.smsid = @sms 
  and Register.ayrid = @aca);							
go

create procedure check_std
@pid int 
as 
select count(*)
from student
where student.pid = @pid
go

create procedure check_std_reg
@pid varchar(50), @cid varchar(50), @ayrid varchar(50), @smsid varchar(50) 
as 
select count(*)
from student,Register
where student.pid = @pid and Register.cid = @cid and Register.ayrid = @ayrid and Register.smsid = @smsid;
go