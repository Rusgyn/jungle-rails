class User < ApplicationRecord

  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, if: :password_required?
  
  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def password_required?
    password.present? && password_confirmation.present?
  end

end
