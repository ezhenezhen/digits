class Digits
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
        @count << sum
        @count << digit.to_i
      end
    end

    digit = @array_of_digits.last
    sum   = @array_of_digits.length - @position.last
    @count << sum
    @count << digit.to_i
    @count.join
  end
end