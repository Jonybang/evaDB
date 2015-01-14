class Student < Contact
  field :enter_year, type: Date
  belongs_to :specialty
  belongs_to :faculty
  belongs_to :university
end
