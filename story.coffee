tracery = require "tracery-grammar"
timeparts = require "timeparts"

# Makes the story before the forest

module.exports = (name) ->
  grammar = tracery.createGrammar {
    name: name
    daytime: timeparts(new Date().toISOString()).timeofday
    greeting: ['hello there, #name#, you #compliment# #person#!', 'good #daytime#, #name#.', '#name#: hi, you #compliment# #person#.', '#name#: stay well, you #compliment# #person.']
    peaceful: ['peaceful', 'calm', 'tranquil', 'soothing', 'secluded', 'silent', 'restful']
    forest: ['forest', 'woodlands', 'meadow']
    hereisyour: ["here's your", "this is your", "here is your"]
    compliment: ['beautiful', 'fantastic', 'excellent', 'lovely', 'tremendous']
    person: ['being', 'person', 'bit of humanity', 'human being', 'thing']
    result: "#greeting# #hereisyour# #peaceful# #forest#:"
  }

  story = grammar.flatten "#result#"
  return story

if require.main is module
  console.log module.exports(process.argv[2])
