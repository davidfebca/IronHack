class Blog
  attr_accessor(:pageSize,:actualPage)
  def initialize pageSize, actualPage
    @posts = []
    @pageSize = pageSize
    @actualPage = actualPage
  end
  def add_item(post)
  	@posts.push(post)
  end
  def totalPages
    @posts.length / @pageSize +1
  end
  def printPagination
    total = ""
    for i in 1..totalPages
      if i == @actualPage
        total +=" #{i} ".colorize(:blue)
      else
        total+= " #{i} "
      end
    end
    total
  end
  def publish_front_page page
    result = ""
    #pagination
    startingPost = 0
    if(page !=1)
      startingPost = (page * @pageSize) - @pageSize
    end
    @posts = @posts.sort! { |a,b| b.date <=> a.date }
    #get desired posts
    #refactor this
    @posts.drop(startingPost).take(@pageSize).each do |post|
        post.printPost
        result +="\n#{"*" * 30}\n#{post.text}\n#{"-" * 30}\n"
    end
    result
  end
end
