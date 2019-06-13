# shortest-distance-in-a-line

[https://leetcode.com/problems/shortest-distance-in-a-line/](https://leetcode.com/problems/shortest-distance-in-a-line/)

```
Table point holds the x coordinate of some points on x-axis in a plane, which are all integers.
 

Write a query to find the shortest distance between two points in these points.
 

| x   |
|-----|
| -1  |
| 0   |
| 2   |
 

The shortest distance is '1' obviously, which is from point '-1' to '0'. So the output is as below:
 

| shortest|
|---------|
| 1       |
 

Note: Every point is unique, which means there is no duplicates in table point.
 

Follow-up: What if all these points have an id and are arranged from the left most to the right most of x axis?
```

# thinking

此题是计算表中，两个字段之差的最小值，一开始我都想用存储过程搞了。。

# solution 

```sql
# Write your MySQL query statement below
select min(a.x - b.x)  as shortest
from point as a, point as b
where a.x > b.x;

# Runtime: 150 ms, faster than 81.85% of MySQL online submissions for Shortest Distance in a Line.
```

# solution (join)

和上面的方案类似。

```sql
# Write your MySQL query statement below
select min(abs(a.x-b.x)) as shortest from point as a
join point as b 
on a.x != b.x;

# Runtime: 242 ms, faster than 8.97% of MySQL online submissions for Shortest Distance in a Line.
```

# refer

[short and simple](https://leetcode.com/problems/shortest-distance-in-a-line/discuss/148748/Short-and-Simple)

[The real no join solution that beats 99.71% submissions](https://leetcode.com/problems/shortest-distance-in-a-line/discuss/104217/The-real-no-join-solution-that-beats-99.71-submissions)