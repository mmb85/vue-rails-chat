require 'rails_helper'
require 'spec_helper'

describe Api::V1::UsersController, :type => :api do
  context 'create an user' do
    let(:valid_params) { { user: { name: 'Jane' } } }

    before do
      post "/api/v1/users", valid_params
    end

    it 'User created' do
      expect(User.count).to be(1)
    end

    it 'User not created due to params validations' do
      post "/api/v1/users", valid_params
      expect(User.count).to be(1)
    end
  end
end