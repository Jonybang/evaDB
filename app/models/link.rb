class Link
  include Mongoid::Document

  include Mongoid::Timestamps
  field :url, type: String
  field :note, type: String
  belongs_to :linkable, polymorphic: true, :dependent => :destroy
  #accepts_nested_attributes_for :link_parent
end
