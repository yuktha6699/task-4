DROP TABLE Students1;

CREATE TABLE Students1 (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    math_score INT,
    science_score INT,
    english_score INT
);
INSERT INTO Students1 (student_id, name, math_score, science_score, english_score)
VALUES 
(1, 'Alice', 85, 78, 92),
(2, 'Bob', 60, 75, 66),
(3, 'Charlie', 95, 88, 90),
(4, 'David', 70, 60, 72),
(5, 'Eva', 88, 84, 91),
(6, 'Frank', 93, 89, 94),
(7, 'Grace', 55, 58, 65);
SELECT student_id, name, total_score
FROM (
    SELECT student_id, name,
           (math_score + science_score + english_score) AS total_score
    FROM Students1
) AS ScoreTable
ORDER BY total_score DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT AVG((math_score + science_score + english_score) / 3.0) AS average_score
FROM Students1
WHERE math_score > 70;

SELECT AVG(total_score) AS avg_total
FROM (
    SELECT (math_score + science_score + english_score) AS total_score
    FROM Students1
) AS ScoreTable
WHERE total_score BETWEEN 200 AND 250;
SELECT MAX(math_score) AS second_highest_math
FROM Students1
WHERE math_score < (SELECT MAX(math_score) FROM Students1);
SELECT student_id, name, math_score
FROM Students1
WHERE math_score = (
    SELECT MAX(math_score)
    FROM Students1
    WHERE math_score < (SELECT MAX(math_score) FROM Students1)
);



