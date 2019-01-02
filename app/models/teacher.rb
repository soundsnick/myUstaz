class Teacher < ApplicationRecord
  belongs_to :university
  belongs_to :department
  has_and_belongs_to_many :subjects
  has_many :rates
end
