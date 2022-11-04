class MessagesController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    # ログインユーザが所属するroomのroom_id一覧を配列で取得
    current_user_rooms = current_user.room_users.pluck(:room_id)
    # 相手ユーザが所属するroomのroom_id一覧を配列で取得
    user_rooms = @user.room_users.pluck(:room_id)
    # 両ユーザが所属するroomのroom_idを配列で取得
    room_id = current_user_rooms & user_rooms
    
    unless room_id.empty?
      # 両ユーザが所属するroomが存在する場合はroomをオブジェクトで取得
      @room = Room.find_by(id: room_id)
    else
      # 両ユーザが所属するroomが存在しない場合はroomとroom_userを作成
      @room = Room.new
      @room.save
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
      RoomUser.create(user_id: @user.id, room_id: @room.id)
    end
    
  end
  
  def create
  end
end
