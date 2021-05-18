SELECT
   employee_id,
   first_name,
   last_name
FROM
   employees
WHERE
   employee_id IN(
   	SELECT
   	    salesman_id
   	FROM
   	    orders
   	INNER JOIN order_items
   	     USING(order_id)
   	WHERE 
            status = 'Shipped'
        GROUP BY 
            salesman_id,
            EXTRACT(
                YEAR
              FROM
                order_date
                )
        HAVING
            SUM(quantity * unit_price) >=1000000
            AND EXTRACT(
                YEAR
            FROM
                order_date) = 2017
            AND salesman_id IS NOT NULL
       )
ORDER BY
first_name,
last_name;
