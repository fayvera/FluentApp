class Call < ApplicationRecord
    belongs_to :language
    
    belongs_to :speaker, class_name: "User"
    belongs_to :caller, class_name: "User"   
    
    

end
