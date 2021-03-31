class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :current_user
    before_action :set_user, only: [:edit, :show]
    

    def new 
        @user = User.new
        @user.languages.each{|language| @language = language}
    end

    def create
        # byebug
        if user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def show
        
    end

    def edit
        @languages = Language.all
    end

    def update
        
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :username,
            :email,
            :password
        )
    end
    def set_user 
        @user = User.find_by(:id => params[:id])
    end 
end
