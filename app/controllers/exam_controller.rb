class ExamController < ApplicationController
  def index
    @cnt = 1
    @questions = Question.all
  end

  def create
    exam = Exam.create(name: '')
    data = []
    JSON.parse(params[:answers]).each do |a|
      data << {
        exam_id: exam.id,
        question_id: a['qid'],
        answer_id: a['answer'],
      }
    end
    
    respond_to do |format|
      if ExamAnswer.create(data)
        session[:log] = nil
        format.html { redirect_to "/exam/#{exam.id}" }
      end
    end
  end

  def show
    @result = ExamAnswer.where(exam_id: params[:id])
    @correct = 0
    @wrong = 0
    @result.each do |a|
      QuestionAnswer.check_answer(a.question_id, a.answer_id).present? ? @correct += 1 : @wrong += 1
    end
  end

  def done
    session[:log] = nil
    redirect_to '/'
  end
end
