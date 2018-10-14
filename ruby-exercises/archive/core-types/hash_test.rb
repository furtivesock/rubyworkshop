require 'minitest/autorun'
require 'minitest/pride'

class HashTest < Minitest::Test
  def test_empty
    assert_equal true, {}.empty?
    assert_equal false, {"a" => "apple"}.empty?
  end

  def test_access
    ages = {16 => ["Alice", "Bob"], 24 => ["Charlie", "Dave"], 37 => ["Eve"]}
    
    assert_equal ["Alice", "Bob"], ages[16]
    assert_equal ["Eve"], ages[37]
  end

  def test_access_with_symbols
    ages = {
      siblings: ["Alice", "Bob"], 
      brothers: ["Charlie", "Dave"], 
      only_child: ["Eve"]
    }
    
    assert_equal ["Alice","Bob"], ages[:siblings]
    assert_equal ["Eve"], ages[:only_child]
  end
  
  def test_hash_alternative_symbol_assignment
    new_restaurants = {
      "cultura": "Latin American", 
      "wallys": "Wisconsin treats",
      "hickory_ash": "Colorado-centric"
      }
    
    assert_equal "Latin American", new_restaurants[:cultura]
    assert_equal "Wisconsin treats", new_restaurants[:wallys]
    assert_equal "Colorado-centric", new_restaurants[:hickory_ash]
  end

  def test_assignment
    stuff = {"a" => ["aardvark", "apple"], "b" => ["butcher", "ballerina"]}
    stuff["c"] = ["cook", "caramel candy"]
    stuff["b"] = "brandy"
    stuff["a"] = stuff["a"] + ["apricot"]
    
    assert_equal ["aardvark","apple","apricot"], stuff["a"]
    assert_equal "brandy", stuff["b"]
    assert_equal ["cook","caramel candy"], stuff["c"]
  end

  def test_assignment_with_symbols
    plants = {
      dahlia: ["Crichton Honey", "Whimsey", "Kasasagi"], 
      hollyhock: ["Chater's Salmon Queen", "Blackberry"]}
    plants[:snapdragon] = ["Black Prince", "Madame Butterfly"]
    plants[:hollyhock] = ["Majorette Mix"]
    plants[:dahlia] += ["Jitterbug"]
    
    expected_dahlias = ["Crichton Honey", "Whimsey", "Kasasagi", "Jitterbug"]
    
    assert_equal expected_dahlias, plants[:dahlia]
    assert_equal ["Black Prince", "Madame Butterfly"], plants[:snapdragon]
    assert_equal ["Majorette Mix"], plants[:hollyhock]
  end

  def test_keys
    assert_equal [], {}.keys
    assert_equal [1,2], {1 => "one", 2 => "two"}.keys
    assert_equal ["a","banana"], {"a" => "apple", "banana" => "b"}.keys
  end

  def test_keys_with_symbols
    assert_equal [:france, :lithuania], {france: "Paris", lithuania: "Vilnius"}.keys
    assert_equal [:forks, :spoons], {forks: 10, spoons: 20}.keys
  end

  def test_values
    assert_equal [], {}.values
    assert_equal ["one","two"], {1 => "one", 2 => "two"}.values
    assert_equal ["apple","b"], {"a" => "apple", "banana" => "b"}.values
  end
  
  def test_values_with_symbols
    assert_equal ["Paris","Vilnius"], {france: "Paris", lithuania: "Vilnius"}.values
    assert_equal [10,20], {forks: 10, spoons: 20}.values
  end

  def test_include
    boolean = {}.include?("a")
    refute boolean
    boolean = {"a" => "apple"}.include?("a")
    assert boolean
    boolean = {"a" => "apple"}.include?("apple")
    refute boolean
  end

  def test_member
    boolean = {}.member?("a")
    refute boolean
    boolean = {"a" => "apple"}.member?("a")
    assert boolean
    boolean = {"a" => "apple"}.member?("apple")
    refute boolean
  end
  
  def test_key
    boolean = {}.key?("a")
    refute boolean
    boolean = {"a" => "apple"}.key?("a")
    assert boolean
    boolean = {"a" => "apple"}.key?("apple")
    refute boolean
  end
  
  def test_member_and_include_and_key_with_symbols_and_strings
    boolean = {}.include?(:cake)
    refute boolean
    boolean = {cake: "yummy"}.include?(:cake)
    assert boolean
    boolean = {"cake": "yummy"}.member?("cake")
    refute boolean
    boolean = {"cake": "yummy"}.member?(:cake)
    assert boolean
    boolean = {cake: "yummy"}.key?(:cake)
    assert boolean
    boolean = {cake: "yummy"}.include?("yummy")
    refute boolean
    boolean = {cake: "yummy"}.member?("yummy")
    refute boolean
    boolean = {"cake": "yummy"}.key?("yummy")
    refute boolean
  end

  def test_invert
    h1 = {"a" => "apple", "b" => "banana"}.invert
    h2 = {1 => "one", 2 => "two"}.invert
    
    expected_h1 = {"apple" => "a", "banana" => "b"}
    expected_h2 = {"one" => 1, "two" => 2}
    
    assert_equal expected_h1, h1
    assert_equal expected_h2, h2
  end

  def test_invert_with_symbols
    food_colors = {beets: "purple", kiwis: "green"}.invert
    foods_with_many_colors = {
      apples: ["green", "red", "yellow"], 
      potatoes: ["brown", "red", "purple"]
    }.invert
    
    expected_food_colors = {"purple" => :beets, "green" => :kiwis}
    expected_foods_with_many_colors = {["green", "red", "yellow"]=>:apples, ["brown","red","purple"]=>:potatoes}
    
    assert_equal expected_food_colors, food_colors
    assert_equal expected_foods_with_many_colors, foods_with_many_colors
  end

  def test_length
    assert_equal 0, {}.length
    assert_equal 1, {"a" => "apple"}.length
    assert_equal 3, {"a" => "apple", "b" => "banana", "c" => "cantaloupe"}.length
  end

  def test_merge
    h1 = {}.merge({})
    apple = {"a" => "apple"}
    h2 = {}.merge(apple)
    h3 = apple.merge({"b" => "banana"})
    h4 = apple.merge({"a" => "avocado", "b" => "banana"})
    h5 = {"a" => "apple", "b" => "banana"}.merge({"b" => "breadfruit"})
    
    expected_h1 = {}
    expected_h2 = {"a"=>"apple"}
    expected_apple = {"a"=>"apple"}
    expected_h3 = {"a"=>"apple", "b"=>"banana"}
    expected_h4 = {"a"=>"avocado", "b"=>"banana"}
    expected_h5 = {"a" => "apple", "b" => "breadfruit"}

    assert_equal expected_h1, h1
    assert_equal expected_h2, h2
    assert_equal expected_apple, apple
    assert_equal expected_h3, h3
    assert_equal expected_h4, h4
    assert_equal expected_h5, h5
  end

  def test_merge_with_symbols
    new_restaurants = {cultura: "Latin American", wallys: "Wisconsin treats"}
    favorite_restaurants = {}.merge(new_restaurants)
    name_lengths = {maeby: 5}.merge({selena: 6})
    saturn = {saturn: 7}
    planet_rings = saturn.merge({jupiter: 3, uranus: 13, neptune: 6})
    battlestar_characters = {battlestar: ["Starbuck", "Apollo", "Boomer"]}
    futurama_characters = {futurama: ["Fry", "Leela", "Bender", "Zoidberg"]}
    tv_characters = battlestar_characters.merge(futurama_characters)
    tv_characters = tv_characters.merge({breaking_bad: "Walter White"})
    shape_sides = {circle: 1}.merge({square: 4, circle: "infinite"})
    
    expected_favorite_restaurants = {cultura: "Latin American", wallys: "Wisconsin treats"}
    expected_name_lengths = {maeby: 5, selena: 6}
    expected_planet_rings = {saturn: 7,jupiter: 3, uranus: 13, neptune: 6}
    expected_saturn = {saturn: 7}
    expected_tv_characters = {battlestar: ["Starbuck", "Apollo", "Boomer"], futurama: ["Fry", "Leela", "Bender", "Zoidberg"], breaking_bad: "Walter White"}
    expected_shape_sides = {square: 4, circle: "infinite"}

    assert_equal expected_favorite_restaurants, favorite_restaurants
    assert_equal expected_name_lengths, name_lengths
    assert_equal expected_planet_rings, planet_rings
    assert_equal expected_saturn, saturn
    assert_equal expected_tv_characters, tv_characters
    assert_equal expected_shape_sides, shape_sides
  end

  def test_update
    h1 = {}.update({})
    apple = {"a" => "apple"}
    h2 = {}.update(apple)
    h3 = apple.update({"b" => "banana"})
    h4 = apple.update({"a" => "avocado", "b" => "banana"})
    h5 = {"a" => "apple", "b" => "banana"}.update({"b" => "breadfruit"})
    
    expected_h1 = {}
    expected_h2 = {"a" => "apple"}
    expected_apple = {"a" => "avocado", "b" => "banana"}
    expected_h3 = {"a" => "avocado", "b" => "banana"}
    expected_h4 = {"a" => "avocado", "b" => "banana"}
    expected_h5 = {"a" => "apple", "b" => "breadfruit"}

    assert_equal expected_h1, h1
    assert_equal expected_h2, h2
    assert_equal expected_apple, apple
    assert_equal expected_h3, h3
    assert_equal expected_h4, h4
    assert_equal expected_h5, h5
  end
  
  def test_update_with_symbols
    new_restaurants = {"cultura": "Latin American", "wallys": "Wisconsin treats"}
    favorite_restaurants = {}.update(new_restaurants)
    name_lengths = {maeby: 5}.update({selena: 6})
    name_lengths_2 = {maeby: 5}.update({selena: 6, "maeby": 5})
    saturn = {saturn: 7}
    planet_rings = saturn.update({jupiter: 3, uranus: 13, neptune: 6})
    battlestar_characters = {battlestar: ["Starbuck", "Apollo", "Boomer"]}
    futurama_characters = {futurama: ["Fry", "Leela", "Bender", "Zoidberg"]}
    tv_characters = battlestar_characters.update(futurama_characters)
    tv_characters.update({breaking_bad: "Walter White"})
    shape_sides = {circle: 1}.update({square: 4, "circle": "infinite"})
    
    expected_favorite_restaurants = {"cultura": "Latin American", "wallys": "Wisconsin treats"}
    expected_name_lengths = {maeby: 5, selena: 6}
    expected_name_lengths_2 = {maeby: 5, selena: 6}
    expected_planet_rings = {saturn: 7, jupiter: 3, uranus: 13, neptune: 6}
    expected_saturn = {saturn: 7, jupiter: 3, uranus: 13, neptune: 6}
    expected_tv_characters = {battlestar: ["Starbuck", "Apollo", "Boomer"], futurama: ["Fry", "Leela", "Bender", "Zoidberg"], breaking_bad: "Walter White"}
    expected_shape_sides = {circle: "infinite", square: 4}
    
    assert_equal expected_favorite_restaurants, favorite_restaurants
    assert_equal expected_name_lengths, name_lengths
    assert_equal expected_name_lengths_2, name_lengths_2
    assert_equal expected_planet_rings, planet_rings
    assert_equal expected_saturn, saturn
    assert_equal expected_tv_characters, tv_characters
    assert_equal expected_shape_sides, shape_sides
  end

end