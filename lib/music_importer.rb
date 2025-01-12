
class MusicImporter

  attr_accessor :path

  def initialize(path = "../db/mp3s")
    @path = path
  end

  def files
    file_list = Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/","")}
  end

  def import
     files.each {|file| Song.create_from_filename(file)}
  end
end
