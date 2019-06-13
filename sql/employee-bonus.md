# employee-bonus

[https://leetcode.com/problems/employee-bonus/](https://leetcode.com/problems/employee-bonus/)

```c++
Select all employee's name and bonus whose bonus is < 1000.

Table:Employee

+-------+--------+-----------+--------+
| empId |  name  | supervisor| salary |
+-------+--------+-----------+--------+
|   1   | John   |  3        | 1000   |
|   2   | Dan    |  3        | 2000   |
|   3   | Brad   |  null     | 4000   |
|   4   | Thomas |  3        | 4000   |
+-------+--------+-----------+--------+
empId is the primary key column for this table.
Table: Bonus

+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
empId is the primary key column for this table.
Example ouput:

+-------+-------+
| name  | bonus |
+-------+-------+
| John  | null  |
| Dan   | 500   |
| Brad  | null  |
+-------+-------+
```

# thinking

这道题，就两个线路，第一 Bonus中不存在Employee中对应的记录 或者 Bonus.bonus < 2000。

# solution (child search)

这种是利用了子查询，查找 Bonus中不能满足条件的 empId即可。

```c++
# Write your MySQL query statement below
select Employee.name,Bonus.bonus from Employee
left JOIN Bonus
on Employee.empId = Bonus.empId
where Employee.empId not in (select empId from Bonus where bonus >= 2000);

# Runtime: 188 ms, faster than 10.48% of MySQL online submissions for Employee Bonus.
```

# solution (pure left join)

这种就是一个很单纯的left join，通过判断 bonus < 2000 OR bonus is null。

```c++
# Write your MySQL query statement below
select Employee.name,Bonus.bonus from Employee
left JOIN Bonus
on Employee.empId = Bonus.empId
where bonus < 2000 OR bonus is null;

# Runtime: 193 ms, faster than 6.27% of MySQL online submissions for Employee Bonus.
```

# points

## is null 与 = null

> Null (or NULL) is a special marker used in Structured Query Language to indicate that a data value does not exist in the database.
> For example, consider the question "How many books does Adam own?" The answer may be "zero" (we know that he owns none) or "null" (we do not know how many he owns). In a database table, the column reporting this answer would start out with no value (marked by Null), and it would not be updated with the value "zero" until we have ascertained that Adam owns no books.

> SQL null is a state, not a value. This usage is quite different from most programming languages, where null value of a reference means it is not pointing to any object.

[Null (SQL)](https://en.wikipedia.org/wiki/Null_%28SQL%29)