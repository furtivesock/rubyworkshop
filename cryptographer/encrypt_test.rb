require 'minitest/autorun'
require_relative 'encrypt'

class EncryptionEngineTest < Minitest::Test
  def test_it_encrypts_using_rot13
    engine = EncryptionEngine.new
    output = engine.encrypt("My Message")
    assert_equal "Zl Zrffntr", output
  end

  def test_it_decrypts_using_rot13
    engine = EncryptionEngine.new
    output = engine.decrypt("Zl Zrffntr")
    assert_equal "My Message", output
  end
end
