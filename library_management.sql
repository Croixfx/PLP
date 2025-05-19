-- Library Management System Database Schema
-- Author: ChatGPT
-- Purpose: Create tables with relationships, keys, and constraints for a library

-- Drop tables if they exist (to avoid errors on re-run)
DROP TABLE IF EXISTS BookCategories;
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS Categories;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT,
    UNIQUE(name) -- assuming author names are unique here for simplicity
);

-- Create Publishers table
CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(255)
);

-- Create Categories table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    publisher_id INT NOT NULL,
    publication_year YEAR,
    isbn VARCHAR(20) UNIQUE,
    copies INT DEFAULT 1 CHECK (copies >= 0),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Junction table for Many-to-Many relationship between Books and Categories
CREATE TABLE BookCategories (
    book_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    join_date DATE DEFAULT CURRENT_DATE
);

-- Create Loans table to track books loaned to members
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (return_date IS NULL OR return_date >= loan_date)
);

-- Indexes to improve query speed (optional but good practice)
CREATE INDEX idx_books_author ON Books(author_id);
CREATE INDEX idx_books_publisher ON Books(publisher_id);
CREATE INDEX idx_loans_member ON Loans(member_id);
CREATE INDEX idx_loans_book ON Loans(book_id);
