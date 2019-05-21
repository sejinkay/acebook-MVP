class AddForeignIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :users, index: true
  end
end
