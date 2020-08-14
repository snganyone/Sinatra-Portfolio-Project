class User < ActiveRecord::Base
    has_secure_password

    has_many :jobs

    validates :email, uniqueness: true, presence: true
end