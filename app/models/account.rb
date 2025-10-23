# app/models/account.rb
class Account < ApplicationRecord
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  # Associations
  has_many :properties, dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

end