class RenameUserIdToRoomTempIdInMessages < ActiveRecord::Migration[6.1]
  def up
    rename_column :messages, :user_id, :room_temp_id
    rename_column :messages, :room_id, :user_temp_id
  end
end
