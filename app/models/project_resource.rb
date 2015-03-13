class ProjectResource
  include Mongoid::Document
  field :name, type: String
  field :default_value, type: String

  belongs_to :resoursable, polymorphic: true, :dependent => :destroy
end
