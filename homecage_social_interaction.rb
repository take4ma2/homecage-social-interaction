require './homecage_social_interaction/tsv'
require './homecage_social_interaction/data'
require './homecage_social_interaction/parse'

module HomecageSocialInteraction
  def main(f, fo)
    parsed = HomecageSocialInteraction::Parse.new f
    data = HomecageSocialInteraction::Data.new parsed.data
    data.cage_data
    fo.puts 'CageId,N. of contacts(times),Duration of contacts(s),Duration of contacts in each minutes(s)'
    data.cage_data.each do |c|
      t = c.duration_of_contact
      count = c.n_of_contact
      # puts "%s, %i, %.1f" % [c.cage_id, count, t]
      m = c.each_minutes.map { |e| e.to_s }.join(',')
      fo.puts "%s,%i,%.1f,%s" % [c.cage_id, count, t, m]
    end
  end

  def VERSION
    '1.1.0 (Assigns output file name)'
  end
  module_function :main, :VERSION
end

filename = ARGV[0]
if filename.nil? || filename.size <= 0
  puts '[Error] XY[n].txt data is require!'
  exit
end

unless filename.match(/XY[0-9]*\.txt$/)
  puts '[Error] XY[n].txt file is require!'
  exit
end

output = filename.gsub(/\.txt$/, '_hsi.csv')

puts "Homecage Social Interaction test data analyzer [v. #{HomecageSocialInteraction.VERSION}]"

HomecageSocialInteraction.main filename, File.open(output,'w')

puts "Program terminate successfully!(result: #{output})"
