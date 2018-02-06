require 'rails_helper'

describe Availability do
  it 'sets the users availablity to true' do
    user = FactoryBot.create(:user)
    Availability.new(user: user, available: true).update
    expect(user.available).to be true
  end

  it 'sets the users unavailable_at time' do
    user = FactoryBot.create(:user)
    current = Time.current
    Availability.new(user: user, available_at: current, available: true, available_for: 5).update
    expect(user.unavailable_at).to eq current + 5.minutes
  end

  it 'defaults the users unavailable_at time to 30 minutes from now' do
    user = FactoryBot.create(:user)
    Availability.new(user: user, available: true).update
    expect(user.unavailable_at.strftime('%M')).to eq (Time.current + 30.minutes).strftime('%M')
  end

  it 'saves the user' do
    user = FactoryBot.create(:user)
    expect(user).to receive(:save!)
    Availability.new(user: user, available: true).update
  end

  it 'raises an exception if not provided an integer' do
    user = FactoryBot.create(:user)
    expect{Availability.new(user: user, available_for: 'foooo', available: true).update}.to raise_error ArgumentError
  end

  describe 'status' do
    it 'responds with "available" if the user is available' do
      user = FactoryBot.create(:user)
      current = Time.current
      availability = Availability.new(user: user, available: true, available_for: 5).update
      expect(availability.status).to eq 'available'
    end
    it 'responds with "unavailable" if the user is not availablity' do
      user = FactoryBot.create(:user)
      current = Time.current
      availability = Availability.new(user: user, available: false).update
      expect(availability.status).to eq 'unavailable'
    end
  end
end
