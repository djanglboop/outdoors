class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the Great Outdoors Journals"
            redirect_to journals_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :emai, :password)
    end

end
