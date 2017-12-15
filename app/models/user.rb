require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_digest, Text

  attr_reader :password
  attr_reader :email
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, :as => :email_address


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
