class Language < ApplicationRecord
    has_many :calls 
    has_many :user_languages
    has_many :users, through: :user_languages

    

    scope :search_by_language, -> (search) {where("name LIKE ?", "#{search}%")}

    def slug 
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Language.all.find{|language| language.slug == slug}
    end 

    # def self.search_by_language(search)
    #     if search 
    #         self.where("name LIKE ?", "#{search}%")
    #     else
    #         self.all
    #     end
    # end
end
