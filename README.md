# King Pong Project

## Goals

* Manage Ping Pong party ganes
* Running the API on Raspberry PI
* Uses 3scale as API management (final goal)


## API endpoints

DISCLAIMER:

All the call to the endpoints must have **Content-Type: application/json**

### User

* **GET /users** - List all users

* **POST /users** - Create a user

    * Required fields:

        * **user_name** unique in DB
        * **email** unique in db


* **GET /users/:user_name** - Show user information

* **DELETE /users/:user_name** - Delete a user

* **PATCH /users/:user_name** - Update a user

    * Optional fields:

        * **user_name** unique in DB
        * **email** unique in db


### Tournament

* **GET /tournaments** - List all tournaments

* **POST /tournaments** - Create a tournament

    * Required fields:

        * **name** String name of the tournament

    * Optional fields:

        * **description** a text

* **GET /tournaments/:id** - Show tournament information

* **GET /tournaments/:id/games** - Show paginated tournament games

* **GET /tournaments/:id/stats/:user_id** - Show paginated tournament stats for a user

    * Parameters:

        * **page** current page (default 1)
        * **per_page** number of stats to retrieve per page (default 25)

* **DELETE /tournaments/:id** - Delete a tournament

* **PATCH /tournaments/:id** - Update a tournament

    * Optional fields:

        * **name** unique in DB
        * **description** unique in db


### Game

* **GET /games** - List paginated games for tournament

    * Required parameters:
        * **tournament_id** ID of the tournament

    * Parameters:

        * **page** current page (default 1)
        * **per_page** number of stats to retrieve per page (default 25)

* **POST /games** - Create a game

    * Required fields:

        * **winner_id** ID of the winner
        * **loser_id** ID of the loser
        * **tournament_id** ID of the tournament
        * **winner_score** score of the winner
        * **loser_score** score of the loser

    * Optional fields:

         * **details** a Hash containing any details you want to add


* **GET /games/:id** - Show game information

* **DELETE /games/:id** - Delete a game

* **PATCH /games/:id** - Update a game

    * Optional fields:

         * **winner_id** ID of the winner
         * **loser_id** ID of the loser
         * **winner_score** score of the winner
         * **loser_score** score of the loser


# Leaderboard

* **GET /leaderboards/:id** - Show the leaderboard of a tournament
