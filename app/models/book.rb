class Book < ApplicationRecord
  belongs_to :user
  # belongs_to :book
  validates :title, presence: true
  validates :body, presence: true
end
