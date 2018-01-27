class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :type
      t.text :description
      t.date :deadline

      t.timestamps
    end
  end
end
