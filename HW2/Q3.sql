--database software: Oracle liveSQL
--Name: Yuhang Xiao, NetID: YXiao776\
--Expected Output: P100

create table ProjectStep(  
PID varchar(10),  
Step varchar(100),  
Status char(1) not null,  
primary key (PID, Step));

insert into ProjectStep (PID, Step, Status) values ('P100', '0', 'C');
insert into ProjectStep (PID, Step, Status) values ('P100', '1', 'W');
insert into ProjectStep (PID, Step, Status) values ('P100', '2', 'W');
insert into ProjectStep (PID, Step, Status) values ('P201', '0', 'C');
insert into ProjectStep (PID, Step, Status) values ('P201', '1', 'C');
insert into ProjectStep (PID, Step, Status) values ('P333', '0', 'W');
insert into ProjectStep (PID, Step, Status) values ('P333', '1', 'W');
insert into ProjectStep (PID, Step, Status) values ('P333', '2', 'W');
insert into ProjectStep (PID, Step, Status) values ('P333', '3', 'W');

select distinct E.PID  
from ProjectStep E 
where (select count(P.Step) from ProjectStep P where P.PID = E.PID and P.Status = 'C') = 1;

