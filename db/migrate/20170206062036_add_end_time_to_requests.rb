class AddEndTimeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :end_time, :datetime
  end
end
