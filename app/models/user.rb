class User < ApplicationRecord
  before_create :confirmation_token
  has_secure_password
  has_many :articles
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { in: 3..16 }
  validates :password, presence: true, confirmation: true, length: { in: 6..8 }
  validates :password_confirmation, presence: true
  validates :mobile_number, length: { is: 10 }

  def confirmation_token
  	  byebug
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  
 end
