class AddReaderItToBooks < ActiveRecord::Migration
  def change
    add_column :books, :reader_id, :integer
  end
end
