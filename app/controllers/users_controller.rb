class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :current_user
    before_action :set_user, only: [:edit, :update]
    

    def new 
        # binding.pry
        @user = User.new
        @languages = Language.all
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = user.id
            redirect_to user_path(@user.slug) 
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by_slug(params[:slug])
        if @user.nil?  
            redirect_to user_path(current_user.slug)
        end 
    end

    def edit

        @languages = Language.all
    end

    def update
        # binding.pry
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user), message: "User updated successfully"
        else
            @user.build(user_params)
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :username,
            :email,
            :password, 
            :password_confirmation,
            :language_ids => []
        )
    end
    def set_user 
        @user = User.find_by(:id => params[:id])
    end 

end
