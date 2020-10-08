require 'rails_helper'

describe "As a visitor" do
  describe "When I visit /pets" do
    it "I see each Pet in the system including teh Pet's: image, name, age, sex, shelter_name"

    shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")

    pet_1 = shelter_1.pets.create(name: "Jax",
                                  age: 5,
                                  sex: "male",
                                image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg")
    pet_2 = shelter_1.pets.create(name: "Max",
                                  age: 2,
                                  sex: "male",
                                image: "https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=965&quality=85&auto=format&fit=max&
                                
    
  end
end