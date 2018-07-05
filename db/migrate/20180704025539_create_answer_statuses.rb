class CreateAnswerStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_statuses do |t|
      t.string :description

      t.timestamps
    end
  end
end
