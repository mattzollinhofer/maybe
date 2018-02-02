require 'rails_helper'

RSpec.describe UserCreator do
  describe '#from_omniauth' do
    context 'when user exists' do
      it 'returns the existing user' do
        email = 'test@test.com'
        user = FactoryBot.create(:user, email: email)

        # Act like you're in prod
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("production"))
        access_token = double(:access_token, info: {email: email})
        expect(UserCreator.from_omniauth(access_token)).to eq user
      end
    end
  end
end
