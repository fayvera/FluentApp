## FluentApp


# User (Self-Join Table)
    -Speaker
    -Caller (default: true)
    -Admin (can add/edit languages) (default: false)
    ex:

    has_many :speakers, class_name: "User", foreign_key: "caller_id"
    has_many :callers, class_name: "User", foreign_key: "speaker_id"
 




# Call
    duration, caller_id, speaker_id, language_id


# Language
    English, Portuguese, Spanish, Italian
