class AddPasswordDigestToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :password_digest, :string
  end
end
