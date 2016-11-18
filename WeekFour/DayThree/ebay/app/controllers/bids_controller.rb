class BidsController < ApplicationController
  #TODO: dont hardcode de routes
  def create
    user_bid = params[:bid][:amount].to_i
    @actual_product =  Product.find params[:bid][:product_id].to_i
    unless @actual_product
      redirect_to '/'
      return
    end
    @current_user = User.find session[:user_id].to_i
    unless @current_user
      redirect_to '/products'
      return
    end
    #a user cant bid his own product
    if @current_user.id == @actual_product.user.id
      redirect_to '/products'
      return
    end

    if user_bid <= @actual_product.minimum || user_bid <= getBiggestBid(@actual_product).amount
      redirect_to '/products'
      return
    end
    @new_bid = Bid.new
    @new_bid.amount = params[:bid][:amount]
    @new_bid.user_id = @current_user.id
    @new_bid.product_id = @actual_product.id
    @new_bid.save
    redirect_to '/products'
  end
end
