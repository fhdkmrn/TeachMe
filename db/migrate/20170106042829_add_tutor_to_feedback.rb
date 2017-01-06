class AddTutorToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :tutor, :integer
  end
end
