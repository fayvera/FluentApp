class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :current_user
    before_action :set_user, only: [:show, :edit, :update]
    before_action :get_languages, only: [:show, :edit, :update, :new, :create]
    

    def new 
        @user = User.new
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
        if @user.nil?  
            redirect_to user_path(current_user.slug)
        end 
    end


    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user.slug)
        else
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
        @user = User.find_by_slug(params[:slug])
    end 

    def get_languages
        @languages = Language.all
    end

end
