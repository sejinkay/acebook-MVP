class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bg_colour, :string
    add_column :users, :font, :string
  end
end
