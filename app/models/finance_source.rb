class FinanceSource
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :volume_from, type: Float
  field :volume_to, type: Float

  embeds_one :contact_data, as: :cdata_parent
  accepts_nested_attributes_for :contact_data

  has_one :link, as: :link_parent
  accepts_nested_attributes_for :link

  belongs_to :currency

  has_and_belongs_to_many  :projects
  has_and_belongs_to_many  :project_directions

  embeds_many :finance_programs
  accepts_nested_attributes_for :finance_programs
end
