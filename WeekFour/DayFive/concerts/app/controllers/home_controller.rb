class HomeController < ApplicationController
  def index
    #get concerts for today
    @concerts = Concert.where("date == ?", Time.zone.now.beginning_of_day)
    @next_concerts = Concert.where("date > ?", Time.zone.now.beginning_of_day)
  end
end
