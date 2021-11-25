class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :coins, through: :entries, dependent: :destroy

  validates :name, presence: true
end
