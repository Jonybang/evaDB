class Contact
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  embeds_one :contact_data, as: :cdata_parent
  accepts_nested_attributes_for :contact_data

  # embeds_one :in_project
  # accepts_nested_attributes_for :in_project

  belongs_to :organization, inverse_of: :contacts, class_name: "Organization"
  belongs_to :workpost

  has_many :equips, class_name: "Equip"
  accepts_nested_attributes_for :equips

  has_many :socnet_links, class_name: "SocnetLink", as: :linkable
  accepts_nested_attributes_for :socnet_links

  # мешают работать contact_data, organization и workpost
  has_many :project_tasks, class_name: "ProjectTask", inverse_of: :responsible
  accepts_nested_attributes_for :project_tasks

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :industries, class_name: "Industry"
  has_and_belongs_to_many :intellect_properties, class_name: "IntellectProperty"

  has_many :chief_projects, class_name: "Project", inverse_of: :chief
  accepts_nested_attributes_for :chief_projects

  has_and_belongs_to_many :team_projects, class_name: "Project", inverse_of: :team
  has_and_belongs_to_many :expert_projects, class_name: "Project", inverse_of: :experts

  has_and_belongs_to_many :member_events, class_name: "Event", inverse_of: :members
end
