require 'rails_helper'

describe "As a visitor" do
  describe "when I'm taken to /shelters/:id/edit" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")
    end
    it "I see a form with fields name, address, city, state, zip populated with the shelters details" do
      visit "/shelters/#{@shelter_1.id}/edit"
      expect(find_field('shelter[name]').value).to eq @shelter_1.name
      expect(find_field('shelter[address]').value).to eq @shelter_1.address
      expect(find_field('shelter[city]').value).to eq @shelter_1.city
      expect(find_field('shelter[state]').value).to eq @shelter_1.state
      expect(find_field('shelter[zip]').value).to eq @shelter_1.zip
    end
    it "a patch request is sent to '/shelters/:id' the shelters info is updated and I am redirected to the shelter page wher I see those changes" do
      visit "/shelters/#{@shelter_1.id}/edit"
      fill_in "shelter[name]", with: "Changed Shelter Name"
      click_button("Submit")
      expect(current_path).to eq("/shelters/#{@shelter_1.id}")
      expect(page).to have_content("Changed Shelter Name")
    end
    it "There is a link to view all pets" do
      visit "/shelters/#{@shelter_1.id}/edit"
      click_link("View all Pets")
      expect(current_path).to eq("/pets")
    end
    it "There is a link to view all shelters" do
      visit "/shelters/#{@shelter_1.id}/edit"
      click_link("View all Shelters")
      expect(current_path).to eq("/shelters")
    end
  end
end
