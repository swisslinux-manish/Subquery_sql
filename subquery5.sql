SELECT 
   name
FROM
   customers
WHERE
   customer_id NOT IN(
       SELECT
             customer_id
       FROM
             orders
       WHERE
            EXTRACT(
               YEAR
            FROM
               order_date) = 2017
      )
 ORDER BY
    name;
