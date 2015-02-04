# Description
#   Set countdown date and retreive countdown (number of days remaining).
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   countdown set #meetupname# #datestring# e.g. countdown set punerbmeetup 21 Jan 2014
#   countdown [for] #meetupname# e.g. countdown punerbmeetup
#   countdown list
#   countdown delete #meetupname# e.g. countdown delete seattlerbmeetup
#   countdown clear
#
# Notes:
#   None
#
# Author:
#   anildigital

module.exports = (robot) ->

  getCountdowns = ->
    countdowns = robot.brain.get("countdowns")
    if not countdowns
      countdowns = {}
      saveCountdowns(countdowns)
    countdowns

  saveCountdowns = (countdowns) ->
    robot.brain.set("countdowns", countdowns)

  getEventKey = (eventName) ->
    eventName.toLowerCase()

  getCountdown = (eventName) ->
    countdowns = getCountdowns()
    eventKey = getEventKey(eventName)
    countdowns[eventKey] if countdowns.hasOwnProperty(eventKey)

  saveCountdown = (eventName, date) ->
    countdowns = getCountdowns()
    eventKey = getEventKey(eventName)
    countdowns[eventKey] = {
      "date" : date.toDateString(),
      "eventName": eventName
    }
    saveCountdowns(countdowns)
    getCountdown(eventName)

  # Get countdown message
  getCountdownMsg = (countdown) ->
    now = new Date()
    eventTime = new Date(countdown.date)
    gap = eventTime.getTime() - now.getTime()
    gap =  Math.floor(gap / (1000 * 60 * 60 * 24));
    "Only #{gap} days remaining till #{countdown.eventName}!"

  robot.hear /countdown set (\w+) (.*)/i, (msg) ->
    dateString = msg.match[2];

    try
      date = new Date(dateString);
      if date == "Invalid Date"
        throw "Invalid date passed"
      eventName = msg.match[1]

      countdown = saveCountdown(eventName, date)
      msg.send "Countdown set for #{countdown.eventName} at #{countdown.date}"
      msg.send getCountdownMsg(countdown)
    catch error
        console.log(error.message)
        msg.send "Invalid date passed!"

  robot.hear /countdown list/i, (msg) ->
    countdowns = getCountdowns()
    for eventName of countdowns
      countdown = countdowns[eventName]
      msg.send eventName + " -> " + countdown.date +
        " -> " + getCountdownMsg(countdown)

  robot.hear /(countdown)( for)? (.*)/, (msg) ->
    eventName = msg.match[3]
    countdown = getCountdown(eventName)
    if countdown
      msg.send getCountdownMsg(countdown)

  robot.hear /countdown clear/i, (msg) ->
    saveCountdowns({})
    msg.send "Countdowns cleared"

  robot.hear /countdown delete (.*)/i, (msg) ->
    eventName = msg.match[1]
    countdown = getCountdown(eventName)
    if countdown
      countdowns = getCountdowns()
      delete countdowns[eventName]
      saveCountdowns(countdowns)
      msg.send "Countdown for #{eventName} deleted."
    else
      msg.send "No such countdown: #{eventName}"

  robot.hear /countdown set$|countdown help/i, (msg) ->
    msg.send "countdown set #meetupname# #datestring# e.g. countdown set PuneRubyMeetup 21 Jan 2014"
    msg.send "countdown [for] #meetupname# e.g. countdown PuneRubyMeetup"
    msg.send "countdown list"
    msg.send "countdown delete #meetupname# e.g. countdown delete HashTagMeetup"
    msg.send "countdown clear"
