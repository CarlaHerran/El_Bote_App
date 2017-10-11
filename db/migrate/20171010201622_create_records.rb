class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.references :boat, foreign_key: true
      t.references :product, foreign_key: true
      t.string :mes
      t.float :account
      t.timestamps
    end
  end
end
