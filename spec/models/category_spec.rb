require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category1) { Category.new }
  it 'fails to create without a name' do
    category1.save
    expect(category1.errors.full_messages).to include("Name can't be blank")
  end
  it 'fails to create with a name too short' do
    category1.save
    expect(category1.errors.full_messages).to include('Name is too short (minimum is 1 character)')
  end
  it 'fails to create with a name too long' do
    category1.name = '1' * 500
    category1.save
    expect(category1.errors.full_messages).to include('Name is too long (maximum is 30 characters)')
  end
  it 'fails to create without a priority' do
    category1.save
    expect(category1.errors.full_messages).to include("Priority can't be blank")
  end
  it 'saves the user with an appropiate name' do
    category1.name = 'Games'
    category1.priority = 1 
    category1.save
    expect(Category.last.name).to eq('Games')
  end
end
