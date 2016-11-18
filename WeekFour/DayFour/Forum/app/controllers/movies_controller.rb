class MoviesController < ApplicationController
  before_action :set_user
  def set_user
    @my_user = User.find session[:user_id]
  end
  def movies
    @movies = Movie.all
  end
  def details
    @logged = false
    if @my_user
      @logged = true
    end
    @movie = Movie.find params[:id]
    @comment = Comment.new
  end
  def save
      result = Imdb::Movie.new(params[:id])
      new_movie = Movie.new
      new_movie.title = result.title
      new_movie.poster = result.poster
      new_movie.year = result.year
      new_movie.synopsis = result.plot
      new_movie.save
      @my_user.movies
      redirect_to controller:"movies",action:"movies"
  end

end
