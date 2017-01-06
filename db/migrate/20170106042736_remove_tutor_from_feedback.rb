class RemoveTutorFromFeedback < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :tutor, :string
  end
end
