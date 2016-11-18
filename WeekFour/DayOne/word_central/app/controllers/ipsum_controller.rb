class IpsumController < ApplicationController
  def new

  end
  def create
      @palabras = ["una","dos","tres"]
      @parrafos = ["primer parrafo","segundo parrafo","tercer parrafo"]
      @num_palabras = params[:ipsum][:palabras].to_i
      @num_parrafos = params[:ipsum][:parrafos].to_i
      @result = ""
      if @num_palabras > 0
        @palabras.take(@num_palabras).each do |word|
          @result += "#{word}<br/>"
        end
      else
        @parrafos.take(@num_parrafos).each do |parrafo|
          @result += "#{parrafo}<br/>"
        end
      end
      render :text =>"#{@result}"
  end
end
