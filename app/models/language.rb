class Language < ApplicationRecord
    has_many :calls 
    has_many :user_languages

    # has_many :speakers, through: :user_languages
    # has_many :callers, through: :user_languages

    include Slug::InstanceMethods
    extend Slug::ClassMethods


    scope :search_by_language, -> (search) {where("name LIKE ?", "#{search}%")}
    
        # def self.search_by_language(search)
        #     if search 
        #         self.where("name LIKE ?", "#{search}%")
        #     else
        #         self.all
        #     end
        # end


end
