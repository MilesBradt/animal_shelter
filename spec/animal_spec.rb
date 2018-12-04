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
    end

end
