class Specialty
  include Mongoid::Document
  field :name, type: String

  embeds_one :contact_data, as: :cdata_parent
  accepts_nested_attributes_for :contact_data

  #embedded_in :faculty
  belongs_to :faculty

  has_one :link, as: :link_parent
  accepts_nested_attributes_for :link

  has_many :students
  accepts_nested_attributes_for :students
end
