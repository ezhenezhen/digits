class Digits
  def self.calculate_recursive(digits)
    digits = digits.to_s
    return '' if digits.length == 0
    (0..digits.length).each do |index|
      unless digits[index] == digits[0]
        @result = (index.to_s + digits[0] + calculate_recursive(digits[index..digits.length]))
        break
      end
    end
    @result
  end

  def self.calculate(digits)
    @position = []
    @count    = []
    @array_of_digits = digits.to_s.split('')

    # находим индексы смены цифр
    @position << 0
    @array_of_digits.each_with_index do |digit, index|
      if index >= 1
        next if @array_of_digits[index-1] == digit
        @position << index
      end
    end

    # записываем количество цифр и саму цифру
    @position.each_with_index do |value, index|
      digit = @array_of_digits[value]
      if index+1 < @position.length
        sum = @position[index+1] - @position[index]
        add_to_count(digit, sum)
      end
    end

    digit = @array_of_digits.last
    sum   = @array_of_digits.length - @position.last
    add_to_count(digit, sum)
    @count.join
  end

  private

  def self.add_to_count(digit, sum)
    @count << sum
    @count << digit.to_i
  end
end