require 'math_game'

mult1 =   "cei"
mult2 =    "da"
add1 =    "gch"
add2 =   "dfb "
answer = "adfh"

char_set = (mult1 + mult2 + add1 + add2 + answer).chars.to_a.uniq.sort
char_set.delete(" ") # space is hard-coded to 0
value_set = (0..9).to_a

each_combination char_set, value_set, " " => 0 do |char_values|
 if valid_multiplication?( mult1, mult2, answer, char_values ) && valid_addition?( add1, add2, answer, char_values ) 
    puts char_values
  end
end
