class SessionsController < ApplicationController
    def new
    end

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        respond_to do |format|
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
                format.html { redirect_to user_path(user), notice: 'You was successfully logged in' }
            else
                format.html { render :new, notice: 'Wrong email or password' }
            end
        end
    end

    def destroy
        respond_to do |format|
            session[:user_id] = nil
            format.html { redirect_to root_path, notice: 'You have logged out' }
        end
    end
    
end
