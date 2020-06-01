#challenge 1
SELECT 
titleauthor.au_id AS id_autor,
titleauthor.title_id AS id_title,
royaltyper AS royalties,
titles.royalty AS royal,
titles.ytd_sales AS year_sales,
sales.qty,
titles.advance * titleauthor.royaltyper / 100 AS advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalt
FROM titleauthor
LEFT JOIN titles 
ON titleauthor.title_id = titles.title_id 
JOIN sales 
ON titleauthor.title_id = sales.title_id
GROUP BY au_id
ORDER BY year_sales DESC;
