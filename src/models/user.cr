require "crypto/bcrypt/password"

class User < Granite::Base
  include Crypto
  connection sqlite
  table users

  column id : Int64, primary: true
  column email : String?
  column hashed_password : String?
  column role : Int32?
  column name : String?
  column phone : String?
  column company : String?
  column approved : Int32?

  has_many :tickets

  validate :name, "is required", ->(user : User) do
    (name = user.name) ? !name.empty? : false
  end

  validate :role, "is required", ->(user : User) do
    (role = user.role) ? !role.nil? : false
  end

  validate :company, "is required", ->(user : User) do
    (company = user.company) ? !company.empty? : false
  end

  validate :approved, "is required", ->(user : User) do
    (approved = user.approved) ? !approved.nil? : false
  end

  validate :email, "is required", ->(user : User) do
    (email = user.email) ? !email.empty? : false
  end

  validate :email, "is required", ->(user : User) do
    (email = user.email) ? !email.empty? : false
  end

  validate :email, "already in use", ->(user : User) do
    existing = User.find_by email: user.email
    !existing || existing.id == user.id
  end

  validate :password, "is too short", ->(user : User) do
    user.password_changed? ? user.valid_password_size? : true
  end

  def password=(password)
    @new_password = password
    @hashed_password = Bcrypt::Password.create(password, cost: 10).to_s
  end

  def password
    (hash = hashed_password) ? Bcrypt::Password.new(hash) : nil
  end

  def password_changed?
    new_password ? true : false
  end

  def valid_password_size?
    (pass = new_password) ? pass.size >= 8 : false
  end

  def authenticate(password : String)
    (bcrypt_pass = self.password) ? bcrypt_pass.verify(password) : false
  end

  private getter new_password : String?
end
