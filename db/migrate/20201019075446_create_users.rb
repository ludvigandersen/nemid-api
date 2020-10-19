class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :cpr, null: false
      t.string :nemid, null: false
      t.references :gender, foreign_key: true


      t.timestamps
    end
  end
end
