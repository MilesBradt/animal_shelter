require('rspec')
require('pg')
require('animal')
require('db_create_spec')

describe(Animal) do
  
  describe('#save') do

    it("Saves animal to database") do
      test_animal = Animal.new({:name => "Milo", :gender => "male", :type => "dog", :breed => "australian shepherd", :id => 1, :date_added=> '2018-12-04'})
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
      end

    it("Sorts animals by type") do
      test_animal_dog = Animal.new({:name => "Milo", :gender => "male", :type => "dog", :breed => "australian shepherd", :id => 1, :date_added => '2018-12-04'})
      test_animal_dog.save()

      test_animal_cat = Animal.new({:name => "Button", :gender => "female", :type => "cat", :breed => "chunky", :id => 2, :date_added => '2018-11-04'})
      test_animal_cat.save()

      test_animal_ferret = Animal.new({:name => "Noodle", :gender => "male", :type => "ferret", :breed => "long", :id => 3, :date_added => '2018-11-04'})
      test_animal_ferret.save()
      expect(Animal.all()).to(eq([test_animal_cat, test_animal_dog, test_animal_ferret]))
    end
  end

end
