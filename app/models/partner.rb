class Partner < Contact
  field :terms, type: String

  has_and_belongs_to_many :sponsor_events, class_name: "Event", inverse_of: :sponsors
  has_and_belongs_to_many :expert_events, class_name: "Event", inverse_of: :experts
end
