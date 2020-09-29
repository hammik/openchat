class Group < ApplicationRecord
    has_many:group_users
    has_many :messages
    has_many:users, through: :group_users
    has_many :userlists
    accepts_nested_attributes_for :group_users
    validates :name, presence: true
    validates :name, uniqueness: true

    
    
end
