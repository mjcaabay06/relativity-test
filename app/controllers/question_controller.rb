class QuestionController < ApplicationController
  def index
  end

  def new
  end

  def create
    question = Question.create(question: params[:question])
    data = []
    dataDummy = []

    params[:answer][:answer_ids].each do |a|
      data << {
        question_id: question.id,
        answer_id: a.to_i
      }
    end

    params[:answer][:dummy_answer_ids].each do |a|
      dataDummy << {
        question_id: question.id,
        answer_id: a.to_i
      }
    end

    respond_to do |format|
      if QuestionAnswer.create(data) && QuestionDummyAnswer.create(dataDummy)
        format.html { redirect_to '/question/new', notice: 'Success' }
      end
    end
  end

  def get_answers
    render inline: '<%= options_for_select(Answer.where(answer_status_id: ' + params['id'] + ').order(:answer).collect { |a| [a.answer, a.id] }) %>'
  end

  private
    def params_question_answer
      params.require(:answer).permit(:question_id, :answer_id => [] )
    end

end
