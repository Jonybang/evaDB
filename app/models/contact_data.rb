class ContactData
  include Mongoid::Document
  field :phone, type: String
  field :email, type: String
  field :addres, type: String
  embedded_in :cdata_parent, polymorphic: true
end
