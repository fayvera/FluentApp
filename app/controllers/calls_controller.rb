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
        @call.select_random_speaker
        if current_user.languages.include?(@language)
            flash[:message] = "You already speak this language!"
            redirect_to language_call_path(@language.slug, @call.id)
        else
           @call.caller_id = current_user.id
            if @call.save
                redirect_to language_call_path(@language.slug, @call.id)
            else
                flash[:message] = "Unable to book call"
                render :new
           end
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
