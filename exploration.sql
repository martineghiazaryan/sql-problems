DROP TABLE student;

-- CREATE TABLE student (
--     student_id INT AUTO_INCREMENT,
--     name VARCHAR(30),
--     major VARCHAR(30),
--     PRIMARY KEY(student_id)
-- ) ;


-- INSERT INTO student(name, major) VALUES('Claire', 'History');
-- INSERT INTO student(name, major) VALUES('Hayk', 'French');
-- INSERT INTO student(name, major) VALUES('Art', 'Maths');


-- SELECT student.name, student.major
-- FROM student
-- ORDER BY major;

-- UPDATE student
-- SET major = 'Mathematics'
-- WHERE major = 'Maths';

-- DELETE FROM student
-- WHERE student_id = 1;

-- SELECT * 
-- FROM student 
-- WHERE name IN ('Clair', 'Erik', 'Art')


CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name  VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE Cascade
);


INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);


SELECT * 
FROM employee
ORDER BY sex, first_name, last_name;


SELECT first_name as forename, last_name as surname
FROM employee
LIMIT 5;

SELECT DISTINCT branch_id
FROM employee;


SELECT COUNT(branch_id)
FROM employee;


SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_day > '1970-01-01';


SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

#total sales by employer
SELECT emp_id, SUM(total_sales)
FROM works_with
GROUP BY emp_id;

SELECT * 
FROM client
WHERE client_name LIKE '%Ex';


SELECT * 
FROM branch_supplier
WHERE supplier_name LIKE '% Labels%';


SELECT * 
FROM employee
WHERE birth_day LIKE '%____-10%' ;  #or '%-10-%'

SELECT client_id, branch_id
FROM client;

SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;

insert into branch values(4,'Bufallo', NULL, NULL);

select employee.emp_id, employee.first_name, branch.branch_name
from employee
join branch
on employee.emp_id = branch.mgr_id;

select employee.first_name, employee.last_name
from employee
where employee.emp_id in (
    select works_with.emp_id
    from works_with 
    where works_with.total_sales > 20000
);


select client.client_name
from client
where client.branch_id in (        
    select branch.branch_id
    from branch
    where mgr_id = 102
); 


DELIMITER $$
CREATE
    TRIGGER my_trigger1 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name);
    END$$
DELIMITER ;

DELIMITER $$
CREATE 
    TRIGGER my_trigger2 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
    IF NEW.sex = 'M' THEN 
        INSERT INTO trigger_test VALUES('added male employee');
    ELSEIF NEW.sex = 'F' THEN
        INSERT INTO trigger_test VALUES('added female employee');
    ELSE 
        INSERT INTO trigger_test VALUES('added other employee');
    END IF;
DELIMITER ;



INSERT INTO employee VALUES(110, 'Kevin', 'De-Bruyne', '1997-02-17', 'M', 150000, 104, 3);
INSERT INTO employee VALUES(111, 'James', 'Smith', '1984-02-17', 'M', 65000, 103, 2);


select * from trigger_test;


ALTER TABLE trigger_test DISABLE ALL TRIGGERS