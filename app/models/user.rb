class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { in: 2..20 }, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name:'ゲストユーザー') do |user|
      user.password = SecureRandom.urlsafe_base64
    #   if current_user.email == "guest@example.com"
    #     # guest case
    #   else
    #     # user case
    #   end
    end
  end
end
