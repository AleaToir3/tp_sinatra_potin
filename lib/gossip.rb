require 'pry'
require 'csv'

class Gossip
  attr_accessor :content
  attr_accessor :author

  def initialize(author,content)
    @author = author
    @content = content
  end

  def save 
    CSV.open("./db/gossip.csv", "ab") { |csv| csv << [@author, @content]}

  # CSV.open("./db/gossip.csv", "ab") do |csv|
  # csv << [@author,@content]
  # end

  # def save
  #   CSV.open("./db/gossip.csv", "ab") do |csv|
  #     csv << ["#{@author}" , "#{@content}"]
  end
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end
  
  
end
