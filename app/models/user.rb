class User < ApplicationRecord
    has_many :facts
    validates :username, presence: true, uniqueness: true
end
