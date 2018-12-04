require('rspec')
require('pg')
require('animal')
require('db_create_spec')

describe(Animal) do

  describe('#save') do
    it("Saves animal to database") do
      test_animal = Animal.new({:name => "Milo", :gender => "male", :type => "dog", :breed => "australian shepherd", :id => 1, :date_added=> '2018-12-04', :owner => "none"})
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

  describe("#all") do
    it("Sorts animals by type") do
      test_animal_dog = Animal.new({:name => "Milo", :gender => "male", :type => "dog", :breed => "australian shepherd", :id => 1, :date_added => '2018-12-04', :owner => "none"})
      test_animal_dog.save()

      test_animal_cat = Animal.new({:name => "Button", :gender => "female", :type => "cat", :breed => "chunky", :id => 2, :date_added => '2018-11-04', :owner => "none"})
      test_animal_cat.save()

      test_animal_ferret = Animal.new({:name => "Noodle", :gender => "male", :type => "ferret", :breed => "long", :id => 3, :date_added => '2018-11-04', :owner => "none"})
      test_animal_ferret.save()
      expect(Animal.all()).to(eq([test_animal_cat, test_animal_dog, test_animal_ferret]))
    end
  end

  describe("#sort_by_breed") do
    it("Sorts animals by breed") do
      test_animal_dog1 = Animal.new({:name => "Chewy", :gender => "female", :type => "dog", :breed => "corgi", :id => 1, :date_added => '2018-12-04', :owner => "none"})
      test_animal_dog1.save()

      test_animal_dog2 = Animal.new({:name => "Milo", :gender => "male", :type => "dog", :breed => "australian shepherd", :id => 2, :date_added => '2018-12-04', :owner => "none"})
      test_animal_dog2.save()

      test_animal_dog3 = Animal.new({:name => "Ryu", :gender => "male", :type => "dog", :breed => "street fighter", :id => 3, :date_added => '2018-12-04', :owner => "none"})
      test_animal_dog3.save()

      expect(Animal.sort_by_breed()).to(eq([test_animal_dog2, test_animal_dog1, test_animal_dog3]))
    end
  end

  describe("#sort_by_name") do
    it("Sorts animals by name") do
      test_animal_dog = Animal.new({:name => "Milo", :gender => "male", :type => "dog", :breed => "australian shepherd", :id => 1, :date_added => '2018-12-04', :owner => "none"})
      test_animal_dog.save()

      test_animal_cat = Animal.new({:name => "Button", :gender => "female", :type => "cat", :breed => "chunky", :id => 2, :date_added => '2018-11-04', :owner => "none"})
      test_animal_cat.save()

      test_animal_ferret = Animal.new({:name => "Noodle", :gender => "male", :type => "ferret", :breed => "long", :id => 3, :date_added => '2018-11-04', :owner => "none"})
      test_animal_ferret.save()

      expect(Animal.sort_by_name()).to(eq([test_animal_cat, test_animal_dog, test_animal_ferret]))
    end
  end

  describe("#sort_by_date") do
    it("Sorts animals by date added") do
      test_animal_dog = Animal.new({:name => "Milo", :gender => "male", :type => "dog", :breed => "australian shepherd", :id => 1, :date_added => '2018-12-04', :owner => "none"})
      test_animal_dog.save()

      test_animal_cat = Animal.new({:name => "Button", :gender => "female", :type => "cat", :breed => "chunky", :id => 2, :date_added => '2018-11-04', :owner => "none"})
      test_animal_cat.save()

      test_animal_ferret = Animal.new({:name => "Noodle", :gender => "male", :type => "ferret", :breed => "long", :id => 3, :date_added => '2018-10-10', :owner => "none"})
      test_animal_ferret.save()

      expect(Animal.sort_by_date()).to(eq([test_animal_ferret, test_animal_cat, test_animal_dog]))
    end
  end

end
