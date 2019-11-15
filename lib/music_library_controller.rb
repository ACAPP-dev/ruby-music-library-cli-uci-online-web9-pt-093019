
class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    response = " "
    until response == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      response = gets.chomp.strip
    end

    def list_songs
      alpha_songs = Song.all.sort {|song1, song2| song1 <=> song2}
      alpha_songs.each do |song|
        puts "1. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

  end
end
