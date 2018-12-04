require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/adopter")
require("./lib/animal")
require("pg")

DB = PG.connect({:dbname => "shelter"})

get("/") do
  @list_animals = Animal.all()
  erb(:index)
end

get("/add_animal") do
  erb(:add_animal)
end

post("/add_animal") do
  erb(:add_animal)
end


get("/animals_list") do
  @list_animals = Animal.all()
  erb(:animals)
end

get("/adopters_list") do
  @list_adopters = Adopter.all()
  erb(:adopters)
end

post("/animals_list") do
  erb(:animals)
end

post("/adopters_list") do
  erb(:adopters)
end
