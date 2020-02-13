class CalculatorController < ApplicationController
  include CalculatorHelper

  def show
    @answer = answer_params[:answer]
  end

  def calculate
    answer = evaluate_expression(calculation_params[:expression])
    redirect_to root_path(answer: answer)
  end

  private

  def answer_params
    params.permit(:answer)
  end

  def calculation_params
    params.permit(:expression)
  end

end
