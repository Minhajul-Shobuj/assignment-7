CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO orders (customer_id, book_id, quantity) VALUES
(2, 2, 1),(2, 1, 2),(3, 1, 2);

--checking all data on orders table
SELECT * FROM orders

--Finding the total number of orders placed by each customer.
SELECT customers.name, COUNT(*) AS total_orders FROM orders 
JOIN customers ON orders.customer_id = customers.id 
GROUP BY customers.name 
ORDER BY total_orders DESC;

--Listing all customers who have placed more than one order.
SELECT customers.name, COUNT(*) AS orders_count FROM orders 
JOIN customers ON orders.customer_id = customers.id 
GROUP BY customers.name HAVING COUNT(*) > 1 
ORDER BY orders_count DESC

--Calculating the total revenue generated from book sales.
SELECT  SUM(books.price * orders.quantity) AS total_revenue FROM orders
JOIN books ON orders.book_id= books.id
