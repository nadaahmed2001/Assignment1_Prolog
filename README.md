# Assignment1_Prolog
My solution for Assignment1 in AI using prolog

# Assignment Description:
  Given the attached knowledge base "students_courses.pl" containing students' grades in
  some courses and courses' prerequisites, you are required to write a Prolog program
  that solves the tasks explained below.

## Task1:
  Get the list of students (IDs & grades in nested lists) who have taken a specific cours
  ### Example:
    ?- studentsInCourse('Robotics', Students).
    Students = [[stud06, 62], [stud09, 29]]
 
 ## Task2:
   Get the number of students who have taken a specific course.
   ### Example:
     ?- numStudents('Algorithms', Num).
     Num = 0
   
## Task3:
  Get the maximum grade that a specific student was able to obtain.

  ### Example:
    ?- maxStudentGrade(stud10, MaxGrade).
    MaxGrade = 97




