class User < ActiveRecord::Base
  PROVINCE_REGEX = /\A\w{7,30}\Z/
  POSTAL_REGEX = /\A[0-9A-Z]{3}\s?[0-9A-Z]{3}\Z/i
  TELEPHONE_REGEX = /\A[0-9]{10}\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles, dependent: :destroy

  validates :password, presence:true , on: :update, allow_blank: true
  validates :first_name, :last_name, :street_address, :city, :province, :postal, :telephone, presence: true
  validates_format_of :province, :with => PROVINCE_REGEX, :on => :create
  validates_format_of :postal, :with => POSTAL_REGEX, :on => :create
  validates_format_of :telephone, :with => TELEPHONE_REGEX, :on => :create

  private



end
