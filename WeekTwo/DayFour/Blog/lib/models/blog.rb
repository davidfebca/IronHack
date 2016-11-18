class Blog
  attr_accessor :posts,:authors,:categories
  attr_reader :name
  def initialize name
    @name = name
    @posts = []
    @categories = []
    @authors = []
  end
  def add_post post
    @posts.push(post)
  end
  def new_post title,content, category_id,author_id
      new_post = Post.new(title,content,category_id,author_id)
      @posts.push(new_post)
      new_post
  end
  def add_category category
    @categories.push(category)
  end
  def add_author author
    @authors.push(author)
  end
  def get_posts
    @posts
  end
  def get_categories
        @categories
  end
  def get_authors
        @authors
  end
  def find_post id_post
    result = get_posts.find do |post|
      post.id == id_post
    end
  end
  def get_latest_posts
    result = get_posts.sort do |a,b|
        b.created_at <=> a.created_at
    end
  end
  def get_categories
    @categories
  end
  def get_category_by_id id
    result = get_categories.find do |category|
      category.id == id.to_i
    end
  end
  def get_posts_by_category category_id
    result = get_posts.select do |post|
      post.category_id == category_id.to_i
    end
  end
  def get_author_by_id author_id
    result = get_authors.find do |author|
      author.id == author_id.to_i
    end
  end
  def get_posts_by_author author_id
    result = get_posts.select do |post|
      post.author_id == author_id.to_i
    end
  end
end
