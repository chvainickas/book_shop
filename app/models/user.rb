class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :password, length: { minimum: 6 }, allow_nil: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
