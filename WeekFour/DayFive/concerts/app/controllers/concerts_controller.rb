class ConcertsController < ApplicationController
  def new
    @concerts= Concert.all
    @concert = Concert.new
  end
  def create
    city = City.find params[:concert][:city_id]
    artist = Artist.find params[:concert][:artist_id]
    new_concert = Concert.new(
    title:params[:concert][:title],
    venue:params[:concert][:venue],
    image:params[:concert][:image],
    price:params[:concert][:price],
    date:params[:concert][:date],
    description:params[:concert][:description],
    city:city,
    artist:artist)
    if new_concert.valid?
      new_concert.save
    end
    redirect_to controller:"concerts",action:"new"
  end
  def delete
    concert = Concert.find params[:id]
    if concert
      concert.destroy
    end
    redirect_to controller:"concerts",action:"new"
  end
  def details
    @concert = Concert.find params[:id]
    @comment = Comment.new
  end
end
