セクション10

Q1

MariaDB [db_lesson]> create table departments(
    -> department_id int unsigned auto_increment primary key,
    -> name varchar(20) not null,
    -> created_at timestamp default current_timestamp,
    -> updated_at timestamp default current_timestamp on update current_timestamp
    -> );

Q2

MariaDB [db_lesson]> alter table people add department_id int unsigned after email;
Query OK, 0 rows affected (0.026 sec)
Records: 0  Duplicates: 0  Warnings: 0

Q3

MariaDB [db_lesson]> insert into departments (department_id,name)
    -> values
    -> (1,'営業'),
    -> (2,'開発'),
    -> (3,'経理'),
    -> (4,'人事'),
    -> (5,'情報システム');
Query OK, 5 rows affected (0.015 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> insert into people (name, email, department_id, age, gender)
    -> values
    -> ('石川一郎', 'ishikawa1@gmail.com', '1', '60', '1'),
    -> ('石川二郎', 'ishikawa2@gmail.com', '1', '60', '1'),
    -> ('石川三郎', 'ishikawa3@gmail.com', '1', '60', '1'),
    -> ('石川四郎', 'ishikawa4@gmail.com', '2', '60', '1'),
    -> ('石川五郎', 'ishikawa5@gmail.com', '2', '60', '1'),
    -> ('石川六郎', 'ishikawa6@gmail.com', '2', '60', '1'),
    -> ('石川七郎', 'ishikawa7@gmail.com', '2', '60', '1'),
    -> ('石川八郎', 'ishikawa8@gmail.com', '3', '60', '1'),
    -> ('石川九郎', 'ishikawa9@gmail.com', '4', '60', '1'),
    -> ('石川十郎', 'ishikawa10@gmail.com', '5', '60', '1');
Query OK, 10 rows affected (0.016 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> insert into reports (person_id, content)
    -> values
    -> (2, '10月1日、天気:晴れ、目標を作った。'),
    -> (4, '10月2日、天気:曇り、目標を達成した。'),
    -> (6, '10月3日、天気:晴れ、目標を作った。'),
    -> (8, '10月4日、天気:曇り、目標未達成だった。'),
    -> (10, '10月5日、天気:雨、目標を見直した。'),
    -> (11, '10月6日、天気:晴れ、目標を修正した。'),
    -> (12, '10月7日、天気:雨、目標を作った。'),
    -> (13, '10月8日、天気:曇り、目標を作った。'),
    -> (14, '10月9日、天気:晴れ、試験学習した'),
    -> (15, '10月10日、天気:雨、テスト実行した。');
Query OK, 10 rows affected (0.008 sec)
Records: 10  Duplicates: 0  Warnings: 0

Q4

MariaDB [db_lesson]> update people set department_id =1 where person_id =1;
Query OK, 1 row affected (0.006 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> update people set department_id =2 where person_id =2;
Query OK, 1 row affected (0.015 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> update people set department_id =3 where person_id =3;
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> update people set department_id =4 where person_id =4;
Query OK, 1 row affected (0.014 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> update people set department_id =5 where person_id =6;
Query OK, 1 row affected (0.014 sec)
Rows matched: 1  Changed: 1  Warnings: 0

Q5

MariaDB [db_lesson]> select name, age from people where gender = 1 order by age desc;

Q6

MariaDB [db_lesson]> --peopleテーブルからdepartment_idが1になっているレコードのうち、カラムが'name', 'email' 'age'のデータを、追加した日時が早い順に取得する。

Q7
MariaDB [db_lesson]> select name from people where age between 20 and 29 and gender = 2 or age between 40 and 49 and gen
der = 1;

Q8

MariaDB [db_lesson]> select * from people where department_id = 1 order by age asc;

Q9

MariaDB [db_lesson]> select avg(age) as average_age from people where department_id = 2 and gender = 2 group by gender;

Q10

MariaDB [db_lesson]> select people.name, departments.name, reports.content
    -> from people inner join reports on people.person_id = reports.person_id
    -> inner join departments on people.department_id = departments.department_id;

Q11
MariaDB [db_lesson]> select p.name from people p left outer join reports r using (person_id)
    -> where r.content is null;
