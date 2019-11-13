class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def index
    redirect_to journals_path
  end

    def show
      @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def edit
      @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
    
        respond_to do |format|
          if @user.save
            session[:user_id] = @user.id
            format.html { redirect_to user_path(@user), notice: 'You was successfully signed up' }
            format.json { render :show, status: :created, location: @user }
          else
            puts @user.errors.full_messages
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      respond_to do |format|
        if @current_user != @user
          format.html { redirect_to root_path, notice: 'You can only edit your own account' }
          format.json { render :home, status: :unprocessable_entity }
        end
      end
    end

    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only admin users can perform that action"
        redirect_to root_path
      end
    end

end
