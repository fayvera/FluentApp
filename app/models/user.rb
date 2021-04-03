class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email, message: "Please fill out all fields"
    validates_uniqueness_of :email
    # validates :password, length: {minimum: 8, message: "Must have at least 8 characters"}
    validates :name, format: {without: /[0-9]/, message: "Name cannot contain numbers"}


    extend Slug::ClassMethods
    include UsersHelper

    has_many :user_languages
    has_many :languages, through: :user_languages


    #as a caller
    has_many :speaker_calls, foreign_key: "speaker_id", class_name: "Call"
    has_many :speakers, through: :speaker_calls, class_name: "User"

    #as a speaker
    has_many :caller_calls, foreign_key: "caller_id", class_name: "Call"
    has_many :callers, through: :caller_calls, class_name: "User"

end
