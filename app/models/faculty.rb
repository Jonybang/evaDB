class Faculty
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  #embedded_in :university, :inverse_of => :faculties
  belongs_to :university

  embeds_one :contact_data, as: :cdata_parent
  accepts_nested_attributes_for :contact_data

  #embeds_many :specialties, class_name: "Specialty"
  has_many :specialties, class_name: "Specialty"
  accepts_nested_attributes_for :specialties, allow_destroy: true

  has_one :link, as: :linkable
  accepts_nested_attributes_for :link

  has_many :students
  accepts_nested_attributes_for :students
end
