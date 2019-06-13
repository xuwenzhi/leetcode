# classes-more-than-5-students

[https://leetcode.com/problems/classes-more-than-5-students/](https://leetcode.com/problems/classes-more-than-5-students/)

```
There is a table courses with columns: student and class

Please list out all classes which have more than or equal to 5 students.

For example, the table:

+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
Should output:

+---------+
| class   |
+---------+
| Math    |
+---------+
 

Note:
The students should not be counted duplicate in each course.
```

# solution (group by + having)

```sql
# Write your MySQL query statement below
SELECT 
    class
FROM
    courses
group by class
having count(distinct student) >= 5;

# Runtime: 270 ms, faster than 5.00% of MySQL online submissions for Classes More Than 5 Students.
```