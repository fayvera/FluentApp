class Language < ApplicationRecord
    has_many :calls 
    has_many :user_languages
    has_many :users, through: :user_languages

    def slug 
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Language.all.find{|language| language.slug == slug}
    end 
end
