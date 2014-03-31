class AddRaceToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :race, :string
  end
end
