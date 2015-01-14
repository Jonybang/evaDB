class Subunit
  include Mongoid::Document
  field :name, type: String

  belongs_to :organization

  has_many :rooms, class_name: "Room"
  accepts_nested_attributes_for :rooms

  has_many :equips, class_name: "Equip"
  accepts_nested_attributes_for :equips
end
