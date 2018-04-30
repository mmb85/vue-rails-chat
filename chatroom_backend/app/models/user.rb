class User
  include Mongoid::Document
  field :name, type: String

  has_many :messages
  validates_presence_of :name
end
                