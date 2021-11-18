class Fact < ApplicationRecord
  validates :fact, presence: true
  belongs_to :user
end
