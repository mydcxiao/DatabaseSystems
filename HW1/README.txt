######################################################################################################################################################
NAME: Yuhang Xiao
USC NetID: YXiao776
CSCI 585 
HOMEWORK #1




The objective: 

Design a database for a small 'STEM' organization that is interested in offering coding courses and hands-on projects in their community, during summer vacation.




Entities and Attributes:

==========================







1.CURRICULUM

=================

This entity is used to represent all the curriculums (courses and projects) that the summer camp offered, which is a also a super type of COURSE and PROJECT.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------




Require Attribute:

-------------------------

CUR_CODE(PK)
CUR_NAME
CUR_TYPE



DISCRIMNATOR:

--------------------------

CUR_TYPE







2.CLASS

========

CLASS_CODE for each class is unique.

CLASS is the different sections of each COURSE or PROJECT offered in different weeks. Assume each class is located in a single room for one week until its end. 

------------------------------------------------------------------------------------------------------------------------------




Require Attribute:

-------------------------

CLASS_CODE(PK), CLASS_TIME, CLASS_WEEK, CUR_CODE(FK), ROOM_CODE(FK)






3.PROJECT

==========

PROJECT is a sub type of CURRICULUM, which represents the project class offered. 

------------------------------------------------------------------------------------------------------------------------------




Attribute:

-------------------------

CUR_CODE(PK), PROJ_DESCRIPTION, PROJ_CHG_HOUR and attributes inherited from CURRICULUM.







4.COURSE

=========

COURSE is a sub type of CURRICULUM, which represents the coding course offered.

------------------------------------------------------------------------------------------------------------------------------




Attribute:

-------------------------

CUR_CODE(PK), CRS_DESCRIPTION, CRS_CHG_HOUR and attributes inherited from CURRICULUM.







5.ROOM

====================

ROOM_CODE is unique. Assume one room is used by a unique class for a week.

------------------------------------------------




Require Attribute:

-------------------------

ROOM_CODE(PK), ROOM_ADDRESS







6.TABLE

=======

Assume one table is used by a kind of PROJECT (the same CUR_CODE). 

TABLE_NUM is unique for each table.

----------------------------------------------------------------------------------------------------------------------------------------------------------------




Require Attribute:

-------------------------

TABLE_NUM(PK), CUR_CODE(FK), TABLE_BOX




Other Attributes:

--------------------------







7.DISTRIBUTION

========================

Type and amount of PART distributed for a particular table.

DIS_NUM is unique

-----------------------------------------------------------




Require Attribute:

-------------------------

DIS_NUM(PK), PART_CODE(FK), TABLE_NUM(FK), DIS_AMOUNT




Other Attributes:

--------------------------






 

8.PART

=====================

PART including microcontroller, wheels, wires and so on, which is needed by the PROJECT.
PART_CODE is unique.

------------------------------




Require Attribute:

-------------------------

PART_CODE(PK), PART_NAME, PART_AMOUNT




Other Attributes:

--------------------------







9.ORDER

=======

ORDER is a table of orders made for purchasing PART with different VENDOR.

--------------------------------------------------------------------------------------------




Require Attribute:

-------------------------

ORDER_NUM(PK), VENDOR_ID(FK), PART_CODE(FK), ORDER_AMOUNT, ORDER_PRICE, ORDER_TIME




Other Attributes:

--------------------------








10. VENDOR

=============

This table is used to place the online hardware supplier.

------------------------------------------------------------------------------------------------------------------------------




Require Attribute:

-------------------------

VENDOR_ID(PK), VENDOR(NAME)




Other Attributes:

--------------------------







11.INSTUCTOR

===========

This table is used to place all the instructors.

------------------------------------------------------------------------------------------------------------------------------




Require Attribute:

-------------------------

INS_ID(PK), INS_FNAME, INS_LNAME, INS_INITIAL




Other Attributes:

--------------------------







12.ASSIGNMENT

=========

The table is used to place all the teaches and supervises for all instructors.

--------------------------------------------------------------------------------




Require Attribute:

-------------------------

ASSIGN_NUM(PK), CLASS_CODE(FK), INS_ID(FK), ASSIGN_HOURS, ASSIGN_CHG_HOURS




Other Attributes:

--------------------------







13.TEXTBOOK

==========

The table is used to place all textbooks that specified by different instructors for different courses.

------------------------------------------------------------------------------------------------------------


Require Attribute:

-------------------------

TEXT_CODE(PK), INS_ID(FK), CUR_CODE(FK), TEXT_NAME




Other Attributes:

--------------------------







14.STUDENT

==============

The table is used to place all students. STD_FEE indicates the remained fee the student is required to submit.

---------------------------------------------------------------------------------------




Require Attribute:

-------------------------

STD_ID(PK), STD_LNAME, STD_FNAME, STD_INITIAL, STD_FEE




Other Attributes:

--------------------------







15.ENROLL

=============================

The table is used to place all enrollments including PROJECT and COURSE(they are CLASS).

-------------------------------------------------------------------------------------------------------------------------------------------




Require Attribute:

-------------------------

ENROLL_NUM(PK), STU_ID(FK), CLASS_CODE(FK)




Other Attributes:

--------------------------








16.PARTICIPANT

=================

The table is used to place all groups that a student has participated in during project classes.

------------------------------------------------------------------------------------------------------



Require Attribute:

-------------------------

PARTC_NUM(PK), STU_ID(FK), GROUP_ID(FK)




Other Attributes:

--------------------------







17.GROUP

===============

The table is used to place all groups of all project classes.

---------------------------------------------------------------------------------------------------------------------------------------------------------




Require Attribute:

-------------------------

GROUP_ID(PK), TABLE_NUM(FK), GROUP_TIME




Other Attributes:

--------------------------







18.BOOK

================

The table is used to place all books in the library.

--------------------------------------------------------

Require Attribute:

-------------------------

BOOK_CODE(PK), BOOK_NAME, BOOK_AMOUNT




Other Attributes:

--------------------------






19.RECORD

================

The table is used to place all checkout records of students.

--------------------------------------------------------

Require Attribute:

-------------------------

RECORD_NUM(PK), BOOK_CODE(FK), STD_ID(FK), RECORD_TIME




Other Attributes:

--------------------------






20.RATE_INS

================

The table is used to place all rates of instructors.

--------------------------------------------------------

Require Attribute:

-------------------------

RATE_INS_NUM(PK), STD_ID(FK), INS_ID(FK), RATE_INS_SCORE




Other Attributes:

--------------------------







21.RATE_CRS

================

The table is used to place all rates of courses.

--------------------------------------------------------

Require Attribute:

-------------------------

RATE_CRS_NUM(PK), STD_ID(FK), CUR_CODE(FK), RATE_CRS_SCORE




Other Attributes:

--------------------------








22.RATE_PROJ

================

The table is used to place all rates of projects.

--------------------------------------------------------


Require Attribute:

-------------------------

RATE_PROJ_NUM(PK), STD_ID(FK), CUR_CODE(FK), RATE_PROJ_SCORE




Other Attributes:

--------------------------







##############################################################################################################################################
