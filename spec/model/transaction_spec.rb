require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject { Transaction.new(name: 'Payment', transaction_number: 123_456, total: 200) }
  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Transaction number should be present' do
    subject.transaction_number = nil
    expect(subject).to_not be_valid
  end

  it 'Total amount should be present' do
    subject.total = nil
    expect(subject).to_not be_valid
  end

  it 'Should be associated to a category' do
    expect(subject).to respond_to(:category)
  end
end
