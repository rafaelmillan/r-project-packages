class Package < ApplicationRecord
  belongs_to :latest_version, class_name: "Version"
  has_many :versions
end
