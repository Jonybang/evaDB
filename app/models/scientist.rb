class Scientist < Contact

  belongs_to :degree
  belongs_to :rank

  embeds_many :papers, class_name: "Paper", cascade_callbacks: true
  accepts_nested_attributes_for :papers, allow_destroy: true
  embeds_many :thesis, class_name: "These", cascade_callbacks: true
  accepts_nested_attributes_for :thesis, allow_destroy: true
end
