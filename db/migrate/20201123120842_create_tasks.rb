class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    # add_column :tasks, :category_id, :integer
    # add_column :tasks, :user_id, :integer

    create_table :tasks do |t|

      t.string "name"
      t.text "description"
      
      t.datetime "deadline"
      t.datetime "started_at"
      t.datetime "completed_at"
    
      t.boolean "started", default: false, null: false
      t.boolean "completed", default: false, null: false

      t.integer "category_id"
      t.integer "user_id"

      # t.datetime "created_at", precision: 6, null: false
      # t.datetime "updated_at", precision: 6, null: false

      t.timestamps
    end
    add_index :tasks, :category_id
  end
end
