-- Query all of the entries in the Genre table
select * from Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist (ArtistID, ArtistName, YearEstablished)
values (null, 'Bruce Springsteen', 1949);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
values (null, 'The Ghost of Tom Joad', 1995, 50, 'Columbia', 28, 2);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
values (null, 'The Line', 5, 'November 21, 1995', 2, 28, 23);

insert into Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
values (null, 'The Ghost of Tom Joad', 4, 'November 21, 1995', 2, 28, 23);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
-- Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title, a.Title, m.ArtistName 
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId
LEFT JOIN Artist m
ON s.ArtistId = m.ArtistId
WHERE m.ArtistName = 'Bruce Springsteen';

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function 
-- and the GROUP BY keyword sequence.
select
a.Title, count(*)
from
Song s
left join
Album a
on
s.AlbumId = a.AlbumId
Group By 
s.AlbumId;

-- Write a SELECT statement to display how many songs exist for each artist. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select
a.ArtistName, count(*)
from
Song s
left join
Artist a
where
s.ArtistId = a.ArtistId
Group By
a.ArtistName

-- Write a SELECT statement to display how many songs exist for each genre. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select
a.ArtistName, count(*)
from
Song s
left join
Artist a
where
s.ArtistId = a.ArtistId
Group By
a.ArtistName

-- Using MAX() function, write a select statement to find the album with the longest duration. 
-- The result should display the album title and the duration.
select
a.Title, max(a.AlbumLength) AS "Duration"
from
Album a

-- Using MAX() function, write a select statement to find the song with the longest duration. 
-- The result should display the song title and the duration.
select
s.Title, max(s.SongLength) AS "Duration"
from
Song s

-- Modify the previous query to also display the title of the album.

select
s.Title, max(s.SongLength) AS "Duration", a.Title AS "Album"
from
Song s
left join
Album a
on
s.AlbumId = s.AlbumId;