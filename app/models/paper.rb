class Paper
  include Mongoid::Document
  field :name, type: String
  embedded_in :scientist, class_name: "Scientist", :inverse_of => :papers
end
