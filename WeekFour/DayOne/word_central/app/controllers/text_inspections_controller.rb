class TextInspectionsController < ApplicationController
  def new

  end
  def create
    @text = params[:text_inspection][:user_text]
    @text = @text.downcase.tr!(" ", "-")
    @word_count = (@text.split("-").length)
    @time_read = ((60 *@word_count)/275)
    redirect_to "/text_inspections/results/#{@text}/#{@word_count}"
  end
  def results
    @text = params[:text]
    @count = params[:count]
    @time_read = ((60 *@count.to_i)/275)
  end
end
