class Public::EndUsersController < ApplicationController
  def show
  end

  def edit
  end

  def withdraw_confirm
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name)
  end
end
