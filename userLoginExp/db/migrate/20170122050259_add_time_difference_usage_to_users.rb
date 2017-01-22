class AddTimeDifferenceUsageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :time_difference, :integer
    add_column :users, :login_failed, :integer, default: 0
  end
end
