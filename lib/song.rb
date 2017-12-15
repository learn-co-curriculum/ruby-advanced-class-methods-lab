require 'pry'

class Song
  attr_accessor :song, :name, :artist_name

  @@all = []

  def initialize(name="", artist_name="")
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @song = Song.new
    @song.save
    @song
  end

  def self.new_by_name(name)
    #binding.pry
    @song = Song.new(name)
    @song
  end

  def self.create_by_name(name)
    @song = Song.new(name)
    @song.save
    @song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/ - |\.mp3/)
    @song = Song.new(filename_array[1], filename_array[0])
  end

  def self.create_from_filename(filename)
    filename_array = filename.split(/ - |\.mp3/)
    @song = Song.new(filename_array[1], filename_array[0])
    @@all << @song
  end

  def self.destroy_all
    @@all = []
  end

end



#Pry.start
