class Entity < ApplicationRecord
  belongs_to :user,class_name: "User",foreign_key: "author_id"
  has_many :groups,foreign_key: "entitiy_id"
end
