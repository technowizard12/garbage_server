Garbagé Servér
==============

Howdy! This here's the server-side code for an assignment for ARTS 244: Topics in Sculpture: Recycled Materials at Willamette University. This particular piece is by Simon Orr. Now, isn't that something?

The Practical Upshot
--------------------

This piece is an experiment in mapping the emotional space on campus. That means next to nothing by itself. Read on, dear reader, and all shall be explained.

A marimba with 12 keys is constructed using recycled materials scavenged from the WU dumpsters. Super fun, right? Positioned above each key of the marimba is a small electromagnetic solenoid. The keys on the marimba correspond to 12 emotional states: happiness, ennui, sadness, anger, upset, contentment, regret, loneliness, schadenfreude, emptiness, melancholy, and the all important "none of the above".

WU Students are given the opportunity to, for however long they wish and as often as they wish visit a web server (This code!) which allows them to register whether or not they are feeling any of the given emotions. That's not the fun part, though. When they press submit, a Daybreak database logs a hash of these emotions as the value, with the timestamp as the key. Every time anybody registers an hash at that timestamp, the values are added to the existing values. Every two minutes, an Arduino with an Ethernet shield will poll the server (This code!) for any logs from the past two minutes. The server will respond with a number of times to actuate each solenoid corresponding with each emotion.  The Arduino keeps track of the time by keeping tabs on an NTP time server. When a timestamp of the proper time is reached, the arduino turns its attention to This code! and, when the exchange with This code! is complete, resumes monitoring the NTP server.

How it's Done
--------------------

This code, in particular, is the front-facing web server, the database wrangler, and the arduino-responder. This is all done with Sinatra out of app.rb, but there are several separate doohickeys which help.

- dbitch.rb
  * Wrangles the database
- arduino.rb
  * Handles arduino responses
- log.rb
  * The object which the responses are originally recorded in


