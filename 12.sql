SELECT
    "first_name",
    "last_name"
 FROM "players"
WHERE "id" IN (
    SELECT
        "p"."id"
    FROM "players" AS "p"
    JOIN "performances" AS "per" ON "per"."player_id" = "p"."id"
    JOIN "salaries" AS "s" ON "s"."player_id" = "p"."id"
    WHERE
        "per"."year" = 2001
        AND "per"."year" = "s"."year"
        AND "per"."H" != 0
    ORDER BY ("s"."salary"/"per"."H"), "first_name" , "last_name" ASC
    LIMIT 10
)
INTERSECT
SELECT
    "first_name",
    "last_name"
 FROM "players"
WHERE "id" IN (
    SELECT
        "p"."id"
    FROM "players" AS "p"
    JOIN "performances" AS "per" ON "per"."player_id" = "p"."id"
    JOIN "salaries" AS "s" ON "s"."player_id" = "p"."id"
    WHERE
        "per"."year" = 2001
        AND "per"."year" = "s"."year"
        AND "per"."RBI" != 0
    ORDER BY ("s"."salary"/"per"."RBI"), "first_name" , "last_name" ASC
    LIMIT 10
)
ORDER BY "last_name" ASC;