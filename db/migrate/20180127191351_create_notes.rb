class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      # type is a reserved keyword so I used type_of instead
      t.integer :type_of
      t.text :description
      t.date :deadline

      t.timestamps
    end
  end
end
