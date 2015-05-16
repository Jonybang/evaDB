class IntellectType
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  has_many :intellect_properties, class_name: "IntellectProperty"
  accepts_nested_attributes_for :intellect_properties
end
