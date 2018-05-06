class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  has_many :messages

  validates :name, uniqueness: true, presence: true
end
                