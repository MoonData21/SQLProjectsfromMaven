-- View the table of student information.
select * from students;

select * from students
limit 5;

select student_name, gpa, school_lunch
from students;

-- Show students who gets a school lunch
select student_name, gpa, school_lunch
from students
where school_lunch = 'Yes';

-- Get the count instead.
select count(*)
from students
where school_lunch = 'Yes';

select student_name, gpa, school_lunch
from students
where school_lunch = 'Yes' and gpa > 3.3;

-- sort the student by gpa (order by)
select * from students
where school_lunch = 'Yes'
order by gpa desc;

-- Getting unique GPA values
select distinct gpa from students
order by gpa desc;

-- show the average gpa for each grade level (group by)
select grade_level, avg(gpa) as AvgGPA from students
group by grade_level 
order by grade_level desc;

-- show the grade levels with an average gpa below 3.3 (having)

select grade_level, avg(gpa) as AvgGPA from students
group by grade_level 
having AvgGPA < 3.3
order by grade_level desc;

-- Full Join
select s.id, s.student_name, sg.class, sg.final_grade
from students s left join student_grades sg
	on students.id = student_grades.student_id;
    

