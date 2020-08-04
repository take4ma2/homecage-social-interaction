# frozen_string_literal: true
require './homecage_social_interaction/datum'
require 'time'
require 'pry'
# HomecageSocialInteraction module
module HomecageSocialInteraction
  # Data class
  class Data
    attr_accessor :cage_data
    attr_accessor :raw_data
    def initialize(data)
      @raw_data = data
      @cage_data = []
    end

    def cage_data
      if @cage_data.size == 0 then
        d = compact
        d[0].each_with_index do |cage_id,i|
          @cage_data << HomecageSocialInteraction::Datum.new(cage_id)
          @cage_data[i].animal_id = d[1][i+1]
          @cage_data[i].group_id = d[2][i+1]
          @cage_data[i].n = d[3][i+1]
        end
        d[5..d.size-1].each do |rec|
          date = Time.strptime(rec[0],"%Y/%m/%d/%H:%M:%S")
          @cage_data.each_with_index do |c,i|
            c.dates     << date
            c.particles << rec[i*14+1].to_f
            c.xors      << rec[i*14+2].to_f
            c.xs1       << rec[i*14+3].to_f
            c.xs2       << rec[i*14+4].to_f
            c.xs3       << rec[i*14+5].to_f
            c.xs4       << rec[i*14+6].to_f
            c.ys1       << rec[i*14+7].to_f
            c.ys2       << rec[i*14+8].to_f
            c.ys3       << rec[i*14+9].to_f
            c.ys4       << rec[i*14+10].to_f
            c.areas1    << rec[i*14+11].to_f
            c.areas2    << rec[i*14+12].to_f
            c.areas3    << rec[i*14+13].to_f
            c.areas4    << rec[i*14+14].to_f
          end
        end
      end
      @cage_data
    end

    def compact
      @raw_data.map{ |d| d.compact.reject{ |c| c.strip == '' } }
    end
  end
end
