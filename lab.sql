CREATE TABLE students (
    github VARCHAR(30) PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30)
);

CREATE TABLE projects (
    title VARCHAR(30) PRIMARY KEY,
    description TEXT,
    max_grade INTEGER
);

CREATE TABLE grades (
  id SERIAL PRIMARY KEY,
  student_github VARCHAR(30) REFERENCES students,
  project_title VARCHAR(30) REFERENCES projects,
  grade INTEGER
);

INSERT INTO students VALUES ('jhacks', 'jane', 'hacker');
INSERT INTO students VALUES ('sdevelops', 'sarah', 'developer');

INSERT INTO projects VALUES ('Markov', 'Tweets generated from Markov chains', 50), ('Blockly','Programmatic Logic Puzzle Game', 100), ('Snakey','Digital version of real snake', '1000'), ('Hamburger','Hamburger generator',75),('Smokey','Makes smokey',30);

INSERT INTO grades VALUES (DEFAULT,'jhacks', 'Blockly', 2), (DEFAULT,'sdevelops', 'Markov', 50), (DEFAULT,'sdevelops', 'Blockly', 100), (DEFAULT,'jhacks', 'Snakey', 999),
(DEFAULT,'sdevelops', 'Snakey', 100);


DROP TABLE students;

SELECT last_name FROM students;
SELECT github FROM students;
SELECT * FROM students WHERE first_name = 'sarah';
SELECT * FROM students WHERE github = 'sdevelops';
SELECT first_name, last_name FROM students WHERE github = 'jhacks';

SELECT title, max_grade FROM projects WHERE max_grade > 50;
SELECT title, max_grade FROM projects WHERE max_grade > 10 AND max_grade < 60;
SELECT title, max_grade FROM projects WHERE max_grade < 25 OR max_grade > 75;
SELECT * FROM projects ORDER BY max_grade;

SELECT first_name, last_name FROM students WHERE github = 'jhacks';
SELECT project_title, grade FROM grades WHERE student_github = 'jhacks';
SELECT title, max_grade FROM projects;

SELECT * FROM students JOIN grades ON (students.github = grades.student_github);

SELECT students.first_name, students.last_name, grades.project_title, grades.grade FROM students JOIN grades ON (students.github = grades.student_github);

SELECT * FROM students JOIN grades ON (students.github = grades.student_github) JOIN projects ON (grades.project_title = projects.title);


SELECT students.first_name, students.last_name, grades.project_title, grades.grade, projects.max_grade FROM students JOIN grades ON (students.github = grades.student_github) JOIN projects ON (projects.title = grades.project_title);