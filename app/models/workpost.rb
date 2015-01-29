class Workpost
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  has_many :contacts
  accepts_nested_attributes_for :contacts
end
