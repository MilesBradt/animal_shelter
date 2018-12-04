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

get("/animals_list") do
  erb(:animals)
end

post("/animals_list") do
  name = params.fetch('name')
  gender = params.fetch('gender')
  type = params.fetch('type')
  breed = params.fetch('breed')
  added = params.fetch('date_added')
  # id = params.fetch('id').to_i
  new_animal = Animal.new({:name => name, :gender => gender, :type => type, :breed => breed, :id => nil, :date_added => added, :owner => "none"})

  new_animal.save
  erb(:animals)

end


get("/add_animal") do
  @list_animals = Animal.all()
  erb(:add_animal)
end

get("/adopters_list") do
  @list_adopters = Adopter.all()
  erb(:adopters)
end

post("/add_animal") do
  erb(:animals)
end

post("/adopters_list") do
  erb(:adopters)
end
