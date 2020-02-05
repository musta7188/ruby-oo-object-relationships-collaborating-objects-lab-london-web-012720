require "pry"
class MP3Importer
    attr_accessor :test_music_path


    def initialize(test_music_path)
        @test_music_path = test_music_path

    end

    def path
   @test_music_path

    end

    def files
        Dir.entries(path).select {|f| !File.directory? f}
    end

    def import
        self.files.each{|file| Song.new_by_filename(file)}
    end
end