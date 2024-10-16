require_relative 'isbn13'

def run_isbn_check_digit_generator
  loop do
    puts "Enter the first 12 digits of an ISBN13 number, or 'q' to quit:"

    input = gets.strip.downcase

    break if input == "q"

    isbn = ISBN13.new(input)

    unless isbn.valid_partial?
      puts "You need to enter exactly 12 digits (or q).  You entered `#{input}`."
      next
    end

    puts "Check digit: #{isbn.check_digit}"
    puts "Full ISBN13: #{isbn.full_isbn}"
  end
end

run_isbn_check_digit_generator
