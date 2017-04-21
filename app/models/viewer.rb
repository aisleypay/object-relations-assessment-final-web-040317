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

#TEST examples
# paisley = Viewer.new("Paisley Singh")
# hari =  Viewer.new("Hari Singh")
# hero = Movie.new("Hero")
# brave = Movie.new("Brave")
# paisley.create_rating(10, hero)
# hari.create_rating(5, brave)
# hari.create_rating(9, hero)
# paisley.create_rating(8, brave)
