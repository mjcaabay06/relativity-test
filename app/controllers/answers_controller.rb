class AnswersController < ApplicationController
  def index
  end

  def new
  end

  def create
    answer = Answer.new(answer: params[:answer], answer_status_id: params[:answer_status_id])

    respond_to do |format|
      if answer.save
        format.html { redirect_to '/answers/new', notice: 'Success' }
      end
    end
  end
end
