module Slug 

    module InstanceMethods
        def slug 
            name.downcase.gsub(" ", "-")
        end
    end

    module ClassMethods

        def find_by_slug(slug)
            self.all.find{|s| s.slug == slug}
        end 
    end


end


