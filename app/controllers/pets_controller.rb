class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      image: params[:image],
      name: params[:name],
      description: params[:description],
      age: params[:age],
      sex: params[:sex],
      status: params[:status]
    })
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.delete(params[:id])
    redirect_to '/pets'
  end

  def new
    @shelters = Shelter.all
    @shelterids = @shelters.map {|shelter| shelter.id}
  end

  def create
     @pet = Pet.create({
      name: params[:pet][:name],
      image: params[:pet][:image],
      description: params[:pet][:description],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      shelter_id: params[:pet][:shelter_id],
      status: "adoptable"
      })
    redirect_to "/pets/#{@pet.id}"

  end


 
end
