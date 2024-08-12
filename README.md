# SQL
a) Crear la base de datos con el archivo create_restaurant_db.sql
b) Explorar la tabla “menu_items” para conocer los productos del menú.
1.- Realizar consultas para contestar las siguientes preguntas:
•	Encontrar el número de artículos en el menú.
--Hay 32 artículos en el menú.

•	¿Cuál es el artículo menos caro y el más caro en el menú?
--El artículo menos caro es el Edamame ($5.00) y el artículo más caro es el Shrimp Scampi ($19.95).

•	¿Cuántos platos americanos hay en el menú?
--Hay 6 platos Americanos en el menú.

•	¿Cuál es el precio promedio de los platos?
-- precio promedio de los platos $13.29.

c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
1.- Realizar consultas para contestar las siguientes preguntas:
•	¿Cuántos pedidos únicos se realizaron en total?
-- Son 33 pedidos únicos, pero como uno es nulo, quedarían 32.

•	¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
--Los 5 pedidos con mayor número de artículos fueron las order id 440, 2675, 3473, 4305, 443.

•	¿Cuándo se realizó el primer pedido y el último pedido?
--El primer pedido fue el 2023-01-01 a las 11:38:36 y el último pedido fue el 2023-03-31 a las 11:22:20.

•	¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
-- Se hicieon 702 pedidos.

d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.
1.- Realizar un left join entre order_details y menu_items con el identificador item_id(tabla order_details) y menu_item_id(tabla menu_items).
![Captura de pantalla 2024-08-11 222939](https://github.com/user-attachments/assets/5ddf7b42-3bad-417b-91e3-04a833ef9c4c)

e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y utiliza los resultados obtenidos para llegar a estas conclusiones.
