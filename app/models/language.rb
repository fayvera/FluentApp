class Language < ApplicationRecord
    has_many :calls 
    has_many :user_languages
    has_many :users, through: :user_languages

    def slug 
        self.name.downcase.gsub(" ", '-')
    end
end
