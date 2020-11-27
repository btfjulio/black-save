class Store < ApplicationRecord
  has_many :offers, dependent: :destroy
end
