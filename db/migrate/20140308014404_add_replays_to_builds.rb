class AddReplaysToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :replays, :text
  end
end
