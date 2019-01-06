class User < ApplicationRecord
  has_many :commentaries
  has_many :rates
  belongs_to :role
end
