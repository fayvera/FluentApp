class SessionsController < ApplicationController
    skip_before_action :verified_user

    def new
        @user = User.new
    end

    def create
        byebug
        if @user = User.find_by(email: params[:user][:email])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        elsif
            user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            render 'new'
        end
    end 

    def destroy
        session.delete("user_id")
        redirect_to root_path
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
end