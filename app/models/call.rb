class Call < ApplicationRecord
    belongs_to :language
    
    belongs_to :speaker, class_name: "User"
    belongs_to :caller, class_name: "User"   
    
    

    def select_random_speaker
        s = self.language.speakers.order("RANDOM()").first
        self.speaker = s
    end
end
