#TODO:  Movie class in other file
class MovieSearcher
  def initialize name
    @name = name
    @movies = {}
  end
  def movie_converter movies
    movies.each_with_index do |movie, index|
      @movies[index] = {:title => movie.title,:poster=>movie.poster,:year=>movie.year,:director=>movie.director}
    end
    @movies
  end
  def search_movie criteria
    @movies.clear
    result = Imdb::Search.new(criteria)
    movie_converter(result.movies.take(9))
  end
end
