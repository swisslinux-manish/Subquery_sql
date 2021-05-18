SELECT 
    product_name,
    list_price,
    ROUND(
    	(
    	  SELECT
    	  	AVG(list_price)
    	  FROM 
    	  	products p1
    	  WHERE
    	  	p1.category_id = p2.category_id
    	  ),
    	  2
    	 ) avg_list_price
    FROM
    	products p2
    ORDER BY
    	product_name;
