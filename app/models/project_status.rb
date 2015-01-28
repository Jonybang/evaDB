class ProjectStatus
   include Mongoid::Document
   field :name, type: String

   has_many :projects
   accepts_nested_attributes_for :projects
end
