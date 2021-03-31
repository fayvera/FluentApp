class StaticController < ApplicationController
    skip_before_action :verified_user
    
    def home
        if current_user
            redirect_to user_path(current_user)
        else
            render :layouts => false  
            # render template: 'layouts/application', layout: false
        end
    end
end