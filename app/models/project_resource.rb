class ProjectResource
  include Mongoid::Document
  field :name, type: String
  field :default_value, type: String
end
