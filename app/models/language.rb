class Language < ApplicationRecord
    has_many :calls 
    has_many :users, foreign_key: :native_language

    def slug 
        self.name.downcase.gsub(" ", '-')
    end
end
