class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy
end
