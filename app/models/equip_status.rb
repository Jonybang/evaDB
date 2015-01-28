class EquipStatus
  include Mongoid::Document
  field :name, type: String

  has_many :equips
  accepts_nested_attributes_for :equips
end
