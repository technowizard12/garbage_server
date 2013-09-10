# Public: An object to hold a log entry from the website. Its main function is to be created. It's fun that way. Essentially, it's a container for holding the various emotion entries.
#
# Examples
#
#   myLog = Log.new(happy, ennui, sad, angry, upset, content, regretful, lonely, schadenfreude, empty, melancholy, none_of_the_above)
#   # => true
#
#   myLog = Log.new(1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0)
#   # => true
class Log

  # Public: Gets/Sets the emotion values for happy, ennui, sad, angry, upset, content, regretful, lonely, schadenfreude, empty, melancholy, and none_of_the_above. Please, for the love of god, only set these to either 0 or 1. Think of the children.
  attr_accessor :happy, :ennui, :sad, :angry, :upset, :content, :regretful, :lonely, :schadenfreude, :empty, :melancholy, :none_of_the_above

  #Public: Initializes a log. Brother, you know this.
  #
  # happy - 1 or 0, depending on response
  # ennui - 1 or 0, depending on response
  # sad - 1 or 0, depending on response
  # angry - 1 or 0, depending on response
  # upset - 1 or 0, depending on response
  # content - 1 or 0, depending on response
  # regretful - 1 or 0, depending on response
  # lonely - 1 or 0, depending on response
  # schadenfreude - 1 or 0, depending on response
  # empty - 1 or 0, depending on response
  # melancholy - 1 or 0, depending on response
  # none_of_the_above - 1 or 0, depending on response
  def initialize(happy, ennui, sad, angry, upset, content, regretful, lonely, schadenfreude, empty, melancholy, none_of_the_above)
    self.happy = happy
    self.ennui = ennui
    self.sad = sad
    self.angry = angry
    self.upset = upset
    self.content = content
    self.regretful = regretful
    self.lonely = lonely
    self.schadenfreude = schadenfreude
    self.empty = empty
    self.melancholy = melancholy
    self.none_of_the_above = none_of_the_above
  end
end



