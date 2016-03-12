class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :link
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
