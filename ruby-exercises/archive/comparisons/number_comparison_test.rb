gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

class NumberComparisonsTest < Minitest::Test
  def test_two_ints
    n1 = 1
    n2 = 1
    assert(n1.object_id == n2.object_id)
    assert(n1 == n2)
    assert n1 <= n2
    assert n1 >= n2
    assert_equal 0, n1 <=> n2
  end

  def test_float_and_int
    n1 = 1
    n2 = 1.0
    refute(n1.object_id == n2.object_id)
    assert n1 == n2
    assert n1 <= n2
    assert n1 >= n2
    assert_equal 0, n1 <=> n2
    assert_equal 0, n2 <=> n1
  end

  def test_two_different_ints
    n1 = 1
    n2 = 2
    refute n1.object_id == n2.object_id
    assert n1 < n2
    refute n1 > n2
    assert n1 <= n2
    refute n1 >= n2
    assert_equal -1, n1 <=> n2
    assert_equal 1, n2 <=> n1
  end

  def test_between
    one = 1
    five = 5
    ten = 10
    assert five.between?(one, ten)
    refute five.between?(ten, one)
    refute one.between?(five, ten)
  end

  def test_sort
    numbers = [9.99, 10.15, 2.75, 1.01]
    assert_equal [1.01,2.75,9.99,10.15], numbers.sort
  end
end
