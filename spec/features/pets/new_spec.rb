require 'rails_helper'

describe "As a visitor" do
 describe "on the new pet site (from /pets)" do
  before(:each) do
    @shelter_1 = Shelter.create(name: "Awesome Shelter",
                                  address: "2345 South St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80210")

  end
   it "I can enter the pet details and select teh shelter to add the pet to" do
    visit "/pets/new"
      fill_in "pet[image]", with: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/black-dog-breeds-black-labrador-retriever-1566497968.jpg"
      fill_in "pet[name]", with: "Charlie"
      fill_in "pet[description]", with: "An energetic dog"
      fill_in "pet[age]", with: "5"
      fill_in "pet[sex]", with: "male"
      page.select "#{@shelter_1.id}", from: 'pet[shelter_id]'
      click_button("Create Pet")
      expect(current_path).to eq('/pets')
      expect(page).to have_content("Charlie")
   end
   it "There is a link to view all pets" do
      visit "/pets/new"
      click_link("View all Pets")
      expect(current_path).to eq("/pets")
    end
    it "There is a link to view all shelters" do
      visit "/pets/new"
      click_link("View all Shelters")
      expect(current_path).to eq("/shelters")
    end
 end
end