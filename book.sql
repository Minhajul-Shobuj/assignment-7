CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0) NOT NULL,
    stock INT CHECK (stock >= 0) NOT NULL,
    published_year INT CHECK (published_year >= 1000 AND published_year <= EXTRACT(YEAR FROM CURRENT_DATE))
);
INSERT INTO books (title, author, price, stock, published_year) VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 12.99, 10, 1925),
('To Kill a Mockingbird', 'Harper Lee', 15.50, 8, 1960),
('1984', 'George Orwell', 10.75, 12, 1949),
('Pride and Prejudice', 'Jane Austen', 9.99, 5, 1813),
('The Catcher in the Rye', 'J.D. Salinger', 14.00, 7, 1951),
('Moby-Dick', 'Herman Melville', 18.25, 6, 1851),
('War and Peace', 'Leo Tolstoy', 20.00, 4, 1869),
('The Hobbit', 'J.R.R. Tolkien', 13.49, 15, 1937),
('Crime and Punishment', 'Fyodor Dostoevsky', 16.99, 9, 1866),
('Brave New World', 'Aldous Huxley', 11.25, 0, 2005);

--checking all data on books table
SELECT * FROM books

-- Finding books that are out of stock on books table
SELECT books.title as title FROM books WHERE stock=0

--Retrieve the most expensive book in the books table
SELECT * FROM books ORDER BY price DESC LIMIT 1

-- Finding the average price of books in books table.
SELECT round(avg(price),2) as avg_book_price FROM books

-- Increasing the price of all books published before 2000 by 10%.
UPDATE books SET price= price + (price * 10)/100 WHERE published_year < 2000

SELECT * FROM books WHERE published_year < 2000

