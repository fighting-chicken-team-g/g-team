class Admin::EndUsersController < ApplicationController
  def index
    #ページネーション
    #@end_users = EndUser.all
    @end_users = EndUser.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end

  def update

  end

  private
  # ストロングパラメータ
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_read, :first_name_read, :post_code, :address, :tel, :email)
  end
end
