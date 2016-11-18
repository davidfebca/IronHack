require 'ruby-dictionary'
require 'pry'
class WordChain
    def initialize(dictionary)
        @dictionary = dictionary
    end
    def wordExist word
        @dictionary.exists?(word)
    end
    def find_chain (startingWord, endingWord)
        new_chain = ""
        starting = startingWord.split("")
        ending = endingWord.split("")
        new_chain += "#{startingWord} \n"
        a_word = ""
        while a_word != endingWord
        starting.each_with_index do |letter, index|
          if ending[index] != letter
             starting[index] = ending[index]
             new_word = starting.join
             #wordExist(new_word) == true ? new_chain += "#{new_word}\n" : starting[index] = letter
             if wordExist(new_word) == true
               new_chain += "#{new_word}\n"
               a_word = new_word
             else
               starting[index] = letter
             end
          end
        end
      end
        new_chain
    end
end
dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
puts(my_chain.find_chain("cat", "dog"))
puts(my_chain.find_chain("ruby", "code"))
