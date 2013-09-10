# Public: DBitch contains useful utilities for manipulating the Garbagé 
# server database. It's essentially a big bundle of shortcuts I've written for 
# you. Be happy. Please initialize this class with the database you'd like to 
# work with. Don't worry, you can always change to a different one later. This 
# should be a string describing the filepath relative to the application where 
# the databse is located. Something like: './mammas_recipes.db'. BE AWARE: If 
#  the DB don't exist already, this will create it.
#
# Examples
#
#   myDBitch = DBitch.new(dbname)
#   # => Daybreak::DB
#
#   DBitch.load_DB(dbname)
#   # => Daybreak::DB
#
#   DBitch.get_DB
#   # => Daybreak::DB
#
#   DBitch.add_log(Log)
#   # => true
#   myDBitch.get_timestamp_hash(timestamp)
#   # => {:happy => 42, :ennui => 42, :sad => 42, :angry => 42, 
#   :upset => 42, :content => 42, :regretful => 42, :lonely =>
#   42, :schadenfreude => 42, :empty => 42, :melancholy => 
#   42, :none_of_the_above => 42}


require 'daybreak'

class DBitch

  # Public: Initialize a dbitch.
  #
  # dbname - a string describing the filepath where the database is located
  #          relative to the directory of the application. If the location does
  #          not hold a file of that name, by gum we'll make one there.
  #
  # Examples
  #
  #   myDBitch = DBitch.new('./mammas_recipes.db')
  #   # => Daybreak::DB
  #
  # Returns the database opened or created
  def initialize(dbname)
    @db = Daybreak::DB.new dbname
    return self.get_DB
    @db.flush
  end

  # Public: Load a database to Bitch about.
  #
  # dbname - a string describing the filepath where the database is located
  #          relative to the directory of the application. If the location does
  #          not hold a file of that name, by gum we'll make one there.
  #
  # Examples
  #
  #   myDBitch.load_DB('./mammas_recipes.db')
  #   # => Daybreak::DB
  #
  # Returns the database opened or created.
  def load_DB(dbname)

    @db = Daybreak::DB.new dbname
    return self.get_DB
    @db.flush
  end

  # Public: Get the database which you're currently Bitching about.
  #
  # Examples
  #
  #   myDBitch.get_DB
  #   # => Daybreak::DB
  #
  # Returns the database presently being worked on.
  def get_DB
    
    @db.flush
    tempdb = @db
    return tempdb
  end

  # Public: File a Log in the database.
  #
  # log - the Log object to be filed in the database.
  #
  # Examples
  #
  #   myDBitch.add_log(todaysLog)
  #   # => true
  #
  # Returns true if successfully added, false otherwise.
  def add_log(log)

    timestamp = log.timestamp
    happy = log.happy
    ennui = log.ennui
    sad = log.sad
    angry = log.angry
    upset = log.upset
    content = log.content
    regretful = log.regretful
    lonely = log.lonely
    schadenfreude = log.schadenfreude
    empty = log.empty
    melancholy = log.melancholy
    none_of_the_above = log.none_of_the_above

    if @db[timestamp] then

      @hash = @db[timestamp]

      happy = @hash[:happy] + happy
      ennui = @hash[:ennui] + ennui
      sad = @hash[:sad] + sad
      angry = @hash[:angry] + angry
      upset = @hash[:upset] + upset
      content = @hash[:content] + content
      regretful = @hash[:regretful] + regretful
      lonely = @hash[:lonely] + lonely
      schadenfreude = @hash[:schadenfreude] + schadenfreude
      empty = @hash[:empty] + empty
      melancholy = @hash[:melancholy] + melancholy
      none_of_the_above = @hash[:none_of_the_above] + none_of_the_above
    end

    @hash = {:happy => happy, :ennui => ennui, :sad => sad, :angry => angry, :upset => upset, :content => content, :regretful => regretful, :lonely => lonely, :schadenfreude => schadenfreude, :empty => empty, :melancholy => melancholy, :none_of_the_above => none_of_the_above}

    @db.set! timestamp, @hash
    @db.flush

    unless @db[timestamp] != @hash then
      return true
    else
      return false
    end
  end

  # Public: Fetch a hash from a particular timestamp
  #
  # timestamp - the timestamp to fetch the hash of
  #
  # Examples
  #
  #   myDBitch.get_timestamp_hash(timestamp)
  #   # => {:happy => 42, :ennui => 42, :sad => 42, :angry => 42, 
  #   :upset => 42, :content => 42, :regretful => 42, :lonely =>
  #   42, :schadenfreude => 42, :empty => 42, :melancholy => 
  #   42, :none_of_the_above => 42}
  #
  # Returns the emotion hash for the timestamp specified.
  def get_timestamp_hash(timestamp)
    hash = @db[timestamp]
    return hash
  end
end
