class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :entries
  has_many :coins, through: :entries
end
