class AddEsperaToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :espera, :integer
  end
end
