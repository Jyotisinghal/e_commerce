class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :tags
  belongs_to :category
  field :name, type: String
  field :price, type: Float
end
