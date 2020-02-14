class CalculatorController < ApplicationController
  include CalculatorHelper

  def show
    @answer = answer_params[:answer]
  end

  def calculate
    answer = evaluate_expression(calculation_params[:expression])
    rounding_param = answer.to_i == answer ? 0 : 2 # this makes sure integers are shown without any decimals
    answer = answer.round(rounding_param)
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
