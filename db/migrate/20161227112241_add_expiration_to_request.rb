class AddExpirationToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :expiration, :datetime
  end
end
