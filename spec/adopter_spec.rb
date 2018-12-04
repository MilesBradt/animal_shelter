require('rspec')
require('pg')
require('adopter')
require('db_create_spec')

describe(Adopter) do
  describe('#save') do
    it("Saves adopter to database") do
      test_adopter = Adopter.new({:name => "Miles", :phone_number => "5031234567", :animal_type => "dog", :animal_breed => "australian shepherd", :id =>  1})
      test_adopter.save()
      expect(Adopter.all()).to(eq([test_adopter]))
      end
    end







end
