class User::SignIn < ActiveType::Object
  # plain model for handle sign in
  # not holding any tables
  attribute :email
  attribute :password

  validates :email, presence: true
  validates :password, presence: true

  validate :existance_user
  validate :authenticate_user

  private

  def existance_user
    errors.add(:email, 'User is not found ') if user.nil?
  end

  def authenticate_user
    errors.add(:password, 'Invalid Credentials') unless user && user.authenticate(password)
  end

  # create user object from email
  def user
    @user ||= User.find_by(email: email)
  end
end
