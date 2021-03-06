class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :ads
has_many :comments, dependent: :destroy

has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end