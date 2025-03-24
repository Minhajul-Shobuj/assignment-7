CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO customers (name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com'),
('David Williams', 'david@example.com'),
('Emma Davis', 'emma@example.com');

--checking all data on customers table
SELECT * FROM customers

--Delete customers who haven't placed any orders.

DELETE FROM customers USING orders
WHERE customers.id NOT IN(SELECT DISTINCT customer_id FROM orders)