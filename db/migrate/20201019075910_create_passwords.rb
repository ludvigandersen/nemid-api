class CreatePasswords < ActiveRecord::Migration[6.0]
  def change
    create_table :passwords do |t|
      t.references :user, foreign_key: true
      t.string :password, null: false
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
