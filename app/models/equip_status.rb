class EquipStatus
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  has_many :equips
  accepts_nested_attributes_for :equips
end
