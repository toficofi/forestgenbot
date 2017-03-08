config = require "config"
Twitter = require "twitter"
forestgen = require "./forestgen"
story = require "./story"

# Initialize twitter with creds from node-config
twtr = new Twitter config.get "twitter"

# Stream tweets mentioning the bot
twtr.stream 'statuses/filter', {track: '@forestgen'}, (stream) ->
  stream.on 'data', (tweet) ->
    # We've hooked a tweet! Grab their screen name
    name = "@#{tweet.user.screen_name}"

    # Make a story and a forest based on their name and id
    post = "#{story name}\n\n#{forestgen tweet.user.id_str}"

    # Post the story and forest back to them
    twtr.post 'statuses/update', {status: post}
    .then ->
      console.log "Made a forest for #{name}!"
    .catch (error) ->
      throw error

# Build the post with a story (passing in the author's name) and a forest
# post = "#{story name} #{forestgen 'twitter'}"
