class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :class
      t.string :topics
      t.string :description
      t.datetime :creation
      t.string :user
      t.string :accepted_by
      t.string :location
      t.integer :rating
      t.integer :duration
      t.boolean :need_help

      t.timestamps null: false
    end
  end
end
