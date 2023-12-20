-- Selezionare cognome e nome tutti gli insegnanti, ordinati per cognome e poi per nome in ordine alfabetico 
SELECT surname, name 
FROM teachers
ORDER BY surname ;
-- Selezionare tutti gli insegnamenti (courses) che valgono almeno 12 crediti 
SELECT * 
FROM courses 
WHERE cfu >= 12;
-- Selezionare tutti gli studenti nati nel 1990 
SELECT *
FROM students 
WHERE YEAR(date_of_birth) = 1990;
-- Selezionare tutti i corsi del primo semestre del primoanno di un qualsiasi corso di laurea 
SELECT * 
FROM courses 
WHERE year = 1 AND period = 'I semestre';
-- Da quanti dipartimenti è composta l’università?
SELECT COUNT(*) AS department_tot 
FROM departments;
-- Contare tutti gli insegnanti il cui cognome termina con la “E” 
SELECT COUNT(*) 
FROM teachers 
WHERE surname LIKE '%E';
-- Selezionare nome, cognome e codice fiscale di tutti gli studenti iscritti al Corso di Laurea in Economia, in ordine alfabetico
SELECT s.name ,s.surname ,s.fiscal_code 
FROM students s 
JOIN exam_student es ON s.id = es.student_id
JOIN exams e ON es.exam_id = e.id 
JOIN courses c ON e.course_id = c.id
JOIN `degrees` d  ON c.degree_id  = d.id
WHERE d.name  ='Corso di Laurea in Economia';
-- versione corta
select s.surname, s.name, s.fiscal_code ,d.department_id 
FROM students s
JOIN `degrees` d ON s.degree_id = d.id
WHERE d.name  ='Corso di Laurea in Economia'
ORDER BY s.surname ; 
-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM `degrees` d
JOIN departments d2 ON d.department_id = d2.id
WHERE d2.name = 'Dipartimento di Neuroscienze' AND d.`level` ='magistrale';
-- Selezionare nome e cognome di tutti gli studenti che hanno superato l’esame del corso “maxime laboriosam nostrum” (39)
select s.name, s.surname 
FROM students s
JOIN exam_student es ON s.id = es.student_id
JOIN exams e ON es.exam_id = e.id
JOIN courses c ON e.course_id = c.id
WHERE es.vote >=18 AND c.name ='maxime laboriosam nostrum'; 
-- Elencare tutti i docenti che insegnano nel Dipartimento di Matematica 
select DISTINCT d.name AS department_name, t.name, t.surname, t.id
FROM departments d
JOIN `degrees` de ON d.id = de.department_id
JOIN courses c ON de.id = c.degree_id
JOIN course_teacher ct ON c.id = ct.course_id
JOIN teachers t ON ct.teacher_id = t.id
WHERE d.name ='Dipartimento di Matematica'
order by t.id;







