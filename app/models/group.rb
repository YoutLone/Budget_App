class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_and_belongs_to_many :expenses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true, length: { maximum: 250 }

  def total_expenses
    expenses.sum(:amount)
  end
end
