# About

Tweet weather information, scraped from Yahoo! 天気

# Ruby version

= 2.2.3

# Setup

## Bundle gem

```
bundle install
```

## Set environment variable

Please set environment variable as below

```
TWITTER_CONSUMER_KEY=your_twitter_consumer_key
TWITTER_CONSUMER_SECRET=your_twitter_comsumer_secret
TWITTER_ACCESS_TOKEN=your_twitter_access_token
TWITTER_ACCESS_TOKEN_SECRET=your_twitter_access_token_secret

WEATHER_AREA=available_area
```

Available weather area is:

* 東京
* 横浜
* 那覇

# Run

You can run the program by `rake`

```
rake weather # Show weather information
rake tweet_weather # Tweet weather information
```
