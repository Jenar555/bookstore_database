-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- Create Genres table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    genre_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Items table
CREATE TABLE Order_Items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert data into Authors table
INSERT INTO Authors (author_name) VALUES
    ('J.K. Rowling'),
    ('George Orwell'),
    ('Harper Lee'),
    ('J.R.R. Tolkien');

-- Insert data into Genres table
INSERT INTO Genres (genre_name) VALUES
    ('Fantasy'),
    ('Science Fiction'),
    ('Mystery'),
    ('Classic');

-- Insert data into Books table
INSERT INTO Books (title, author_id, genre_id, price, stock_quantity) VALUES
    ('Harry Potter and the Philosopher''s Stone', 1, 1, 29.99, 100),
    ('1984', 2, 2, 24.99, 50),
    ('To Kill a Mockingbird', 3, 3, 19.99, 75),
    ('The Lord of the Rings', 4, 1, 39.99, 80);

-- Insert data into Customers table
INSERT INTO Customers (customer_name, email) VALUES
    ('John Doe', 'john.doe@example.com'),
    ('Jane Smith', 'jane.smith@example.com');

-- Insert data into Orders table
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
    (1, '2023-08-04', 54.98),
    (2, '2023-08-04', 44.98);

-- Insert data into Order_Items table
INSERT INTO Order_Items (order_id, book_id, quantity) VALUES
    (1, 1, 2),
    (1, 3, 1),
    (2, 2, 1),
    (2, 4, 2);
