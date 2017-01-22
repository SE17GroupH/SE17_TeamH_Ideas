class AddLoginTimeUsageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :open_page_at, :integer
    add_column :users, :login_at, :integer
  end
end
