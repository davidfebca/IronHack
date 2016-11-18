class SponsoredPost <Post
  def initialize(title, date, text)
    super(title,date,text)
  end
  def printPost
    puts "#{"*" * 10}#{@title}#{"*" * 10}\n"
  end
end
