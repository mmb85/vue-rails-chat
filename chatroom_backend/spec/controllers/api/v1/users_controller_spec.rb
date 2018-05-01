require 'rails_helper'
require 'spec_helper'

describe Api::V1::UsersController, :type => :api do
  context 'create an user' do
    # let! sentence just to use factory_bot to mockup a user, as an example of use of this gem
    let!(:user) { create(:user, name: 'Juana') }

    before do
      post '/api/v1/users?name=Jane'
    end

    it 'User created' do
      expect(last_response.status).to eq 200
      expect(last_response.body.include?('Jane')).to eq true
      expect(User.count).to eq(2)
    end

    it 'User not creted due to validation name' do
      post '/api/v1/users?name=Jane'
      expect(last_response.status).to eq 500
      expect(last_response.body.include?('Name is already taken')).to eq true
    end
  end
end