require 'csv'
require './search'

class Simulator
  def initialize()
    @record_book = Hash.new{ |hash, key| hash[key] = 0 }
    @total_book  = Hash.new{ |hash, key| hash[key] = 0 }
  end

  def simulate
    (1..1000).each do |i|
      puts i
      (1..1000).each do |n|
        searcher = Search.new(i, n, 1000)
          @record_book[i] += 1 if searcher.searches <= 9
          @total_book[i] += searcher.searches
      end
    end
    CSV.open("data.csv", "wb"){|csv| @record_book.to_a.each {|elem| csv << elem} }
    CSV.open("dataTotal.csv", "wb") {|csv| @total_book.to_a.each {|elem| csv << elem} }
  end
end

simulator = Simulator.new
simulator.simulate