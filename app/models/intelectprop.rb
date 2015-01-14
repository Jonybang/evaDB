class Intelectprop
  include Mongoid::Document
  field :name, type: String
  field :indnumber, type: String
  field :description, type: String
  field :formula, type: String
  field :regdate, type: Date
  field :enddate, type: Date
  field :doclink, type: String

  belongs_to :intelecttype
  has_and_belongs_to_many :authors, class_name: "Contact"
end
