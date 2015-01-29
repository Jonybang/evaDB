class IntellectProperty
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :indnumber, type: String
  field :description, type: String
  field :formula, type: String
  field :regdate, type: Date
  field :enddate, type: Date
  field :doclink, type: String

  belongs_to :intellect_type
  has_and_belongs_to_many :authors, class_name: "Contact"
  has_and_belongs_to_many :projects, class_name: "Project"
end
