require 'minitest/autorun'
require_relative 'isbn13'  # Adjust the path to where your class file is located

class TestISBN13 < Minitest::Test
  # Test valid ISBN partial
  def test_valid_isbn_partial
    isbn = ISBN13.new("978014300723")
    assert isbn.valid_partial?, "ISBN partial should be valid"
    assert_equal "9780143007234", isbn.full_isbn
    assert_equal 4, isbn.check_digit
  end

  # Test invalid ISBN partial (too short)
  def test_invalid_isbn_partial_short
    isbn = ISBN13.new("123456")
    refute isbn.valid_partial?, "ISBN partial should be invalid (too short)"
  end

  # Test invalid ISBN partial (non-numeric)
  def test_invalid_isbn_partial_non_numeric
    isbn = ISBN13.new("1234567890ab")
    refute isbn.valid_partial?, "ISBN partial should be invalid (non-numeric characters)"
  end

  # Edge case: Check for valid ISBN with all zeroes
  def test_isbn_with_all_zeroes
    isbn = ISBN13.new("000000000000")
    assert isbn.valid_partial?, "ISBN partial with all zeroes should be valid"
    assert_equal 0, isbn.check_digit, "The check digit should be 0"
    assert_equal "0000000000000", isbn.full_isbn, "The full ISBN13 should be correct for all zeroes"
  end
end
