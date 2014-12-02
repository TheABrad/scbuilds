class AddBuildTypeToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :build_type, :string
  end
end
