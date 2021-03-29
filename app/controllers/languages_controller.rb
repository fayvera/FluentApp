class LanguagesController < ApplicationController
    # before_action :set_language, only: [:show]

    def index
        @languages = Language.all
    end

    def show
        # byebug
        @language = Language.find_by_slug(language_params)
    end



    private

    def set_language
        @language = Language.find_by(name: params[:name])
    end

    def language_params
        params.require(:language).permit(:name)
    end

end
