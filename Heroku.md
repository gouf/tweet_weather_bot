# Setup multiple environment

Create some apps

```sh
heroku create --remote staging
heroku create --remote production
```

You can see what happened by `git remote`

```sh
git remote # =>
# staging
# production
```

Push to specific environment

```
git push staging master
```

* [Managing Multiple Environments for an App | Heroku Dev Center](https://devcenter.heroku.com/articles/multiple-environments)

# Set environment variable

Use `heroku config:set`

```sh
heroku config:set --remote staging $(cat .env)
```

# Add scheduler

```sh
heroku addons:create scheduler:standard --remote staging
heroku addons:open scheduler --remote staging # open dashboard to set schedule
```

Set command as

```sh
rake tweet_weather
```

* [Heroku Scheduler | Heroku Dev Center](https://devcenter.heroku.com/articles/scheduler)
