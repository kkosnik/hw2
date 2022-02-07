class Person < ApplicationRecord
    has_many :roles
    has_many :movies
end
