require 'rails_helper'
RSpec.describe IngredientsController, type: :controller do
  describe  "GET /ingredients" do
    before do
      Ingredient.delete_all
      Ingredient.create(name:"Prova",calories:2)
    end
    it "should return a success code(200)" do
      get :index,{format: :json}
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(data.length).to eq(1)
    end
  end
  describe "GET #show" do
    it "shows an Ingredient" do
      ingredient = Ingredient.create(name:"Carrot",calories:2)
      get :show,{id:ingredient.id}
      expect(response).to be_success
      ingredient.destroy
    end
    it "returns 404 when ingredient doesnt exist" do
      get :show,{id:1}
      expect(response).to have_http_status 404
    end
  end
  describe "POST #create" do
    it "creates a new Ingredient" do
      expect {
        post :create, {ingredient: {name:'Carrot',calories:3}}
      }.to change(Ingredient,:count).by(1)
      expect(Ingredient.last.name).to eq('Carrot')
    end
  end
end
