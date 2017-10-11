class CreateOceans < ActiveRecord::Migration[5.1]
  def change
    create_table :oceans do |t|
      t.references :user, foreign_key: true
      t.references :boat, foreign_key: true
      t.timestamps
    end
  end
end
