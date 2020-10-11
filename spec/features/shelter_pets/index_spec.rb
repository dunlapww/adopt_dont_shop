require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters/:shelter_id/pets'" do
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

      @pet_2 = @shelter_1.pets.create(name: "Max",
                                    age: 2,
                                    sex: "male",
                                    image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/black-dog-breeds-black-labrador-retriever-1566497968.jpg")
      
    end
    it "I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's image, name, age, sex" do
      
      
      visit "/shelters/#{@shelter_1.id}/pets"

      @shelter_1.pets.each do |pet|
        expect(page).to have_content(pet.name)
        expect(page).to have_content(pet.age)
        expect(page).to have_content(pet.sex)
        expect(page).to have_xpath("//img[contains(@src,'#{pet.image}')]")
      end
    end
    it "Each pets update details button takes me to the pets update page" do
      visit "/shelters/#{@shelter_1.id}/pets"
      click_button("Update #{@pet_1.name}")
      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
    end
    it "Each pets delete button deletes the pet and returns me to /pets" do
      visit "/shelters/#{@shelter_1.id}/pets"
      click_button("Delete #{@pet_1.name}")
      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("#{@pet_1.name}")
    end
    it "Each pets view details button takes me to the pets show page" do
      visit "/shelters/#{@shelter_1.id}/pets"
      click_button("View #{@pet_1.name} Details")
      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end
    it "There is a link to return to the shelter page" do
      visit "/shelters/#{@shelter_1.id}/pets"
      click_link("Return to #{@shelter_1.name}")
      expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    end
    it "There is a link to add a pet to the shelter" do
      visit "/shelters/#{@shelter_1.id}/pets"
      click_link("Add Pet to #{@shelter_1.name}")
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")
    end
    it "There is a link to view all pets" do
      visit "/shelters/#{@shelter_1.id}/pets"
      click_link("View all Pets")
      expect(current_path).to eq("/pets")
    end
    it "There is a link to view all shelters" do
      visit "/shelters/#{@shelter_1.id}/pets"
      click_link("View all Shelters")
      expect(current_path).to eq("/shelters")
    end
  end
end