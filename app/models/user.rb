class User < ApplicationRecord

  has_many :passwords, dependent: :destroy
end
