class AddTutoreeRatingToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :tutoree_rating, :integer
  end
end
