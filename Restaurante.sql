a) Crear la base de datos con el archivo create_restaurant_db.sql
b) Explorar la tabla “menu_items” para conocer los productos del menú.
1.- Realizar consultas para contestar las siguientes preguntas:
•	Encontrar el número de artículos en el menú.
•	¿Cuál es el artículo menos caro y el más caro en el menú?
•	¿Cuántos platos americanos hay en el menú?
•	¿Cuál es el precio promedio de los platos?

c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
1.- Realizar consultas para contestar las siguientes preguntas:
•	¿Cuántos pedidos únicos se realizaron en total?
•	¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
•	¿Cuándo se realizó el primer pedido y el último pedido?
•	¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?

d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.
1.- Realizar un left join entre order_details y menu_items con el identificador item_id(tabla order_details) y menu_item_id(tabla menu_items).

e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y utiliza los resultados obtenidos para llegar a estas conclusiones.


SELECT * FROM menu_items

SELECT * FROM order_details



	
	
--Encontrar el número de artículos en el menú.
SELECT item_name
FROM menu_items;

--Hay 32 artículos en el menú.





--¿Cuál es el artículo menos caro y el más caro en el menú?

SELECT MIN(price)
FROM menu_items;

SELECT MAX(price)
FROM menu_items;

--El artículo menos caro es el Edamame ($5.00) y el artículo más caro es el Shrimp Scampi ($19.95). 






--¿Cuántos platos americanos hay en el menú?
SELECT COUNT(menu_item_id)
FROM menu_items 
WHERE category='American';

--Hay 6 platos Americanos en el menú.






--¿Cuál es el precio promedio de los platos?
SELECT ROUND(AVG(price),2) AS promedio
FROM menu_items;

--- precio promedio de los platos $13.29









--¿Cuántos pedidos únicos se realizaron en total?
SELECT DISTINCT item_id AS PEDIDOS_UNICOS
FROM order_details;
-- 33

SELECT COUNT (DISTINCT item_id) AS PEDIDOS_UNICOS
FROM order_details;
-- 32

-- Son 33 pedidos únicos, pero como uno es nulo, quedarían 32.







--¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC
LIMIT 5
--Los 5 pedidos con mayor número de artículos fueron  las order id 440, 2675, 3473, 4305, 443.









--¿Cuándo se realizó el primer pedido y el último pedido?
SELECT order_date, order_time
FROM order_details
ORDER BY order_date ASC
LIMIT 1;

SELECT order_date, order_time
FROM order_details
ORDER BY order_date DESC
LIMIT 1;

--El primer pedido fue el 2023-01-01 a las 11:38:36 y el último pedido fue el 2023-03-31 a las 11:22:20.








--¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
SELECT COUNT (*)
FROM order_details
WHERE order_date
BETWEEN '2023-01-01' AND '2023-01-05';

-- Se hicieon 702 pedidos.








--1.- Realizar un left join entre order_details y menu_items con el identificador item_id(tabla order_details) y menu_item_id(tabla menu_items).
SELECT *
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id


SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC
LIMIT 5




--¿Cuáles fueron los platillos más pedidos del menú?
SELECT COUNT(o.order_id), m.item_name
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id
GROUP BY m.item_name
	HAVING COUNT (o.order_id)<>0
ORDER BY COUNT(o.order_id) ASC
LIMIT 4
--Los platillos más pedidos del menú fueron chicken tacos, potstickers y cheese lasagna.




	

--¿Cuáles fueron los 5 platillos menos pedidos del menú?
SELECT COUNT(o.order_id), m.item_name
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id
GROUP BY m.item_name
ORDER BY COUNT(o.order_id) DESC
LIMIT 5;
--Hamburger, edamame, korean beef bowl, cheeseburger, french fries.





--¿Cuál fue el día en que más ordenes hubo?
SELECT * FROM order_details

SELECT order_id, order_date, COUNT(*)
FROM order_details
GROUP BY order_id, order_date
	HAVING COUNT(*)>13
ORDER BY COUNT(order_id) ASC
LIMIT 1;
--El día en que más ordenes hubo fue 2023-01-08.





