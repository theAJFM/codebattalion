class Hacker < ActiveRecord::Base
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: " is not valid."}
    validates :password, length: { in: 6..20 }
end
