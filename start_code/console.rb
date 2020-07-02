require_relative("models/star")
require_relative("models/movie")

star_1 = Star.new({"first_name" => "George", "last_name" => "Clooney"})
star_1.save

movie1 = Movie.new({"title" => "Batman and Robin", "genre" => "superhero"})
movie1.save