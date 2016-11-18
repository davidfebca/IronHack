class CommentsController < ApplicationController
  def create
     #TODO: validate input data
      my_user = User.find session[:user_id]
      movie = Movie.find params[:comment][:movie_id]
      new_comment = Comment.new
      new_comment.content = params[:comment][:content]
      new_comment.user = my_user
      new_comment.movie = movie
      new_comment.save
      redirect_to controller:"movies", action:"details", id:"#{movie.id}"
  end
end
