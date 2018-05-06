require 'rails_helper'
require 'spec_helper'

describe Api::V1::RoomsController, :type => :api do
  context 'create a Room' do
    let(:valid_params) { { room: { name: 'Room1' } } }

    before do
      post "/api/v1/rooms", valid_params
    end

    it 'Room created' do
      expect(Room.count).to be(1)
    end

    it 'Room not created due to params validations' do
      post "/api/v1/rooms", valid_params
      expect(Room.count).to be(1)
    end
  end
end