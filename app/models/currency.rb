class Currency
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  has_many :finance_sources, class_name: "FinanceSource"
  accepts_nested_attributes_for :finance_sources
end
