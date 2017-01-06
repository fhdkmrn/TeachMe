class AddRequestToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :request, :integer
  end
end
