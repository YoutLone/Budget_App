require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(name: 'Htet', email: 'htet@gmail.com') }
    before { subject.save }

    it 'requires name to be present' do
      subject.name = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'requires email to be present' do
      subject.email = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:email]).to include("can't be blank")
    end
  end
end
