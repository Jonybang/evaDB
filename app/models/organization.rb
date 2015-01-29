class Organization
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :requisites, type: String

  embeds_one :contact_data, as: :cdata_parent
  accepts_nested_attributes_for :contact_data

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  has_many :contacts, inverse_of: :organization
  accepts_nested_attributes_for :contacts

  has_many :equips, class_name: "Equip"
  accepts_nested_attributes_for :equips

  has_many :subunits, class_name: "Subunit"
  accepts_nested_attributes_for :subunits
end
