class AddKeyToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :api_key, :text
  end
end
