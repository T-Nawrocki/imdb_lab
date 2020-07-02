require_relative("models/star")
require_relative("models/movie")
require_relative("models/casting")

Casting.delete_all
Star.delete_all
Movie.delete_all

star1 = Star.new({"first_name" => "George", "last_name" => "Clooney"})
star1.save
star2 = Star.new({"first_name" => "Johnny", "last_name" => "Depp"})
star2.save

movie1 = Movie.new({"title" => "Batman and Robin", "genre" => "superhero"})
movie1.save

casting1 = Casting.new({"movie_id" => movie1.id, "star_id" => star1.id, "fee" => "10"})
casting1.save

star2.delete