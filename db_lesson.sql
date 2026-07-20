-- Q1
CREATE TABLE departments (
    -> department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(20) NOT NULL,
    -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP                                                                                                                          
    -> );  

-- Q2
ALTER TABLE people ADD department_id INT UNSIGNED COMMENT 'emailの後ろに追加する';

-- Q3
INSERT INTO departments (name)
    -> VALUES
    -> ('営業'), ('開発'), ('経理'), ('人事'), ('情報システム');


UPDATE people SET 
    -> department_id = 1 WHERE person_id <= 3;

UPDATE people SET  department_id = 2 WHERE 4 <= person_id and person_id <= 7;

UPDATE people SET  department_id = 3 WHERE person_id = 8;

UPDATE people SET  department_id = 4 WHERE person_id = 9;

UPDATE people SET  department_id = 5 WHERE person_id = 10;


SELECT * FROM reports;
+-----------+-----------+-----------+---------------------+---------------------+
| report_id | person_id | content   | created_at          | updated_at          |
+-----------+-----------+-----------+---------------------+---------------------+
|         1 |         1 | 初投稿    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         2 |         2 | 二回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         3 |         3 | 三回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         4 |         4 | 四回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         5 |         1 | 五回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         6 |         2 | 六回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         7 |         3 | 七回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         8 |         4 | 八回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         9 |         1 | 九回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|        10 |         5 | 十回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
+-----------+-----------+-----------+---------------------+---------------------+

UPDATE reports SET person_id = 5 WHERE report_id = 5;
UPDATE reports SET person_id = 6 WHERE report_id = 6;
UPDATE reports SET person_id = 7 WHERE report_id = 7;
UPDATE reports SET person_id = 8 WHERE report_id = 8;
UPDATE reports SET person_id = 9 WHERE report_id = 9;
UPDATE reports SET person_id = 10 WHERE report_id = 10;

SELECT * FROM reports;
+-----------+-----------+-----------+---------------------+---------------------+
| report_id | person_id | content   | created_at          | updated_at          |
+-----------+-----------+-----------+---------------------+---------------------+
|         1 |         1 | 初投稿    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         2 |         2 | 二回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         3 |         3 | 三回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         4 |         4 | 四回目    | 2026-07-18 18:23:13 | 2026-07-18 18:23:13 |
|         5 |         5 | 五回目    | 2026-07-18 18:23:13 | 2026-07-19 18:24:06 |
|         6 |         6 | 六回目    | 2026-07-18 18:23:13 | 2026-07-19 18:24:27 |
|         7 |         7 | 七回目    | 2026-07-18 18:23:13 | 2026-07-19 18:24:34 |
|         8 |         8 | 八回目    | 2026-07-18 18:23:13 | 2026-07-19 18:24:41 |
|         9 |         9 | 九回目    | 2026-07-18 18:23:13 | 2026-07-19 18:24:47 |
|        10 |        10 | 十回目    | 2026-07-18 18:23:13 | 2026-07-19 18:24:55 |
+-----------+-----------+-----------+---------------------+---------------------+

-- Q4

-- Q5
SELECT * FROM people ORDER BY age DESC;
+-----------+-----------------------+---------------------+------+--------+---------------------+---------------------+---------------+
| person_id | name                  | email               | age  | gender | created_at          | updated_at          | department_id |
+-----------+-----------------------+---------------------+------+--------+---------------------+---------------------+---------------+
|         3 | 福田だいすけ          | fukuda@gizumo.jp    |   42 |      1 | 2026-07-18 01:45:30 | 2026-07-19 18:15:25 |             1 |
|         4 | 豊島はなこ            | toyoshima@gizumo.jp |   34 |      2 | 2026-07-18 01:45:30 | 2026-07-19 18:16:17 |             2 |
|         2 | 田中ゆうこ            | tanaka@gizumo.jp    |   25 |      2 | 2026-07-18 01:45:30 | 2026-07-19 18:15:25 |             1 |
|         1 | 鈴木たかし            | suzuki@gizumo.jp    |   20 |      1 | 2026-07-18 01:39:05 | 2026-07-19 18:14:26 |             1 |
|         5 | 上杉まこと            | NULL                | NULL |   NULL | 2026-07-19 18:03:52 | 2026-07-19 18:16:17 |             2 |
|         6 | 不思議沢みちこ        | NULL                | NULL |   NULL | 2026-07-18 01:45:30 | 2026-07-19 18:16:17 |             2 |
|         7 | 武田てつお            | NULL                | NULL |   NULL | 2026-07-19 18:03:52 | 2026-07-19 18:16:17 |             2 |
|         8 | 豊臣たくや            | NULL                | NULL |   NULL | 2026-07-19 18:03:52 | 2026-07-19 18:16:44 |             3 |
|         9 | 浅田みほ              | NULL                | NULL |   NULL | 2026-07-19 18:03:52 | 2026-07-19 18:16:53 |             4 |
|        10 | 服部ことね            | NULL                | NULL |   NULL | 2026-07-19 18:03:52 | 2026-07-19 18:17:00 |             5 |
+-----------+-----------------------+---------------------+------+--------+---------------------+---------------------+---------------+
10 rows in set (0.00 sec)

-- Q6
peopleというテーブルにおいてname, email, ageの三つのカラムを取得する。この際department_idが1の人だけを取得し、作成した順で並べる。

-- Q7
mysql> SELECT name FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2;
+-----------------+
| name            |
+-----------------+
| 田中ゆうこ      |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT name FROM people WHERE age BETWEEN 40 AND 49 AND gender = 1;
+--------------------+
| name               |
+--------------------+
| 福田だいすけ       |
+--------------------+
1 row in set (0.00 sec)

-- Q8
mysql> SELECT name FROM people WHERE department_id = 1 ORDER BY age ASC;
+--------------------+
| name               |
+--------------------+
| 鈴木たかし         |
| 田中ゆうこ         |
| 福田だいすけ       |
+--------------------+
3 rows in set (0.00 sec)

-- Q9
mysql> SELECT AVG(age) AS average_age FROM people WHERE gender = 2;
+-------------+
| average_age |
+-------------+
|     29.5000 |
+-------------+
1 row in set (0.00 sec)

-- Q10
SELECT p.name, d.name, r.content FROM people AS p INNER JOIN departments AS d ON p.department_id = d.department_id INNER JOIN reports AS r ON p.person_id = r.person_id;
+-----------------------+--------------------+-----------+
| name                  | name               | content   |
+-----------------------+--------------------+-----------+
| 鈴木たかし            | 営業               | 初投稿    |
| 田中ゆうこ            | 営業               | 二回目    |
| 福田だいすけ          | 営業               | 三回目    |
| 豊島はなこ            | 開発               | 四回目    |
| 上杉まこと            | 開発               | 五回目    |
| 不思議沢みちこ        | 開発               | 六回目    |
| 武田てつお            | 開発               | 七回目    |
| 豊臣たくや            | 経理               | 八回目    |
| 浅田みほ              | 人事               | 九回目    |
| 服部ことね            | 情報システム       | 十回目    |
+-----------------------+--------------------+-----------+
10 rows in set (0.00 sec)

-- Q11
mysql> SELECT p.name, r.content FROM people AS p INNER JOIN reports AS r ON p.person_id = r.person_id WHERE content = null;
Empty set (0.00 sec)

