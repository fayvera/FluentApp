class SessionsController < ApplicationController
    skip_before_action :verified_user 


    def new
        @user = User.new
    end

    def create
        # binding.pry
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            @user = User.new
            render :new
        end
    end 

    def delete
        session.delete(:user_id)
        redirect_to root_path
    end

end