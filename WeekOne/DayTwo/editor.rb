class Editor
    attr_accessor :blog
    def initialize blog
      @blog = blog
    end
    def printPosts
      puts @blog.publish_front_page(@blog.actualPage)
    end
    def printPagination
      puts @blog.printPagination
    end
    def main
      puts "Next or back?"
      command = gets.chomp
      if command =="next"
        if @blog.actualPage < @blog.totalPages
            @blog.actualPage = @blog.actualPage + 1
        else
          @blog.actualPage = 1
        end
      elsif command =="back"
        if @blog.actualPage > 1
            @blog.actualPage = @blog.actualPage - 1
        else
          @blog.actualPage = @blog.totalPages
        end
      else
        puts "You can only write next"
      end
      printPosts
      printPagination
      main
    end
end
