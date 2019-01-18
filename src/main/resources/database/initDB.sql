DROP TABLE IF EXISTS BOOKS;

DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START 100000;

CREATE TABLE BOOKS(
  ID INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  BOOK_TITLE VARCHAR(100) NOT NULL,
  BOOK_DESCRIPTION VARCHAR(255) NOT NULL,
  BOOK_AUTHOR VARCHAR(100) NOT NULL,
  BOOK_ISBN VARCHAR(20) NOT NULL,
  BOOK_PRINT_YEAR INTEGER NOT NULL,
  BOOK_STATUS BOOL DEFAULT FALSE
);

INSERT INTO BOOKS (ID, BOOK_TITLE, BOOK_DESCRIPTION, BOOK_AUTHOR, BOOK_ISBN, BOOK_PRINT_YEAR, BOOK_STATUS)
VALUES ('1', 'Harry Potter and  the Philosophers Stone', 'First book of saga', 'J. K. Rowling', '0-7475-3269-9', '1997', 'TRUE'),
('2', 'Harry Potter and the Chamber of Secrets', 'Second book of saga', 'J. K. Rowling', '0-7475-3849-2', '1998', 'TRUE'),
('3', 'Harry Potter and the Prisoner of Azkaban', 'Third book of saga', 'J. K. Rowling', '0-7475-4215-5', '1999', 'TRUE'),
('4', 'Harry Potter and the Goblet of Fire', 'Fourth book of saga', 'J. K. Rowling', '0-7475-4624-X', '2000', 'TRUE'),
('5', 'Harry Potter and the Order of the Phoenix', 'Fifth book of saga', 'J. K. Rowling', '0-7475-5100-6', '2003', 'TRUE'),
('6', 'Harry Potter and the Half-Blood Prince', 'Sixth book of saga', 'J. K. Rowling', '0-7475-8108-8', '2005', 'TRUE'),
('7', 'Harry Potter and the Deathly Hallows', 'Seventh book of saga', 'J. K. Rowling', '0-545-01022-5', '2007', 'TRUE'),
('8', 'The Dark Tower: The Gunslinger', 'First book of saga', 'Stephen King', '978-0-937986-50-9', '1982', 'FALSE'),
('9', 'The Dark Tower II: The Drawing of the Three', 'Second book of saga', 'Stephen King', '978-0-937986-90-5', '1987', 'FALSE'),
('10', 'The Dark Tower III: The Waste Lands', 'Third book of saga', 'Stephen King', '978-0-937986-17-2', '1991', 'FALSE'),
('11', 'The Dark Tower IV: Wizard and Glass', 'Fourth book of saga', 'Stephen King', '978-1-880418-38-3', '1997', 'FALSE'),
('12', 'The Dark Tower V: Wolves of the Calla', 'Fifth book of saga', 'Stephen King', '978-1-880418-56-7', '2003', 'FALSE'),
('13', 'The Dark Tower VI: Song of Susannah', 'Sixth book of saga', 'Stephen King', '978-1-880-41859-8', '2004', 'FALSE'),
('14', 'The Dark Tower VII: The Dark Tower', 'Seventh book of saga', 'Stephen King', '978-1-880418-62-8', '2004', 'FALSE'),
('15', 'A Game of Thrones', 'First book of saga', 'George R. R. Martin', '0-553-10354-7', '1996', 'TRUE'),
('16', 'A Clash of Kings', 'Second book of saga', 'George R. R. Martin', '0-00-224585-X', '1998', 'TRUE'),
('17', 'A Storm of Swords', 'Third book of saga', 'George R. R. Martin', '0-553-10663-5', '2000', 'TRUE'),
('18', 'A Feast for Crows', 'Fourth book of saga', 'George R. R. Martin', '0-00-224743-7', '2005', 'TRUE'),
('19', 'A Dance with Dragons', 'Fifth book of saga', 'George R. R. Martin', '978-0553801477', '2011', 'TRUE'),
('20', 'The Hobbit', 'First book of saga', 'John Ronald Reuel Tolkien', '9780582186552', '1937', 'FALSE'),
('21', 'The Fellowship of the Ring', 'Second book of saga', 'John Ronald Reuel Tolkien', '9780582186558', '1954', 'FALSE'),
('22', 'The Two Towers', 'Third book of saga', 'John Ronald Reuel Tolkien', '9780582186556', '1954', 'FALSE'),
('23', 'The Return of the King', 'Fourth book of saga', 'John Ronald Reuel Tolkien', '9780582186554', '1955', 'FALSE');
