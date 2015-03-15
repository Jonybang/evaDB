class User
  include Mongoid::Document
  field :encrypted_password, :type => String
  field :email, :type => String

  has_one :contact
  accepts_nested_attributes_for :contact

  def name
    self.email
  end

  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create, :message => "can't be blank"
  validates_presence_of :email, :message => "can't be blank"
  validates_uniqueness_of :email, :message => "already in use"

  before_create :encrypt_password

  # Password and auth stuff.
  def saved_password
    @saved_password ||= BCrypt::Password.new(encrypted_password)
  end
  def saved_password=(new_password)
    @saved_password = BCrypt::Password.create(new_password)
    self.encrypted_password = @saved_password
  end
  def encrypt_password
    self.saved_password = password if password.present?
  end
  def self.authenticate email, password
    user = where(:email => email).first
    logger = Logger.new(STDOUT)
    logger.debug "Saved_password: #{user.saved_password}"
    logger.debug "Tested password: #{password}"
    if user && user.saved_password == password
      logger.debug "OK"
      user
    else
      logger.debug "BAD!"
      nil
    end
  end
end
