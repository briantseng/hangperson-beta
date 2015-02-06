class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
    if self.word.include? letter
      self.guesses = self.guesses + letter
      true
    else
      self.wrong_guesses = self.wrong_guesses + letter
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
