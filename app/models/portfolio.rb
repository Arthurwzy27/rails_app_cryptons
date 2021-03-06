class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :coins, through: :entries

  validates :name, presence: true, uniqueness: true

  def fetch_value
    values = self.entries.map do |entry|
      entry.coin.price * entry.amount
    end
    values.inject(&:+) || 0
  end

  def fetch_gain
    values = self.entries.map do |entry|
      (entry.coin.price * entry.amount) - (entry.amount * entry.buying_price)
    end
    values.sum || 0
  end
end
