%
student(stud01, 'Programming 1', 90).
student(stud01, 'Math 1', 78).
student(stud01, 'Statistics 1', 94).
student(stud01, 'Electronics 1', 81).
student(stud01, 'Management', 66).
student(stud01, 'English', 83).
student(stud02, 'OS 1', 65).
student(stud02, 'Math 1', 50).
student(stud02, 'Data Communication', 76).
student(stud03, 'OOP', 68).
student(stud03, 'Math 1', 63).
student(stud03, 'Statistics 1', 98).
student(stud03, 'Electronics 2', 72).
student(stud04, 'Database', 59).
student(stud04, 'Math 3', 67).
student(stud04, 'Data Structures', 79).
student(stud05, 'Programming 1', 88).
student(stud05, 'Math 1', 75).
student(stud05, 'Statistics 1', 96).
student(stud05, 'Electronics 1', 89).
student(stud05, 'Management', 84).
student(stud06, 'Robotics', 62).
student(stud07, 'Programming 1', 50).
student(stud07, 'Math 2', 8).
student(stud07, 'Statistics 2', 70).
student(stud07, 'Electronics 1', 47).
student(stud08, 'OS 1', 71).
student(stud09, 'Robotics', 29).
student(stud09, 'Database', 57).
student(stud10, 'Data Structures', 82).
student(stud10, 'Math 2', 64).
student(stud10, 'Data Communication', 85).
student(stud10, 'Database', 46).
student(stud10, 'Electronics 2', 58).
student(stud10, 'Statistics 2', 97).
%
prerequisite('Programming 1', 'OOP').
prerequisite('OOP', 'OS 1').
prerequisite('OS 1', 'OS 2').
prerequisite('OOP', 'Data Structures').
prerequisite('Data Structures', 'Algorithms').
prerequisite('Algorithms', 'Advanced Algorithms').
prerequisite('Math 1', 'Math 2').
prerequisite('Math 2', 'Math 3').
prerequisite('Math 3', 'Math 4').
prerequisite('Statistics 1', 'Statistics 2').
prerequisite('Electronics 1', 'Electronics 2').
prerequisite('Electronics 2', 'Computer Architecture').
prerequisite('Computer Architecture', 'Microprocessors').
prerequisite('Data Communication', 'Networks').
prerequisite('Database', 'Data Warehouses').



/*Task1:
Get the list of students (IDs & grades in nested lists) who have taken a specific course.*/

/*Implementing the member() function*/
/*Base case*/
myMemberFunction(X, [X|_]).
/*Recursive case*/
myMemberFunction(X, [H|T]) :-
    myMemberFunction(X, T).

/*Implementing the append function*/
/*BaseCase*/
myappend([], L2, L2).
/*RecursiveCase*/
myappend([H|T], L2, [H|R]) :-
    myappend(T, L2, R).

studentsInCourse(Course, Students):-
	studentsInCourse(Course,[],Students).
studentsInCourse(Course,TmpList, Students):-  
	student(X,Course,Y),
	not(myMemberFunction([X,Y] , TmpList)),!,
	myappend(TmpList, [[X,Y]], NewTmpList),
	studentsInCourse(Course,NewTmpList, Students).
studentsInCourse(Course,Students,Students).



/*Task2:
Get the number of students who have taken a specific course.*/
/*First:implement the length function*/
/*BaseCase*/
mylength([], 0).
/*RecursiveCase*/
mylength([H|T], N):-
    mylength(T, N1),
    N is N1 + 1.

numStudents(Course, Num):-
    studentsInCourse(Course,List),
    mylength(List, Num).


/*Task3:
Get the maximum grade that a specific student was able to obtain.*/
maxStudentGrade(Student, MaxGrade) :-
    findall(
        Grade,
        (
            student(Student, _, Grade)
        ),
        Grades
    ),
    max_list(Grades, MaxGrade).



/*Task4:
Show a student's grade digits in a specific course as a list of words.*/
    word(0, 'zero').
    word(1, 'one').
    word(2, 'two').
    word(3, 'three').
    word(4, 'four').
    word(5, 'five').
    word(6, 'six').
    word(7, 'seven').
    word(8, 'eight').
    word(9, 'nine').
gradeInWords(Student, Course, GradeDigits) :-
    student(Student, Course, Grade),
    X is (Grade // 10) mod 10,
    Y is Grade mod 10,
    word(X, First),
    word(Y, Second),
    GradeDigits = [[First], [Second]],!.