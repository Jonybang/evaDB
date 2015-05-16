class ResourceType
  include Mongoid::Document
  field :name, type: String
  has_many :resources, class_name: "ProjectResource"
  accepts_nested_attributes_for :resources
end
