class Stay < ApplicationRecord
  has_one :review, :dependent => :destroy
  belongs_to :lodging
  belongs_to :user
end
