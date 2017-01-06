class AddTutoreeToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :tutoree, :integer
  end
end
