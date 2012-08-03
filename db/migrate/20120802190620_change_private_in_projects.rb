class ChangePrivateInProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :private, :restricted
  end
end
