require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.new }
  it 'fails to create without a name' do
    user1.save
    expect(user1.errors.full_messages).to include("Name can't be blank")
  end
  it 'fails to create with a name too short' do
    user1.save
    expect(user1.errors.full_messages).to include('Name is too short (minimum is 3 characters)')
  end
  it 'fails to create with a name too long' do
    user1.name = '1' * 500
    user1.save
    expect(user1.errors.full_messages).to include('Name is too long (maximum is 60 characters)')
  end
  it 'saves the user with an appropiate name' do
    user1.name = 'Pedro'
    user1.save
    expect(User.last.name).to eq('Pedro')
  end
end
