class ProjectResource
  include Mongoid::Document

  def name
    self.value
  end
  #def owner_name
  #  self.owner.name
  #end
  belongs_to :resource_type
  field :value, type: String

  belongs_to :project

  has_one :owner, as: :resoursable
  accepts_nested_attributes_for :owner
end
