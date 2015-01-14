class Intelecttype
  include Mongoid::Document
  field :name, type: String

  has_many :intelectprops, class_name: "Intelectprop"
end
