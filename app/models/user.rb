class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups, foreign_key: 'author_id'
  has_many :entities, foreign_key: 'author_id'
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :recoverable, :confirmable

  validates :name, presence: true

  def is?(role)
    self.role == role.to_s
  end
end
