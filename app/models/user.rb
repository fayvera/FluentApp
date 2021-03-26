class User < ApplicationRecord
    has_secure_password
    validates_presence_of :name, :username, :email, :password 

    has_many :calls

    #as a caller
    has_many :speakers, foreign_key: speaker_id, class_name: "Call"

    #as a speaker
    has_many :callers, foreign_key: caller_id, class_name: "Call"


    private
end
