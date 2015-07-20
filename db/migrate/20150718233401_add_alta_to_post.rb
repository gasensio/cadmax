class AddAltaToPost < ActiveRecord::Migration
  def change
    add_column :posts, :alta, :date
  end
end
