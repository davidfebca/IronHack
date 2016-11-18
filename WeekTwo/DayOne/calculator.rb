class Calculator

  def self.add text
      if (text  == "" || text == nil)
        return 0
      end

      string = text.split(',')
      total = string.inject(0)do |sum,x|
        sum + x.to_i
      end
  end
end
puts(Calculator.add(nil))
