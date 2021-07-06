class Lodging < ApplicationRecord
  belongs_to :user
  has_many :stays, :dependent => :destroy
  has_many :reservations, :dependent => :destroy
  has_and_belongs_to_many :services, :dependent => :destroy
  has_one_attached :image 
  has_one_attached :video
end
