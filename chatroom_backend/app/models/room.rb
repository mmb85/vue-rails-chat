class Room
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  has_many :messages
  has_many :users

  validates :name, uniqueness: true, presence: true
end