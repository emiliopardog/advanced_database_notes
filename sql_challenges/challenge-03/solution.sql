#sqlbot lesson 1
SELECT MAX(years_employed) FROM employees;

SELECT role, AVG(years_employed) FROM employees GROUP BY role;

SELECT building, SUM(years_employed) FROM employees GROUP BY building;

#sqlbot lesson 2
SELECT MAX(years_employed) FROM employees;

SELECT role, AVG(years_employed) FROM employees GROUP BY role;

SELECT building, SUM(years_employed) FROM employees GROUP BY building;

#Aggregating Rows: Databases for Developers
select count(distinct shape) number_of_shapes,
       stddev(distinct weight) distinct_weight_stddev
from   bricks;

select shape, sum(weight) shape_weight
from   bricks
group  by shape;

select shape, sum(weight)
from   bricks
group  by shape;
