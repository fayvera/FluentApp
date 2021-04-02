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
        @call.language = @language
        # @call.duration = params["call"]["duration"].strftime("%M")
        # binding.pry
        if current_user.languages.include?(@language)
            speaker_to_current_user
            redirect_to language_call_path(@language.slug, @call)
        else
             @call.save
                caller_to_current_user
                # @call.speaker.id = @language.users.
                flash[:message] = "Call not available"
                redirect_to language_call_path(@language.slug, @call)
            # else
            #     render :new
            # end
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
