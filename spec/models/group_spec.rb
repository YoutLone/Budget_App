require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.new(name: 'Htet', email: 'htet@gmail.com', password: 'password')
    @group = @user.groups.new(name: 'Vacation', icon: 'https://unsplash.com/photos/KVym2PAn1gA',
                              user_id: @user.id)
  end
  before { subject.save }

  it 'name should not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = @group.name
    expect(subject).to be_valid
  end

  it 'icon should be present' do
    subject.icon = @group.icon
    expect(subject).to be_valid
  end

  it 'icon should not be blank' do
    subject.icon = ''
    expect(subject).to_not be_valid
  end

  it 'should allow valid user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end