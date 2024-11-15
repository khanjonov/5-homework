-- 1
CREATE TABLE authors (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2
CREATE TABLE books (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    summary TEXT,
    published_date DATE,
    metadata JSON,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3
CREATE TABLE publishers (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country CHAR(2) NOT NULL,
    founded_year INTEGER,
    details JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4
CREATE TABLE libraries (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location TEXT NOT NULL,
    open_time TIME,
    close_time TIME,
    facilities JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5


CREATE TABLE author_book (
    author_id UUID NOT NULL,
    book_id UUID NOT NULL,
    PRIMARY KEY (author_id, book_id),
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors (id),
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books (id)
);


CREATE TABLE book_publisher (
    book_id UUID NOT NULL,
    publisher_id UUID NOT NULL,
    PRIMARY KEY (book_id, publisher_id),
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books (id),
    CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES publishers (id)
);


CREATE TABLE library_book (
    library_id UUID NOT NULL,
    book_id UUID NOT NULL,
    PRIMARY KEY (library_id, book_id),
    CONSTRAINT fk_library FOREIGN KEY (library_id) REFERENCES libraries (id),
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books (id)
);




