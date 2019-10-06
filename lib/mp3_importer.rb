require 'pry'

class MP3Importer
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    playlist = Dir.entries(self.path)
    playlist.select { |file| file.end_with?(".mp3") }
  end
    
  def import
    self.files.each { |file| Song.new_by_filename(file) }
  end
  
end