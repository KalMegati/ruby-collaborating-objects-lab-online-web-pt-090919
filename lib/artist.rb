class Artist
    
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def songs
    Song.all.select { |tune| tune.artist == self }
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_or_create_by_name(name)
    self.all.each { |singer| return singer if singer.name == name }
    Artist.new(name)
  end
  
  def print_songs
    puts songs.map{ |tune| tune.name }
  end
  
end