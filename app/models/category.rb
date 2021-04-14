class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :products
  has_many :tags
  field :name, type: String
end
