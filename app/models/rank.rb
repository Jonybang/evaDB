class Rank
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  has_many :scientists, class_name: "Scientist"
end
