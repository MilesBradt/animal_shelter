require 'pg'
require 'pry'
class Animal
  attr_reader(:name, :gender, :type, :breed, :id, :date_added)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @id = attributes.fetch(:id)
    @added = attributes.fetch(:date_added)
  end




  def self.all
    animal_list = DB.exec("SELECT * FROM animals ORDER BY type;")
    animals = []
    animal_list.each() do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      id = animal.fetch("id").to_i()
      added = animal.fetch("date_added")
      animals.push(Animal.new({:name => name, :gender => gender, :type => type, :breed => breed, :id => id, :date_added => added}))
    end
    animals
  end

  def self.sort_by_breed
   animal_list = DB.exec("SELECT * FROM animals ORDER BY breed;")
   animals = []
   animal_list.each() do |animal|
     name = animal.fetch("name")
     gender = animal.fetch("gender")
     type = animal.fetch("type")
     breed = animal.fetch("breed")
     id = animal.fetch("id").to_i()
     added = animal.fetch("date_added")
     animals.push(Animal.new({:name => name, :gender => gender, :type => type, :breed => breed, :id => id, :date_added => added}))
   end
   animals
  end

  def self.sort_by_name
   animal_list = DB.exec("SELECT * FROM animals ORDER BY name;")
   animals = []
   animal_list.each() do |animal|
     name = animal.fetch("name")
     gender = animal.fetch("gender")
     type = animal.fetch("type")
     breed = animal.fetch("breed")
     id = animal.fetch("id").to_i()
     added = animal.fetch("date_added")
     animals.push(Animal.new({:name => name, :gender => gender, :type => type, :breed => breed, :id => id, :date_added => added}))
   end
   animals
  end

  def save
    DB.exec("INSERT INTO animals (name, gender, type, breed, id, date_added) VALUES ('#{@name}', '#{@gender}', '#{@type}', '#{@breed}', #{@id}, '#{@added}');")
  end

  def ==(another_animal)
    self.name().==(another_animal.name()).&(self.gender().==(another_animal.gender())).&(self.type().==(another_animal.type())).&(self.breed().==(another_animal.breed())).&(self.id().==(another_animal.id())).&(self.date_added().==(another_animal.date_added()))
  end


end
