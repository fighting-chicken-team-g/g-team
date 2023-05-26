class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    #ページネーション
    #@end_users = EndUser.all
    @end_users = EndUser.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
        @end_user =EndUser.find(params[:id])
    if  @end_user.update(end_user_params)
        redirect_to admin_end_user_path
    else
        render "edit"
    end
  end

  private
  # ストロングパラメータ
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_read, :first_name_read, :post_code, :address, :tel, :email, :is_deleted)
  end
end
