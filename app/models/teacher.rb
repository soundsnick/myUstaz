class Teacher < ApplicationRecord
  belongs_to :university
  belongs_to :subject
  has_many :costs
end
