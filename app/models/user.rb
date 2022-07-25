class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: {minimum: 2, maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :phone_number, numericality: { only_integer: true }, length: {maximum: 11}, on: :update

  validates :description, length: {maximum: 140}

  has_many :rooms, dependent: :destroy

  has_many :reservations

  has_many :my_reserved_room, through: :rooms, source: :reservations

  has_many :reviews_from_host, through: :reservations, source: :reviews

  has_many :reviews_from_guest, through: :my_reserved_room, source: :reviews
end
