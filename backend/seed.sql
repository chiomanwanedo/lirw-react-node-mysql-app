-- Create Authors Table if it doesn't exist
CREATE TABLE IF NOT EXISTS author (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    birthday DATE,
    bio TEXT
);

-- Create Books Table if it doesn't exist
CREATE TABLE IF NOT EXISTS book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    releaseDate DATE,
    description TEXT,
    pages INT,
    authorId INT,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (authorId) REFERENCES author(id)
);

-- Insert Authors (using INSERT IGNORE to avoid duplicates)
INSERT IGNORE INTO author (id, name, birthday, bio) VALUES
(1, 'George Orwell', '1903-06-25', 'English novelist known for 1984 and Animal Farm'),
(2, 'Jane Austen', '1775-12-16', 'Romantic fiction pioneer'),
(3, 'J.K. Rowling', '1965-07-31', 'Author of the Harry Potter series'),
(4, 'Mark Twain', '1835-11-30', 'Humorous and satirical writer'),
(5, 'Agatha Christie', '1890-09-15', 'Queen of crime and detective novels'),
(6, 'Ernest Hemingway', '1899-07-21', 'Noted for The Old Man and the Sea'),
(7, 'F. Scott Fitzgerald', '1896-09-24', 'Wrote The Great Gatsby'),
(8, 'Leo Tolstoy', '1828-09-09', 'Russian author of War and Peace'),
(9, 'Charles Dickens', '1812-02-07', 'Victorian novelist, wrote Oliver Twist'),
(10, 'Harper Lee', '1926-04-28', 'Known for To Kill a Mockingbird'),
(11, 'J.R.R. Tolkien', '1892-01-03', 'Author of The Lord of the Rings'),
(12, 'Mary Shelley', '1797-08-30', 'Wrote Frankenstein'),
(13, 'Chinua Achebe', '1930-11-16', 'Nigerian author of Things Fall Apart'),
(14, 'Dan Brown', '1964-06-22', 'Wrote The Da Vinci Code'),
(15, 'Arthur Conan Doyle', '1859-05-22', 'Created Sherlock Holmes'),
(16, 'Stephen King', '1947-09-21', 'Master of horror fiction'),
(17, 'Gabriel García Márquez', '1927-03-06', 'Colombian author of magical realism'),
(18, 'Oscar Wilde', '1854-10-16', 'Known for wit and satire'),
(19, 'Suzanne Collins', '1962-08-10', 'Author of The Hunger Games'),
(20, 'C.S. Lewis', '1898-11-29', 'Wrote The Chronicles of Narnia');

-- Insert Books (using INSERT IGNORE to avoid duplicates)
INSERT IGNORE INTO book (title, releaseDate, description, pages, authorId, createdAt, updatedAt) VALUES
('1984', '1949-06-08', 'Dystopian future surveillance state', 328, 1, NOW(), NOW()),
('Pride and Prejudice', '1813-01-28', 'Romantic novel set in Georgian England', 432, 2, NOW(), NOW()),
('Harry Potter and the Philosopher\'s Stone', '1997-06-26', 'A young wizard\'s first year at Hogwarts', 223, 3, NOW(), NOW()),
('The Adventures of Tom Sawyer', '1876-06-01', 'Boyhood adventures along the Mississippi River', 274, 4, NOW(), NOW()),
('Murder on the Orient Express', '1934-01-01', 'A murder mystery aboard a luxury train', 256, 5, NOW(), NOW()),
('The Old Man and the Sea', '1952-09-01', 'A struggle between a fisherman and a marlin', 127, 6, NOW(), NOW()),
('The Great Gatsby', '1925-04-10', 'The Jazz Age and the American Dream', 180, 7, NOW(), NOW()),
('War and Peace', '1869-01-01', 'Historical epic of Napoleonic wars', 1225, 8, NOW(), NOW()),
('Oliver Twist', '1837-02-01', 'An orphan boy in industrial London', 554, 9, NOW(), NOW()),
('To Kill a Mockingbird', '1960-07-11', 'Racial injustice in the American South', 281, 10, NOW(), NOW()),
('The Fellowship of the Ring', '1954-07-29', 'A journey to destroy the One Ring begins', 423, 11, NOW(), NOW()),
('Frankenstein', '1818-01-01', 'A scientist creates life and suffers the consequences', 280, 12, NOW(), NOW()),
('Things Fall Apart', '1958-06-17', 'Colonialism in pre-independence Nigeria', 209, 13, NOW(), NOW()),
('The Da Vinci Code', '2003-03-18', 'A symbologist uncovers a religious conspiracy', 454, 14, NOW(), NOW()),
('The Hound of the Baskervilles', '1902-04-01', 'Sherlock Holmes investigates a supernatural legend', 256, 15, NOW(), NOW()),
('The Shining', '1977-01-28', 'A haunted hotel and a family in peril', 447, 16, NOW(), NOW()),
('One Hundred Years of Solitude', '1967-06-05', 'The rise and fall of the Buendía family', 417, 17, NOW(), NOW()),
('The Picture of Dorian Gray', '1890-07-20', 'A man remains young while his portrait ages', 254, 18, NOW(), NOW()),
('The Hunger Games', '2008-09-14', 'Teens fight to survive in a dystopian reality show', 374, 19, NOW(), NOW()),
('The Lion, the Witch and the Wardrobe', '1950-10-16', 'Children enter a magical world through a wardrobe', 208, 20, NOW(), NOW());
