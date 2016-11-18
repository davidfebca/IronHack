class SiteController < ApplicationController
  def index
    shortLink = params[:shortlink]
    original = Link.find_by shortUrl: shortLink
    if original == nil
      redirect_to '/error'
      return;
    end
    redirect_to original.originalUrl
  end
  def results
    @links = Link.all
  end
  def error
  end
  def new

  end
  def randomString
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...4).map { o[rand(o.length)] }.join
  end
  def create
    final = ""
    originalLink = params[:link][:original]
    if originalLink.include? "http://"
      final+= originalLink
    else
      final+="http://#{originalLink}"
    end
    exist = Link.find_by originalUrl: final
    if exist != nil
      redirect_to "/results"
    else
      new_link = Link.new(originalUrl: final,shortUrl:randomString())
      new_link.save
      redirect_to "/results"
    end
  end
end
