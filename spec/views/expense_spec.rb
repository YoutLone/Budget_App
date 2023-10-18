# spec/models/expense_spec.rb
require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:group) { Group.create(name: 'Test Group', user:) }

  it 'is valid with valid attributes' do
    expense = Expense.new(user:, group:, name: 'Category Name', amount: 100)
    expect(expense).to be_valid
  end

  it 'is not valid without a user' do
    expense = Expense.new(group:, name: 'Category Name', amount: 100)
    expect(expense).to_not be_valid
  end

  it 'is not valid without a group' do
    expense = Expense.new(user:, name: 'Category Name', amount: 100)
    expect(expense).to_not be_valid
  end

  it 'is not valid without a name' do
    expense = Expense.new(user:, group:, amount: 100)
    expect(expense).to_not be_valid
  end

  it 'is not valid without an amount' do
    expense = Expense.new(user:, group:, name: 'Category Name')
    expect(expense).to_not be_valid
  end

  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a group' do
    association = described_class.reflect_on_association(:group)
    expect(association.macro).to eq(:belongs_to)
  end
end
