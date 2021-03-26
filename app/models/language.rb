class Language < ApplicationRecord
    has_many :calls 
    has_many :users, foreign_key: :native_language

    def create_slug 
        self.name.downcase.gsub(" ", '-')
    end
end
