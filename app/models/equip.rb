class Equip
  include Mongoid::Document
  field :name, type: String
  field :model, type: String
  field :description, type: String
  field :parametres, type: String

  belongs_to :responsible, class_name: "Contact"
  belongs_to :organization
  belongs_to :subunit
  belongs_to :room
  belongs_to :equipstatus

  has_and_belongs_to_many :project_tasks, class_name: "ProjectTask"
end
