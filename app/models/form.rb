class Form < ApplicationRecord
  has_one_attached :file
  validates :name, presence: true, length: { minimum: 1 }

  belongs_to :user, foreign_key: :user_id, primary_key: :id, required: true
end
