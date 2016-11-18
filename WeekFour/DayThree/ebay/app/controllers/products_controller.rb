class ProductsController < ApplicationController
  #TODO: do a public method to check if user is loged in
  def getUserById id
    product = User.find id
  end
    def index
    @current_user = User.find session[:user_id].to_i
    unless @current_user
      redirect_to '/'
      return
    end
    @products = Product.all
  end
  def new
    @current_user = User.find session[:user_id].to_i
    unless @current_user
      redirect_to '/'
      return
    end
    @my_product = Product.new
  end
  def create
    @current_user = User.find session[:user_id].to_i
    unless @current_user
      redirect_to '/'
      return
    end
    @new_product = Product.new(title:params[:product][:title],description:params[:product][:description],
                deadline:params[:product][:deadline],minimum:params[:product][:minimum])
    @new_product.user = @current_user
    @new_product.save
    redirect_to '/products'
  end
  def delete
    @product = Product.find params[:id]
    if @product.user.id != session[:user_id].to_i
      redirect_to '/products'
      return
    end
    if @product != nil
      @product.destroy
    end
    redirect_to '/products'
  end
  def details
    @current_user = User.find session[:user_id].to_i
    @my_bid = Bid.new
    @closed = false
    @winner = nil
    unless @current_user
      redirect_to '/'
      return
    end
    @product = Product.find params[:id]
    unless @product
      redirect_to '/'
      return
    end
    today = DateTime.now
    if @product.deadline < today
      @closed = true
      @winner = getUserById(@product.getBiggestBid).name
    end
  end
end
