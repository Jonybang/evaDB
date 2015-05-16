<<<<<<< HEAD
class Link
  include Mongoid::Document

  include Mongoid::Timestamps
  field :url, type: String
  field :note, type: String
  belongs_to :linkable, polymorphic: true, :dependent => :destroy
  #accepts_nested_attributes_for :link_parent
end
=======
class Link
  include Mongoid::Document

  include Mongoid::Timestamps
  field :url, type: String
  field :note, type: String
  belongs_to :linkable, polymorphic: true, :dependent => :destroy
  #accepts_nested_attributes_for :link_parent
end
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
