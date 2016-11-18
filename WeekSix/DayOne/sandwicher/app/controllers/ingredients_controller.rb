class IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all
    render json: ingredients
  end
  def create
    ingredient = Ingredient.create(ingredient_params)
    render json: ingredient
  end
  def find_ingredient id
    ingredient = Ingredient.find_by id:id
    unless ingredient
        render json:{error:"ingredient not found"},
            status:404
        return
    end
    ingredient
  end
  def show
    ingredient = find_ingredient params[:id].to_i
    unless ingredient
      
      return
    end
    render json: ingredient
  end
  def destroy
    ingredient = find_ingredient params[:id].to_i
    ingredient.destroy
    render json: ingredient
  end
  private
  def ingredient_params
    params.require(:ingredient)
    .permit(:name)
  end
end
