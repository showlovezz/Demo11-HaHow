class CreateProjectSupports < ActiveRecord::Migration[5.2]
  def change
    create_table :project_supports do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      t.integer :price
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
