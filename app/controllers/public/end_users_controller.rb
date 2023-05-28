class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to end_users_mypage_path
    else
      render 'edit'
    end
  end

  def withdraw_confirm
  end

  def withdraw
    @user = current_end_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_read, :first_name_read, :post_code, :address, :tel, :is_deleted, :email, :encrypted_password)
  end
end
