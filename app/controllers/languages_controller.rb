class LanguagesController < ApplicationController
    # before_action :set_language, only: [:index]

    def index
        if params["search"]
            @language = Language.search_by_language(params["search"]) 
        else
            @languages = Language.all
        end
    end

    def show
        @language = Language.find_by_slug(language_params)
        byebug
    end

    def new 
        if current_user.admin && User.admin == true
            @language = Language.new
        else
            redirect_to languages_path
        end
    end

    def create
        if current_user.admin && User.admin == true
            @language = Language.new(language_params)
            if @language.save
                redirect_to language_path
            else
                render 'new'
            end
        else
            redirect_to languages_path
        end
    end 


    private

    def set_language
        @language = Language.find_by(name: params[:name])
    end

    def language_params
        params.require(:language).permit(:name)
    end

end
