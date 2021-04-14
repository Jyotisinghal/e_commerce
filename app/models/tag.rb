class Tag
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :products, dependent: :restrict_with_exception
  field :name, type: String
end
