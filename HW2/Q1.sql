--database software: Oracle liveSQL
--Name: Yuhang Xiao, NetID: YXiao776
--use check to restrict the range of roomNum, startTime and endTime
--create a trigger and a new attribute timeFlag to check if the time is valid(check the two invalid situations)

CREATE TABLE ProjectRoomBookings 
(roomNum INTEGER NOT NULL CHECK(1<= roomNum AND roomNum <= 10), 
startTime INTEGER NOT NULL CHECK(startTime >= 7), 
endTime INTEGER NOT NULL CHECK(endTime <= 18), 
groupName CHAR(10) NOT NULL, 
timeFlag NUMBER(1) NOT NULL CHECK(timeFlag = 1), 
PRIMARY KEY (roomNum, startTime));;

CREATE OR REPLACE TRIGGER clashCheck  
BEFORE INSERT OR UPDATE OF startTime, endTime ON ProjectRoomBookings 
FOR EACH ROW 
DECLARE  
    CURSOR timeCursor IS 
        SELECT startTime, endTime   
            FROM ProjectRoomBookings 
            WHERE roomNum = :NEW.roomNum; 
    w_startTime ProjectRoomBookings.startTime%TYPE; 
    w_endTime ProjectRoomBookings.endTime%TYPE; 
            
BEGIN 
    :NEW.timeFlag := 1;
    IF :NEW.startTime >= :NEW.endTime THEN 
       :NEW.timeFlag := 0; 
    ELSE  
       OPEN timeCursor; 
       LOOP 
        FETCH timeCursor INTO w_startTime, w_endTime; 
        EXIT WHEN timeCursor%NOTFOUND; 
        IF :NEW.startTime < w_endTime AND :NEW.endTime > w_startTime THEN 
            :NEW.timeFlag := 0; 
        END IF; 
       END LOOP; 
       CLOSE timeCursor; 
    END IF; 
END; 


-- test case:
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 9, 12, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 9, 7, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 6, 8, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 13, 13, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 17, 19, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(007, 9, 12, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(007, 10, 11, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(007, 8, 9, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(007, 7, 10, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 7, 10, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 8, 9, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 10, 12, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 9, 11, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 8, 11, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 12, 14, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 11, 13, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 12, 14, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 16, 17, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 17, 18, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 16, 18, ’aaa');