class Socnet
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :url, type: String

  has_many :socnet_links, class_name: "SocnetLink", as: :linkable
  accepts_nested_attributes_for :socnet_links
end
