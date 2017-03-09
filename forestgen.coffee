hash = require "string-hash"
Random = require "random-js"

# Generates a lovely forest based on the passed seed
module.exports = (input) ->
  # Initialize and seed our random engine using the hashed input
  engine = Random.engines.mt19937().seed hash input

  # Pool of emojis we will use to make the forest
  trees = [
    '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲',
    '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲',
    '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲',
    '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲', '🌳', '🌲',
    '🥀', '🌼', '🌼', '🌼', '🌼', '🌼', '🌻', '🌻', '🌻', '🌻', '🌻', '🌻', '🌻', '🌺', '🌺', '🌺'
    '🏵️', '🏵️', '🐖', '🍁', '🍁', '🍁', '🍄', '🍄', '🍄', '🍀', '🌱', '🌱', '🌷', '🌷', '🌷'
  ]

  result = ""

  # Pick 50 random emojis
  for i in [1..52]
    result += Random.pick(engine, trees)

  return result


# Run with passed argument if executed directly
if require.main is module
  console.log module.exports(process.argv[2])
