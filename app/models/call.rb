class Call < ApplicationRecord
    belongs_to :language
    
    belongs_to :speaker, class_name: "User"
    belongs_to :caller, class_name: "User"   
    

    def is_speaker
        # If a user speaks a language

        # in USER class
        # if self.languages.include?(@language) 
        #     self = @speaker
        # else
        #     self = @caller
        # end
    end

    def select_random_speaker
        # Set amount of speakers (Users class?)
            @speakers = Speaker.all
        # #Search all speakers for that language
        # User.
        # @speaker = User.speaker.random()
        #  SELECT random(speaker_id) FROM speakers 
    end

end
