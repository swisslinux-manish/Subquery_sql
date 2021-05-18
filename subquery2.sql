SELECT
    order_id,
    order_value
 FROM
    (
      SELECT 
      	  order_id,
      	  SUM(quantity * unit_price) order_value
      FROM
      	  order_items
      GROUP BY 
      	  order_id
      ORDER BY
          order_value DESC
     )
FETCH FIRST 10 ROWS ONLY;
