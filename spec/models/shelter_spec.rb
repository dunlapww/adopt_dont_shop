require 'rails_helper'

describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do 
    it {should have_many :pets}
  end
  describe 'instance methods' do
    it 'can calculate count of pets' do
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
    
      expect(shelter_1.pet_count).to eq(2)
    end
  end


end
