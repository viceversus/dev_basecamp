class ChangeToUserIdInMembership < ActiveRecord::Migration
  def change
    rename_column :memberships, :member_id, :user_id
  end
end
