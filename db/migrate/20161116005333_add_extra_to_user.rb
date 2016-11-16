class AddExtraToUser < ActiveRecord::Migration
  def change
    add_column :users, :major, :string
    add_column :users, :year, :integer
    add_column :users, :study_spot, :string
    add_column :users, :starred, :string, array: true, default: []
  end
end
