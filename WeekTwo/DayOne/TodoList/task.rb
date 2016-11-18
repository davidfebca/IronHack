class Task
    attr_reader :content, :id,:created_at,:updated_at
    @@current_id = 0
    def initialize(content)
        @content = content
        @status = false
        @id = @@current_id
        @@current_id += 1
        @created_at = Time.now
        @updated_at = nil
    end
    def complete?
      @status
    end
    def complete!
      @status = true
    end
    def update input
      @content = input
      @updated_at = Time.now
    end
end
