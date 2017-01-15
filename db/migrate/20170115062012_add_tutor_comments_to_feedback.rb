class AddTutorCommentsToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :tutor_comments, :text
  end
end
