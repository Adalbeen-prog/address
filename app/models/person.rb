class Person < ApplicationRecord
    has_many :locations
    validates_length_of :name, in: 2..32, allow_nil: false
    validates_length_of :surname, in: 2..32, allow_nil: false
    validates_length_of :phoneNumber, in: 9..32, allow_nil: false
    validates_format_of :birthNumber, with: /\A([0-9]{6}+)\/+[0-9]{3,4}\z/i
    validates :birthNumber, uniqueness: true
end
