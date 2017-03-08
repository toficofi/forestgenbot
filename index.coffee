config = require "config"
Twitter = require "twitter"
forestgen = require "./forestgen"
story = require "./story"

# Initialize twitter with creds from node-config
twtr = new Twitter config.get "twitter"

# Stream tweets mentioning the bot
twtr.stream 'statuses/filter', {track: '@forestgen'}, (stream) ->
  stream.on 'data', (tweet) ->
    name = "@#{tweet.user.screen_name}"
    post = "#{story name}\n\n#{forestgen tweet.user.id_str}"

    twtr.post 'statuses/update', {status: post}
    .then ->
      console.log "Made a forest for #{name}!"
    .catch (error) ->
      throw error

# Build the post with a story (passing in the author's name) and a forest
# post = "#{story name} #{forestgen 'twitter'}"
