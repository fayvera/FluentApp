class User < ApplicationRecord
    has_secure_password
    validates_presence_of :name, :username, :email, :password 


    #as a caller
    has_many :speakers_calls, foreign_key: speaker_id, class_name: "Call"
    has_many :speakers, through: :speakers_calls, class_name: "User"

    #as a speaker
    has_many :callers_calls, foreign_key: caller_id, class_name: "Call"
    has_many :callers, through: :callers_calls, class_name: "User"


    private

end
