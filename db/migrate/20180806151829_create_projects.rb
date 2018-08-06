class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :category_id
      t.integer :project_owner_id
      t.string :name
      t.string :brief
      t.text :description
      t.integer :goal
      t.datetime :due_date
      t.string :ad_url
      t.string :cover_image
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
