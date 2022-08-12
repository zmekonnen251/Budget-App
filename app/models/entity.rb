class Entity < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :groups, foreign_key: 'entitiy_id'

  validates :name, presence: true
  validates :amount, presence: true
end
