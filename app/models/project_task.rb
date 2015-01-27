class ProjectTask
  include Mongoid::Document
  field :name, type: String
  field :number, type: Integer

  field :begin_date, type: Date
  field :end_date, type: Date

  field :tehnical_task, type: String

  belongs_to :project
  belongs_to :projectstatus
  belongs_to :responsible, class_name: "Contact", inverse_of: :project_tasks
end
