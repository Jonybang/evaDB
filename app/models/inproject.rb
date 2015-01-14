class Inproject
  include Mongoid::Document
  embedded_in :contact

  def name
      return self.contact.name
  end

  has_many :projects, class_name: "Project", inverse_of: :chief
  accepts_nested_attributes_for :projects

  has_and_belongs_to_many :asTeamMember, class_name: "Project", inverse_of: :team
  has_and_belongs_to_many :asExpert, class_name: "Project", inverse_of: :experts
end
