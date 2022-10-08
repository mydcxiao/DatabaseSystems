--database software: Oracle liveSQL
--Name: Yuhang Xiao, NetID: YXiao776
-- Expect output:

-- | ClassName  | Total |
--   ----------- -------
-- | JavaScript |  4    |
-- | Python     |  4    |
-- | Scratch    |  3    |  
-- | Processing |  1    |
-- | Java       |  1    |

create table enrollment (    
  StuID        number not null,    
  ClassName    varchar2(25) not null,    
  Grade        char(1),    
  primary key (StuID, ClassName));

insert into enrollment (StuID, ClassName, Grade) values (123,'Processing', 'A');
insert into enrollment (StuID, ClassName, Grade) values (123,'Python', 'B');
insert into enrollment (StuID, ClassName, Grade) values (123,'Scratch', 'B');
insert into enrollment (StuID, ClassName, Grade) values (662,'Java', 'B');
insert into enrollment (StuID, ClassName, Grade) values (662,'Python', 'A');
insert into enrollment (StuID, ClassName, Grade) values (662,'JavaScript', 'A');
insert into enrollment (StuID, ClassName, Grade) values (662,'Scratch', 'B');
insert into enrollment (StuID, ClassName, Grade) values (345,'Scratch', 'A');
insert into enrollment (StuID, ClassName, Grade) values (345,'JavaScript', 'B');
insert into enrollment (StuID, ClassName, Grade) values (345,'Python', 'A');
insert into enrollment (StuID, ClassName, Grade) values (555,'Python', 'B');
insert into enrollment (StuID, ClassName, Grade) values (555,'JavaScript', 'B');
insert into enrollment (StuID, ClassName, Grade) values (213,'JavaScript', 'A');

select ClassName, count(StuID) from enrollment  
group by ClassName 
order by count(StuID) desc;

