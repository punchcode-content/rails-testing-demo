class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :codename
      t.text :body

      t.timestamps
    end
  end
end
