# Description
#   "Calculate" the odds of things happening.
#
# Configuration:
#   None
#
# Commands:
#   who is most likely to <die in the hot tub>?
#   what are the odds that <Barney is a real dick>?
#
# Notes:
#   None
#
# Author:
#   subakva

module.exports = (robot) ->
  randomUser = (msg)->
    randomKey = msg.random Object.keys(robot.brain.users())
    robot.brain.users()[randomKey]

  randomPercentage = (msg)->
    lhs = Math.floor(Math.random() * 100)
    rhs = Math.floor(Math.random() * 100)
    "#{lhs}.#{rhs}"

  sendPrediction = (msg, eventuality)->
    probability = randomPercentage(msg)
    msg.send "There is a #{probability}% chance #{eventuality}."

  sendUserPrediction = (msg, eventuality)->
    userName = randomUser(msg).name
    sendPrediction(msg, "that #{userName} will #{eventuality}")

  robot.hear /who (is|si) most (likely|liekly) to ([^?]*)/i, (msg) ->
    eventuality = msg.match[3]
    sendUserPrediction(msg, eventuality)

  robot.hear /what are (the|teh) odds ((that|of) ([^?]*))/i, (msg) ->
    eventuality = msg.match[2]
    sendPrediction(msg, eventuality)

