class Link
  include Mongoid::Document
  field :url, type: String
  field :note, type: String
  belongs_to :link_parent, polymorphic: true, :dependent => :destroy
  #accepts_nested_attributes_for :link_parent
end
