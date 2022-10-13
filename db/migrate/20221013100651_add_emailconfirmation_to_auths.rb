class AddEmailconfirmationToAuths < ActiveRecord::Migration[7.0]
  def change
    add_column :auths, :email_confirmation, :string
  end
end
