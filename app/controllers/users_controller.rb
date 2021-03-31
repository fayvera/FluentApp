class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :current_user
    before_action :set_user, only: [:edit, :update, :show]
    

    def new 
        @user = User.new
    end

    def create
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
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            # binding.pry
            @user.build(params)
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
