class UserLanguage < ApplicationRecord
    belongs_to :user
    belongs_to :language

    def set_speaker
        # @user = User.find_by(params[:id])
        if @user.language_ids
            @user.language_ids.each do |l|
                @language = Language.find_by_id(l)
                @language.speaker << @user
            end
        end
    end
end
