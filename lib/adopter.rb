require 'pg'

class Adopter
  attr_reader(:name, :phone_number, :animal_type, :animal_breed, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:animal_type)
    @breed = attributes.fetch(:animal_breed)
    @id = attributes.fetch(:id)
  end


  def self.all
    adopter_list = DB.exec("SELECT * FROM  adopter;")
    adopters = []
    adopter_list.each() do |adopter|
      name = adopter.fetch("name")
      number = adopter.fetch("phone_number")
      type = adopter.fetch("animal_type")
      breed = adopter.fetch("animal_breed")
      id = adopter.fetch("id").to_i()
      adopters.push(Adopter.new({:name => name, :phone_number => number, :animal_type => type, :animal_breed => breed, :id => id}))
    end
    adopters
  end

  def save
    DB.exec("INSERT INTO adopter (name, phone_number, animal_type, animal_breed, id) VALUES ('#{@name}', '#{@number}', '#{@type}', '#{@breed}', #{@id});")
  end

  def ==(another_adopter)
    self.name().==(another_adopter.name()).&(self.phone_number().==(another_adopter.phone_number())).&(self.animal_type().==(another_adopter.animal_type())).&(self.animal_breed().==(another_adopter.animal_breed())).&(self.id().==(another_adopter.id()))
  end


end
