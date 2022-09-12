class PetsController < ApplicationController
  
  # GET /pets
  def index 
    @pets = Pet.all
    json_response(@pets)
  end 

  # GET  /pets/:id
  def show 
    @pet = Pet.find(params[:id])
    json_response(@pet)
  end 

  #POST /pets
  def create 
    @pet = Pet.new(pet_params) 
    if @pet.save
      json_response(@pet, status = :created )
    else 
      json_response({ message: "Could'nt create pet"}, status = :unprocessable_entity)
    end 
  end 

  #PUT /pets/:id
  def update 
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      json_response(@pet, status = :no_content)
    else 
      json_response({ message: 'No content'}, status= :no_content)
    end 
  end 

  # DELETE /pets/:id
  def destroy 
    @pet = Pet.find(params[:id])
    @pet.destroy 
    json_response(@pet, status = :no_content)
  end 

  private 
  def pet_params
    params.permit(:name, :animal)
  end 
end
