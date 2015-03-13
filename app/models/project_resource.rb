class ProjectResource
  include Mongoid::Document
  field :name, type: String
  field :value, type: String

  has_many :owners, as: :resoursable
  accepts_nested_attributes_for :owners
end
