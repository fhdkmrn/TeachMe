class AddStartTimeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :start_time, :datetime
  end
end
