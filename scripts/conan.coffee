# Description
#   Remind all what is best in life.
#
# Author:
#   aden

module.exports = (robot) ->

   robot.respond /what is (good|best) in life?/i, (msg) ->
     msg.send "To crush your enemies, to see them driven before you, and to hear the lamentations of their women."
