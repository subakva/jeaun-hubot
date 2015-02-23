# Description
#   It's important to know what is best in life.
#
# Configuration:
#   None
#
# Commands:
#   what is best in life - Let's you know what Conan thinks is best.
#
# Notes:
#   None
#
# Author:
#   subakva

module.exports = (robot) ->
  robot.hear /(good|best) in life/i, (msg) ->
    msg.send "To crush your enemies, to see them driven before you, and to hear the lamentations of their women!"
