class Organization < ApplicationRecord
  has_many :organizations, class_name: 'Organization', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Organization', optional: true
end
