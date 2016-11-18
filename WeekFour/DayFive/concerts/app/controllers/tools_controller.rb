class ToolsController < ApplicationController
  def price
    @concerts = []
    price = params[:price].to_i
    if price > 0
      results = Concert.where("price <= #{price}")
      @concerts = results
    end
  end
  def commented
    @concerts = Concert.all
    @concerts = @concerts.sort do |a,b|
        b.comments.count <=> a.comments.count
    end.take(10)
  end
end
