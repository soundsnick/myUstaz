class Taguser < ApplicationRecord
  belongs_to :user
  belongs_to :teacher
  belongs_to :tag
end
