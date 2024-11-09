class User < ApplicationRecord

  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, if: :password_required?
  
  before_save :downcase_email


  def self.authenticate_with_credentials(email, password)
   
    email = email.strip.downcase
    user = User.find_by(email: email)
 
    if user && user.authenticate(password)
     return user
    else
     return nil
    end
  end


  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def password_required?
    password.present? && password_confirmation.present?
  end

end
