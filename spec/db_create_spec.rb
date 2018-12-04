require("rspec")
require("pg")
require("adopter")
require("animal")

DB = PG.connect({:dbname => "shelter"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM adopter *;")
    DB.exec("DELETE FROM animals *;")
  end
end
