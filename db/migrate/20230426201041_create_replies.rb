class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :comment, null: false, foreign_key: true
      t.text :reply, null: false

      t.timestamps
    end
  end
end
