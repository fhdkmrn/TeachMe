class AddCommentsToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :comments, :text
  end
end
