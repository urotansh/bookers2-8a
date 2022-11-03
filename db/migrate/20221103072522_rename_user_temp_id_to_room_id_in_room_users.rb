class RenameUserTempIdToRoomIdInRoomUsers < ActiveRecord::Migration[6.1]
  def up
    rename_column :room_users, :room_temp_id, :room_id
    rename_column :room_users, :user_temp_id, :user_id
  end
end
