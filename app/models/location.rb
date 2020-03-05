class Location < ApplicationRecord
    validates_length_of :city, in: 2..32, allow_nil: false
    validates_length_of :street, in: 2..48, allow_nil: false
    validates :psc, length: { is: 5 }, allow_blank: false
end
