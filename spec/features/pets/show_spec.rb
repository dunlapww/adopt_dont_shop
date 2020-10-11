require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit "/pets/:id' do
    it 'I see the pet and details' do

      shelter_1 = Shelter.create(name: "Awesome Shelter",
                                  address: "2345 South St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80210")
    
      pet_1 = shelter_1.pets.create(name: "Jax",
                                    age: 5,
                                    sex: "male",
                                    image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg"
                                    )
      visit "/pets/#{pet_1.id}"

      expect(page).to have_content(pet_1.image)
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.description)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.status)
    end
  end
end