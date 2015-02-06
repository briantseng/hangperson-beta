class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  attr_accessor :word, :guesses, :wrong_guesses, :word_with_guesses

  def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''
    @word_with_guesses = ''
    for i in 0...new_word.length
      @word_with_guesses += '-'
    end
  end

  def guess(letter)
    if not letter =~ /[[:alpha:]]/
      raise ArgumentError, 'Input is not a letter'
    elsif self.guesses.include? letter or self.wrong_guesses.include? letter
      false
    elsif self.word.include? letter
      self.guesses = self.guesses + letter
      update_word(letter)
      true
    else
      self.wrong_guesses = self.wrong_guesses + letter
    end
  end

  def update_word(letter)
    indices = (0 ... self.word.length).find_all { |i| self.word[i,1] == letter }
    indices.each do |i|
      self.word_with_guesses[i] = letter
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
