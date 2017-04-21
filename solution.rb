class Viewer
  attr_accessor :first_name, :last_name
  ALL = []

  def initialize(name)
    @name = name
    @first_name = @name.split[0]
    @last_name = @name.split[1]
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    ALL
  end

  def self.find_by_name(name)
    ALL.find { |viewer| viewer.full_name == name }
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end

end

################################################

class Rating
  attr_accessor :score, :movie, :viewer
  ALL = []

  def initialize(score, movie, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    ALL << self
  end

  def self.all
    ALL
  end

end

################################################

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
