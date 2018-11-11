class Teacher < ApplicationRecord
  belongs_to :university
  belongs_to :subject
end
