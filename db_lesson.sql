-- Q1
CREATE TABLE departments (department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(20) NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);  

-- Q2
ALTER TABLE people ADD department_id INT UNSIGNED COMMENT 'emailの後ろに追加する' AFTER email;

-- Q3
INSERT INTO departments (name) VALUES ('営業'), ('開発'), ('経理'), ('人事'), ('情報システム');


INSERT INTO people (name, email, department_id, age, gender) VALUES('鈴木たかし', 'suzuki@gizumo.jp', 1, 20, 1), ('田中ゆうこ', 'tanaka@gizumo.jp', 1, 25, 2), ('福田だいすけ', 'fukuda@gizumo.jp', 1, 42, 1), ('豊島はなこ', 'toyoshima@gizumo.jp', 2, 34, 2), ('上杉まこと', 'uesugi@gizumo.jp', 2, 55, 1), ('不思議沢みちこ', 'fushigi@gizumo.jp', 2, 43, 2), ('武田てつお', 'takeda@gizumo.jp', 2, 62, 1), ('豊臣たくや', 'toyotomi@gizumo.jp', 3, 33, 1), ('浅田みほ ', 'asada@gizumo.jp', 4, 21, 2), ('服部ことね ', 'hattori@gizumo.jp', 5, 20, 2);


INSERT INTO reports (person_id, content) VALUES(1, '初投稿がんばっていこう'), (2, '二回目二回目二回目二回目'), (3, '三回目三回目三回目三回目'), (4, '四回目四回目四回目四回目'), (5, '五回目五回目五回目五回目'), (6, '六回目六回目六回目六回目'), (7, '七回目七回目七回目七回目'), (8, '八回目八回目八回目八回目'), (9, '九回目九回目九回目九回目'), (10, '十回目十回目十回目十回目');

-- Q4
UPDATE people SET department_id = 1 WHERE person_id <= 3;

UPDATE people SET  department_id = 2 WHERE 4 <= person_id and person_id <= 7;

UPDATE people SET  department_id = 3 WHERE person_id = 8;

UPDATE people SET  department_id = 4 WHERE person_id = 9;

UPDATE people SET  department_id = 5 WHERE person_id = 10;


-- Q5
SELECT name, age FROM people where gender = 1 ORDER BY age DESC;

-- Q6
peopleというテーブルにおいてname, email, ageの三つのカラムを取得する。この際department_idが1のレコードを取得し、作成した順で並べる。

-- Q7
SELECT name FROM people WHERE (age BETWEEN 20 AND 29 AND gender = 2) OR (age BETWEEN 40 AND 49 AND gender = 1);

-- Q8
mysql> SELECT name FROM people WHERE department_id = 1 ORDER BY age ASC;

-- Q9
mysql> SELECT AVG(age) AS average_age FROM people WHERE gender = 2 and department_id = 2;

-- Q10
SELECT p.name, d.name, r.content FROM people p INNER JOIN departments d ON p.department_id = d.department_id INNER JOIN reports r ON p.person_id = r.person_id;

-- Q11
mysql> SELECT p.name, r.content FROM people p INNER JOIN reports r ON p.person_id = r.person_id WHERE content IS NULL;
Empty set (0.00 sec)

