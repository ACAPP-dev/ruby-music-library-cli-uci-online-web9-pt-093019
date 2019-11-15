
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
      response = gets.chomp
    end
  end

    def list_songs
      #binding.pry
      alpha_songs = Song.all.sort {|song1, song2| song1.name <=> song2.name}
      alpha_songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_artists
      alpha_artists = Artist.all.sort {|artist1, artist2| artist1.name <=> artist2.name}
      alpha_artists.each.with_index(1) do |artist, index|
        puts "#{index}. #{artist.name}"
      end
    end

    def list_genres
      alpha_genres = Genre.all.sort {|genre1, genre2| genre1.name <=> genre2.name}
      alpha_genres.each.with_index(1) do |genre, index|
        puts "#{index}. #{genre.name}"
      end
    end

    def list_songs_by_artist
      response = nil
      until response != nil
        puts "Please enter the name of an artist:"
        response = gets.chomp
        if Artist.all.detect {|artist| artist.name == response}
          alpha_songs = Artist.find_by_name(response).songs.sort {|song1, song2| song1.name <=> song2.name}
          alpha_songs.each.with_index(1) do |song, index|
            puts "#{index}. #{song.name} - #{song.genre}"
          end
          #binding.pry
        end


      end


      #each.with_index(1) do |song, index|


    end
end
