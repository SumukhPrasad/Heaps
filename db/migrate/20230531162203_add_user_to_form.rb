class AddUserToForm < ActiveRecord::Migration[7.0]
  def change
    add_reference :forms, :user, null: false, foreign_key: true
  end
end