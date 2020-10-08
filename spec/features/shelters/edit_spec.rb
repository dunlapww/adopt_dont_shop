require 'rails_helper'

describe "As a visitor" do
  describe "when I'm taken to /shelters/:id/edit" do
    it "I see a form with fields name, address, city, state, zip populated with the shelters details" do
      
      shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")

      visit "/shelters/#{shelter_1.id}/edit"
      expect(find_field('shelter[name]').value).to eq shelter_1.name
      expect(find_field('shelter[address]').value).to eq shelter_1.address
      expect(find_field('shelter[city]').value).to eq shelter_1.city
      expect(find_field('shelter[state]').value).to eq shelter_1.state
      expect(find_field('shelter[zip]').value).to eq shelter_1.zip
    end
  end
end

  describe "As a visitor" do
  describe "when I make changes to one of the form fields and I click the button to submit the form" do
    it "a patch request is sent to '/shelters/:id' the shelters info is updated and I am redirected to the shelter page wher I see those changes" do
      
      shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")

      visit "/shelters/#{shelter_1.id}/edit"
      fill_in "shelter[name]", with: "Changed Shelter Name"
      click_button("Submit")
      expect(current_path).to eq("/shelters/#{shelter_1.id}")
      expect(page).to have_content("Changed Shelter Name")
    end
  end
end