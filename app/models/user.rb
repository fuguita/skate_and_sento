class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :park_favorites, dependent: :destroy
  has_many :favorite_parks, through: :park_favorites, source: :park
  has_many :sento_favorites, dependent: :destroy
  has_many :favorite_sentos, through: :sento_favorites, source: :sento

  validates :name, length: { in: 2..20 }, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name:'ゲストユーザー') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def park_favorite(park)
    favorite_parks << park
  end

  def unpark_favorite(park)
    favorite_parks.destroy(park)
  end

  def sento_favorite(sento)
    favorite_sentos << sento
  end

  def unsento_favorite(sento)
    favorite_sentos.destroy(sento)
  end

end
