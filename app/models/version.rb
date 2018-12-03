class Version < ApplicationRecord
  belongs_to :package

  validates :number, presence: true
end
