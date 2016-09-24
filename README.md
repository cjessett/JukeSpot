# JukeSpot

Install the dependencies

`bundle install`

Create and migrate your database

```
rails db:create
rails db:migrate
```

You will need [to get Spotify credentials](https://developer.spotify.com/my-applications)

This app loads it's environment variables from a .env file with [dotenv](https://github.com/bkeepers/dotenv)

create a `.env` file in the root of the project and add your keys:

```
CLIENT_ID=<YOUR_CLIENT_ID>
CLIENT_SECRET=<YOUR_CLIENT_SECRET>
```

Start it up

`rails s`

