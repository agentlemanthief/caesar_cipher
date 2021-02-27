def caesar_cipher(word, shift)
  shift = shift%26
  result_array = word.split("")
  result_array.map! {|char| char.ord}
  result_array.map! do |char|
    if shift > 0
      if char < 65 || char > 90 && char < 97 || char > 122
        char
      elsif char < 65 || char + shift > 90 && char < 97 || char + shift > 122
        char + (shift - 26)
      else
        char + shift 
      end
    else
      if char < 65 || char > 90 && char < 97 || char > 122
        char
      elsif char + shift < 65 || char > 90 && char + shift < 97 || char  > 122
        char + (shift - 26)
      else
        char + shift 
      end
    end
  end
  result_array.map! {|char| char.chr}
  result = result_array.join
  puts result
end

def get_word()
  puts "Please enter a word or phrase to encrypt"
  gets.chomp
end

def get_cipher()
  puts "Please enter a cipher shift value"
  gets.chomp.to_i
end

puts caesar_cipher(get_word, get_cipher)