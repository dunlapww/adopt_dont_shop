require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit a pet show page' do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Awesome Shelter",
                                  address: "2345 South St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80210")
    
      @pet_1 = @shelter_1.pets.create(name: "Jax",
                                    age: 5,
                                    description: "mellow dog",
                                    status: "adoptable",
                                    sex: "male",
                                    image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg"
                                    )
      
    end
    it 'I can click update pet to edit pet details and then return to show' do
      visit "/pets/#{@pet_1.id}"
      click_button("Update #{@pet_1.name}")
      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
      
      
      expect(page).to have_selector("input[value='#{@pet_1.image}']")
      expect(page).to have_selector("input[value='#{@pet_1.name}']")
      expect(page).to have_selector("input[value='#{@pet_1.description}']")
      expect(page).to have_selector("input[value='#{@pet_1.age}']")
      expect(page).to have_selector("input[value='#{@pet_1.sex}']")
      expect(page).to have_selector("input[value='#{@pet_1.status}']")
      
      
      fill_in "name", with: "Jack"

      click_button('Update Pet')
      expect(current_path).to eq("/pets/#{@pet_1.id}")

    end
  end
end