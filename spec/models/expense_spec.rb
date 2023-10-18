require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    @user = User.new(name: 'Htet', email: 'htet@gmail.com', password: 'password')
    @group = @user.groups.new(name: 'Travel', icon: 'https://unsplash.com/photos/KVym2PAn1gA',
                              user_id: @user.id)
    @expense = Expense.new(name: 'Train', amount: 100, group: @group, user_id: @user.id)
  end
  before { subject.save }

  it 'name should not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.errors[:name]).to include("can't be blank")
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
    expect(subject.errors[:amount]).to include("can't be blank")
  end

  it 'amount should be numeric value' do
    subject.amount = 'invalid'
    subject.valid?

    expect(subject.errors[:amount]).to include('is not a number')
  end

  it 'amount should be greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
    expect(subject.errors[:amount]).to include('must be greater than 0')
  end

  it 'should be associated to a group' do
    expect(subject).to respond_to(:group)
  end
end
