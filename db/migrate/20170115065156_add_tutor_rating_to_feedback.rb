class AddTutorRatingToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :tutor_rating, :integer
  end
end
