class User < ApplicationRecord
  validates :email, presence: true,
    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: "is not valid"},
    uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6}
end
