module UsersHelper
    def slug
        self.username = self.email.split('@')[0].downcase
    end

end
