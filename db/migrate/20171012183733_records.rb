class Records < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :boat, foreign_key: true
      t.references :product, foreign_key: true
      t.datetime :fecha
      t.float :account
      t.string :note
      t.timestamps
    end
  end
end






