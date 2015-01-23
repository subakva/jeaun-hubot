# Description
#   Something about Dr. Poop.
#
# Dependencies:
#   "underscore": ">= 1.0.0"
#
# Configuration:
#   None
#
# Commands:
#   drpoop me
#
# Notes:
#   None
#
# Author:
#   subakva

_ = require('underscore')

speakers = [
  'Doctor',
  'Tom',
  'Kathy',
  'Receptionist',
  'Dr. Poop'
]

all_lines = [
  {
    speaker: 'Doctor',
    text: "Yes, uh, this is very difficult phone call for a doctor to have to make."
  },
  {
    speaker: 'Doctor',
    text: 'No, no, no, no. The operation went fine.'
  },
  {
    speaker: 'Doctor',
    text: "You see, I left a baseball in your chest cavity. I, I, I'm very sorry."
  },
  {
    speaker: 'Doctor',
    text: "Right. Well you see its autographed by Carlos Delgado."
  },
  {
    speaker: 'Doctor',
    text: "I said I'm sorry. I want my baseball back, you son of a bitch."
  },
  {
    speaker: 'Receptionist',
    text: "Uh, Doctor? The Framinghams are here to see you."
  },
  {
    speaker: 'Doctor',
    text: "Oh, good. Send them right in."
  },
  {
    speaker: 'Receptionist',
    text: "Yes. By the way, could I have Tuesday off for a modeling job?"
  },
  {
    speaker: 'Doctor',
    text: "Absolutely."
  },
  {
    speaker: 'Tom',
    text: "Hello doctor."
  },
  {
    speaker: 'Doctor',
    text: "Hello...Tom, Kathy. So good to see you."
  },
  {
    speaker: 'Kathy',
    text: "Oh you too."
  },
  {
    speaker: 'Doctor',
    text: "Please have a seat."
  },
  {
    speaker: 'Kathy',
    text: "So how is our baby?"
  },
  {
    speaker: 'Doctor',
    text: "Listen, I don't want to keep you two in suspense, so we'll just get right into it."
  },
  {
    speaker: 'Doctor',
    text: "[phone rings] Hold on."
  },
  {
    speaker: 'Doctor',
    text: "Hello. Beverly! How the hell.. what?! No! Old Chester?!"
  },
  {
    speaker: 'Doctor',
    text: "A palomino? They're beautiful. Yes."
  },
  {
    key: 'how_many_hands',
    speaker: 'Doctor',
    text: "How many hands?"
  },
  {
    key: 'huge_palomino',
    speaker: 'Doctor',
    text: "Sixteen hands?! That's a huge palomino!"
  },
  {
    key: 'all_the_time',
    speaker: 'Doctor',
    text: "Well yes, I've got all the time in the world."
  },
  {
    speaker: 'Tom',
    text: "[Coughs]"
  },
  {
    key: 'knob_job',
    speaker: 'Doctor',
    text: "Oh actually, Beverly, I should go. One of my patients is being a real knob job."
  },
  {
    speaker: 'Tom',
    text: "Excuse me?"
  },
  {
    speaker: 'Doctor',
    text: "Yea, that was him. You know how it is Beverly. All right.."
  },
  {
    speaker: 'Doctor',
    text: "What's that?"
  },
  {
    speaker: 'Doctor',
    text: "No, he doesn't look like that. Close though. Hahahahaha."
  },
  {
    key: 'covered_in_brains',
    speaker: 'Doctor',
    text: "He's looking at me right now. His big, sweaty fat face sucking in air like a dying fish. You should see him. Between you and me, I'd like to stomp on his head till my foot's covered in brains."
  },
  {
    speaker: 'Kathy',
    text: "You know we can hear you."
  },
  {
    speaker: 'Doctor',
    text: "At least his wife's got a big enough ass for a nice roll in the hay."
  },
  {
    speaker: 'Doctor',
    text: "All right Beverly. Goodbye old friend.  [Hangs up phone]"
  },
  {
    key: 'magazines',
    speaker: 'Doctor',
    text: "Sorry. I was just subscribing to some magazines."
  },
  {
    speaker: 'Kathy',
    text: "No you weren't."
  },
  {
    speaker: 'Doctor',
    text: "Now where were we? Oh right. Your father may never again have what we call a human face."
  },
  {
    speaker: 'Kathy',
    text: "What?"
  },
  {
    speaker: 'Tom',
    text: "We're here about our baby."
  },
  {
    speaker: 'Kathy',
    text: "Our baby."
  },
  {
    speaker: 'Doctor',
    text: "Who are you people?"
  },
  {
    speaker: 'Tom',
    text: "The Framinghams?! We gave birth to a baby a week ago, and you were supposed to give us test results."
  },
  {
    speaker: 'Doctor',
    text: "Are you Brian and Cheryl Framingham?"
  },
  {
    speaker: 'Kathy',
    text: "No"
  },
  {
    key: 'funk_and_blowfish',
    speaker: 'Doctor',
    text: "Funk and Blowfish Framingham?"
  },
  {
    speaker: 'Tom',
    text: "No, for god sakes!"
  },
  {
    speaker: 'Doctor',
    text: "Jennifer, get the F in here!"
  },
  {
    speaker: 'Receptionist',
    text: "Yes, doctor?"
  },
  {
    speaker: 'Doctor',
    text: "Who are these people?"
  },
  {
    speaker: 'Receptionist',
    text: "They're Tom and Kathy Framingham from Mount Oak. They have a baby, Shane."
  },
  {
    speaker: 'Doctor',
    text: "My God. Tom and Kathy, I feel like an idiot. Shane, of course, your son. He's fantastic. Now, quick call to my good friend Beverly to check up on his new paler- palomino, and I'll give you the test results."
  },
  {
    speaker: 'Tom',
    text: "Excu- excuse me, we haven't seen our son in a week, we want to know how he is."
  },
  {
    speaker: 'Doctor',
    text: "You shut your mouth Tom."
  },
  {
    speaker: 'Tom',
    text: "I will not."
  },
  {
    speaker: 'Doctor',
    text: "Yeah, you will if I- if you're in my office."
  },
  {
    speaker: 'Tom',
    text: "I will not shut up."
  },
  {
    speaker: 'Kathy',
    text: "Tom.."
  },
  {
    speaker: 'Doctor',
    text: "And you tell that Asian wife of yours to shut her mouth too."
  },
  {
    speaker: 'Tom',
    text: "You, you are really being awful."
  },
  {
    key: 'witch',
    speaker: 'Doctor',
    text: "Believe me, I know. But you all need to shut up. Are we clear on that? Good. Now I'm going to tell you this quickly. It's going to sting a little bit, but your son's a witch."
  },
  {
    speaker: 'Tom',
    text: "What?"
  },
  {
    speaker: 'Kathy',
    text: "Oh my God, no!"
  },
  {
    speaker: 'Tom',
    text: "This is ridiculous.."
  },
  {
    speaker: 'Kathy',
    text: "What?"
  },
  {
    speaker: 'Tom',
    text: "There's no way to determine..."
  },
  {
    key: 'dr_poop',
    speaker: 'Doctor',
    text: "Yes there is. Jennifer, please send in Dr. Poop. And yes, laugh all you want at his last name, but he may save your son's life."
  },
  {
    key: 'do_the_robot',
    speaker: 'Dr. Poop',
    text: "Tom, Kathy, I'm Dr. Steven Poop. I'm sorry, there's absolutely nothing I can do for your son. But, I can do the robot. That'll be five thousand dollars. Good day to you both."
  },
  {
    speaker: 'Tom',
    text: "What the hell was that?"
  },
  {
    speaker: 'Doctor',
    text: "Look, I couldn't think of anything good. Uh, (pause). The truth is..we misplaced your baby."
  },
  {
    key: 'vondruke',
    speaker: 'Tom',
    text: "You vondruke!!"
  },
  {
    speaker: 'Doctor',
    text: "Is that an actual curse word?"
  },
  {
    speaker: 'Tom',
    text: "I think so. Listen when did you misplace our baby?"
  },
  {
    speaker: 'Doctor',
    text: "It was right after we delivered it..I, uh, went out to grab a bite to eat, I forgot I had him with me. Then I met some friend's for a beer, went to a Bodine's concert, and, son of a vondruke, if I didn't leave him at the concert hall. Thank god they had him, the next day at lost and found. Then I just flat out lost him."
  },
  {
    key: 'straight_shooter',
    speaker: 'Tom',
    text: "Doc, I got to tell ya, you have angered me with your irresponsibilty. And yet at the same time, you were a straight shooter. And I can't fault you for that. We'll let it slide, just this once."
  },
  {
    speaker: 'Kathy',
    text: "Honey?!"
  },
  {
    speaker: 'Tom',
    text: "Now, let's go start making another one."
  },
  {
    speaker: 'Kathy',
    text: "Eww! You are totally grossing me out!! Ugh, you're being creepy!"
  },
  {
    speaker: 'Doctor',
    text: "(Whew)"
  },
  {
    speaker: 'Doctor',
    text: "Thank god."
  },
  {
    speaker: 'Doctor',
    text: "Yikes."
  },
  {
    speaker: 'Doctor',
    text: "That was rough."
  }
]

lines_by_key = _.reduce(all_lines, (memo, line) ->
  memo[line.key] = line if line.key
  memo
, {})

module.exports = (robot) ->
  robot.hear /drpoop me/i, (msg) ->
    line = msg.random all_lines
    msg.send "#{line.speaker}: #{line.text}"

  robot.hear /how many hands/i, (msg) ->
    line = lines_by_key['huge_palomino']
    msg.send "#{line.speaker}: #{line.text}"

  robot.hear /huge palomino/i, (msg) ->
    line = lines_by_key['all_the_time']
    msg.send "#{line.speaker}: #{line.text}"

