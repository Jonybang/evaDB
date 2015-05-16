class Equip
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :model, type: String
  field :description, type: String
  field :parametres, type: String

  has_many :project_resources, as: :resoursable
  accepts_nested_attributes_for :project_resources

  belongs_to :responsible, class_name: "Contact"
  belongs_to :organization
  belongs_to :subunit
  belongs_to :room
  belongs_to :equip_status

  has_and_belongs_to_many :project_tasks, class_name: "ProjectTask"
  accepts_nested_attributes_for :project_tasks
end
