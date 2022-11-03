class RenameUserTempIdToRoomIdInMessages < ActiveRecord::Migration[6.1]
  def up
    rename_column :messages, :room_temp_id, :room_id
    rename_column :messages, :user_temp_id, :user_id
  end
end
