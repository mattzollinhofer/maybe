class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :lockable, :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :first_name, presence: true
  validates :last_name, presence: true

  attr_reader :available_for

  scope :friends_available_for_calls,
    -> (me) { where.not(id: me).where("unavailable_at > ?", Time.current) }

  def name
    "#{first_name} #{last_name}"
  end

  def to_s
    display_user = name
    display_user += nickname.present? ? " (#{nickname})" : ''
    display_user += " - #{email.downcase}"
  end
end
