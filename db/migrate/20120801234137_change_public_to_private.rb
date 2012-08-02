class ChangePublicToPrivate < ActiveRecord::Migration
  def change
    rename_column :projects, :public, :private
    change_column :projects, :private, :boolean, :default => true
  end
end
