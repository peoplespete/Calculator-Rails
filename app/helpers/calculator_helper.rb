module CalculatorHelper

  def evaluate_expression(expression)
    numbers = expression.split(/[*\/+-]/).map(&:to_i)
    operators = expression.split(/\d+/).delete_if(&:blank?)
    %w(* / + -).each do |symbol|
      operators.count(symbol).times do
        operator_index = operators.index(symbol)
        a = numbers[operator_index].to_f
        b = numbers[operator_index + 1].to_f
        numbers[operator_index] = a.send(symbol, b)
        numbers.delete_at(operator_index + 1)
        operators.delete_at(operator_index)
      end
    end
    numbers.first
  end

end
