class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.text :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
