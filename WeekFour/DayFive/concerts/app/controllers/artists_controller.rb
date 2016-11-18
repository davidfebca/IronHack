class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    @artist = Artist.new
  end
  def create
    new_artist = Artist.new(name:params[:artist][:name])
    if new_artist.valid?
      new_artist.save
    end
    redirect_to controller:"artists",action:"index"
  end
  def delete
    artist= Artist.find params[:id]
    if artist
      artist.destroy
    end
    redirect_to controller:"artists",action:"index"
  end
end
