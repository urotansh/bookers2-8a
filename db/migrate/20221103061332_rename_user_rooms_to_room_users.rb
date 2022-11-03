class RenameUserRoomsToRoomUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_rooms, :room_users
  end
end
