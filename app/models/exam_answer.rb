class ExamAnswer < ApplicationRecord
  belongs_to :exam
  belongs_to :question
  belongs_to :answer
end
