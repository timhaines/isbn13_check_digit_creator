class ISBN13
  attr_reader :check_digit, :partial

  def initialize(partial)
    @partial = partial
    validate_partial
    calculate_check_digit if valid_partial?
  end

  def full_isbn
    "#{partial}#{check_digit}"
  end

  def valid_partial?
    @valid_partial
  end

  private
    def validate_partial
      @valid_partial ||= partial.match?(/^\d{12}$/)
    end

    def calculate_check_digit
      sum = partial.chars.each_with_index.sum do |char, index|
        index.even? ? char.to_i : char.to_i * 3
      end

      remainder = sum % 10

      @check_digit = remainder.zero? ? 0 : (10 - remainder)
    end
end
