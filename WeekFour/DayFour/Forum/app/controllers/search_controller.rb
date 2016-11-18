class SearchController < ApplicationController
  def movie_converter movies
    @movies = []
    movies.each_with_index do |movie, index|
      new_movie = Movie.new
      new_movie.id = movie.id
      new_movie.title = movie.title
      new_movie.poster = movie.poster
      new_movie.year = movie.year
      @movies.push(new_movie)
    end
    @movies
  end
  def search_imdb_movie criteria
    result = Imdb::Search.new(criteria)
    movie_converter(result.movies.take(10))
  end
  def results
    @movies = []
    @results_in_local = false
    query = params[:query]
    movies_in_db = Movie.where("title like ?", "% #{query} %")
    if movies_in_db.count > 0
      @movies = movies_in_db
      @results_in_local = true
    else
      @movies = search_imdb_movie(query)
    end
  end
end
