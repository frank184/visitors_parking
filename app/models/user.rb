class User < ActiveRecord::Base





  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles, dependent: :destroy

  validates :first_name, :last_name, :street_address, :city, :province, :postal, :telephone, presence: true

  PROVINCE_REGEX = /\A[A-Z]{7,30}\Z/i
  validates_format_of :province, :with => PROVINCE_REGEX, :on => :create

  POSTAL_REGEX = /\A[A-Z][0-9][A-Z] ?[0-9][A-Z][0-9]\Z/i
  validates_format_of :postal, :with => POSTAL_REGEX, :on => :create

  TELEPHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[ .-]\d{3}[ .-]\d{4}\Z/
  validates_format_of :telephone, :with => TELEPHONE_REGEX, :on => :create

end
