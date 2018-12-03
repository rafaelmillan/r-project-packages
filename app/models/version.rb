class Version < ApplicationRecord
  validates :version, presence: true
end
