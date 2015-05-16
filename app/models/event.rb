class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :date, type: Time

  has_and_belongs_to_many :members, class_name: "Contact", inverse_of: :member_events

  has_and_belongs_to_many :sponsors, class_name: "Partner", inverse_of: :sponsor_events
  has_and_belongs_to_many :experts, class_name: "Partner", inverse_of: :expert_events

  embeds_many :documents, class_name: "EventDocument"
  accepts_nested_attributes_for :documents
end
