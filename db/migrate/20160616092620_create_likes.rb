class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :post, index: true, foreign_key: true
      t.user :

      t.timestamps null: false
    end
  end
end
