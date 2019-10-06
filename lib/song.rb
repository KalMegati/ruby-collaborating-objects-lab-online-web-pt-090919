class Song
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(file)
    new = Song.new(file.split(" - ")[1])
    new.artist_name = file.split(" - ")[0]
    new
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
end