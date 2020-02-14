require 'rails_helper'

describe CalculatorHelper, type: :helper do
  describe '#evaluate_expression' do
    it 'correctly returns answer' do
      expression = '5*3+1+6/2+9*100'
      expect(helper.evaluate_expression(expression)).to eq(919)
    end
  end
end
