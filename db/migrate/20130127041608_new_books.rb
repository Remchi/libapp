class NewBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :pages 
      t.string :author
      t.text :description

      t.timestamps
    end
  end
end
