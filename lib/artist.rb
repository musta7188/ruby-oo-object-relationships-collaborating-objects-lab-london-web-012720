require_relative './song.rb'
require "pry"
class Artist
    attr_accessor :name, :songs
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self

    end

    def self.all
        @@all
    end


    def add_song(song)
        song.artist = self
    end


    def songs
     
     Song.all.select {|s|s.artist == self}
    end

    def self.find(name)
        @@all.find{|a| a.name == name}
    end

    def self.find_or_create_by_name(artist_name)

     self.find(artist_name) ? self.find(artist_name) : self.new(artist_name)
            # a
            # self.all.select do |artist|
            #     if artist.name == artist_name 
            #        a = artist
            #     end       
            # end
    end

    def print_songs
     songs.select {|s|puts s.name}.join(" ")
    end
end

