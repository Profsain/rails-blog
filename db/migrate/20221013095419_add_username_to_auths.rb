class AddUsernameToAuths < ActiveRecord::Migration[7.0]
  def change
    add_column :auths, :username, :string
  end
end
