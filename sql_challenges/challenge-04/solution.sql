#Analytic Functions
select b.*,
       count(*) over (
         partition by shape
       ) bricks_per_shape,
       median ( weight ) over (
         partition by shape
       ) median_weight_per_shape
from   bricks b
order  by shape, weight, brick_id;

select b.brick_id, b.weight,
       round ( avg ( weight ) over (
         order by brick_id
       ), 2 ) running_average_weight
from   bricks b
order  by brick_id;

select b.*,
       min ( colour ) over (
         order by brick_id
         rows between 2 preceding and current row
       ) first_colour_two_prev,
       count (*) over (
         order by weight
         range between 0 preceding and 1 following
       ) count_values_this_and_next
from   bricks b
order  by weight;

with totals as (
  select b.*,
         sum ( weight ) over (
           partition by shape
         ) weight_per_shape,
         sum ( weight ) over (
           order by brick_id
         ) running_weight_by_id
  from   bricks b
)
select * from totals
where  weight_per_shape > 2
order  by brick_id;

#datalemur
SELECT department_name, name, salary
FROM (
  SELECT d.department_name, e.name, e.salary,
         DENSE_RANK() OVER (PARTITION BY d.department_name ORDER BY e.salary DESC) AS rank
  FROM employee e
  INNER JOIN department d ON e.department_id = d.department_id
) ranked
WHERE rank <= 3
ORDER BY department_name ASC, salary DESC, name ASC;