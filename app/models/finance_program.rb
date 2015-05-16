class FinanceProgram
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :terms, type: String

  embedded_in :finance_source
end
