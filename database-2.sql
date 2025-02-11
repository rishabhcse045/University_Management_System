//create table login
create table login(username varchar(29), password varchar(25));

//inserting values from login
insert into login values('admin', '12345');

//showing values from login
select * from login;

//deleting values from login
truncate table login;


//create table student
CREATE TABLE student (
    name VARCHAR(40),
    fname VARCHAR(40),
    rollno VARCHAR(20),
    dob VARCHAR(40),
    address VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(40),
    class_x VARCHAR(20),
    class_xii VARCHAR(20),
    aadhar VARCHAR(20),
    course VARCHAR(40),
    branch VARCHAR(40)
);

//trigger to check student phone number length
CREATE OR REPLACE TRIGGER check_contact_length
BEFORE INSERT ON student
FOR EACH ROW
DECLARE
    contact_length EXCEPTION;
BEGIN
    IF LENGTH(:NEW.phone) != 9 THEN
        RAISE contact_length;
    END IF;
EXCEPTION
    WHEN contact_length THEN
        RAISE_APPLICATION_ERROR(-20001, 'Contact number must be 9 digits long');
END;
/

//create table student
CREATE TABLE teacher (
    name VARCHAR(40),
    fname VARCHAR(40),
    empId VARCHAR(20),
    dob VARCHAR(40),
    address VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(40),
    class_x VARCHAR(20),
    class_xii VARCHAR(20),
    aadhar VARCHAR(20),
    education VARCHAR(40),
    department VARCHAR(40)
);


//trigger to check teacher phone number legth
CREATE OR REPLACE TRIGGER check_phone_length
BEFORE INSERT ON teacher
FOR EACH ROW
DECLARE
    phone_length EXCEPTION;
BEGIN
    IF LENGTH(:NEW.phone) != 9 THEN
        RAISE phone_length;
    END IF;
EXCEPTION
    WHEN phone_length THEN
        RAISE_APPLICATION_ERROR(-20001, 'Contact number must be 9 digits long');
END;
/

///trigger to check teacher aadhar length
CREATE OR REPLACE TRIGGER check_aadhar_length
BEFORE INSERT ON teacher
FOR EACH ROW
DECLARE
    aadhar_length EXCEPTION;
BEGIN
    IF LENGTH(:NEW.aadhar) != 12 THEN
        RAISE aadhar_length;
    END IF;
EXCEPTION
    WHEN aadhar_length THEN
        RAISE_APPLICATION_ERROR(-20001, 'Aadhar number must be 12 digits long');
END;
/

//displaying teacher values
select * from teacher;

//insert values in teacher
insert into teacher values('Shovik', 'sanjit', '1234', '14-02-2004', 'kolkata', '90078377', 'shb@gmail.com', '69%', '90%', '89773839339', 'btech', 'cse');

//create student leave
CREATE TABLE studentleave (
    rollno VARCHAR(30),
    dat VARCHAR(50),
    duration VARCHAR(20)
);


select * from studentleave;

CREATE TABLE teacherleave (
    empId VARCHAR(20),
    dat VARCHAR(50),
    duration VARCHAR(20)
);


CREATE TABLE subject (
    rollno VARCHAR(20),
    semester VARCHAR(20),
    subject1 VARCHAR(50),
    subject2 VARCHAR(50),
    subject3 VARCHAR(50),
    subject4 VARCHAR(50),
    subject5 VARCHAR(50)
);

select * from subject;

insert into subject values ('2211003010270', '1', '89', '78', '99', '79', '95');
insert into subject values ('2211003010270', '2', '87', '98', '89', '89', '95');
insert into subject values ('2211003010272', '1', '86', '68', '39', '79', '95');

CREATE TABLE marks (
    rollno VARCHAR(20),
    semester VARCHAR(20),
    marks1 VARCHAR(50),
    marks2 VARCHAR(50),
    marks3 VARCHAR(50),
    marks4 VARCHAR(50),
    marks5 VARCHAR(50)
);

