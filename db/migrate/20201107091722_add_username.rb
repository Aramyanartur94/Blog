class AddUsername < ActiveRecord::Migration[6.0]
  def change
    def up
    add_column :users, :username, :string
    end
    add_index :users, :username, unique: true
  end
end
