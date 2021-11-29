class Entry < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio

  validates :amount, numericality: { min: 0, step: 0.0000001 }
end