CREATE TABLE fee (
    course VARCHAR(20),
    semester1 VARCHAR(20),
    semester2 VARCHAR(20),
    semester3 VARCHAR(20),
    semester4 VARCHAR(20),
    semester5 VARCHAR(20),
    semester6 VARCHAR(20),
    semester7 VARCHAR(20),
    semester8 VARCHAR(20)
);


INSERT INTO fee (course, semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8) 
VALUES ('Bsc', '40000', '35000', '35000', '35000', '35000', '35000', '45000', '34000');

INSERT INTO fee (course, semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8) 
VALUES ('Bsc', '40000', '35000', '35000', '35000', '35000', '35000', '45000', '34000');

INSERT INTO fee (course, semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8) 
VALUES ('BCA', '35000', '34000', '34000', '34000', '34000', '34000', '50000', '54000');

INSERT INTO fee (course, semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8) 
VALUES ('MTech', '65000', '60000', '60000', '60000', '34000', '43000', '23000', '34000');

INSERT INTO fee (course, semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8) 
VALUES ('MSc', '47500', '45000', '45000', '45000', '56000', '34000', '65000', '23000');

INSERT INTO fee (course, semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8) 
VALUES ('MCA', '43000', '42000', '42000', '49000', '45000', '23000', '34000', '34000');

INSERT INTO fee (course, semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8) 
VALUES ('Bcom', '22000', '20000', '20000', '20000', '20000', '20000', '67000', '27000');

INSERT INTO fee (course, semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8) 
VALUES ('Mcom', '36000', '30000', '30000', '30000', '45000', '45000', '34000', '45000');

select * from fee;

ALTER TABLE studentleave
MODIFY dates VARCHAR(20);

desc studentleave;

CREATE TABLE collegefee (
    rollno VARCHAR(20),
    course VARCHAR(20),
    branch VARCHAR(20),
    semester VARCHAR(20),
    total VARCHAR(20)
);


//inner join college fee and fee
SELECT cf.rollno, cf.course, cf.branch, cf.semester, cf.total, 
       f.semester1, f.semester2, f.semester3, f.semester4, 
       f.semester5, f.semester6, f.semester7, f.semester8
FROM collegefee cf
INNER JOIN fee f ON cf.course = f.course;


// inner join student and student leave
SELECT s.name, s.fname, s.rollno, s.dob, s.address, s.phone, s.email, s.class_x, s.class_xii, s.aadhar, s.course, s.branch, sl.dat, sl.duration
FROM student s
INNER JOIN studentleave sl ON s.rollno = sl.rollno;

SELECT 
    course,
    semester,
    SUM(CAST(semester1 AS DECIMAL)) AS total_semester1,
    SUM(CAST(semester2 AS DECIMAL)) AS total_semester2,
    SUM(CAST(semester3 AS DECIMAL)) AS total_semester3,
    SUM(CAST(semester4 AS DECIMAL)) AS total_semester4,
    SUM(CAST(semester5 AS DECIMAL)) AS total_semester5,
    SUM(CAST(semester6 AS DECIMAL)) AS total_semester6,
    SUM(CAST(semester7 AS DECIMAL)) AS total_semester7,
    SUM(CAST(semester8 AS DECIMAL)) AS total_semester8
FROM fee
GROUP BY course, semester;

//cursor in teacher table
DECLARE
    -- Declare variables to store data fetched by the cursor
    v_name teacher.name%TYPE;
    v_email teacher.email%TYPE;
    v_contact teacher.phone%TYPE;
BEGIN
    -- Open a cursor to fetch data from the teacher table
    FOR teacher_row IN (SELECT * FROM teacher) LOOP
        -- Assign values to variables from the current row in the cursor
        v_name := teacher_row.name;
        v_email := teacher_row.email;
        v_contact := teacher_row.phone;
        
        -- Print or use the fetched data as needed
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Email: ' || v_email || ', Contact: ' || v_contact);
    END LOOP;
END;
/




