require 'rails_helper'

describe "As a vistor" do
  describe "When I visit a shelter pets index page" do
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
  
    it "I fill in the form with the pet's image, name, description, age, sex" do
      visit "/shelters/#{@shelter_1.id}/pets/new"

      fill_in "pet[image]", with: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/black-dog-breeds-black-labrador-retriever-1566497968.jpg"
      fill_in "pet[name]", with: "Charlie"
      fill_in "pet[description]", with: "An energetic dog"
      fill_in "pet[age]", with: "5"
      fill_in "pet[sex]", with: "male"
      click_button("Create Pet")
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
      expect(page).to have_content("Charlie")
      pet = Pet.last
      expect(pet.name).to eq("Charlie")
      expect(pet.description).to eq("An energetic dog")
      expect(pet.age).to eq(5)
      expect(pet.sex).to eq("male")
      expect(pet.status).to eq("adoptable")
    end
    it "There is a link to view all pets" do
      visit "/shelters/#{@shelter_1.id}/pets/new"
      click_link("View all Pets")
      expect(current_path).to eq("/pets")
    end
    it "There is a link to view all shelters" do
      visit "/shelters/#{@shelter_1.id}/pets/new"
      click_link("View all Shelters")
      expect(current_path).to eq("/shelters")
    end


    
  end
end
