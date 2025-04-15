CREATE TABLE Authors (
	id SERIAL PRIMARY KEY,
	lastname VARCHAR(255),
	firstname VARCHAR(255),
	patronymic VARCHAR(255),
	UNIQUE (lastname, firstname, patronymic)
);

CREATE TABLE Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) unique
);

CREATE TABLE Languages (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) unique
);

CREATE TABLE Users (
	id SERIAL PRIMARY KEY,
	email VARCHAR(255) unique,
	password VARCHAR(255),
	lastname VARCHAR(255),
	firstname VARCHAR(255),
	patronymic VARCHAR(255),
	phoneNumber INT unique
);

CREATE TABLE Books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) unique,
    authorId INT,
    genreId INT,
	languageId INT,
    publishedYear INT,
    totalCopies INT DEFAULT 0,
    availableCopies INT DEFAULT 0,
    pricePerWeek DECIMAL,
	FOREIGN KEY (authorId) REFERENCES Authors(id),
	FOREIGN KEY (genreId) REFERENCES Genres(id),
	FOREIGN KEY (languageId) REFERENCES Languages(id)	
);

CREATE TABLE Rentals (
	id SERIAL PRIMARY KEY,
	bookId INT,
	userId INT,
	startDate DATE,
	endDate DATE,
	rating INT,
	comment VARCHAR(255),
	FOREIGN KEY (bookId) REFERENCES Books(id),
	FOREIGN KEY (userId) REFERENCES Users(id)
);
