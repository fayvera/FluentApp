class CallsController < ApplicationController
    before_action :verified_user
    before_action :find_user, :find_language, only: [:new, :create, :show]
   

    def new
        @call = Call.new
    end

    def show
    end

    def create
        @call = Call.new(call_params)
        @call.language_id = @language.id
        # binding.pry
        # @call.duration = params["users"]["duration"].strftime("%M")
        if current_user.languages.include?(@language)
            speaker_to_current_user
            redirect_to language_call_path(@language, @call)
        else
            # binding.pry
            caller_to_current_user
            # @call.speaker.id = @language.users.
            redirect_to language_call_path(@language, @call)
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
        @call.speaker_id = current_user.id 
    end 

    def caller_to_current_user
        @call.caller_id = current_user.id
    end

    def find_user
        @user = User.find_by_slug(params[:slug])
    end

    def find_language
        @language = Language.find_by_slug(params["language_slug"])
    end

    def set_duration
        duration = params["users"]["duration"].strftime("%M")
    end
end
