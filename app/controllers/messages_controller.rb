class MessagesController < ApplicationController
  layout 'no_search_footer_application'
  
  def show
    @user = User.find(params[:id])
    
    # ログインユーザが所属するroomのroom_id一覧を配列で取得
    current_user_room_ids = current_user.room_users.pluck(:room_id)
    # 相手ユーザが所属するroomのroom_id一覧を配列で取得
    user_room_ids = @user.room_users.pluck(:room_id)
    # 両ユーザが所属するroomのroom_idを配列で取得
    room_id = current_user_room_ids & user_room_ids
    
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
    
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
    
  end
  
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      render :create
    else
      render :validate
    end
    
  end
  
  private
  
  def message_params
    params.require(:message).permit(:room_id, :message)
  end
  
  
  
end
