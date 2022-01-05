require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: 'General', description: 'Random', picture: 2) }
  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'Picture should be present' do
    subject.picture = nil
    expect(subject).to_not be_valid
  end

  it 'Should be associated to a user' do
    expect(subject).to respond_to(:user)
  end
end
