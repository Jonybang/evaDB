class Paper
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  embedded_in :scientist, class_name: "Scientist", :inverse_of => :papers
end
