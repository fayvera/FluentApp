class LanguagesController < ApplicationController
    before_action :set_language, only: [:edit, :update, :destroy]
    # before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]

    def index
        if params["search"]
            @languages = Language.search_by_language(params["search"])
        else
            @languages = Language.all
        end
    end

    def show
        @language = Language.find_by_slug(params[:slug])
        if current_user.languages.include?(@language)
            flash[:message] = "You cannot make a call in this language since you already speak it!"
            redirect_to languages_path
        end
        if @language.nil?  
            redirect_to languages_path
        end 
    end

    def new 
        if is_admin?
            @language = Language.new
        else
            redirect_to languages_path, message: "User not authorized"
        end
    end

    def create
        if is_admin?
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

    def is_admin?
        current_user.admin == true
    end

end
