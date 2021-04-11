# Frozen_string_literal: true

def caesar_cipher(word, shift)
  shift = shift % 26
  result_array = word.split('')
  result_array.map!(&:ord)
  shift_chars(result_array, shift)
  result_array.map!(&:chr)
  result_array.join
end

def shift_chars(result_array, shift)
  result_array.map! do |char|
    shift.positive? ? shift_positive(shift, char) : shift_negative(shift, char)
  end
end

def shift_positive(shift, char)
  if char < 65 || char > 90 && char < 97 || char > 122
    char
  elsif char < 65 || char + shift > 90 && char < 97 || char + shift > 122
    char + (shift - 26)
  else
    char + shift
  end
end

def shift_negative(shift, char)
  if char < 65 || char > 90 && char < 97 || char > 122
    char
  elsif char + shift < 65 || char > 90 && char + shift < 97 || char > 122
    char + (shift - 26)
  else
    char + shift
  end
end

def string_to_encrypt
  puts 'Enter a word or phrase to encrypt:'
  string = gets.chomp
  while string =~ /\d/
    puts "Enter a word or phrase only.\nDo not include any numbers!\nPlease try again..."
    string = gets.chomp
  end
  string
end

def cipher
  puts 'Enter a number to use as the cipher for encryption:'
  cipher = gets.chomp
  while cipher =~ /[^\d]/
    puts "Enter a number only.\nPlease try again..."
    cipher = gets.chomp
  end
  cipher.to_i
end

puts caesar_cipher('What a string!', 5)

# caesar_cipher(string_to_encrypt, cipher)
