class DropAuths < ActiveRecord::Migration[7.0]
  def change
    drop_table :auths
  end
end
