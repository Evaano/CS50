SELECT people.name
FROM people
INNER JOIN stars ON people.id = stars.person_id
INNER JOIN movies ON stars.movie_id = movies.id
WHERE movies.id
IN (SELECT movies.id
    FROM movies
    INNER JOIN stars ON movies.id = stars.movie_id
    INNER JOIN people ON stars.person_id = people.id
    WHERE people.id
    IN (SELECT people.id
        FROM people
        WHERE people.name = 'Kevin Bacon' AND people.birth = 1958)) EXCEPT SELECT people.name FROM people WHERE people.name = 'Kevin Bacon';