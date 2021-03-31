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


    <div class="topnav">
        <%= link_to "Home", user_path(current_user), class:'link'%>
        <%= link_to "Languages", languages_path, class:'link' %>
        <li class="dropdown">
          <a class="dropbtn" float="right">Settings</a>
          <div class="dropdown-content">
              <%= link_to "Edit Account", edit_user_path(current_user)%><br>
              <%= link_to "Log Out", logout_path %>
          </div>
        </li>    
        </div>