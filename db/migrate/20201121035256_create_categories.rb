class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string "name"
      t.text "description"
      # t.datetime "created_at", precision: 6, null: false
      # t.datetime "updated_at", precision: 6, null: false
      t.timestamps
    end
  end
end
