class Room
  include Mongoid::Document
  field :name, type: String

  belongs_to :subunit

  has_many :equips, class_name: "Equip"
  accepts_nested_attributes_for :equips
end
