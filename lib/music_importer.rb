
class MusicImporter

  attr_accessor :path

  def initialize(path = "../db/mp3s")
    @path = path
  end

  def files
    #file_list = Dir.entries(path).select{|file| File.file?(file)}
    file_list = Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/","")}
    #binding.pry
  end
end
