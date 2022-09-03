class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :section, null: false, foreign_key: true
      t.text :name

      t.timestamps
    end
  end
end
