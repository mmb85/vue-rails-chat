class Message
  include Mongoid::Document
  field :text, type: String

  belongs_to :room, dependent: :destroy
  belongs_to :user
end
