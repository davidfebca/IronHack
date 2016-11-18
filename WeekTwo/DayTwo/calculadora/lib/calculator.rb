require 'io/console'
require 'yaml/store'
require 'tzinfo'
class Calculator
  def self.add num1, num2
    result = num1 + num2
  end
  def self.substract num1, num2
    num1 - num2
  end
  def self.mulitply num1, num2
    num1 * num2
  end
  def self.divide num1, num2
    num1/num2
  end
  def self.save text
    store = YAML::Store.new("./public/operations.yml")
    store.transaction do
      store["operation"] = text
   end
  end
  def self.count number
    text = ""
    for n in 1..number
      text += " #{n} "
    end
    text
  end
  def self.timezone zone
    zone
  end
end
