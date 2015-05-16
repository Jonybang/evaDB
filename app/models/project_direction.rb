class ProjectDirection
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  has_many :projects
  accepts_nested_attributes_for :projects

  has_and_belongs_to_many :finance_sources, class_name: "FinanceSource"
end
