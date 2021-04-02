def caesar_cipher(word, shift)
  shift = shift % 26
  result_array = word.split('')
  result_array.map! { |char| char.ord }
  result_array.map! do |char|
    if shift.positive?
      if char < 65 || char > 90 && char < 97 || char > 122
        char
      elsif char < 65 || char + shift > 90 && char < 97 || char + shift > 122
        char + (shift - 26)
      else
        char + shift
      end
    elsif shift.negative?
      if char < 65 || char > 90 && char < 97 || char > 122
        char
      elsif char + shift < 65 || char > 90 && char + shift < 97 || char > 122
        char + (shift - 26)
      else
        char + shift
      end
    end
  end
  result_array.map! { |char| char.chr }
  result = result_array.join
  puts result
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

# caesar_cipher("What a string!", 5)

caesar_cipher(string_to_encrypt, cipher)
