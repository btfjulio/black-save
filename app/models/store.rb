class Store < ApplicationRecord
  has_many :offers, :inverse_of => :store
end
