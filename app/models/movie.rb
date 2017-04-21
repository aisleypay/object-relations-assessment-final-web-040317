class Movie
  attr_accessor :title
  ALL = []

  def initialize(title)
    self.title = title
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_title(title)
    ALL.find { |movie| movie.title == title }
  end

  def ratings
    Rating.all.select { |rating| rating.movie == self }
  end

  def viewers
    ratings.collect { |rating| rating.viewer }
  end

  def average_rating
    scores = ratings.collect { |rating| rating.score }
    scores.reduce(:+) / scores.size.to_f
  end

end
