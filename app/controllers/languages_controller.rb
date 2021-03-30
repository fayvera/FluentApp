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

    end


    private

    def set_language
        @language = Language.find_by(name: params[:name])
    end

    def language_params
        params.require(:language).permit(:name)
    end

end
