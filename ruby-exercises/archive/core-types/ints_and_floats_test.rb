# encoding: utf-8
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class IntsAndFloatsTest < Minitest::Test
  def test_add
    assert_equal 9.0, (7.+ 2)
    assert_equal 13, (8 + 5)
  end

  def test_subtract
    assert_equal -3.0, (5.- 8)
    assert_equal 7, (10 - 3)
  end

  def test_divide
    assert_equal 4.0, (12./ 3)
    assert_equal 3, (18 / 6)
    assert_equal 2, (18 / 7)
    assert_equal 2.5714285714285716, (18.0 / 7)
    assert_equal 2.5714285714285716, (18 / 7.0)
  end

  def test_multiply
    assert_equal 32.0, (8.* 4)
    assert_equal 14, (2 * 7)
  end

  def test_power
    assert_equal 81, (3.** 4)
    assert_equal 1, (1 ** 18)
  end

  def test_modulo
    assert_equal 2.0, (8.% 3)
    assert_equal 3, (8 % 5)
  end

  def test_succ
    assert_equal 2, 1.succ
    assert_equal 18, 17.succ
    assert_equal 31, 30.succ
  end

  def test_pred
    assert_equal 98, 99.pred
    assert_equal 12, 13.pred
    assert_equal 7, 8.pred
  end

  def test_even
    refute 7.even?
    assert 6.even?
    assert 0.even?
  end

  def test_odd
    refute 4.odd?
    assert 9.odd?
    assert 13.odd?
  end

  def test_zero
    assert 0.zero?
    refute 1.zero?
  end

  def test_round
    assert_equal 35, 34.56.round
    assert_equal 0, 0.23.round
    assert_equal 87, 87.round
    assert_equal 0, 0.round
    assert_equal -84, -83.82.round
  end

  def test_to_f
    assert_equal 8.0, 8.to_f
    assert_equal 8.9, 8.9.to_f
    assert_equal 0.9, 0.9.to_f
    assert_equal -83.82, -83.82.to_f
  end

  def test_to_i
    assert_equal 8, 8.to_i
    assert_equal 8, 8.9.to_i
    assert_equal 0, 0.9.to_i
    assert_equal 0, 0.23.to_i
    assert_equal -83, -83.82.to_i
  end

  def test_to_s
    assert_equal "8", 8.to_s
    assert_equal "8.9", 8.9.to_s
    assert_equal "0.9", 0.9.to_s
    assert_equal "0.23", 0.23.to_s
    assert_equal "-83.82", -83.82.to_s
  end

  def test_floor
    assert_equal 8, 8.floor
    assert_equal 8, 8.9.floor
    assert_equal 0, 0.9.floor
    assert_equal 0, 0.23.floor
    assert_equal -84, -83.82.floor
  end

  def test_ceil
    assert_equal 8, 8.ceil
    assert_equal 9, 8.9.ceil
    assert_equal 1, 0.9.ceil
    assert_equal 1, 0.23.ceil
    assert_equal -83, -83.82.ceil
  end

  def test_abs
    assert_equal 8, 8.abs
    assert_equal 8.9, 8.9.abs
    assert_equal 0.9, 0.9.abs
    assert_equal 0.23, 0.23.abs
    assert_equal 83.82, -83.82.abs
  end

end
