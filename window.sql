SELECT
    emp_id,
    emp_name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employee;
SELECT
    emp_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM employee;
SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employee;
SELECT *
FROM (
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employee
) e
WHERE rnk = 1;
SELECT *
FROM (
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employee
) e
WHERE rnk = 2;
SELECT
    emp_id,
    emp_name,
    salary,
    LAG(salary) OVER(ORDER BY emp_id) AS previous_salary
FROM employee;
SELECT
    emp_id,
    emp_name,
    salary,
    LEAD(salary) OVER(ORDER BY emp_id) AS next_salary
FROM employee;