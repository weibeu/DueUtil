# DueUtil
### The questing and fun discord bot ready to setup on heroku with mongodb connection, without installing mongodb element on heroku

#### Running the bot
(more detailed setup / install script later -- maybe)

Requirements:
* Python 3.5 +
* The packages in requirements.txt (`pip install -r requirements.txt`)
* MongoDB  (https://docs.mongodb.com/manual/installation/)
* PHP & Apache (if you really want to run the site too)

##### Setup the DB
1. Create an account that can create & update databases (admin will do)
2. Put the account details in `dbconfig.json`

```json
{
    "url" : "your mongodb app authentication url (v 4)"
}
```
signup at mongodb website, create cluster and get app authentication url

##### Configure DueUtil
Create a file `dueutil.json` in the same folder as `run.py` (the root).
```json
{
   "botToken":"[DISCORD BOT TOKEN]",
   "owner":"[OWNER DISCORD ID]",
   "shardCount":1,
   "shardNames":[
      "Clone DueUtil: shard 1"
   ],
   "logChannel": "[SERVER ID]/[CHANNEL ID]",
   "errorChannel": "[SERVER ID]/[CHANNEL ID]",
   "feedbackChannel": "[SERVER ID]/[CHANNEL ID]",
   "bugChannel": "[SERVER ID]/[CHANNEL ID]",
   "announcementsChannel":"[SERVER ID]/[CHANNEL ID]",
   "carbonKey":"[https://www.carbonitex.net key you won't have]",
   "discordBotsOrgKey":"https://discordbots.org/ key you also won't have",
   "discordBotsKey": "https://bots.discord.pw/ key you also also won't have",
   "discoinKey":"http://discoin.sidetrip.xyz/ you will never get",
   "sentryAuth": "[SENTRY AUTH]"
}
```
The logging channels are currenly needed (the bot may not work properly without them), the bot probably can run without the other keys.

##### Restoring the database

1. Download the database dump from the last release
2. Extract that zip into folder called `database`
    ```
    database
    `-- dueutil
        |-- award_stats.bson
        |-- award_stats.metadata.json
        |-- _CacheStats.bson
        ...
    ```
    Your file tree should look like this
 3. Use mongorestore
    ``mongorestore  --username your_use --password "your_pass" --authenticationDatabase admin ./database``

##### Setup on heroku!

goto heroku, sign up and create app. IThen goto settings, reveal config vars and add following:
```
    MONGOHQ_URL : [your mongo db authentication url]
    SENTRY_DSN : [your sentry dsn]
    TOKEN : [your discord bot token]
```
Download and install heroku CLI
You may clone this repo or download it to your local system.
If you clone repo:
    Just setup config files in your repo, goto heroku, link your github, and deploy your app from heroku.
    Click on deploy branch in deploy tab
    Login to you heroku CLI, `heroku login`
    Enter `heroku ps:scale worker=1 -a [your app name on heroku]` to finally start your app
    You may use `heroku logs -t -a [your app name on heroku]` to view heroku logs and python logs.
If you downloaded zip:
    Extract zip to folder, then open `quest-knight` (app root directory)
    Open console/cmd here and enter following:
    ```
        git init
        heroku git:remote -a [your app name]
        git add .
        git commit -am "initial commit"
        git push heroku master
    ```
    To finally start, enter: `heroku ps:scale worker=1`
    You may use `heroku logs -t -a [your app name on heroku]` to view heroku logs and python logs.
