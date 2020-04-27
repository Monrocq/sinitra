require 'csv'

class Gossip
  attr_accessor :index, :author, :content

  def initialize(index = 0, author, content)
    @author = author
    @content = content
    @index = index
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
      all_gossips << Gossip.new(index, csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(index)
    return self.all[index.to_i]
  end
end