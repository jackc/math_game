require 'math_game'
require 'minitest/autorun'

class MathGameTest < MiniTest::Unit::TestCase
  def test_chars_to_number
    assert_equal 123, chars_to_number("abc", "a" => 1, "b" => 2, "c" => 3)
  end

  def test_valid_multiplication
    assert valid_multiplication?( "a", "b", "c", "a" => 2, "b" => 3, "c" => 6 )
    assert !valid_multiplication?( "a", "b", "c", "a" => 2, "b" => 3, "c" => 7 )
  end

  def test_valid_addition
    assert valid_addition?("a", "b", "c", "a" => 1, "b" => 2, "c" => 3)
    assert !valid_addition?("a", "b", "c", "a" => 1, "b" => 2, "c" => 4)
  end

  def test_each_combination
    expected_combinations = [
      {"c"=>1, "b"=>2, "a"=>3},
      {"c"=>1, "b"=>3, "a"=>2},
      {"c"=>2, "b"=>1, "a"=>3},
      {"c"=>2, "b"=>3, "a"=>1},
      {"c"=>3, "b"=>1, "a"=>2},
      {"c"=>3, "b"=>2, "a"=>1}
    ]

    actual_combinations = []

    each_combination %w{ a b c }, [1,2,3] do |char_values|
      assert expected_combinations.include?( char_values ), "Expected combinations does not include #{char_values}"
      expected_combinations.delete( char_values )
    end

    assert expected_combinations.empty?, "All expected combinations were not used"
  end

  def test_each_combination_with_larger_value_set_than_char_set
    expected_combinations = [
      {"b"=>3, "a"=>1},
      {"b"=>3, "a"=>2},
      {"b"=>2, "a"=>3},
      {"b"=>2, "a"=>1},
      {"b"=>1, "a"=>3},
      {"b"=>1, "a"=>2}
    ]

    actual_combinations = []

    each_combination %w{ a b }, [1,2,3] do |char_values|
      assert expected_combinations.include?( char_values ), "Expected combinations does not include #{char_values}"
      expected_combinations.delete( char_values )
    end

    assert expected_combinations.empty?, "All expected combinations were not used. Leftovers: #{expected_combinations}"
  end
end
