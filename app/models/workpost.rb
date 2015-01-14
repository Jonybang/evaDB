class Workpost
  include Mongoid::Document
  field :name, type: String

  has_many :contacts
  accepts_nested_attributes_for :contacts
end
