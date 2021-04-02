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


<!-- Application layout, without being on the static, login, or signup pages-->



[ ] Format of "Duration" under calls tables so that it is saved in "new" form.

[ ] Create custom method for calls to select random user to be either caller or speaker

[ ] If a user knows the language, they should not be able to make that call and be redirected to the 
    language index page with a flash message indicating why

[ ] Set timer clock for duration of call and ability to end call

[ ] Show User's calls in show page 

[ ] Clean up CSS for links to languages