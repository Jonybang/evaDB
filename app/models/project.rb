class Project
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :result, type: String

  has_many :project_tasks, class_name: "ProjectTask"
  accepts_nested_attributes_for :project_tasks

  belongs_to :projectstatus
  belongs_to :projectdirection
  belongs_to :chief, class_name: "Contact", inverse_of: :chief_projects

  has_and_belongs_to_many :intellect_properties, class_name: "IntellectProperty"
  has_and_belongs_to_many :team, class_name: "Contact", inverse_of: :team_projects
  has_and_belongs_to_many :experts, class_name: "Contact", inverse_of: :expert_projects
end
