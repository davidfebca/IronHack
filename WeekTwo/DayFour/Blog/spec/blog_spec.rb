require 'rspec'
require './lib/models/author'
require './lib/models/category'
require './lib/models/post'
require './lib/models/blog'

describe Blog do
  before do
    subject = Blog.new("MyBlog")
    category1 = Category.new(1,"Furbol")
    author1 = Author.new(1,"David")
    post1 = Post.new("First post","Content first post",1,1)
    blog.add_category(category1)
    blog.add_author(author1)
    blog.add_post(post1)
  end

  describe '#add_post' do
    post = Post.new("Titulo","content",1,1)
    subject.add_post(post)
    let(:result){subject.posts}
    let(:expected_output){post}
    it 'add a post into posts array' do
      expect(result).to inlcude(expected_output)
    end
  end
  describe '#add_category' do
    category = Category.new(2,"Category")
    subject.add_category(category)
    let(:result){subject.categories}
    let(:expected_output){category}
    it 'add a category into category array' do
      expect(result).to inlcude(expected_output)
    end
  end
  describe '#add_author' do
    author = Author.new(2,"Category")
    subject.add_author(author)
    let(:result){subject.authors}
    let(:expected_output){category}
    it 'add a author into authors array' do
      expect(result).to inlcude(expected_output)
    end
  end
  describe '#new_post' do
    post = subject.new_post("Title","Content",1,1)
    let(:result){subject.posts}
    let(:expected_output){post}
    it 'new post' do
      expect(result).to inlcude(expected_output)
    end
  end
  describe '#get_posts' do
    posts = subject.get_posts
    let(:result){subject.get_posts}
    let(:expected_output){posts}
    it 'get posts' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#get_categories' do
    categories = subject.get_categories
    let(:result){subject.get_categories}
    let(:expected_output){categories}
    it 'get categories' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#get_authors' do
    authors = subject.get_authors
    let(:result){subject.get_authors}
    let(:expected_output){authors}
    it 'get categories' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#find_post' do
    let(:result){subject.find_post(0)}
    let(:expected_output){post1}
    it 'get categories' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#get_category_by_id' do
    let(:result){subject.get_category_by_id(1)}
    let(:expected_output){category1}
    it 'get categories' do
      expect(result).to eq(expected_output)
    end
  end
end
