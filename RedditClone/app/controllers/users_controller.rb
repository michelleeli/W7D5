class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.delete
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:username,:password)
    end
end
