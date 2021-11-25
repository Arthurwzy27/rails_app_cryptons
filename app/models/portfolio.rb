class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :coins, through: :entries

  validates :name, presence: true
end
