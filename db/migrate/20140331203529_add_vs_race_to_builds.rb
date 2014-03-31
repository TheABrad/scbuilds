class AddVsRaceToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :vs_race, :string
  end
end
