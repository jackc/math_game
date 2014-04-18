def chars_to_number( digits, char_values )
  digits.reverse.chars.each_with_index.inject(0) do |sum, char_and_place|
    char, place = char_and_place 
    sum + char_values[char] * (10**place)
  end
end

def valid_multiplication?( char_mult1, char_mult2, char_product, char_values )
  mult1 = chars_to_number( char_mult1, char_values )
  mult2 = chars_to_number( char_mult2, char_values )
  product = chars_to_number( char_product, char_values )
  mult1 * mult2 == product
end

def valid_addition?( char_add1, char_add2, char_sum, char_values )
  add1 = chars_to_number( char_add1, char_values )
  add2 = chars_to_number( char_add2, char_values )
  sum = chars_to_number( char_sum, char_values )
  add1 + add2 == sum
end

def each_combination( char_set, value_set, char_values={}, &block )
  char_set = char_set.clone
  value_set = value_set.clone
  char_values = char_values.clone
  
  char = char_set.pop
  if char_set.size > 0
    value_set.each do |value|
      char_values[char] = value
      value_set_without_current_value = value_set.clone
      value_set_without_current_value.delete( value )
      each_combination( char_set, value_set_without_current_value, char_values, &block )
    end
  else
    value_set.each do |value|
      char_values[char] = value
      block.call( char_values.clone )
    end
  end
end