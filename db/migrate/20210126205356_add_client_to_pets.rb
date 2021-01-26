class AddClientToPets < ActiveRecord::Migration[6.0]
  def change
    add_reference :pets, :client, null: true, foreign_key: true
  end
end
