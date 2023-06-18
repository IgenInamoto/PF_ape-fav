class Admin::UsersController < ApplicationController
     before_action :authenticate_admin!
    
    def index
      @users = User.page(params[:page])
    end
    
    def show
       @user = User.find(params[:id])
       @users = User.page(params[:page])
       @sneakers = Sneaker.page(params[:page])
       @sneaker = @user.sneakers
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = 'ユーザーを削除しました。'
        redirect_to admin_users_path
    end
    
end
