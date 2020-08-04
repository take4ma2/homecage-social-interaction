require './homecage_social_interaction/tsv'
#
# HomecageSocialInteraction module
#
module HomecageSocialInteraction
  #
  # Parse HSI XY data file
  #
  class Parse
    attr_accessor :tsv, :headers, :data
    
    #
    # Initializer
    # @param [Stinrg] xy_data_file HSI XY data file path
    #
    def initialize(xy_data_file)
      @head = nil
      @data = nil
      @tsv = HomecageSocialInteraction::Tsv.parse xy_data_file
    end

    def headers
      _headers if @header.nil?
      @headers
    end

    def _headers
      @tsv.raw_data.each_with_index do |row, i|
        if !row.index('Cage 1').nil?
          @headers = @tsv.raw_data[0..i-1]
          return
        end
      end
    end

    def data
      _data if @data.nil?
      @data
    end

    def _data
      @tsv.raw_data.each_with_index do |row, i|
        if !row.index('Cage 1').nil?
          @data = @tsv.raw_data[i..@tsv.raw_data.length-1]
          return
        end
      end
    end
  end
end
