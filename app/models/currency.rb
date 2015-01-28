class Currency
  include Mongoid::Document
  field :name, type: String
  embedded_in :finance_sources
end
