require_relative './mp3_importer'
require "pry"
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

    # def artist_song
    #     Artist.all.select {|a|a.song == self}
        
    # end

    def self.new_by_filename(file) #"Real Estate - Green Aisles - country.mp3"
       artist_name = file.split("-")[0].strip
       song_name = file.split("-")[1].strip
       new_song = Song.new(song_name)
       new_song.artist = Artist.find_or_create_by_name(artist_name)   
       new_song
    end

    def artist_name=(artist_n)
      artist = Artist.find_or_create_by_name(artist_n)
     
        artist.add_song(self)
      end
end