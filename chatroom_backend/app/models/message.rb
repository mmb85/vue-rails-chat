class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :text, type: String

  belongs_to :room, dependent: :destroy
  belongs_to :user
end
