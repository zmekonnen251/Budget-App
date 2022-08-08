class AddReferenceOfUserToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :author, foreign_key: {to_table: :users}
  end
end
