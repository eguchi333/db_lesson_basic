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


SELECT * FROM reports;
+-----------+-----------+--------------------------------------+---------------------+---------------------+
| report_id | person_id | content                              | created_at          | updated_at          |
+-----------+-----------+--------------------------------------+---------------------+---------------------+
|         1 |         1 | 初投稿がんばっていこう               | 2026-07-18 18:23:13 | 2026-09-02 10:43:19 |
|         2 |         2 | 二回目二回目二回目二回目             | 2026-07-18 18:23:13 | 2026-09-02 10:43:47 |
|         3 |         3 | 三回目三回目三回目三回目             | 2026-07-18 18:23:13 | 2026-09-02 10:44:19 |
|         4 |         4 | 四回目四回目四回目四回目             | 2026-07-18 18:23:13 | 2026-09-02 10:44:35 |
|         5 |         5 | 五回目五回目五回目五回目             | 2026-07-18 18:23:13 | 2026-09-02 10:45:03 |
|         6 |         6 | 六回目六回目六回目六回目             | 2026-07-18 18:23:13 | 2026-09-02 10:45:26 |
|         7 |         7 | 七回目七回目七回目七回目             | 2026-07-18 18:23:13 | 2026-09-02 10:45:43 |
|         8 |         8 | 八回目八回目八回目八回目             | 2026-07-18 18:23:13 | 2026-09-02 10:49:38 |
|         9 |         9 | 九回目九回目九回目九回目             | 2026-07-18 18:23:13 | 2026-09-02 10:50:07 |
|        10 |        10 | 十回目十回目十回目十回目             | 2026-07-18 18:23:13 | 2026-09-02 10:50:44 |
+-----------+-----------+--------------------------------------+---------------------+---------------------+

-- Q4
UPDATE people SET 
    -> department_id = 1 WHERE person_id <= 3;

UPDATE people SET  department_id = 2 WHERE 4 <= person_id and person_id <= 7;

UPDATE people SET  department_id = 3 WHERE person_id = 8;

UPDATE people SET  department_id = 4 WHERE person_id = 9;

UPDATE people SET  department_id = 5 WHERE person_id = 10;


-- Q5
SELECT * FROM people where gender = 1 ORDER BY age DESC;
+-----------+--------------------+--------------------+------+--------+---------------------+---------------------+---------------+
| person_id | name               | email              | age  | gender | created_at          | updated_at          | department_id |
+-----------+--------------------+--------------------+------+--------+---------------------+---------------------+---------------+
|         7 | 武田てつお         | takeda@gizumo.jp   |   62 |      1 | 2026-07-19 18:03:52 | 2026-09-02 10:40:28 |             2 |
|         5 | 上杉まこと         | uesugi@gizumo.jp   |   55 |      1 | 2026-07-19 18:03:52 | 2026-09-02 10:40:17 |             2 |
|         3 | 福田だいすけ       | fukuda@gizumo.jp   |   42 |      1 | 2026-07-18 01:45:30 | 2026-07-19 18:15:25 |             1 |
|         8 | 豊臣たくや         | toyotomi@gizumo.jp |   33 |      1 | 2026-07-19 18:03:52 | 2026-09-02 10:40:38 |             3 |
|         1 | 鈴木たかし         | suzuki@gizumo.jp   |   20 |      1 | 2026-07-18 01:39:05 | 2026-07-19 18:14:26 |             1 |
+-----------+--------------------+--------------------+------+--------+---------------------+---------------------+---------------+

-- Q6
peopleというテーブルにおいてname, email, ageの三つのカラムを取得する。この際department_idが1のレコードを取得し、作成した順で並べる。

-- Q7
SELECT name FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2 UNION SELECT name FROM people WHERE age BETWEEN 40 AND 49 AND gender = 1;
+--------------------+
| name               |
+--------------------+
| 田中ゆうこ         |
| 浅田みほ           |
| 服部ことね         |
| 福田だいすけ       |
+--------------------+

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
mysql> SELECT AVG(age) AS average_age FROM people WHERE gender = 2 and department_id = 2;
+-------------+
| average_age |
+-------------+
|     38.5000 |
+-------------+


-- Q10
SELECT p.name, d.name, r.content FROM people p INNER JOIN departments d ON p.department_id = d.department_id INNER JOIN reports r ON p.person_id = r.person_id;
+-----------------------+--------------------+--------------------------------------+
| name                  | name               | content                              |
+-----------------------+--------------------+--------------------------------------+
| 鈴木たかし            | 営業               | 初投稿がんばっていこう               |
| 田中ゆうこ            | 営業               | 二回目二回目二回目二回目             |
| 福田だいすけ          | 営業               | 三回目三回目三回目三回目             |
| 豊島はなこ            | 開発               | 四回目四回目四回目四回目             |
| 上杉まこと            | 開発               | 五回目五回目五回目五回目             |
| 不思議沢みちこ        | 開発               | 六回目六回目六回目六回目             |
| 武田てつお            | 開発               | 七回目七回目七回目七回目             |
| 豊臣たくや            | 経理               | 八回目八回目八回目八回目             |
| 浅田みほ              | 人事               | 九回目九回目九回目九回目             |
| 服部ことね            | 情報システム       | 十回目十回目十回目十回目             |
+-----------------------+--------------------+--------------------------------------+

-- Q11
mysql> SELECT p.name, r.content FROM people p INNER JOIN reports r ON p.person_id = r.person_id WHERE content IS NULL;
Empty set (0.00 sec)

