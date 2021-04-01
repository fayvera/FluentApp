class CallsController < ApplicationController
    before_action :verified_user
    before_action :find_user 

    def show
    end

    def new
        # binding.pry
        @call = Call.new
        @language = Language.find_by_slug(params[:slug])

    end

    def create
        @language = Language.find_by_slug(params[:slug])
        if current_user.languages.include?(@language)
            speaker_to_current_user
            redirect_to 
        else
            caller_to_current_user
        end
    end



    private

    def call_params
        params.require(:call).permit(
            :schedule_time,
            :duration,
            :language_id
        )
    end

    def speaker_to_current_user
        current_user.id = speaker_id
    end 

    def caller_to_current_user
        current_user.id = caller_id
    end

    def find_user
        @user = User.find_by_slug(params[:slug])
    end
end
