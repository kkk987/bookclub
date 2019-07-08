class RelationshipsController < ApplicationController
  def create
    if current_user == nil
      flash[:alert] = "You must login to continue"
      return redirect_to new_user_session_path
    end
    user = User.find(params[:user_id])
    current_user.following.push(user)
    if current_user.save
      flash[:alert] = "You are now following #{user.name}"
      redirect_to books_path
    end
  end
end
