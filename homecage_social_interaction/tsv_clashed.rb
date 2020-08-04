require 'csv'

# HomecageSocialInteraction module
module HomecageSocialInteraction
  # TSV data file parser
  class Tsv
    
    attr_accessor :file, :raw_data
    
    #
    # parse & create self from tsv data file
    # @param [String] xy_data_file HomecageSocialInteraction test XYdata file
    # 
    def self.parse(xy_data_file)
      self.new xy_data_file
    end
    
    #
    # initializer
    # @param [String] xy_data_file HomecageSocialInteraction test XYdata file
    # 
    def initialize(file)
      @file = file
      parse
    end

    # parse tsv data file
    # @return [Array] Parsed data
    def parse

end
