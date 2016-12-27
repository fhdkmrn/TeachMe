class RenameRequestClassColumn < ActiveRecord::Migration
  def change
  	rename_column :requests, :class, :course
  end
end
