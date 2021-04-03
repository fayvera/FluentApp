class SessionsController < ApplicationController
    skip_before_action :verified_user 


    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            @user = User.new
            render :new, error: "Invalid Credentials"
        end
    end 

    def delete
        session.delete(:user_id)
        redirect_to root_path
    end
        
    def omniauth
        @user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth["info"]["email"]
            u.password = SecureRandom.hex(20)
            u.username = auth["info"]["name"].downcase.gsub(" ", "_")
        end
        if @user.save
            # binding.pry
                session[:user_id] = @user.id
                redirect_to user_path(@user.slug)
            else
                render :new
        end
    end

    private

    def auth
        request.env["omniauth.auth"]
    end
end