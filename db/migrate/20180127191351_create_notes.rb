class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :type
      t.text :description
      t.date :deadline

      t.timestamps
    end
  end
end
