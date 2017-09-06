class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  # POST /users/friends/:id
  def friends
    friends = UserUser.where("user_id = ? OR friend_id = ?", params[:id], params[:id])

    render json: friends
  end

  # POST /users/add_friend/:id
  def add_friend
    connection = UserUser.create(user_id: params[:id], friend_id: params[:friend_id])
    connection.update(connection_id: connection.id)
    chatmessages = ChatMessage.where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)",
                                     params[:id], params[:friend_id], params[:id], params[:friend_id])
    chatmessages.update(connection_id: connection.id)
  end

  # POST /users/add_friend/:id
  def remove_friend
    UserUser.where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)",
                                params[:id], params[:friend_id], params[:id], params[:friend_id]).first.destroy
    chatmessages = ChatMessage.where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)",
                                     params[:id], params[:friend_id], params[:id], params[:friend_id])
    chatmessages.update(connection_id: nil)
  end

  def stories
    stories = StoryUser.where("user_id = ?", params[:id])

    render json: stories
  end

  def comments
    comments = LibraryComment.where("user_id = ?", params[:id])

    render json: comments
  end


  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end
