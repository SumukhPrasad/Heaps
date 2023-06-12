class Form < ApplicationRecord
  has_one_attached :file
  validates :name, presence: true, length: { minimum: 1 }

  belongs_to :user, foreign_key: :user_id, primary_key: :id, required: true
  has_one :heap, foreign_key: :form_id, primary_key: :id, dependent: :destroy
end
