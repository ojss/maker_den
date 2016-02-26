class User < ActiveRecord::Base
  # User model
  # !!!!!   DO NOT MODIFY UNLESS NECESSARY !!!!!

  # attr_accessor is a method that creates and allows us to read and write to a virtual variable.
  attr_accessor :remember_token
  # before_save is a callback. Executed when a new user is going to be saved.
  before_save :downcase
  # Validations on the data.
  validates :name, presence: true, length: {maximum: 100}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  # has_secure_password belongs to the bcrypt gem. Creates attr_accessors for password and its confirmation
  # in the end only stores the digest(hash) of the plain text password in the DB.
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Random token generator
  def User.new_token
    SecureRandom.urlsafe_base64
  end


  # When the user wants to be remembered this function generates a unique hash to be stored for that purpose
  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(self.remember_token)
  end

  # Called when user logs out, has to be forgotten then
  def forget
    update_attribute :remember_digest, nil
  end

  private
  # Converts an email into all lower-case
  def downcase
    self.email=email.downcase
  end
end
