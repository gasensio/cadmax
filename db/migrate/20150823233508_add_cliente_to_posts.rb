class AddClienteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cliente, :string
  end
end
