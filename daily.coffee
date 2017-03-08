config = require "config"
Twitter = require "twitter"
forestgen = require "./forestgen"
randomWord = require "random-word"

# Initialize twitter with creds from node-config
twtr = new Twitter config.get "twitter"

# Pick a random word and make a forest out of that word
word = randomWord()
forest = forestgen word

# Post the story and forest back to them
twtr.post 'statuses/update', {status: "today's daily forest is '#{word}'\n\n#{forest}'"}
.then ->
  console.log "Made a daily forest for #{word}!"
.catch (error) ->
  throw error
