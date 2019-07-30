-- 1. Query all of the entries in the Genre table
SELECT * FROM Genre;

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('The Offspring', 1984);

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('Americana', '11/17/1998', 1905, 'Columbia', 31, 2);

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Pretty Fly', 206, '11/17/1998', 2, 31,25);

-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title, al.Title, ar.ArtistName FROM Song s
JOIN Album al ON s.AlbumId = al.id
JOIN Artist ar ON s.ArtistId = ar.id;

-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.AlbumId, COUNT(s.Title) AS 'Songs per album'
FROM Song s
GROUP BY s.AlbumId;

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.ArtistId, COUNT (s.ArtistId) AS 'Songs per artist'
FROM Song s
GROUP BY s.ArtistId;

-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.GenreId, COUNT(s.Title) AS 'Songs per genre'
FROM Song s 
GROUP BY s.GenreId;

-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title AS AlbumName, AlbumLength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength)
FROM ALBUM);

-- 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title AS SongName, SongLength
FROM Song
WHERE SongLength = (SELECT MAX(SongLength)
FROM SONG);

-- 11. Modify the previous query to also display the title of the album.
SELECT a.Title AS AlbumName, s.Title AS SongName, SongLength
FROM Song s
JOIN Album a ON s.AlbumId = a.id
WHERE SongLength = (SELECT MAX(SongLength)
FROM SONG);