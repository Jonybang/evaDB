class ProjectResource
  include Mongoid::Document

  def name
    self.value
  end
  def owner_name
    self.owner.name
  end
  belongs_to :resource_type
  field :value, type: String

  belongs_to :project

  belongs_to :resoursable, polymorphic: true, :dependent => :destroy
end
