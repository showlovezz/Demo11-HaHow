class CreateProjectOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :project_owners do |t|
      t.integer :user_id
      t.text :description
      t.string :cover_image

      t.timestamps
    end
  end
end
