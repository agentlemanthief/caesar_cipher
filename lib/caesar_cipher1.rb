# Frozen_string_literal: true

def caesar_cipher(word, shift)
  a_z = ('a'..'z').to_a
  upper_a_z = ('A'..'Z').to_a
  split_word = word.split('')
  shift_letters(split_word, shift, a_z, upper_a_z).join
end

def shift_letters(split_word, shift, a_z, upper_a_z)
  split_word.map! do |letter|
    case letter
    when 'a'..'z'
      a_z.rotate(shift)[a_z.index(letter)]
    when 'A'..'Z'
      upper_a_z.rotate(shift)[upper_a_z.index(letter)]
    else
      letter
    end
  end
end

puts caesar_cipher('Hello, World!', 5)
puts caesar_cipher('Mjqqt, Btwqi!', -5)
