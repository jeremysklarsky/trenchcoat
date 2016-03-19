class Search

  attr_accessor :start, :target, :max, :searches, :min

  def initialize(start, target, max)
    @max = max
    @min = 0
    @start = start
    @target = target
    self.find
  end

  def find
    guess = @start
    guesses = []
    guesses << guess
    until guess == @target do 
      
      if guess < @target
        @min = guess
        guesses << ((@max - guesses[-1]) / 2.0).round + guesses[-1]
        guess = guesses.last
      else
        @max = guess
        guesses << guesses.last - ((guesses[-1] - @min)/2)
        guess = guesses.last
      end
    end    
    @searches = guesses.size
    @searches
  end
end
