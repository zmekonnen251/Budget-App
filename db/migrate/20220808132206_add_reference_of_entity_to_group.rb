class AddReferenceOfEntityToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :entity, foreign_key: {to_table: :entities}
  end
end
