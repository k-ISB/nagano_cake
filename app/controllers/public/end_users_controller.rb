class Public::EndUsersController < ApplicationController
  def show
    @user = current_end_user
  end

  def edit
    @user = current_end_user
  end

  def update
    @user = current_end_user
    if @user.update(end_user_params)
      flash[:success] = "メールアドレスを更新しました"
      redirect_to end_users_path
    else
      render :exit
    end
  end

  def delete_verification
  end

  def destroy
    user = EndUser.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :email)
  end
end
