require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit "/pets/:id' do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Awesome Shelter",
                                  address: "2345 South St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80210")
    
      @pet_1 = @shelter_1.pets.create(name: "Jax",
                                    age: 5,
                                    sex: "male",
                                    image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg"
                                    )
    end
    it 'I see the pet and details' do
      visit "/pets/#{@pet_1.id}"

      expect(page).to have_xpath("//img[contains(@src,'#{@pet_1.image}')]")
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.description)
      expect(page).to have_content(@pet_1.age)
      expect(page).to have_content(@pet_1.sex)
      expect(page).to have_content(@pet_1.status)
    end
    it "Each pets update details button takes me to the pets update page" do
      visit "/pets/#{@pet_1.id}"
      click_button("Update #{@pet_1.name}")
      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
    end
    it "Each pets delete button deletes the pet and returns me to /pets" do
      visit "/pets/#{@pet_1.id}"
      click_button("Delete #{@pet_1.name}")
      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("#{@pet_1.name}")
    end
  end
end