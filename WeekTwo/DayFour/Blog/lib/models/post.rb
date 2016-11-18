class Post
  attr_reader :id
  attr_accessor :title,:content, :category_id,:author,:published,:modified_at,:author_id
  @@current_id = 0

  def initialize title,content, category, author_id
    @id = @@current_id
    @@current_id += 1
    @title = title
    @content = content
    @category_id = category
    @author_id = author_id
    @published = true
    @created_at = Time.now
    @modified_at = nil
  end
  def update title, content, category,author, status
    @title = content
    @content = content
    @category = category
    @author = author
    @published = status
    @modified_at = Time.now
  end
  def change_status status
    @published = status
  end
  def get_content
    @content
  end
end
