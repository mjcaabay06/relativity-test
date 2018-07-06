class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :answer

  scope :check_answer, -> (question_id,answer_id) { where(question_id: question_id, answer_id: answer_id) }
end
