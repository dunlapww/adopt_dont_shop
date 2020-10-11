require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a pet show page' do
    it "I can delete a pet" do

      shelter_1 = Shelter.create(name: "Awesome Shelter",
                                  address: "2345 South St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80210")
    
      pet_1 = shelter_1.pets.create(name: "Jax",
                                    age: 5,
                                    description: "mellow dog",
                                    status: "adoptable",
                                    sex: "male",
                                    image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg"
                                    )
      visit "/pets/#{pet_1.id}"
      click_button("Delete Pet")
      expect(current_path).to eq('/pets')
      expect(page).to_not have_content('Jax')


    end
  end
end