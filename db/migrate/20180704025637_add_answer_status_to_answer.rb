class AddAnswerStatusToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :answer_status, foreign_key: true
  end
end
