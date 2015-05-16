class ProjectStatus
   include Mongoid::Document
   include Mongoid::Timestamps
   include SimpleEnum::Mongoid
   field :name, type: String
   as_enum :color, [:green, :blue, :yellow, :red], map: :string
   def color
     return self.color_cd
   end

   has_many :projects
   accepts_nested_attributes_for :projects
   has_many :project_tasks
   accepts_nested_attributes_for :project_tasks
end
