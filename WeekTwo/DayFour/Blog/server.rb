require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require ('./lib/models/blog')
require ('./lib/models/post')
require ('./lib/models/category')

enable :sessions
blog = Blog.new("MyBlog")
category1 = Category.new(1,"Furbol")
category2 = Category.new(2,"Volley")
author1 = Author.new(1,"David")
author2 = Author.new(2,"Miguel")
post1 = Post.new("First post","Content first post",1,1)
post2 = Post.new("hola1 post","Content second post",1,1)
post3 = Post.new("hola2 post","Content second post",2,2)
post4 = Post.new("hola3 post","Content second post",2,2)
post5 = Post.new("hola4 post","Content second post",2,2)
blog.add_category(category1)
blog.add_category(category2)
blog.add_author(author1)
blog.add_author(author2)
blog.add_post(post1)
blog.add_post(post2)
blog.add_post(post3)
blog.add_post(post4)
blog.add_post(post5)
get "/" do
  @posts = blog.posts
  erb(:home)
end
get "/categories" do
  @categories = blog.get_categories
  erb(:categories)
end
get "/authors" do
  @authors = blog.get_authors
  erb(:authors)
end
get "/new" do
  @authors = blog.get_authors
  @categories = blog.get_categories
  erb(:new)
end
get "/read/:id" do
  @post = blog.find_post(params[:id].to_i)
  erb(:read)
end
post "/create" do
  title = params[:title]
  content = params[:content]
  category = params[:category]
  author = params[:author]
  blog.new_post(title,content,category,author)
  redirect to '/'
end
