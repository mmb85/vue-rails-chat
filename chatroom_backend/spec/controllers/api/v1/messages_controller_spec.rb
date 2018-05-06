require 'rails_helper'
require 'spec_helper'

describe Api::V1::MessagesController, :type => :api do
  context 'create an user' do
    let!(:room) { FactoryGirl.create(:room) }
    let!(:user) { FactoryGirl.create(:user) }

    let(:valid_params)   { { text: 'Text', user: user.name, room: room.name } }
    let(:invalid_params) { { text: 'Text', user: user.name } }

    before do
      post "/api/v1/messages", valid_params
    end

    it 'Message created' do
      expect(Message.count).to eq(1)
    end

    it 'Message not created due to params validations' do
      post "/api/v1/messages", invalid_params
      expect(Message.count).to be(1)
    end
  end
end