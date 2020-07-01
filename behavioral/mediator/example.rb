require 'pry'
# Component / Colleague 1
class WordsList
  attr_accessor :words

  def initialize(words)
    @words = words
  end
end
# Component / Colleague 2
class TextField
  attr_accessor :value, :observers

  def initialize
    @observers = []
    @value = ''
  end

  def value=(value)
    @value = value
    observers.each { |observer| observer.text_field_changed }
  end
end

class SearchMediator
  attr_reader :text_field, :words_list

  def initialize(text_field, words_list)
    @text_field = text_field
    @text_field.observers << self
    @words_list = words_list
  end

  def text_field_changed
    filtered_words = words_list.words.select { |word| word.start_with?(text_field.value) }
    @words_list.words = filtered_words
  end
end

words_list = WordsList.new(["apple", "avocado", "banana", "bread"])
text_field = TextField.new
mediator = SearchMediator.new(text_field, words_list)

text_field.value = "a"
puts words_list.words.inspect # ["apple", "avocado"]
