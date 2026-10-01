SELECT
    sales.product_name,
    sales.product_category,
    sales.total_amount,
    sales.sale_date
FROM flourmills_sales AS sales
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS product_sales
    WHERE product_sales.product_name = sales.product_name
    GROUP BY product_sales.product_name
    HAVING COUNT(DISTINCT EXTRACT(MONTH FROM product_sales.sale_date)) > 1
);
