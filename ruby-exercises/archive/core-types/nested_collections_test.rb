require 'minitest/autorun'
require 'minitest/pride'

class NestedCollectionsTest < Minitest::Test
  
  def test_2D_array
    numbers = [[1, 2], [9, 4, 89], 9]
    
    assert_equal [1, 2], numbers.first
    assert_equal 2, numbers[0][1]
    assert_equal nil, numbers[1][3]
    assert_equal 9, numbers[2]
  end
  
  def test_2D_array_access
    numbers = [15, [45, 0, nil], [8]]
    
    assert_equal 15, numbers[0]
    assert_nil numbers[1][2]
    assert_equal 8, numbers[2][0]
  end
  
  def test_3D_array_access
    numbers = [[9, [4], [89, 11, 42]], [23, 2], 9]
    
    assert_equal [23, 2], numbers[1]
    assert_equal 11, numbers[0][2][1]
    assert_equal [4], numbers[0][1]
  end
  
  def test_2D_hash
    new_restaurants = {
      cultura: {cuisine: "Latin American", seats_available: 20}, 
      wallys: {cuisine: "Wisconsin treats", seats_available: 50}
    }
    expected_cultura = {cuisine: "Latin American", seats_available: 20}
    expected_wallys_cuisine = "Wisconsin treats"
      
    assert_equal expected_cultura, new_restaurants[:cultura]
    assert_equal expected_wallys_cuisine, new_restaurants[:wallys][:cuisine]
    assert_equal 20, new_restaurants.values.first[:seats_available]
  end
  
  def test_3D_hash_access
    
    stars = {
      proxima_centauri: {distance: 4.2, magnitudes: {
        apparent: -26.72, absolute: 4.8
      }},
      sirius_a: {distance: 8.6, magnitudes: {apparent: -1.46, absolute: 1.4}}
    }
      
    assert_equal 8.6, stars[:sirius_a][:distance]
    assert_equal -26.72, stars[:proxima_centauri][:magnitudes][:apparent]
    assert_equal ({apparent: -1.46, absolute: 1.4}), stars[:sirius_a][:magnitudes]
  end
  
  def test_mixed_array_access
    
    orders = [
      {10944 => {date: (Date.today - 1), products: ['shampoo', 'toothbrush']}},
      {10945 => {date: Date.today, products: ['handsoap']}}
    ]
    
    assert_equal 10944, orders.keys.first
    assert_equal Date.today, orders[10945][:date]
    assert_equal 'shampoo', orders[10944][:products][0]
  end
  
  def test_mixed_hash_access
  
    plants = {
      dahlia: {
        "Crichton Honey" => {
          'magenta': ['purple', 'red'], 
          'peach': ['orange', 'yellow', 'white'], 
          'green': ['yellow', 'blue']
        }, 
        "Whimsey" => ['yellow', ['blue', 'rose']], 
        "Kasasagi" => 'fire colors'
      },
      hollyhock: ["Chater's Salmon Queen", "Blackberry"]
    }
    
    assert_equal ['yellow', ['blue', 'rose']], plants[:dahlia]["Whimsey"]
    assert_equal ['yellow', 'blue'], plants[:dahlia]["Crichton Honey"][:green]
    assert_equal "Blackberry", plants[:hollyhock][1]
    assert_equal "white", plants[:dahlia]["Crichton Honey"][:peach][2]
    assert_equal "rose", plants[:dahlia]["Whimsey"][1][1]
  end
  
end