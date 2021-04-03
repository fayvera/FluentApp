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
        # @call.duration = params["call"]["duration"].strftime("%M")
        if @language.speakers.count == 0
            flash[:message] = "Sorry, no speakers available for this language!"
            redirect_to languages_path
        else 
            if current_user.languages.include?(@language)
                flash[:message] = "You already speak this language!"
                redirect_to language_call_path(@language.slug, @call.id)
            else
                @call.caller_id = current_user.id
                if @call.save
                    # flash[:message] = "Call Booked"
                    redirect_to language_call_path(@language.slug, @call.id)
                else
                    render :new
                end
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
