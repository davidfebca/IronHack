class CitiesController < ApplicationController
  def index
    @cities = City.all
    @city = City.new
  end
  def create
    new_city = City.new(name:params[:city][:name])
    if new_city.valid?
      new_city.save
    end
    redirect_to controller:"cities",action:"index"
  end
  def delete
    city = City.find params[:id]
    if city
      city.destroy
    end
    redirect_to controller:"cities",action:"index"
  end
end
