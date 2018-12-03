class Package < ApplicationRecord
  has_one :latest_version, class_name: "Version"
  has_many :versions
end
