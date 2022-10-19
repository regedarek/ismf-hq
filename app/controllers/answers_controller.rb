class AnswersController < ApplicationController
  def check
    answer = Answer.find(params[:id])

    render json: { correct: answer.correct? }, status: :ok
  end
end
