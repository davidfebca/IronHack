class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]


def array_printer(array)
  array.each do | language |
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
end

#array_printer(array_of_languages)
puts "-----------------map------------------------------"
aged_languages = array_of_languages.map do |language|
  ProgrammingLanguage.new(language.name,language.age+1,language.type)
end
puts "The programming languages aged one year are: "
array_printer(aged_languages)
puts "-------------------sort----------------------------"
sorted_languages = array_of_languages.sort do |a,b|
  b.age<=>a.age
end
array_printer(sorted_languages)
puts "--------------------delete---------------------------"
without_java = array_of_languages.delete_if do |language|
language.name == "Java"
end
array_printer(without_java)
puts "--------------------shuffle---------------------------"
shuffle_languages = sorted_languages.shuffle do |a,b|
  b.age<=>a.age
end
array_printer(shuffle_languages)
puts "----------------------drop-------------------------"
dropped_languages = array_of_languages.drop(1)
array_printer(dropped_languages)
puts "----------------------clear-------------------------"
empty_languages = array_of_languages.clear
array_printer(empty_languages)
