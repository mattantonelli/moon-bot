# Moon Bot

Moon Bot is a silly Discord bot with a dynamic prefix that changes based on the current primary phase of the moon. Powered by [discordrb](https://github.com/meew0/discordrb).

## Installation

Moon Bot is a private bot that should not be hosted by any sane individual. If you are actually insane, you will need to create and run your own Discord app to add it to your server.

1. [Create a new Discord app](https://discordapp.com/developers/applications/me)
2. Click "Create a Bot User"
3. Insert your client ID into the following URL: `https://discordapp.com/oauth2/authorize?client_id=INSERT_CLIENT_ID_HERE&scope=bot`
4. Follow the URL to add the bot to your server (requires the Manage Server permission)
5. `git clone https://github.com/mattantonelli/moon-bot`
6. `cd moon-bot`
7. `bundle install`
8. Set up the configuration file
    * `cp config.yml.example config.yml`
    * Update the example values appropriately
9. `bundle exec ruby run.rb`

## Usage

![Screenshot](https://i.imgur.com/unFeKGh.png)

## Contributing

What's wrong with you?
