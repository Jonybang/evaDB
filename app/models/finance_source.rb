class FinanceSource
  include Mongoid::Document
  field :name, type: String
  field :volume_from, type: Float
  field :volume_to, type: Float
  embedded_in :contact_data
  embedded_in :link
  embedded_in :currency
  embedded_in :projects
  embedded_in :project_directions
end
