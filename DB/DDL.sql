create table person(
pid int not null,
pfname varchar(50) not null,
plname varchar(50) not null,
email varchar(100),
mobile varchar(50),
constraint pk_pid PRIMARY KEY (pid)
);

create table student(
pid int not null,
dptid varchar(50) not null,
constraint pk_stdpid primary key (pid)
);

create table instructor(
pid int not null,
constraint pk_inspid primary key (pid)
);

create table adminn(
pid int not null,
constraint pk_admpid primary key (pid)
);

ALTER TABLE student 
ADD constraint fk_student_person
FOREIGN KEY(pid) REFERENCES person(pid)
ON DELETE CASCADE;

ALTER TABLE instructor 
ADD constraint fk_instructor_person
FOREIGN KEY(pid) REFERENCES person(pid);

ALTER TABLE adminn 
ADD constraint fk_adminn_person
FOREIGN KEY(pid) REFERENCES person(pid);


create table users(
pid int not null,
username varchar(50) not null,
password varchar(50) not null,
rolename varchar(50) not null,
constraint pk_userpid PRIMARY KEY (pid)
);

ALTER TABLE users 
ADD constraint fk_users_person
FOREIGN KEY(pid) REFERENCES person(pid);

alter table users
add constraint ck_rolename 
check (rolename ='admin' or rolename = 'instructor');

create table loginhistory(
lgnid int not null,
pid int not null,
lgnDate date not null,
lgnTime Time not null,
constraint pk_loginhistory PRIMARY KEY (lgnid)
);

ALTER TABLE loginhistory 
ADD constraint fk_loginhistory_users
FOREIGN KEY(pid) REFERENCES users(pid);








create table faculty(
	fctid varchar(20),
	fctname varchar(50) not  null,
	pid int not  null,
	constraint pk_fctid PRIMARY KEY (fctid)
);

ALTER TABLE faculty 
ADD constraint fk_faculty_instructor
FOREIGN KEY(pid) REFERENCES instructor(pid);

create table departement(
	dptid varchar(50),
	dptname varchar(50) not null,
	fctid varchar(20) not null,
	constraint pk_departement PRIMARY KEY (dptid)
);

ALTER TABLE departement 
ADD constraint fk_departement_faculty 
FOREIGN KEY(fctid) REFERENCES faculty(fctid);


ALTER TABLE student 
ADD constraint fk_student_departement
FOREIGN KEY(dptid) REFERENCES departement(dptid);




create table Academicyear(
ayrid varchar(50),
constraint pk_academicyear PRIMARY KEY (ayrid)
);

create table Semester(
smsid varchar(50),
ayrid varchar(50),
constraint pk_semester PRIMARY KEY (smsid, ayrid)
);

ALTER TABLE Semester 
ADD constraint fk_semester_academicyear
FOREIGN KEY(ayrid) REFERENCES Academicyear(ayrid);

create table Course(
	cid varchar(50),
	cname varchar(50),
	constraint pk_course PRIMARY KEY (cid)
);

create table Register(
	smsid varchar(50),
	ayrid varchar(50),
	pid int,
	cid varchar(50),
	constraint pk_register PRIMARY KEY (smsid, ayrid, cid, pid)
);

alter table Register
add constraint fk_registration_semester
foreign key (smsid, ayrid) references Semester (smsid, ayrid);

alter table Register
add constraint fk_registration_course
foreign key (cid) references Course (cid);

alter table Register
add constraint fk_registration_student
foreign key (pid) references Student (pid)
on delete cascade;








create table hall(
hid varchar(50) not null,
nbOfSeats int not null,
constraint pk_hall primary key (hid)
);

ALTER TABLE Hall
ADD fctid varchar(20);

alter table Hall
add constraint fk_hall_faculty
foreign key (fctid) references faculty(fctid);

create table exam(
exmid int not null,
examDate date,
startTime time,
endTime time,
duration float,
examType varchar(50),
cid varchar(50),
constraint pk_exam PRIMARY Key (exmid)
);

alter table Exam
add constraint ck_examType 
check (examType ='partiel' or examType = 'final');

alter table Exam
add constraint fk_exam_course
foreign key (cid) references course(cid);



create table seating(
pid int not null,
hid varchar(50) not null,
exmid int not null,
constraint pk_seating PRIMARY KEY (pid, hid, exmid)
);

alter table seating
add constraint fk_seating_student
foreign key (pid) references student (pid)
on delete cascade;

alter table seating
add constraint fk_seating_exam
foreign key (exmid) references exam (exmid);

alter table seating
add constraint fk_seating_hall
foreign key (hid) references hall (hid);
