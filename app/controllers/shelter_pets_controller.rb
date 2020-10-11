class ShelterPetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
    @pets = Shelter.find(params[:id]).pets
    @pet_count = @shelter.pets.count
  end
  
  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @pet = Pet.create({
      name: params[:pet][:name],
      image: params[:pet][:image],
      description: params[:pet][:description],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      shelter_id: params[:id],
      status: "adoptable"
      })
    redirect_to "/shelters/#{params[:id]}/pets"

  end

end