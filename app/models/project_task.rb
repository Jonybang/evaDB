class ProjectTask
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :number, type: Integer

  field :begin_date, type: Date
  field :end_date, type: Date

  field :tehnical_task, type: String

  belongs_to :project
  belongs_to :project_status
  belongs_to :responsible, class_name: "Contact", inverse_of: :project_tasks

  has_and_belongs_to_many :equips, class_name: "Equip"
end
