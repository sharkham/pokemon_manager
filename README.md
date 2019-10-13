# Pokémon Manager

Pokémon Manager is a Sinatra-based web application for keeping track of your Pokémon! Currently featuring generations I - VII.

## Installation

1. Fork the repository
2. Clone the files to your computer
3. Navigate to the `pokemon_manager` directory.
4. Run `bundle install`
5. Run `rake db:migrate`
6. Run `rake db:seed` to seed the database with the available Pokémon species (required for the app to run).

## Usage

After following the installation instructions, enable sessions by creating a `.gitignore` file and an `.env` file in the root directory. This can be done by typing `touch .gitignore` then `touch .env` in the terminal.

In `.gitignore`, add `.env`.

In `.env` add the following code, replacing `test string` with a secret word or string.

`SECRET_SESSION_KEY="test string"`

After this, type `shotgun` (while still in the `pokemon_manager` directory) to start the server.

This web app supports the sign-up, logging in and logging out of users, and creating, reading, editing and deleting Pokémon.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
