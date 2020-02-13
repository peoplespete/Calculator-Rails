module CalculatorHelper
  # Add calculator logic here!
  def evaluate_expression(expression)
    expression = "5*3+1+6/2+9*100"
    # [5,3,1,6,2,9,100]
    # ['*','+','+','/','+','*']
    # [15,1,6,2,900]
    # ['+','+','/','+']
    # [15,1,3,900]
    # ['+','+','+']
    # [910]
    # []
    numbers = expression.split(/[*\/+-]/).map(&:to_i)
    operators = expression.split(/\d+/).delete_if(&:blank?)
    # binding.pry
    ['*', '/', '+', '-'].each do |symbol|
      operators.count(symbol).times do
        operator_index = operators.index(symbol)
        a = numbers[operator_index]
        b = numbers[operator_index + 1]
        numbers[operator_index] = send(mode(symbol), a, b)
        numbers.delete(operator_index + 1)
        operators.delete(operator_index)
      end
    end
    puts numbers
    binding.pry
      # mdas

  end

  def mode(symbol)
    case symbol
    when '*'
      'multiply'
    when '/'
      'divide'
    when '+'
      'add'
    when '-'
      'subtract'
    end
  end

  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    a / b
  end
end
