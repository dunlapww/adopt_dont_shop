require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters/:shelter_id/pets'" do
    it "I see each Pet that can be adopted from that Shelter withthat shelter_id including the Pet's image, name, age, sex" do
      
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

      pet_2 = shelter_1.pets.create(name: "Max",
                                    age: 2,
                                    sex: "male",
                                    image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/black-dog-breeds-black-labrador-retriever-1566497968.jpg")
      
      visit "/shelters/#{shelter_1.id}/pets"

      pets = Pet.all.select {|pet| pet.shelter_id == shelter_1.id}
      pets.each do |pet|
        expect(page).to have_content(pet.name)
        expect(page).to have_content(pet.age)
        expect(page).to have_content(pet.sex)
        expect(page).to have_xpath("//img[contains(@src,'#{pet.image}')]")
      end
    end
  end
end