class CommentsController < ApplicationController
  def create
    concert = Concert.find params[:comment][:concert_id]
    new_comment = Comment.new(
    content:params[:comment][:content],
    user:params[:comment][:user],
    concert:concert)
    if new_comment.valid?
      new_comment.save
    end
    redirect_to controller:"concerts",action:"details",id:concert.id
  end
end
