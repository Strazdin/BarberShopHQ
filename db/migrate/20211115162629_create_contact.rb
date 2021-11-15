class CreateContact < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.text :name
      t.text :mail
      t.text :text

      t.timestamps
    end
  end
end
