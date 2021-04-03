class Call < ApplicationRecord
    belongs_to :language
    
    belongs_to :speaker, class_name: "User"
    belongs_to :caller, class_name: "User"   
    
    

    def select_random_speaker
        s = User.can_speak(self.language).sample
        self.speaker = s
    end
end
