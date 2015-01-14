class Rank
  include Mongoid::Document
  field :name, type: String
  has_many :scientists, class_name: "Scientist"
end
