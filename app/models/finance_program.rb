class FinanceProgram
  include Mongoid::Document
  field :name, type: String
  field :terms, type: String

  embedded_in :finance_source
end
