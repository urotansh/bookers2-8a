class RenameUserIdToRoomTempIdInRoomUsers < ActiveRecord::Migration[6.1]
  def up
    rename_column :room_users, :user_id, :room_temp_id
    rename_column :room_users, :room_id, :user_temp_id
  end
end
