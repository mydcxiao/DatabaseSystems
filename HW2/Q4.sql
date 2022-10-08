--database software: Oracle liveSQL
--Name: Yuhang Xiao, NetID: YXiao776
--Assume each student can only take a duplicate class with a different instructor
--Create two tables. rateByClass: stores different hourly rate of different kinds of class.
--enrollment: stores enrollment information of students, classname and class instructor
--Expected Output: 5 (Instructor 001 who teaches four classes and 'Processing' class has 20 hourly rate.)

create table rateByClass ( 
  ClassName varchar2(25), 
  HourRate number(9, 2) not null, 
  primary key (ClassName));

create table enrollment (     
  StuID        char(3),     
  ClassName    varchar2(25),     
  InsID        char(3),     
  primary key (ClassName, InsID, StuID), 
  foreign key (ClassName) references rateByClass);

insert into rateByClass (ClassName, HourRate) values ('Java', 10.00);
insert into rateByClass (ClassName, HourRate) values ('JavaScript', 10.00);
insert into rateByClass (ClassName, HourRate) values ('Python', 10.00);
insert into rateByClass (ClassName, HourRate) values ('Processing', 20.00);
insert into rateByClass (ClassName, HourRate) values ('Scratch', 10.00);

insert into enrollment (StuID, ClassName, InsID) values ('123','Processing', '001');
insert into enrollment (StuID, ClassName, InsID) values ('123','Python', '001');
insert into enrollment (StuID, ClassName, InsID) values ('123','Scratch', '001');
insert into enrollment (StuID, ClassName, InsID) values ('662','Java', '002');
insert into enrollment (StuID, ClassName, InsID) values ('662','Python', '002');
insert into enrollment (StuID, ClassName, InsID) values ('662','JavaScript', '003');
insert into enrollment (StuID, ClassName, InsID) values ('662','Scratch', '002');
insert into enrollment (StuID, ClassName, InsID) values ('345','Scratch', '003');
insert into enrollment (StuID, ClassName, InsID) values ('345','JavaScript', '002');
insert into enrollment (StuID, ClassName, InsID) values ('345','Python', '003');
insert into enrollment (StuID, ClassName, InsID) values ('555','Python', '004');
insert into enrollment (StuID, ClassName, InsID) values ('555','JavaScript', '001');
insert into enrollment (StuID, ClassName, InsID) values ('213','JavaScript', '004');

select max(bonus) 
    from (select sum(0.1 * HourRate * counts) as bonus 
        from (select InsID, ClassName, count(StuID) as counts 
            from enrollment 
            group by InsID, ClassName) e inner join rateByClass c on e.ClassName = c.ClassName 
        group by InsID);

