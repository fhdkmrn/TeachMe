class AddExtrasToUser < ActiveRecord::Migration
  def change
    add_column :users, :major, :string
    add_column :users, :year, :integer
    add_column :users, :study_spot, :string
  end
end
