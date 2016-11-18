require "colorize"
require "pry"
require "date"
require_relative 'editor.rb'
require_relative 'post.rb'
require_relative 'blog.rb'
require_relative 'sponsoredPost'

myBlog = Blog.new(3,1)

post1 = Post.new("Title post 1", Date.new(2001,2,3),"Text post 1")
post2 = SponsoredPost.new("Title post 2",Date.new(2001,2,3),"Text post 2")
post3 = Post.new("Title post 3",Date.new(2001,2,3),"Text post 3")
post4 = Post.new("Title post 4", Date.new(2001,2,3),"Text post 4")
post5 = Post.new("Title post 5", Date.new(2001,2,3),"Text post 5")
post6 = Post.new("Title post 6", Date.new(2001,2,3),"Text post 6")
post7 = Post.new("Title post 7", Date.new(2001,2,3),"Text post 7")
post8 = Post.new("Title post 8",Date.new(2001,2,3),"Text post 8")

myBlog.add_item(post1)
myBlog.add_item(post2)
myBlog.add_item(post3)
myBlog.add_item(post4)
myBlog.add_item(post5)
myBlog.add_item(post6)
myBlog.add_item(post7)
myBlog.add_item(post8)

editor = Editor.new(myBlog)
editor.printPosts
editor.printPagination
editor.main
