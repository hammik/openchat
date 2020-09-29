class User < ApplicationRecord
    has_secure_password 
    has_many :group_users
    has_many :messages
    has_many :groups,through: :group_users
   
   
    validates :email, presence: true
    validates :email, uniqueness: true
    
    validates :name, presence: true

end
