require 'rails_helper'

describe CalculatorController, type: :controller do
  describe 'GET show' do
    it 'assigns @answer' do
      answer = '1.23'
      get :show, { params: { answer: answer } }
      expect(assigns(:answer)).to eq(answer)
    end

    it 'does not break without an answer' do
      get :show
      expect(response.status).to eq(200)
    end
  end

  describe 'POST calculate' do
    it 'should call CalculatorHelper method evaluate_expression with expression' do
      expression = '5+5'
      expect(subject).to receive(:evaluate_expression).with(expression).and_return(10)
      post :calculate, { params: { expression: expression } }
    end

    it 'should round the answer to two digits' do
      expression = '1/3'
      post :calculate, { params: { expression: expression } }
      expect(subject).to redirect_to(root_path(answer: 0.33.to_s))
    end

    it 'should not round integers' do
      expression = '5+5'
      post :calculate, { params: { expression: expression } }
      expect(subject).to redirect_to(root_path(answer: 10.to_s))
    end
  end
end
