class List < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :tasks, dependent: :delete_all
  has_and_belongs_to_many :users
end
